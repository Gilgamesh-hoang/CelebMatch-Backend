import cv2
import numpy as np

from src.service.face_service import get_embeddings
from src.service.preprocessing_service import PreprocessingService


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


image = cv2.imread(
    'C:\\Users\\FPT SHOP\\Pictures\\Saved Pictures\\IMG_20240213_123353.jpg')

pre = PreprocessingService(face_number_per_img=10)
result = pre.pre_process_image([image])[0]

print('face number:', len(result.faces))
embeddings = get_embeddings(result.faces)
print('embeddings:', len(embeddings))
print('shape:', embeddings[0].shape)

if result.bounding_boxes is not None:
    # Vẽ bounding_boxes lên ảnh gốc
    image_with_boxes = draw_bounding_boxes(image, result.bounding_boxes, color=(0, 255, 0))
    # Tùy chọn: Hiển thị ảnh
    output_path = f"image_with_boxes.jpg"
    cv2.imwrite(output_path, image_with_boxes)
