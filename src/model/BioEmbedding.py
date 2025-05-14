# src/model.py
import numpy as np
class BioEmbedding:
    def __init__(self, user_id: int, embedding:np.ndarray):
        self.user_id = user_id
        self.embedding = embedding
