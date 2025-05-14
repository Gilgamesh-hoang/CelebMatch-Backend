import mysql.connector
from src.database.db_setting import get_connection
from src.model.Award import Award


def get_all_awards() -> list[Award]:
    connection = get_connection()
    cursor = connection.cursor()

    query = "SELECT user_id, award FROM awards"
    cursor.execute(query)
    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    awards = []
    for row in rows:
        user_id, award = row
        awards.append(Award.from_award(user_id=user_id, award=award))
    return awards

def save_award_embedding(user_id: int, embedding_bytes: bytes):
    connection = get_connection()
    cursor = connection.cursor()

    try:
        insert_query = "INSERT INTO awards (user_id, embedding) VALUES (%s, %s)"
        cursor.execute(insert_query, (user_id, embedding_bytes))
        connection.commit()
    except mysql.connector.Error as e:
        print(f"Lỗi khi lưu vào database cho user_id {user_id}: {e}")

    cursor.close()
    connection.close()