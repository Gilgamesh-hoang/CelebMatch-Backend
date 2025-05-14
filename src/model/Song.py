# src/model.py
import numpy as np

class Song:
    def __init__(self, id: int, user_id: int, song: str = None, embedding: np.ndarray = None):
        self.id = id
        self.user_id = user_id
        self.song = song
        self.embedding = embedding

    @classmethod
    def from_song(cls, id: int, user_id: int, song: str):
        return cls(id=id, user_id=user_id, song=song, embedding=None)

    @classmethod
    def from_embedding(cls, id: int, user_id: int, embedding: np.ndarray):
        return cls(id=id, user_id=user_id, song=None, embedding=embedding)

    def __str__(self):
        if self.song is not None:
            return f"Song(id={self.id}, user_id={self.user_id}, song={self.song})"
        return f"Song(id={self.id}, user_id={self.user_id}, embedding={self.embedding})"
