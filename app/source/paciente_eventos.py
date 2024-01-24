import psycopg2
import source.conn_db as conn_db
from datetime import datetime

def consulta_paciente_data(dados):
    data_br = dados["data_buscada"]
    data = datetime.strptime(data_br, '%d/%m/%Y').strftime('%Y-%m-%d')
    nome = dados["nome"]
    conn = conn_db.conn_db()
    cur = conn.cursor()
    cur.execute("""
                SELECT funcionario.nome AS "medico", consulta.horas AS "horario", consulta.status_consulta AS "status", consulta.especialidade
                FROM consulta, funcionario
                WHERE consulta.ID_medico = funcionario.ID_func
                AND consulta.data_consulta = '{data_busca}'
                AND consulta.ID_paciente IN (SELECT ID_paciente
                                            FROM paciente
                                            WHERE nome LIKE '%{nome_busca}%')
                UNION
                SELECT funcionario.nome AS "medico", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", cirurgia.especialidade
                FROM procedimento, funcionario, cirurgia
                WHERE procedimento.ID_medico = funcionario.ID_func
                AND procedimento.ID_procedimento = cirurgia.ID_procedimento
                AND procedimento.data_procedimento = '{data_busca}'
                AND procedimento.ID_paciente IN (SELECT ID_paciente
                                            FROM paciente
                                            WHERE nome LIKE '%{nome_busca}%')
                UNION
                SELECT funcionario.nome AS "medico", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", exame.tipo AS "especialidade"
                FROM procedimento, funcionario, exame
                WHERE procedimento.ID_medico = funcionario.ID_func
                AND procedimento.ID_procedimento = exame.ID_procedimento
                AND procedimento.data_procedimento = '{data_busca}'
                AND procedimento.ID_paciente IN (SELECT ID_paciente
                                            FROM paciente
                                            WHERE nome LIKE '%{nome_busca}%')
                """.format(data_busca=data, nome_busca=nome))
    rows = cur.fetchall()
    conn_db.close_db(conn)
    
    if rows:
        arr_eventos = []
        for row in rows:
            dict_evento = {
                'medico':row[0],
                'horario':row[1].strftime("%H:%M"),
                'status':row[2],
                'especialidade':row[3]
            }
            arr_eventos.append(dict_evento)
        return {'eventos':arr_eventos}, 200
    
    else:
        return {"erro":"Nenhum evento encontrado"}, 404
            
    
def cosulta_paciente(dados):
    nome = dados["nome"]