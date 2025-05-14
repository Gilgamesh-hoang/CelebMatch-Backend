# src/model.py
import numpy as np

class Award:
    def __init__(self, id: int, user_id: int, award: str = None, embedding: np.ndarray = None):
        self.id = id
        self.user_id = user_id
        self.award = award
        self.embedding = embedding

    @classmethod
    def from_award(cls, id: int, user_id: int, award: str):
        return cls(id=id, user_id=user_id, award=award, embedding=None)

    @classmethod
    def from_embedding(cls, id: int, user_id: int, embedding: np.ndarray):
        return cls(id=id, user_id=user_id, award=None, embedding=embedding)

    def __str__(self):
        if self.award is not None:
            return f"Award(id={self.id}, user_id={self.user_id}, award={self.award})"
        return f"Award(id={self.id}, user_id={self.user_id}, embedding={self.embedding})"
