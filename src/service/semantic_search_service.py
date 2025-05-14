from sentence_transformers import SentenceTransformer
import numpy as np
from src.database.bio_embedding_repository import save as bio_save
from src.database.song_repository import save_song_embedding as song_save
from src.database.celebrity_repository import get_celebrity_by_id
from src.database.song_repository import get_all_songs as get_all_songs
from src.database.award_repository import get_all_awards as get_all_awards
from src.service.preprocess_text_service import preprocess_sentence


class SematicSearchService:

    def __init__(self):
        self.model = self.load_model()

    def load_model(self):
        model = SentenceTransformer('dangvantuan/vietnamese-embedding')
        print("Model Transformer loaded successfully")
        return model

    def get_embeddings(self, sentences: list[str]) -> np.ndarray:
        """ Generates embeddings for a list of sentences using the loaded SentenceTransformer model.
        Args:
            sentences (list[str]): A list of sentences to encode into embeddings.

        Returns:
            np.ndarray: A NumPy array containing the embeddings for the input sentences.
        """
        embeddings = self.model.encode(sentences)
        return embeddings


sematic = SematicSearchService()


def insert_bio():
    for i in range(1, 31):
        celeb = get_celebrity_by_id(i)
        if celeb:
            bio = preprocess_sentence(celeb.biography)
            embeddings = sematic.get_embeddings([bio])
            bio_save(celeb.id, embeddings[0].tobytes())


def insert_song():
    songs = get_all_songs()
    for song in songs:
        song_name = preprocess_sentence(song.song)
        embeddings = sematic.get_embeddings([song_name])
        song_save(song.user_id, embeddings[0].tobytes())


def insert_award():
    awards = get_all_awards()
    for award in awards:
        award_name = preprocess_sentence(award.award)
        embeddings = sematic.get_embeddings([award_name])
        song_save(award.user_id, embeddings[0].tobytes())
