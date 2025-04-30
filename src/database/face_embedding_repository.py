import mysql.connector
import numpy as np
from src.database.db_setting import get_connection
from src.model.FaceEmbedding import FaceEmbedding


def save(label: int, embedding_bytes: bytes):
    connection = get_connection()
    cursor = connection.cursor()

    try:
        insert_query = "INSERT INTO face_embeddings (user_id, embedding) VALUES (%s, %s)"
        cursor.execute(insert_query, (label, embedding_bytes))
        connection.commit()
        print(f"Lưu thành công embedding cho user_id: {label}")
    except mysql.connector.Error as e:
        print(f"Lỗi khi lưu vào database cho user_id {label}: {e}")

    cursor.close()
    connection.close()


def get_embedding_by_id(user_id: int) -> FaceEmbedding | None:
    """
    Retrieve face embedding record by user_id from face_embeddings table.
    Returns a FaceEmbedding object with user_id, embedding (as np.ndarray), and img_url.
    Returns None if user_id is not found or an error occurs.
    """
    connection = get_connection()
    cursor = connection.cursor()

    try:
        select_query = "SELECT user_id, embedding, img_url FROM face_embeddings WHERE user_id = %s"
        cursor.execute(select_query, (user_id,))
        result = cursor.fetchone()

        if not result:
            print(f"Không tìm thấy bản ghi cho user_id: {user_id}")
            return None

        # Unpack result
        fetched_user_id, embedding_bytes, img_url = result

        # Deserialize embedding to np.ndarray
        embedding = np.frombuffer(embedding_bytes, dtype=np.float32)

        # Map to FaceEmbedding object
        return FaceEmbedding(
            user_id=fetched_user_id,
            embedding=embedding,  # np.ndarray, shape (512,)
            img_url=img_url
        )

    except mysql.connector.Error as e:
        print(f"Lỗi khi truy vấn database cho user_id {user_id}: {e}")
        return None
    finally:
        cursor.close()
        connection.close()


def load_celebrity_embeddings() -> dict[int, np.ndarray]:
    connection = get_connection()
    cursor = connection.cursor()

    query = "SELECT user_id, embedding FROM face_embeddings"
    cursor.execute(query)
    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    embeddings = {}
    for user_id, embedding_bytes in rows:
        if embedding_bytes:
            embedding_array = np.frombuffer(embedding_bytes, dtype=np.float32)
            embeddings[user_id] = embedding_array

    return embeddings
