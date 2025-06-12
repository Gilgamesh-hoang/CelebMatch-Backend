import mysql.connector
import numpy as np
from src.database.db_setting import get_connection
from src.model.BioEmbedding import BioEmbedding


def save(user_id: int, embedding_bytes: bytes):
    connection = get_connection()
    cursor = connection.cursor()

    try:
        insert_query = "INSERT INTO bio_embeddings (user_id, embedding) VALUES (%s, %s)"
        cursor.execute(insert_query, (user_id, embedding_bytes))
        connection.commit()
    except mysql.connector.Error as e:
        print(f"Lỗi khi lưu vào database cho user_id {user_id}: {e}")

    cursor.close()
    connection.close()

def get_all_bio_emb() -> list[BioEmbedding]:
    connection = get_connection()
    cursor = connection.cursor()

    query = "SELECT user_id, embedding FROM bio_embeddings"
    cursor.execute(query)
    rows = cursor.fetchall()  # Đọc hết tất cả kết quả để tránh lỗi Unread result

    cursor.close()
    connection.close()

    embeddings = []
    for row in rows:
        user_id, embedding_bytes = row
        embedding_array = np.frombuffer(embedding_bytes, dtype=np.float32)
        embeddings.append(BioEmbedding(user_id=user_id, embedding=embedding_array))

    return embeddings

def get_by_user_id(user_id: int) -> BioEmbedding | None:
    connection = get_connection()
    cursor = connection.cursor()

    query = "SELECT user_id, embedding FROM bio_embeddings WHERE user_id = %s"
    cursor.execute(query, (user_id,))
    row = cursor.fetchone()

    cursor.close()
    connection.close()

    if row:
        user_id, embedding_bytes = row
        embedding_array = np.frombuffer(embedding_bytes, dtype=np.float32)
        return BioEmbedding(user_id=user_id, embedding=embedding_array)
    else:
        return None

