import http
import io
import traceback
from concurrent.futures import ThreadPoolExecutor

import numpy as np
from PIL import Image
from fastapi import APIRouter, UploadFile, File
from fastapi.encoders import jsonable_encoder
from scipy.spatial.distance import cosine
from starlette.responses import JSONResponse

from src.database.celebrity_repository import get_celebrity_info
from src.database.face_embedding_repository import load_celebrity_embeddings
from src.service.face_service import FaceNetModel
from src.service.preprocessing_service import PreprocessingService

router = APIRouter()
preprocessing_service = PreprocessingService()
facenet_model = FaceNetModel()


@router.post("/lookalike")
async def lookalike(upload_file: UploadFile = File(...)) -> JSONResponse:
    try:
        # Đọc file ảnh
        image_bytes: bytes = await upload_file.read()
        image: Image.Image = Image.open(io.BytesIO(image_bytes)).convert("RGB")
        image_np: np.ndarray = np.array(image)

        celebrity_embeddings = load_celebrity_embeddings()

        # 1. Preprocess ảnh: detect và crop khuôn mặt
        preprocessed_objects = preprocessing_service.pre_process_image([image_np])

        if not preprocessed_objects:
            return JSONResponse(
                status_code=http.HTTPStatus.BAD_REQUEST,
                content={"message": "No face detected."}
            )

        preprocessed_object = preprocessed_objects[0]

        if preprocessed_object.faces is None:
            return JSONResponse(
                status_code=http.HTTPStatus.BAD_REQUEST,
                content={"message": "No face detected."}
            )

        face = preprocessed_object.faces

        if len(face) > 1:
            return JSONResponse(
                status_code=http.HTTPStatus.BAD_REQUEST,
                content={"message": "Multiple faces detected. Please upload an image with only one face."}
            )

        # 2. Trích xuất embedding của khuôn mặt
        embedding: np.ndarray = facenet_model.get_embeddings(face)

        # 3. Tính khoảng cách cosine đa luồng
        def compute_distance(item):
            celeb_id, celeb_embedding = item
            dist = cosine(embedding.flatten(), celeb_embedding.flatten())
            return (celeb_id, float(dist))  # Ép float luôn tại đây

        with ThreadPoolExecutor() as executor:
            distances = list(executor.map(compute_distance, celebrity_embeddings.items()))

        # 4. Tìm 2 người nổi tiếng giống nhất
        top_matches = sorted(distances, key=lambda x: x[1])[:2]

        results = []
        for celeb_id, dist in top_matches:
            celeb_info = get_celebrity_info(celeb_id)
            if celeb_info is None:
                continue

            similarity = (1 - dist) * 100

            results.append({
                "singer": jsonable_encoder(celeb_info),
                "similarity": round(float(similarity), 2)
            })

        return JSONResponse(status_code=http.HTTPStatus.OK, content=results)

    except Exception as e:
        traceback.print_exc()
        return JSONResponse(
            status_code=http.HTTPStatus.INTERNAL_SERVER_ERROR,
            content={"error": str(e)}
        )
