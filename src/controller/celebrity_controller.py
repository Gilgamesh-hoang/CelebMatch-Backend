from typing import List

import cv2
import numpy as np
from fastapi import APIRouter, UploadFile, HTTPException, File
from scipy.spatial.distance import cosine
from src.service.face_service import FaceNetModel
from src.service.preprocessing_service import PreprocessingService

router = APIRouter()
preprocessing_service = PreprocessingService()
facenet_model = FaceNetModel()
THRESHOLD = 0.4 # Ngưỡng chấp nhận

# endpoint này chấp nhận request POST với body là FormData có field "file" chứa File hình ảnh.
@router.post("/verify")
async def verify(files: List[UploadFile] = File(...)):
    # Kiểm tra số lượng file tải lên là 2
    if len(files) != 2:
        raise HTTPException(status_code=400, detail="Exactly two image files are required.")

    images = []
    for file in files:
        if not file.content_type.startswith("image/"):
            raise HTTPException(status_code=400, detail="All uploaded files must be images.")
        image_bytes = await file.read()
        np_arr = np.frombuffer(image_bytes, np.uint8)
        frame = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        if frame is None:
            raise HTTPException(status_code=400, detail="Invalid image format.")
        images.append(frame)

    # Xử lý ảnh để phát hiện khuôn mặt
    results = preprocessing_service.pre_process_image(images)

    # Kiểm tra nếu mỗi ảnh có ít nhất 1 khuôn mặt
    if len(results) != 2 or len(results[0].faces) == 0 or len(results[1].faces) == 0:
        raise HTTPException(status_code=400, detail="Each image must contain at least one face.")

    # Lấy khuôn mặt đầu tiên trong mỗi ảnh
    face1 = results[0].faces[0]
    face2 = results[1].faces[0]

    # Trích xuất embeddings từ các khuôn mặt
    embeddings = facenet_model.get_embeddings([face1, face2])

    # Lấy embedding cho từng khuôn mặt
    emb1 = embeddings[0]
    emb2 = embeddings[1]

    # Tính khoảng cách cosine giữa hai embedding
    similarity_score = cosine(emb1, emb2)
    similarity_score = similarity_score.item() #Chuyển numpy.float64 thành float chuẩn
    is_same_person = bool(similarity_score < THRESHOLD)
    return {
        "is_same_person": is_same_person,
        "similarity_score": similarity_score
    }
