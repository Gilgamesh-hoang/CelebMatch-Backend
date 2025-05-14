import mysql.connector

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


def get_all() -> list[BioEmbedding]:
    # Tuan viet tiep ham nay
    pass