from collections import defaultdict
from typing import Optional, List

import numpy as np
from scipy.spatial.distance import cosine
from sentence_transformers import SentenceTransformer

from src.database.award_repository import get_all_awards_emb
from src.database.bio_embedding_repository import get_all_bio_emb
from src.database.celebrity_repository import get_celebrity_info
from src.database.face_embedding_repository import get_embedding_by_id
from src.database.song_repository import get_all_song_emb
from src.service.preprocess_text_service import preprocess_sentence


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

    def search(self, songs: Optional[List[str]], awards: Optional[List[str]], bio: Optional[str]):
        # Sửa ở đây: Nhóm embedding theo singer_id thay vì tính từng embedding riêng lẻ
        song_embeddings = defaultdict(list)
        for vector_song in get_all_song_emb():
            song_embeddings[vector_song.user_id].append(vector_song.embedding)

        award_embeddings = defaultdict(list)
        for vector_award in get_all_awards_emb():
            award_embeddings[vector_award.user_id].append(vector_award.embedding)

        bio_embeddings = {}
        for vector_bio in get_all_bio_emb():
            bio_embeddings[vector_bio.user_id] = vector_bio.embedding

        # Tiền xử lý các truy vấn
        song_queries_emb = []
        if songs:
            song_queries = [preprocess_sentence(song) for song in songs]
            song_queries_emb = self.get_embeddings(song_queries)

        award_queries_emb = []
        if awards:
            award_queries = [preprocess_sentence(award) for award in awards]
            award_queries_emb = self.get_embeddings(award_queries)

        bio_query_emb = None
        if bio:
            bio_query = preprocess_sentence(bio)
            bio_query_emb = self.get_embeddings([bio_query])[0]

        # Sửa ở đây: Tính khoảng cách thay vì tổng tất cả các similarity
        singer_distances = defaultdict(float)

        # Lấy tất cả các singer_id từ các embedding
        all_singer_ids = set(song_embeddings.keys()) | set(award_embeddings.keys()) | set(bio_embeddings.keys())

        for singer_id in all_singer_ids:
            total_distance = 0.0

            # Sửa ở đây: Tính song_distance bằng cách lấy trung bình của các khoảng cách nhỏ nhất
            if songs:
                if singer_id in song_embeddings:
                    min_dists = []
                    for query_emb in song_queries_emb:
                        min_dist = min(cosine(query_emb, song_emb) for song_emb in song_embeddings[singer_id])
                        min_dists.append(min_dist)
                    song_distance = sum(min_dists) / len(min_dists)
                else:
                    song_distance = 1.0  # Giá trị mặc định nếu không có embedding
                total_distance += song_distance

            # Sửa ở đây: Tính award_distance tương tự như songs
            if awards:
                if singer_id in award_embeddings:
                    min_dists = []
                    for query_emb in award_queries_emb:
                        min_dist = min(cosine(query_emb, award_emb) for award_emb in award_embeddings[singer_id])
                        min_dists.append(min_dist)
                    award_distance = sum(min_dists) / len(min_dists)
                else:
                    award_distance = 1.0  # Giá trị mặc định nếu không có embedding
                total_distance += award_distance

            # Sửa ở đây: Tính bio_distance trực tiếp
            if bio:
                if singer_id in bio_embeddings:
                    bio_distance = cosine(bio_query_emb, bio_embeddings[singer_id])
                else:
                    bio_distance = 1.0  # Giá trị mặc định nếu không có embedding
                total_distance += bio_distance

            singer_distances[singer_id] = total_distance

        # Sắp xếp và lấy top N kết quả
        top_n = 3
        top_celebs = sorted(singer_distances.items(), key=lambda item: item[1])[:top_n]

        arr_result = []
        for celeb in top_celebs:
            celeb_info = get_celebrity_info(celeb[0])
            image = get_embedding_by_id(celeb_info['id']).img_url
            celeb_info["image"] = image
            arr_result.append(celeb_info)
        return arr_result
