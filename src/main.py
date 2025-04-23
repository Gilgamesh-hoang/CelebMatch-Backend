import os
# Add the root directory of the project to the Python path
import sys
from contextlib import asynccontextmanager

from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

from src.database.celebrity_repository import get_celebrity_by_id
from api.celebs import router as celebs_router

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import uvicorn
app = FastAPI()

@asynccontextmanager
async def lifespan(app: FastAPI):
    """Lifespan handler để load model khi ứng dụng khởi động."""
    print("Starting application...")
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

app.include_router(celebs_router)
@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}


app.include_router(celebs_router)

if __name__ == "__main__":
    # port = int(os.getenv("PORT", 8111))  # Lấy port từ biến môi trường hoặc dùng 8000 mặc định
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)

celebrity = get_celebrity_by_id(1)
if celebrity:
    print(celebrity)
else:
    print("Not found")

# if not run with main.py, then run with uvicorn
# uvicorn main:app --reload