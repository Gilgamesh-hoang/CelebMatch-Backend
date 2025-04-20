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
async def predict(upload_file: UploadFile = File(...)):
    try:
        image_bytes = await upload_file.read()
        image = Image.open(io.BytesIO(image_bytes)).convert("RGB")
        image_np = np.array(image)
        preprocessing_service = PreprocessingService()
        classification_service = ClassificationService()
        facenet_model = FaceNetModel()
        preprocessed_objects = preprocessing_service.pre_process_image([image_np])
        result = []
        preprocessed_object = preprocessed_objects[0]
        if preprocessed_object is not None and preprocessed_object.faces is not None:
            embedding = facenet_model.get_embeddings(preprocessed_object.faces)
            prediction_results = classification_service.predict(embedding)
            for pred in prediction_results:
                singer_info = get_celebrity_by_id(pred.class_id)
                if singer_info is None:
                    continue
                result.append({
                    "bounding_box": preprocessed_object.bounding_boxes.flatten().tolist(),
                    "singer": jsonable_encoder(singer_info),
                    "probability": round(pred.probability, 2)
                })
        return JSONResponse(status_code=http.HTTPStatus.OK,content=result)
    except Exception as e:
        traceback.print_exc()
        return JSONResponse(status_code=http.HTTPStatus.INTERNAL_SERVER_ERROR, content={"error": str(e)})