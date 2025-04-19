import numpy as np

class FaceEmbedding:
    def __init__(self, user_id: int, embedding: np.ndarray, img_url: str | None):
        self.user_id = user_id
        self.embedding = embedding  # np.ndarray, shape (512,)
        self.img_url = img_url

    def __repr__(self):
        return f"FaceEmbedding(user_id={self.user_id}, embedding_shape={self.embedding.shape}, img_url={self.img_url})"