import concurrent
import concurrent.futures
import math

import cv2
import numpy as np
import tensorflow as tf

import src.utils.constant as constant
from src.align.detect_face import detect_face, create_mtcnn
from src.model.Preprocessed import PreprocessedObject


class PreprocessingService:
    """
    A service class for preprocessing images, including face detection, alignment, and resizing.
    """

    def __init__(self, face_number_per_img: int = 1):
        """
        Initializes the PreprocessingService with the maximum number of faces to detect per image.

        Args:
            face_number_per_img (int): Maximum number of faces to detect in each image. Defaults to 1.
        """
        self.__pnet, self.__rnet, self.__onet = self.get_mtcnn()  # Initialize MTCNN models.
        self.__face_number_per_img = face_number_per_img

    def get_mtcnn(self):
        """
        Initializes the MTCNN (Multi-task Cascaded Convolutional Networks) for face detection.

        Returns:
            tuple: The P-Net, R-Net, and O-Net models for face detection.
        """
        with tf.Graph().as_default():
            gpu_options = tf.compat.v1.GPUOptions(per_process_gpu_memory_fraction=0.6)  # Limit GPU memory usage.
            sess = tf.compat.v1.Session(
                config=tf.compat.v1.ConfigProto(gpu_options=gpu_options, log_device_placement=False)
            )
            with sess.as_default():
                pnet, rnet, onet = create_mtcnn(sess, constant.DET_MODEL_DIR)  # Load MTCNN models.
                return pnet, rnet, onet

    def pre_process_image(self, images_data: list[np.ndarray]) -> list[PreprocessedObject]:
        """
        Preprocesses a list of images by detecting faces, aligning them, and resizing.

        Args:
            images_data (list[np.ndarray]): List of input images as NumPy arrays.

        Returns:
            list[PreprocessedObject]: List of preprocessed objects containing bounding boxes and face data.
        """
        with concurrent.futures.ThreadPoolExecutor(max_workers=3) as executor:
            futures = []
            scales = []
            for image in images_data:
                # Resize the image and calculate the scaling factor.
                frame, scaling = resize_image(image, 800, 800)
                scales.append(scaling)
                # Submit the image processing task to the thread pool.
                futures.append(executor.submit(self.process_image, frame))

            frames = []
            for future in concurrent.futures.as_completed(futures):
                result = future.result()  # Collect results from threads.
                frames.append(result)

            results = []
            for i in range(len(frames)):
                if frames[i] is not None:
                    # Convert bounding boxes back to the original size.
                    results.append(
                        PreprocessedObject(
                            convert_bounding_boxes_to_original(frames[i].bounding_boxes, scales[i]),
                            frames[i].faces
                        )
                    )
        return results

    def process_image(self, frame: np.ndarray) -> PreprocessedObject | None:
        """
        Processes a single image to detect faces, align them, and crop the face regions.

        Args:
            frame (np.ndarray): Input image as a NumPy array.

        Returns:
            PreprocessedObject | None: Preprocessed object containing bounding boxes and face data, or None if no faces are found.
        """
        if frame is None or len(frame.shape) < 2:
            return None

        # Detect faces and facial landmarks in the image.
        bounding_boxes, points = detect_face(frame, constant.MINSIZE, self.__pnet, self.__rnet, self.__onet,
                                             constant.THRESHOLD, constant.FACTOR)

        # bounding_boxes: [[148.00093049 133.82583825 376.22581562 454.02033539   0.9953056]]
        # points: [[201.50337] [307.95285] [252.0651] [216.44322]  [298.9202] [257.74042] [256.6488] [324.68854]  [383.765] [381.88498]]

        faces_found = bounding_boxes.shape[0]
        if faces_found > self.__face_number_per_img:
            return None  # Skip if the number of faces exceeds the limit.

        if faces_found > 0:
            # Get coordinates of facial landmarks.
            left_eye, right_eye, _, _, _ = self.get_coordinates(points)
            # Align the face based on eye positions.
            frame, isRotate = self.rotate_face_to_align_eyes(frame, left_eye, right_eye, faces_found != 1)
            if isRotate:
                # If the image was rotated, crop and resize faces.
                return PreprocessedObject(bounding_boxes, self.crop_and_resize_faces(frame))
            else:
                # If no rotation was needed, crop and resize faces using bounding boxes.
                return PreprocessedObject(bounding_boxes, self.crop_and_resize_faces(frame, bounding_boxes))

        return None

    def crop_and_resize_faces(self, frame: np.ndarray, bounding_boxes: np.ndarray = None) -> list[np.ndarray]:
        """
        Crops and resizes detected faces in the image.

        Args:
            frame (np.ndarray): Input image as a NumPy array.
            bounding_boxes (np.ndarray, optional): Bounding boxes for detected faces. Defaults to None.

        Returns:
            list[np.ndarray]: List of cropped and resized face images.
        """
        if bounding_boxes is None:
            # Detect faces if bounding boxes are not provided.
            bounding_boxes, _ = detect_face(frame, constant.MINSIZE, self.__pnet, self.__rnet, self.__onet,
                                            constant.THRESHOLD, constant.FACTOR)

        num_faces = bounding_boxes.shape[0]
        cropped_faces = []
        for i in range(num_faces):
            # Extract bounding box coordinates and ensure they are within image boundaries.
            x1, y1, x2, y2 = bounding_boxes[i, :4].astype(int)
            x1, y1 = max(0, x1), max(0, y1)
            x2, y2 = min(frame.shape[1], x2), min(frame.shape[0], y2)

            # Crop and resize the face region.
            cropped_face = frame[y1:y2, x1:x2, :]
            resized_face = cv2.resize(cropped_face, (constant.INPUT_IMAGE_SIZE, constant.INPUT_IMAGE_SIZE),
                                      interpolation=cv2.INTER_CUBIC)
            cropped_faces.append(resized_face)

        return cropped_faces

    def get_coordinates(self, points):
        """
        Extracts facial landmark coordinates from the points array.

        Args:
            points (np.ndarray): Array of facial landmark points.

        Returns:
            tuple: Coordinates of left eye, right eye, nose, and mouth corners.
        """
        left_eye_x = int(points[0, 0])
        left_eye_y = int(points[5, 0])
        right_eye_x = int(points[1, 0])
        right_eye_y = int(points[6, 0])
        nose_x = int(points[2, 0])
        nose_y = int(points[7, 0])
        mouth_left_x = int(points[3, 0])
        mouth_left_y = int(points[8, 0])
        mouth_right_x = int(points[4, 0])
        mouth_right_y = int(points[9, 0])

        left_eye = (left_eye_x, left_eye_y)
        right_eye = (right_eye_x, right_eye_y)
        nose = (nose_x, nose_y)
        mouth_left = (mouth_left_x, mouth_left_y)
        mouth_right = (mouth_right_x, mouth_right_y)
        return left_eye, right_eye, nose, mouth_left, mouth_right

    def rotate_face_to_align_eyes(self, image: np.ndarray, left_eye: tuple[int, int], right_eye: tuple[int, int],
                                  is_only_face: bool = True) -> tuple[np.ndarray, bool]:
        """
        Rotates the image to align the face based on eye positions.

        Args:
            image (np.ndarray): Input image as a NumPy array.
            left_eye (tuple[int, int]): Coordinates of the left eye.
            right_eye (tuple[int, int]): Coordinates of the right eye.
            is_only_face (bool): Whether to rotate based on the midpoint of the eyes or the image center.

        Returns:
            tuple: Rotated image and a boolean indicating if rotation was applied.
        """
        (x1, y1) = left_eye
        (x2, y2) = right_eye

        # Calculate the angle between the eyes.
        angle = math.degrees(math.atan2(y2 - y1, x2 - x1))

        if abs(angle) < 5:
            return image, False  # Skip rotation if the angle is small.

        image_np = np.array(image)

        if is_only_face:
            # Use the midpoint of the eyes as the rotation center.
            center = ((x1 + x2) // 2, (y1 + y2) // 2)
        else:
            # Use the image center as the rotation center.
            center = (image_np.shape[1] // 2, image_np.shape[0] // 2)

        # Get the rotation matrix and apply the rotation.
        rotation_matrix = cv2.getRotationMatrix2D(center, angle, 1.0)
        rotated_image = cv2.warpAffine(image_np, rotation_matrix, (image_np.shape[1], image_np.shape[0]),
                                       flags=cv2.INTER_LINEAR)
        return rotated_image, True


def resize_image(image: np.ndarray, max_width: int, max_height: int) -> tuple[np.ndarray, float]:
    """
    Resizes an image to fit within the specified maximum width and height while maintaining its aspect ratio.

    Args:
        image (np.ndarray): The input image as a NumPy array.
        max_width (int): The maximum allowed width for the resized image.
        max_height (int): The maximum allowed height for the resized image.

    Returns:
        tuple[np.ndarray, float]: A tuple containing the resized image and the scaling factor used.
    """
    if image is None or len(image.shape) < 2:
        raise ValueError("Invalid image provided")  # Raise an error if the input image is invalid.

    # Step 1: Get the current dimensions of the image.
    height, width = image.shape[:2]

    # Step 2: Check if the image exceeds the maximum dimensions.
    if width > max_width or height > max_height:
        # Calculate the scaling factor to maintain the aspect ratio.
        scaling_factor = min(max_width / width, max_height / height)
        new_width = int(width * scaling_factor)  # Calculate the new width.
        new_height = int(height * scaling_factor)  # Calculate the new height.
        # Resize the image using the calculated dimensions.
        resized_image = cv2.resize(image, (new_width, new_height), interpolation=cv2.INTER_AREA)
        return resized_image, scaling_factor  # Return the resized image and scaling factor.

    return image, 1.0  # Return the original image and a scaling factor of 1.0 if no resizing is needed.


def convert_bounding_boxes_to_original(bboxes_resized: np.ndarray, scaling_factor: float) -> np.ndarray:
    """
    Converts resized bounding boxes back to their original size using the scaling factor.

    Args:
        bboxes_resized (np.ndarray): An array of resized bounding boxes.
        scaling_factor (float): The scaling factor used to resize the image.

    Returns:
        np.ndarray: An array of bounding boxes scaled back to the original size.
    """
    bboxes_orig = bboxes_resized.copy()  # Create a copy of the resized bounding boxes.
    bboxes_orig[:, :4] /= scaling_factor  # Scale the coordinates (x1, y1, x2, y2) back to the original size.
    return bboxes_orig  # Return the bounding boxes in their original size.
