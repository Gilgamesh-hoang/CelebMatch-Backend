import os

import cv2
import numpy as np

from src.database.face_embedding_repository import save
from src.service.face_service import FaceNetModel
from src.service.preprocessing_service import PreprocessingService


def create_dataset1(root_path: str, output_file: str):
    """
    Tạo dataset từ các ảnh khuôn mặt trong các thư mục con.

    Args:
        root_path (str): Đường dẫn đến thư mục gốc chứa các thư mục con (1-30).
        output_file (str): Tệp để lưu dataset (định dạng .npy).

    """
    # Khởi tạo PreprocessingService
    pre = PreprocessingService()
    faceNet = FaceNetModel()

    # Danh sách lưu dataset: [(embedding, label), ...]
    dataset = []
    # Các định dạng ảnh được hỗ trợ
    supported_extensions = ('.jpg', '.jpeg', '.png', '.bmp')

    # Lặp qua các thư mục con (1 đến 30)
    for dir_name in sorted(os.listdir(root_path)):
        try:
            label = int(dir_name)  # Label là số thư mục (1-30)
            if label < 1 or label > 30:
                print(f"Bỏ qua thư mục không trong khoảng 1-30: {dir_name}")
                continue  # Bỏ qua nếu không phải 1-30
        except ValueError:
            print(f"Bỏ qua thư mục không phải số: {dir_name}")
            continue

        sub_dir_path = os.path.join(root_path, dir_name)
        if not os.path.isdir(sub_dir_path):
            print(f"Bỏ qua vì không phải thư mục: {sub_dir_path}")
            continue

        print(f"Xử lý thư mục: {sub_dir_path} (Label: {label})")

        images = []
        # Lặp qua các tệp ảnh trong thư mục con
        for file_name in os.listdir(sub_dir_path):
            if file_name.lower().endswith(supported_extensions):
                image_path = os.path.join(sub_dir_path, file_name)

                # Đọc ảnh
                image = cv2.imread(image_path)
                if image is None:
                    print(f"Không thể đọc ảnh: {image_path}")
                    continue

                images.append(image)
            else:
                print(f"Bỏ qua tệp không phải ảnh: {file_name}")

        # Tiền xử lý ảnh
        results = pre.pre_process_image(images)

        # Kiểm tra kết quả tiền xử lý
        if not results:
            print(f"Không tìm thấy khuôn mặt trong ảnh: {sub_dir_path}")
            continue

        print(f"Đã phát hiện {len(results)} khuôn mặt trong thư mục: {sub_dir_path}")
        # Lấy embeddings từ các khuôn mặt
        faces = []
        for result in results:
            faces.extend(result.faces)

        embeddings = faceNet.get_embeddings(faces)
        if len(embeddings) == 0:
            print(f"Không lấy được embeddings từ ảnh: {sub_dir_path}")
            continue

        # Thêm các cặp (embedding, label) vào dataset
        for embedding in embeddings:
            dataset.append((embedding, label))

        print(f"Đã thêm embedding cho label {label}: {len(embeddings)} embeddings")
        print('-----------------------' * 5)

    # Lưu dataset vào file
    if dataset:
        # Chuyển dataset thành mảng NumPy
        embeddings_array = np.array([item[0] for item in dataset])
        labels_array = np.array([item[1] for item in dataset])

        # Lưu vào file .npy
        np.savez(output_file, embeddings=embeddings_array, labels=labels_array)
        print(f"Đã lưu dataset vào: {output_file}")
        print(f"Tổng số embeddings: {len(dataset)}")
    else:
        print("Dataset rỗng, không lưu file.")

    return dataset


