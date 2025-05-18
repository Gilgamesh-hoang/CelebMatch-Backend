import mysql
from mysql.connector import MySQLConnection

def get_connection() -> MySQLConnection:
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='password',
        database='celeb_match',
    )
    # return mysql.connector.connect(
    #     host='localhost',
    #     user='admin',
    #     password='admin',
    #     database='celeb_match',
    # )