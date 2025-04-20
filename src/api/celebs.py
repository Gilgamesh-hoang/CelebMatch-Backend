import http

import numpy as np
from PIL import Image
from fastapi import APIRouter, UploadFile, File
from starlette.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from src.service.preprocessing_service import PreprocessingService
from src.service.face_service import FaceNetModel
from src.service.classification_service import ClassificationService
from src.database.celebrity_repository import get_celebrity_by_id
import io
import traceback

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

            # Duyệt qua từng kết quả phân loại
            # test 2

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