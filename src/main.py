import os
# Add the root directory of the project to the Python path
import sys
from contextlib import asynccontextmanager

from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

from api.predict import router as predict_router
from api.verify import router as verify_router
from api.lookalike import router as celebs_router
from src.service.face_service import FaceNetModel
from src.service.preprocess_image_service import PreprocessingImageService
from starlette.datastructures import State

from src.service.semantic_search_service import SematicSearchService

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import uvicorn
# app = FastAPI()

@asynccontextmanager
async def lifespan(app: FastAPI):
    """Lifespan handler để load model khi ứng dụng khởi động."""
    print("Starting application...")
    app.state: State
    app.state.facenet_model = FaceNetModel()
    app.state.preprocess_image_service = PreprocessingImageService(face_number_per_img=3)
    app.state.sematic_search_service = SematicSearchService()
    yield  # Ứng dụng chạy tại đây
    print("Shutting down application...")

app = FastAPI(lifespan=lifespan)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["GET", "POST"],
    allow_headers=["Content-Type"]
)
app.include_router(predict_router)
app.include_router(verify_router)
app.include_router(celebs_router)

if __name__ == "__main__":
    # port = int(os.getenv("PORT", 8111))  # Lấy port từ biến môi trường hoặc dùng 8000 mặc định
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)

# if not run with main.py, then run with uvicorn
# uvicorn main:app --reload