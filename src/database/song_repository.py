from src.database.db_setting import get_connection
from src.model.Song import Song
import mysql.connector


def get_all_songs() -> list[Song]:
    connection = get_connection()
    cursor = connection.cursor()

    query = "SELECT id,user_id, song FROM songs"
    cursor.execute(query)
    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    songs = []
    for row in rows:
        id, user_id, song = row
        songs.append(Song.from_song(id=id, user_id=user_id, song=song))
    return songs


def save_song_embedding(id: int, embedding_bytes: bytes):
    connection = get_connection()
    cursor = connection.cursor()

    try:
        insert_query = "update songs set embedding = %s where id = %s"
        cursor.execute(insert_query, (embedding_bytes, id))
        connection.commit()
    except mysql.connector.Error as e:
        print(f"Lỗi khi lưu vào database cho id {id}: {e}")

    cursor.close()
    connection.close()
