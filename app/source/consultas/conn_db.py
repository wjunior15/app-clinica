import psycopg2
import config

def conn_db(in_database=config.DATABASE_NAME):
    try:
        out_conn = psycopg2.connect(
                                database=in_database,
                                host = config.DATABASE_HOSTANAME,
                                user = config.DATABASE_USER,
                                password = config.DATABASE_PASSWORD,
                                port = config.DATABASE_PORT
                                )

        print("Conectado ao banco")
        return out_conn
    
    except Exception as e:
        print("Erro ao conectar: ", type(e).__name__)
        return None
        
def close_db(in_conn):
    if in_conn is None:
        print("Conexão nula")
        return
    in_conn.close()
    print("Desconectado do banco")