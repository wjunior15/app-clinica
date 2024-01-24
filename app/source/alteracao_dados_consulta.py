import psycopg2
import source.conn_db as conn_db
from datetime import datetime

def altera_data_hora(dados):
    nova_data = datetime.strptime(dados['nova_data'], '%d/%m/%Y').strftime('%Y-%m-%d') #dados['data_nova'].strftime('%Y-%m-%d')
    nova_hora =str(dados['nova_hora'])+":00"
    data_atual = datetime.strptime(dados['data_atual'], '%d/%m/%Y').strftime('%Y-%m-%d') #dados['data_atual'].strftime('%Y-%m-%d')
    hora_atual = str(dados['hora_atual'])+":00"
    cpf_paciente = dados['paciente']
    nome_medico = dados['medico']
    
    try:
        conn = conn_db.conn_db()
        cur = conn.cursor()
        cur.execute("""
                        UPDATE consulta
                        SET data_consulta = '{nova_data}', horas = '{nova_hora}'
                        WHERE ID_medico IN (SELECT funcionario.ID_func FROM medico,funcionario WHERE funcionario.nome LIKE '%{nome_medico}%' AND funcionario.ID_func = medico.ID_func)
                        AND ID_paciente IN (SELECT ID_paciente FROM paciente WHERE cpf LIKE '%{cpf_paciente}%')
                        AND data_consulta = '{data_atual}'
                        AND horas = '{hora_atual}';
                    """.format(data_atual = data_atual,hora_atual = hora_atual,nova_data = nova_data,nova_hora = nova_hora,cpf_paciente = cpf_paciente,nome_medico = nome_medico))
        conn.commit()
        conn_db.close_db(conn)
        return 'Alteração realizada com sucesso!', 200
    except (Exception, psycopg2.DatabaseError) as error:
        conn_db.close_db(conn)
        return "erro - "+str(error), 400

def altera_status(dados):
    novo_status = dados['novo_status']
    data = datetime.strptime(dados['data'], '%d/%m/%Y').strftime('%Y-%m-%d')
    hora = str(dados['hora'])+":00"
    cpf_paciente = dados['paciente']
    nome_medico = dados['medico']
    
    try:
        conn = conn_db.conn_db()
        cur = conn.cursor()
        cur.execute("""
                        UPDATE consulta
                        SET status_consulta = '{novo_status}'
                        WHERE ID_medico IN (SELECT funcionario.ID_func FROM medico,funcionario WHERE funcionario.nome LIKE '%{nome_medico}%' AND funcionario.ID_func = medico.ID_func)
                        AND ID_paciente IN (SELECT ID_paciente FROM paciente WHERE cpf LIKE '%{cpf_paciente}%')
                        AND data_consulta = '{data}'
                        AND horas = '{hora}';
                    """.format(novo_status = novo_status,data = data,hora = hora,cpf_paciente = cpf_paciente,nome_medico = nome_medico))
        conn.commit()
        conn_db.close_db(conn)
        return 'Alteração realizada com sucesso!', 200
    except (Exception, psycopg2.DatabaseError) as error:
        conn_db.close_db(conn)
        return "erro - "+str(error), 400