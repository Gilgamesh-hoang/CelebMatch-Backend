import numpy as np
from src.database.db_setting import get_connection


def load_celebrity_embeddings() -> dict[int, np.ndarray]:
  connection = get_connection()
  cursor = connection.cursor()

  query = """
      SELECT user_id, embedding
      FROM face_embeddings
  """
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