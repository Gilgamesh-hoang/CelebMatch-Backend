import http
import io
import traceback
from concurrent.futures import ThreadPoolExecutor

import numpy as np
from PIL import Image
from fastapi import APIRouter, UploadFile, File, Request, HTTPException
from fastapi.encoders import jsonable_encoder

from src.database.celebrity_repository import get_celebrity_info
from src.database.face_embedding_repository import load_celebrity_embeddings
from sklearn.metrics.pairwise import cosine_similarity

router = APIRouter()


@router.post("/lookalike")
async def lookalike(request: Request, upload_file: UploadFile = File(...)):
    facenet_model = request.app.state.facenet_model
    preprocess_image_service = request.app.state.preprocess_image_service

    try:
        # Đọc file ảnh
        image_bytes: bytes = await upload_file.read()
        image: Image.Image = Image.open(io.BytesIO(image_bytes)).convert("RGB")
        image_np: np.ndarray = np.array(image)

        celebrity_embeddings = load_celebrity_embeddings()

        # 1. Preprocess ảnh: detect và crop khuôn mặt
        preprocessed_objects = preprocess_image_service.pre_process_image([image_np])

        if not preprocessed_objects or preprocessed_objects[0].faces is None:
            raise HTTPException(
                status_code=404,
                detail={"message": "No face detected."}
            )

        preprocessed_object = preprocessed_objects[0]
        face = preprocessed_object.faces

        if len(face) > 1:
            raise HTTPException(
                status_code=400,
                detail={"message": "Multiple faces detected. Please upload an image with only one face."}
            )

        # 2. Trích xuất embedding của khuôn mặt
        embedding: np.ndarray = facenet_model.get_embeddings(face)

        # 3. Tính khoảng cách cosine đa luồng
        def cosine_sim(item):
            celeb_id, celeb_embedding = item
            similarity = cosine_similarity(embedding.reshape(1, -1), celeb_embedding.reshape(1, -1))[0][0]
            return (celeb_id, similarity)

        with ThreadPoolExecutor() as executor:
            similarities = list(executor.map(cosine_sim, celebrity_embeddings.items()))

        # 4. Tìm 1 người nổi tiếng giống nhất
        top_matches = sorted(similarities, key=lambda x: x[1], reverse=True)[:1]

        results = []
        for celeb_id, similarity in top_matches:
            celeb_info = get_celebrity_info(celeb_id)
            if celeb_info is None:
                continue

            similarity_float = float(similarity)
            if similarity_float < 0:
                similarity_float = 0.0

            results.append({
                "singer": jsonable_encoder(celeb_info),
                "similarity": similarity_float
            })

        return results

    except Exception as e:
        traceback.print_exc()
        raise HTTPException(
            status_code=500,
            detail={"error": str(e)}
        )
