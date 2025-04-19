from typing import Optional

from src.database.db_setting import get_connection
from src.model.Celebrity import Celebrity


def get_celebrity_by_id(celebrity_id: int) -> Optional[Celebrity]:
    connection = get_connection()
    cursor = connection.cursor()

    query = """
        SELECT id, full_name, occupation, nationality, birth_date,
               residence, biography, awards, songs
        FROM celebrities
        WHERE id = %s
    """
    cursor.execute(query, (celebrity_id,))
    row = cursor.fetchone()

    cursor.close()
    connection.close()

    if row:
        return Celebrity(*row)
    return None