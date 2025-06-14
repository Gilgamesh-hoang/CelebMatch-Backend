import http
import io
import traceback

import numpy as np
from PIL import Image
from fastapi import APIRouter, UploadFile, File, Request
from fastapi.encoders import jsonable_encoder
from starlette.responses import JSONResponse

from src.database.celebrity_repository import get_celebrity_info

router = APIRouter()

@router.post("/predict")
async def predict(request: Request, upload_file: UploadFile = File(...)) -> JSONResponse:
    facenet_model = request.app.state.facenet_model
    preprocess_image_service = request.app.state.preprocess_image_service
    classification_service = request.app.state.classification_service

    try:
        # Đọc ảnh từ file upload
        image_bytes: bytes = await upload_file.read()
        image: Image.Image = Image.open(io.BytesIO(image_bytes)).convert("RGB")
        image_np: np.ndarray = np.array(image)

        # Tiền xử lý ảnh, nhận diện khuôn mặt
        preprocessed_objects = preprocess_image_service.pre_process_image([image_np])
        result: list[dict] = []

        # Lấy đối tượng tiền xử lý đầu tiên (chỉ xét ảnh đầu tiên trong danh sách)
        preprocessed_object = preprocessed_objects[0]

        if not preprocessed_objects:
            return JSONResponse(status_code=http.HTTPStatus.OK, content=result)

        # Nếu phát hiện khuôn mặt thì trích xuất embedding và phân loại
        if preprocessed_object is not None and preprocessed_object.faces is not None:
            embedding: np.ndarray = facenet_model.get_embeddings(preprocessed_object.faces)
            prediction_results = classification_service.predict(embedding)

            # Duyệt qua từng kết quả phân loại
            for i, pred in enumerate(prediction_results):
                bounding_boxes = preprocessed_object.bounding_boxes[i].tolist()

                # Lấy thông tin người nổi tiếng từ ID
                singer_info = get_celebrity_info(pred.class_id)
                if singer_info is None:
                    print(f"Không tìm thấy thông tin người nổi tiếng cho ID: {pred.class_id}")
                    continue

                # Thêm kết quả vào danh sách trả về
                result.append({
                    "bounding_box": bounding_boxes[:4],
                    "singer": jsonable_encoder(singer_info),
                    "probability": pred.probability
                })

        # Trả về kết quả với mã trạng thái 200 (OK)
        return JSONResponse(status_code=http.HTTPStatus.OK, content=result)
    except Exception as e:
        # In traceback ra log (debug)
        traceback.print_exc()

        # Trả về lỗi nếu xảy ra exception
        return JSONResponse(status_code=http.HTTPStatus.INTERNAL_SERVER_ERROR, content={"error": str(e)})
