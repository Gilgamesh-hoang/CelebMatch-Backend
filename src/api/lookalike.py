import http
import io
import traceback
from concurrent.futures import ThreadPoolExecutor

import numpy as np
from PIL import Image
from fastapi import APIRouter, UploadFile, File, Request
from fastapi.encoders import jsonable_encoder
from starlette.responses import JSONResponse

from src.database.celebrity_repository import get_celebrity_info
from src.database.face_embedding_repository import load_celebrity_embeddings
from sklearn.metrics.pairwise import cosine_similarity

router = APIRouter()


@router.post("/lookalike")
async def lookalike(request: Request, upload_file: UploadFile = File(...)) -> JSONResponse:
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

        print("Preprocessed objects:")

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
        print(f"Detected faces: {len(face)}")

        if len(face) > 1:
            return JSONResponse(
                status_code=http.HTTPStatus.BAD_REQUEST,
                content={"message": "Multiple faces detected. Please upload an image with only one face."}
            )

        # 2. Trích xuất embedding của khuôn mặt
        embedding: np.ndarray = facenet_model.get_embeddings(face)

        # 3. Tính khoảng cách cosine đa luồng
        def cosine_sim(item):
            celeb_id, celeb_embedding = item
            similarity =  cosine_similarity(embedding.reshape(1, -1), celeb_embedding.reshape(1, -1))[0][0]
            return (celeb_id, similarity)


        with ThreadPoolExecutor() as executor:
            similarities = list(executor.map(cosine_sim, celebrity_embeddings.items()))

        print("Similarities:")
        # 4. Tìm 2 người nổi tiếng giống nhất
        top_matches = sorted(similarities, key=lambda x: x[1])[:2]

        results = []
        for celeb_id, similarity in top_matches:
            celeb_info = get_celebrity_info(celeb_id)
            if celeb_info is None:
                continue

            # similarity = (1 - dist) * 100

            results.append({
                "singer": jsonable_encoder(celeb_info),
                "similarity": round((similarity * 100), 2)
            })

        return JSONResponse(status_code=http.HTTPStatus.OK, content=results)

    except Exception as e:
        traceback.print_exc()
        return JSONResponse(
            status_code=http.HTTPStatus.INTERNAL_SERVER_ERROR,
            content={"error": str(e)}
        )
