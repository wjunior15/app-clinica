import psycopg2

def conn_db(in_database='CLINICA'):
    try:
        out_conn = psycopg2.connect(
                                database=in_database,
                                host = 'localhost',
                                user = 'postgres',
                                password = '1003',
                                port = '5432'
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