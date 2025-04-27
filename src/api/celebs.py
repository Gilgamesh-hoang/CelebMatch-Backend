import http
from concurrent.futures import ThreadPoolExecutor

import numpy as np
from PIL import Image
from fastapi import APIRouter, UploadFile, File
from starlette.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from src.service.preprocessing_service import PreprocessingService
from src.service.face_service import FaceNetModel
from src.service.classification_service import ClassificationService
from src.database.celebrity_repository import get_celebrity_by_id
from src.database.load_celebrity_embeddings import load_celebrity_embeddings
from src.database.get_celebrity_info import get_celebrity_info
import io
import traceback
from concurrent.futures import ThreadPoolExecutor
from scipy.spatial.distance import cosine

router = APIRouter()

@router.post("/predict")
async def predict(upload_file: UploadFile = File(...)) -> JSONResponse:
    try:
        # Đọc ảnh từ file upload
        image_bytes: bytes = await upload_file.read()
        image: Image.Image = Image.open(io.BytesIO(image_bytes)).convert("RGB")
        image_np: np.ndarray = np.array(image)

        # Khởi tạo các service và model
        preprocessing_service = PreprocessingService()
        classification_service = ClassificationService()
        facenet_model = FaceNetModel()

        # Tiền xử lý ảnh, nhận diện khuôn mặt
        preprocessed_objects = preprocessing_service.pre_process_image([image_np])
        result: list[dict] = []

        # Lấy đối tượng tiền xử lý đầu tiên (chỉ xét ảnh đầu tiên trong danh sách)
        preprocessed_object = preprocessed_objects[0]

        # Nếu phát hiện khuôn mặt thì trích xuất embedding và phân loại
        if preprocessed_object is not None and preprocessed_object.faces is not None:
            embedding: np.ndarray = facenet_model.get_embeddings(preprocessed_object.faces)
            prediction_results = classification_service.predict(embedding)

            # Duyệt qua từng kết quả phân loạic
            for i, pred in enumerate(prediction_results):
                # Lấy thông tin người nổi tiếng từ ID
                singer_info = get_celebrity_by_id(pred.class_id)
                if singer_info is None:
                    continue

                # Thêm kết quả vào danh sách trả về
                result.append({
                    "bounding_box": preprocessed_object.bounding_boxes[i].tolist()[:4],
                    "singer": jsonable_encoder(singer_info),
                    "probability": pred.probability
                })

        # Trả về kết quả với mã trạng thái 200 (OK)
        return JSONResponse(status_code=http.HTTPStatus.OK,content=result)
    except Exception as e:
        # In traceback ra log (debug)
        traceback.print_exc()

        # Trả về lỗi nếu xảy ra exception
        return JSONResponse(status_code=http.HTTPStatus.INTERNAL_SERVER_ERROR, content={"error": str(e)})

@router.post("/lookalike")
async def lookalike(upload_file: UploadFile = File(...)) -> JSONResponse:
    try:
        # Đọc file ảnh
        image_bytes: bytes = await upload_file.read()
        image: Image.Image = Image.open(io.BytesIO(image_bytes)).convert("RGB")
        image_np: np.ndarray = np.array(image)

        # Khởi tạo service
        preprocessing_service = PreprocessingService()
        facenet_model = FaceNetModel()

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