def create_dataset2(root_path: str, output_npz: str):
    pre = PreprocessingService()
    faceNet = FaceNetModel()
    dataset = []
    supported_extensions = ('.jpg', '.jpeg', '.png', '.bmp')

    for dir_name in sorted(os.listdir(root_path)):
        try:
            label = int(dir_name)
            if label < 1 or label > 30:
                continue
        except ValueError:
            print(f"Bỏ qua thư mục không phải số: {dir_name}")
            continue

        sub_dir_path = os.path.join(root_path, dir_name)
        if not os.path.isdir(sub_dir_path):
            continue

        print(f"Xử lý thư mục: {sub_dir_path} (Label: {label})")
        count_emb = 0
        for file_name in os.listdir(sub_dir_path):
            if file_name.lower().endswith(supported_extensions):
                image_path = os.path.join(sub_dir_path, file_name)
                image = cv2.imread(image_path)
                if image is None:
                    print(f"Không thể đọc ảnh: {image_path}")
                    continue

                results = pre.pre_process_image([image])
                if not results:
                    print(f"Không tìm thấy khuôn mặt trong ảnh: {image_path}")
                    continue

                result = results[0]
                if result.faces is None or not result.faces:
                    print(f"Không có khuôn mặt được cắt từ ảnh: {image_path}")
                    continue

                # Lấy embeddings và kiểm tra độ dài
                embeddings = faceNet.get_embeddings(result.faces)
                if len(embeddings) == 0:  # Sửa lỗi ở đây
                    print(f"Không lấy được embeddings từ ảnh: {image_path}")
                    continue

                if len(embeddings) > 1:
                    print(f"Tìm thấy nhiều khuôn mặt trong ảnh: {image_path}, chỉ lấy khuôn mặt đầu tiên.")

                # Thêm các cặp (embedding, label) vào dataset
                for embedding in embeddings:
                    count_emb += 1
                    dataset.append((embedding, label))
                    # print(f"Thêm embedding từ ảnh: {image_path}, Label: {label}")
        print(f"count_emb: {count_emb}")
        print('-----------------------' * 5)

    if dataset:
        embeddings_array = np.array([item[0] for item in dataset])
        labels_array = np.array([item[1] for item in dataset])
        np.savez(output_npz, embeddings=embeddings_array, labels=labels_array)
        print(f"Đã lưu dataset vào: {output_npz}")


def insert_embeddings_to_database(root_path: str):
    pre = PreprocessingService()
    faceNet = FaceNetModel()
    supported_extensions = ('.jpg', '.jpeg', '.png', '.bmp')


    for dir_name in sorted(os.listdir(root_path)):
        try:
            label = int(dir_name)
            if label < 1 or label > 30:
                continue
        except ValueError:
            print(f"Bỏ qua thư mục không phải số: {dir_name}")
            continue

        sub_dir_path = os.path.join(root_path, dir_name)
        if not os.path.isdir(sub_dir_path):
            continue

        print(f"Xử lý thư mục: {sub_dir_path} (Label: {label})")
        for file_name in os.listdir(sub_dir_path):
            if file_name.lower().endswith(supported_extensions):
                image_path = os.path.join(sub_dir_path, file_name)
                image = cv2.imread(image_path)
                if image is None:
                    print(f"Không thể đọc ảnh: {image_path}")
                    continue

                results = pre.pre_process_image([image])
                if not results:
                    print(f"Không tìm thấy khuôn mặt trong ảnh: {image_path}")
                    continue

                result = results[0]
                if result.faces is None or not result.faces:
                    print(f"Không có khuôn mặt được cắt từ ảnh: {image_path}")
                    continue

                # Lấy embeddings và kiểm tra độ dài
                embeddings = faceNet.get_embeddings(result.faces)
                # embeddings.shape = (1, 512)
                if len(embeddings) == 0:
                    print(f"Không lấy được embeddings từ ảnh: {image_path}")
                    continue

                if len(embeddings) > 1:
                    print(f"Tìm thấy nhiều khuôn mặt trong ảnh: {image_path}, chỉ lấy khuôn mặt đầu tiên.")

                # Lấy embedding đầu tiên
                embedding = embeddings[0]  # Shape: (512,)

                # Serialize embedding to bytes
                embedding_bytes = embedding.tobytes()

                # Thêm vào database
                save(label, embedding_bytes)




def load_dataset(file_path: str):
    # Tải tệp .npz
    data = np.load(file_path)

    # Truy cập embeddings và labels
    embeddings = data["embeddings"]
    labels = data["labels"]

    # In thông tin để kiểm tra
    print(f"Embeddings shape: {embeddings.shape}")
    print(f"Labels shape: {labels.shape}")
    print(f"First embedding: {embeddings[0]}")
    print(f"First label: {labels[0]}")
    print(f"Total number of embeddings: {len(embeddings)}")
    print(f"Total number of labels: {len(labels)}")
    print(f"Unique labels: {np.unique(labels)}")

# insert_embeddings_to_database("D:\\Download\\Vietnamese-Celebrity-Face\\dataset\\database-emb")


# create_dataset2("D:\\Download\\Vietnamese-Celebrity-Face\\dataset\\test",
#                "E:\\CelebMatch\\Dataset\\test")

# load_dataset("E:\\CelebMatch\\Dataset\\test.npz")
