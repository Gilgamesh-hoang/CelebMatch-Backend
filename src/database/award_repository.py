import mysql.connector
from src.database.db_setting import get_connection
from src.model.Award import Award


def get_all_awards() -> list[Award]:
    connection = get_connection()
    cursor = connection.cursor()

    query = "SELECT id,user_id, award FROM awards"
    cursor.execute(query)
    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    awards = []
    for row in rows:
        id, user_id, award = row
        awards.append(Award.from_award(id=id, user_id=user_id, award=award))
    return awards


def save_award_embedding(id: int, embedding_bytes: bytes):
    connection = get_connection()
    cursor = connection.cursor()

    try:
        insert_query = "update awards set embedding = %s where id = %s"
        cursor.execute(insert_query, (embedding_bytes, id))
        connection.commit()
    except mysql.connector.Error as e:
        print(f"Lỗi khi lưu vào database cho id {id}: {e}")

    cursor.close()
    connection.close()
