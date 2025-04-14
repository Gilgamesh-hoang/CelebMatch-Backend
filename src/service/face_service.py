import numpy as np
import tensorflow as tf

import src.face_recognition.facenet as facenet
import src.utils.constant as constant

class FaceNetModel:
    def __init__(self, model_path: str):
        """
        Khởi tạo FaceNet model, tải một lần duy nhất.

        Args:
            model_path (str): Đường dẫn đến tệp mô hình FaceNet (.pb).
        """
        self.graph = tf.Graph()
        with self.graph.as_default():
            self.gpu_options = tf.compat.v1.GPUOptions(per_process_gpu_memory_fraction=0.6)
            self.session = tf.compat.v1.Session(
                config=tf.compat.v1.ConfigProto(gpu_options=self.gpu_options, log_device_placement=False)
            )
            with self.session.as_default():
                print(f"Loading FaceNet model from {model_path}")
                facenet.load_model(model_path)
                self.images_placeholder = tf.compat.v1.get_default_graph().get_tensor_by_name("input:0")
                self.embeddings_tensor = tf.compat.v1.get_default_graph().get_tensor_by_name("embeddings:0")
                self.phase_train_placeholder = tf.compat.v1.get_default_graph().get_tensor_by_name("phase_train:0")


    def prewhiten_batch(self, images: list[np.ndarray]) -> np.ndarray:
        """
        Applies the prewhiten operation to each image in the list and returns them as a single NumPy array.

        Args:
            images (list[np.ndarray]): A list of images represented as NumPy arrays.

        Returns:
            np.ndarray: A single NumPy array containing the prewhitened images.
        """
        # Apply the prewhiten function to each image in the list.
        prewhitened_images = [facenet.prewhiten(img) for img in images]
        # Stack the prewhitened images into a single NumPy array.
        return np.stack(prewhitened_images)

    def get_embeddings(self, images_data: list[np.ndarray]) -> np.ndarray:
        """
        Computes embeddings for a list of images using the FaceNet model.

        Args:
            images_data (list[np.ndarray]): A list of images represented as NumPy arrays.

        Returns:
            list[np.ndarray]: A list of embeddings for the input images.
        """
        if not images_data:
            return np.array([])

        with self.graph.as_default():
            with self.session.as_default():
                prewhitened_images = self.prewhiten_batch(images_data)
                reshaped = prewhitened_images.reshape(
                    -1, constant.INPUT_IMAGE_SIZE, constant.INPUT_IMAGE_SIZE, 3
                )
                feed_dict = {
                    self.images_placeholder: reshaped,
                    self.phase_train_placeholder: False
                }
                embeddings = self.session.run(self.embeddings_tensor, feed_dict=feed_dict)
                return embeddings



    def __del__(self):
        """
        Đóng session khi đối tượng bị hủy.
        """
        if hasattr(self, 'session'):
            self.session.close()
            print("TensorFlow session closed.")