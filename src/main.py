import os
# Add the root directory of the project to the Python path
import sys

from fastapi import FastAPI

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import uvicorn
app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}

if __name__ == "__main__":
    # port = int(os.getenv("PORT", 8111))  # Lấy port từ biến môi trường hoặc dùng 8000 mặc định
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)

# if not run with main.py, then run with uvicorn
# uvicorn main:app --reload