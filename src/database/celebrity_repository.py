from typing import Optional

from src.database.db_setting import get_connection
from src.model.Celebrity import Celebrity


def get_celebrity_by_id(celebrity_id: int) -> Optional[Celebrity]:
    connection = get_connection()
    cursor = connection.cursor()

    query = """
        SELECT id, full_name, occupation, nationality, birth_date,
               residence, biography
        FROM celebrities
        WHERE id = %s
    """

    # old query
    # query = """
    #     SELECT id, full_name, occupation, nationality, birth_date, awards, songs,
    #            residence, biography
    #     FROM celebrities
    #     WHERE id = %s
    # """
    cursor.execute(query, (celebrity_id,))
    row = cursor.fetchone()

    cursor.close()
    connection.close()

    if row:
        return Celebrity(*row)
    return None


def get_celebrity_info(celebrity_id: int) -> Optional[dict]:
    connection = get_connection()
    cursor = connection.cursor()

    query = """
      SELECT full_name, occupation, nationality, birth_date, residence, biography
      FROM celebrities
      WHERE id = %s
    """
    # old query
    # query = """
    #   SELECT full_name, occupation, nationality, birth_date, residence, biography, awards, songs
    #   FROM celebrities
    #   WHERE id = %s
    # """
    cursor.execute(query, (celebrity_id,))
    row = cursor.fetchone()

    cursor.close()
    connection.close()

    if row:
        return {
            "full_name": row[0],
            "occupation": row[1],
            "nationality": row[2],
            "birth_date": str(row[3]) if row[3] else None,
            "residence": row[4],
            "biography": row[5],
            # "awards": row[6],
            # "songs": row[7],
        }
    return None
