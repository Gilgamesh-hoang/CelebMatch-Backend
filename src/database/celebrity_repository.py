from typing import Optional

from src.database.db_setting import get_connection

def get_celebrity_info(celebrity_id: int) -> Optional[dict]:
    connection = get_connection()
    cursor = connection.cursor()

    query = """
            SELECT c.id,
                   full_name,
                   occupation,
                   nationality,
                   birth_date,
                   residence,
                   biography,
                   a.award,
                   s.song
            FROM celebrities c
                     LEFT JOIN awards a on c.id = a.user_id
                     LEFT JOIN songs s on c.id = s.user_id
            WHERE c.id = %s
            """
    cursor.execute(query, (celebrity_id,))
    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    if not rows: return None

    first_row = rows[0]

    if first_row is None: return None

    celeb = {
        "id": first_row[0],
        "full_name": first_row[1],
        "occupation": first_row[2],
        "nationality": first_row[3],
        "birth_date": first_row[4],
        "residence": first_row[5],
        "biography": first_row[6],
        "awards": set(),
        "songs": set(),
    }

    for row in rows:
        award = row[7]
        song = row[8]
        if award:
            celeb["awards"].add(award)
        if song:
            celeb["songs"].add(song)

    return celeb
