import numpy as np
from sentence_transformers import SentenceTransformer


class SematicSearchService:

    def __init__(self):
        self.model = self.load_model()

    def load_model(self):
        model = SentenceTransformer('dangvantuan/vietnamese-embedding')
        print("Model Transformer loaded successfully")
        return model

    def get_embeddings(self, sentences: list[str]) -> np.ndarray:
        """
        Generates normalized embeddings for a list of sentences

        Args:
            sentences (list[str]): A list of sentences to encode into embeddings.

        Returns:
            np.ndarray: A NumPy array containing the normalized embeddings.
        """
        embeddings = self.model.encode(sentences, normalize_embeddings=True)
        return embeddings


    def search(self):
        pass