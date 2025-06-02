from collections import defaultdict
from typing import Optional, List

import numpy as np
from scipy.spatial.distance import cosine
from sentence_transformers import SentenceTransformer

from src.database.award_repository import get_all_awards, get_all_awards_emb
from src.database.bio_embedding_repository import get_all_bio_emb
from src.database.celebrity_repository import get_celebrity_info
from src.database.song_repository import get_all_songs, get_all_song_emb
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

    def format_celeb_response(self, rows):
        if not rows:
            return {}

        first_row = rows[0]

        response = {
            "id": first_row[0],
            "full_name": first_row[1],
            "occupation": first_row[2],
            "nationality": first_row[3],
            "birth_date": str(first_row[4]),
            "residence": first_row[5],
            "biography": first_row[6],
            "awards": [],
            "songs": []
        }

        awards_set = set()
        songs_set = set()

        for row in rows:
            award = row[7].award
            song = row[8].song
            if award:
                awards_set.add(award)
            if song:
                songs_set.add(song)

        response["awards"] = list(awards_set)
        response["songs"] = list(songs_set)

        return response

    def search(self, songs: Optional[List[str]], awards: Optional[List[str]], bio: Optional[List[str]]):
        results = {}

        # Đối với từng field, Tính khoảng cách cosin giữa vector query và tất cả các vector trong bảng tương ứng
        singer_similarities = defaultdict(list)  # key: singer_id, value: list of similarity scores

        # Đối với từng field, thực hiện tiền xử lý
        if songs:
            # Truy xuất các vector đã được lưu trữ trước trong database
            vectors_songs = get_all_song_emb()
            songs_arr = []
            for song in songs:
                # Sử dụng model để chuyển đổi dữ liệu thành vector
                processed = preprocess_sentence(song)
                songs_arr.append(processed)

            for query_vector in self.get_embeddings(songs_arr):
                for vector_song in vectors_songs:
                    similarity = cosine(query_vector, vector_song.embedding)
                    # Nhóm các kết quả theo id của ca sĩ
                    singer_similarities[vector_song.user_id].append(similarity)

        if awards:
            vectors_awards = get_all_awards_emb()
            awards_arr = []
            for award in awards:
                processed = preprocess_sentence(award)
                awards_arr.append(processed)

            for query_vector in self.get_embeddings(awards_arr):
                for vector_award in vectors_awards:
                    similarity = cosine(query_vector, vector_award.embedding)
                    singer_similarities[vector_award.user_id].append(similarity)

        if bio:
            bio = bio
            vectors_bios = get_all_bio_emb()
            for query_vector in self.get_embeddings(preprocess_sentence(bio)):
                for vector_bio in vectors_bios:
                    similarity = cosine(query_vector, vector_bio.embedding)
                    singer_similarities[vector_bio.user_id].append(similarity)

        # Tính trung bình cosine similarity cho mỗi singer_id
        average_similarities = {}
        for singer_id, scores in singer_similarities.items():
            average = sum(scores) / len(scores)
            average_similarities[singer_id] = average

        # Sắp xếp và lấy top N kết quả
        top_n = 3
        top_celebs = sorted(
            average_similarities.items(), key=lambda item: item[1], reverse=True
        )[:top_n]

        arr_result = [];
        for celeb in top_celebs:
            celeb_info = get_celebrity_info(celeb[0])
            arr_result.append(celeb_info)
        return arr_result