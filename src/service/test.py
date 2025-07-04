import os
from collections import defaultdict

import cv2
import numpy as np
import tensorflow as tf
from scipy.spatial.distance import cosine
import src.utils.constant as constant
from src.align.detect_face import create_mtcnn, detect_face
from src.database.face_embedding_repository import get_embedding_by_id
from src.model.ProbabilityResult import ProbabilityResult
from src.service.classification_service import ClassificationService
from src.service.face_service import FaceNetModel
from src.service.preprocess_image_service import PreprocessingImageService


def draw_bounding_boxes(image: np.ndarray, bboxes: np.ndarray, color: tuple = (0, 255, 0),
                        thickness: int = 2) -> np.ndarray:
    """Vẽ các hộp giới hạn lên ảnh và trả về ảnh đã vẽ."""
    img_copy = image.copy()
    for box in bboxes:
        x1, y1, x2, y2, confidence = map(float, box)
        # Chuyển tọa độ thành int
        x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
        # Vẽ hình chữ nhật
        cv2.rectangle(img_copy, (x1, y1), (x2, y2), color, thickness)
        # Vẽ confidence (tùy chọn)
        cv2.putText(img_copy, f"{confidence:.2f}", (x1, y1 - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 1)
    return img_copy


def count_files_in_subdirectories(parent_dir):
    count_folder = 0
    count_file = 0
    file_count_dict = defaultdict(int)

    # Lặp qua tất cả các thư mục con trong thư mục cấp 1
    for dir_name in os.listdir(parent_dir):
        sub_dir_path = os.path.join(parent_dir, dir_name)

        # Kiểm tra xem có phải là thư mục không
        if os.path.isdir(sub_dir_path):
            count_folder += 1
            # Đếm số lượng file trong thư mục cấp 2
            file_count = len([f for f in os.listdir(sub_dir_path) if os.path.isfile(os.path.join(sub_dir_path, f))])
            file_count_dict[dir_name] = file_count
            count_file += file_count

    # Sắp xếp theo số lượng file giảm dần
    sorted_file_counts = sorted(file_count_dict.items(), key=lambda x: x[1], reverse=True)

    # In ra kết quả
    print('count_folder', count_folder)
    print('count_file', count_file)
    print("Số lượng file trong các thư mục cấp 2:")
    for dir_name, count in sorted_file_counts:
        print(f'{dir_name}: {count} file(s)')


# Khởi tạo MTCNN
def detect():
    files = []
    with tf.Graph().as_default():
        gpu_options = tf.compat.v1.GPUOptions(per_process_gpu_memory_fraction=0.6)  # Giới hạn bộ nhớ GPU
        sess = tf.compat.v1.Session(
            config=tf.compat.v1.ConfigProto(gpu_options=gpu_options, log_device_placement=False)
        )
        with sess.as_default():
            pnet, rnet, onet = create_mtcnn(sess, constant.DET_MODEL_DIR)  # Tải mô hình MTCNN

            path = "D:\\Download\\Vietnamese-Celebrity-Face\\dataset\\database-emb"
            # Các định dạng ảnh được hỗ trợ
            supported_extensions = ('.jpg', '.jpeg', '.png', '.bmp')

            # Lặp qua tất cả các thư mục con trong thư mục path
            for dir_name in os.listdir(path):
                sub_dir_path = os.path.join(path, dir_name)
                print(f"Đang xử lý thư mục: {sub_dir_path}")

                # Kiểm tra xem có phải là thư mục không
                if os.path.isdir(sub_dir_path):
                    # Lặp qua tất cả các tệp trong thư mục con
                    for file_name in os.listdir(sub_dir_path):
                        # Kiểm tra xem tệp có phải là ảnh không
                        if file_name.lower().endswith(supported_extensions):
                            image_path = os.path.join(sub_dir_path, file_name)
                            # Đọc ảnh
                            image = cv2.imread(image_path)

                            # Kiểm tra xem ảnh có đọc được không
                            if image is None:
                                print(f"Không thể đọc ảnh: {image_path}")
                                continue

                            # Phát hiện khuôn mặt
                            bounding_boxes, points = detect_face(
                                image,
                                constant.MINSIZE,
                                pnet,
                                rnet,
                                onet,
                                constant.THRESHOLD,
                                constant.FACTOR
                            )

                            # Kiểm tra số khuôn mặt tìm thấy
                            faces_found = bounding_boxes.shape[0] if bounding_boxes is not None else 0
                            if faces_found == 0:
                                files.append(image_path)
                                print(f"Không tìm thấy khuôn mặt trong ảnh: {image_path}")
                                continue

                            percent = bounding_boxes[0][4]
                            # Kiểm tra độ tin cậy
                            if percent < 0.91:
                                print(f"Độ tin cậy thấp: {percent} trong ảnh: {image_path}")
                                files.append(image_path)

    # Đóng session
    sess.close()
    print('-----------------------')
    # delete files

    # for file in files:
    #     try:
    #         os.remove(file)
    #         print(f"Đã xóa tệp: {file}")
    #     except Exception as e:
    #         print(f"Lỗi khi xóa tệp {file}: {e}")
    print('len:', len(files))


def test_classify():
    image = cv2.imread('C:\\Users\\FPT SHOP\\Pictures\\ghrth.jpg')

    pre = PreprocessingImageService(face_number_per_img=10)
    facenet = FaceNetModel()
    classification = ClassificationService()

    result = pre.pre_process_image([image])[0]

    print('face number:', len(result.faces))
    embeddings = facenet.get_embeddings(result.faces)

    results :list[ProbabilityResult] = classification.predict(embeddings)
    # In kết quả
    for i, result in enumerate(results):
        print(f"Khuôn mặt {i + 1}:")
        print(f"Lớp: {result.class_id}, Xác suất: {result.probability:.4f}")


def compare_embeddings():
    # image = cv2.imread('C:\\Users\\FPT SHOP\\Pictures\\ghrth.jpg')
    image = cv2.imread('D:\\Download\\Vietnamese-Celebrity-Face\\dataset\\database-emb\\1\\1671998465655418000.jpg')

    pre = PreprocessingImageService(face_number_per_img=10)
    facenet = FaceNetModel()

    result = pre.pre_process_image([image])[0]

    print('face number:', len(result.faces))
    embeddings = facenet.get_embeddings(result.faces)

    # In kích thước của embeddings
    # print('embeddings shape:', embeddings.shape)
    embedding1 = embeddings[0]

    face = get_embedding_by_id(1)
    embedding2 = face.embedding

    # print(embedding1)
    # print(('---' * 20))
    # print(embedding2)

    # Check exact equality
    exact_match = np.array_equal(embedding1, embedding2)

    # Compute cosine similarity
    # Cosine distance = 1 - cosine similarity
    cosine_distance = cosine(embedding1, embedding2)
    cosine_similarity = 1 - cosine_distance

    # Determine if they represent the same person (using a common threshold)
    similarity_threshold = 0.6  # Adjust based on your FaceNet model
    is_same_person = cosine_similarity > similarity_threshold

    print('res:', {
        "exact_match": exact_match,
        "cosine_similarity": cosine_similarity,
        "cosine_distance": cosine_distance,
        "is_same_person": is_same_person,
    })


# detect()
count_files_in_subdirectories("D:\\Download\\Vietnamese-Celebrity-Face\\dataset-v2\\train")
print('-----------------------')
count_files_in_subdirectories("D:\\Download\\Vietnamese-Celebrity-Face\\dataset-v2\\test")
