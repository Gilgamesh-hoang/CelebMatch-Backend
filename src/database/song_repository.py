from src.database.db_setting import get_connection
from src.model.Song import Song
import mysql.connector

def get_all_songs() -> list[Song]:
    connection = get_connection()
    cursor = connection.cursor()

    query = "SELECT user_id, song FROM songs"
    cursor.execute(query)
    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    songs = []
    for row in rows:
        user_id, song = row
        songs.append(Song.from_song(user_id=user_id, song=song))
    return songs

def save_song_embedding(user_id: int, embedding_bytes: bytes):
    connection = get_connection()
    cursor = connection.cursor()

    try:
        insert_query = "INSERT INTO songs (user_id, embedding) VALUES (%s, %s)"
        cursor.execute(insert_query, (user_id, embedding_bytes))
        connection.commit()
    except mysql.connector.Error as e:
        print(f"Lỗi khi lưu vào database cho user_id {user_id}: {e}")

    cursor.close()
    connection.close()