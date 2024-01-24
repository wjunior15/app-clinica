import psycopg2
import source.conn_db as conn_db
from datetime import datetime

def consulta_medico_data(dados):
    data_br = dados["data_buscada"]
    data = datetime.strptime(data_br, '%d/%m/%Y').strftime('%Y-%m-%d')
    nome = dados["nome"]
    conn = conn_db.conn_db()
    cur = conn.cursor()
    cur.execute("""
                    SELECT paciente.nome AS "paciente", consulta.horas AS "horario", consulta.status_consulta AS "status", consulta.especialidade
                    FROM consulta, paciente
                    WHERE consulta.ID_paciente = paciente.ID_paciente
                    AND consulta.data_consulta = '{data_busca}'
                    AND consulta.ID_medico IN (SELECT funcionario.ID_func
                                            FROM medico,funcionario
                                            WHERE funcionario.nome LIKE '%{nome_busca}%' AND funcionario.ID_func = medico.ID_func)
                    UNION
                    SELECT paciente.nome AS "paciente", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", cirurgia.especialidade
                    FROM procedimento, paciente, cirurgia
                    WHERE procedimento.ID_paciente = paciente.ID_paciente
                    AND procedimento.ID_procedimento = cirurgia.ID_procedimento
                    AND procedimento.data_procedimento = '{data_busca}'
                    AND procedimento.ID_medico IN (SELECT funcionario.ID_func
                                                FROM medico,funcionario
                                                WHERE funcionario.nome LIKE '%{nome_busca}%' AND funcionario.ID_func = medico.ID_func)
                    UNION
                    SELECT paciente.nome AS "paciente", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", exame.tipo AS "especialidade"
                    FROM procedimento, paciente, exame
                    WHERE procedimento.ID_paciente = paciente.ID_paciente
                    AND procedimento.ID_procedimento = exame.ID_procedimento
                    AND procedimento.data_procedimento = '{data_busca}'
                    AND procedimento.ID_medico IN (SELECT funcionario.ID_func
                                                FROM medico,funcionario
                                                WHERE funcionario.nome LIKE '%{nome_busca}%' AND funcionario.ID_func = medico.ID_func)
                """.format(data_busca=data, nome_busca=nome))
    rows = cur.fetchall()
    conn_db.close_db(conn)
    
    if rows:
        arr_eventos = []
        for row in rows:
            dict_evento = {
                'paciente':row[0],
                'horario':row[1].strftime("%H:%M"),
                'status':row[2],
                'especialidade':row[3]
            }
            arr_eventos.append(dict_evento)
        return {'eventos':arr_eventos}, 200
    
    else:
        return {"erro":"Nenhum evento encontrado"}, 404
    
def consulta_medico(dados):
    nome = dados["nome"]
    conn = conn_db.conn_db()
    cur = conn.cursor()
    cur.execute("""
                    SELECT paciente.nome AS "paciente", consulta.horas AS "horario", consulta.status_consulta AS "status", consulta.especialidade, consulta.data_consulta AS "data"
                    FROM consulta, paciente
                    WHERE consulta.ID_paciente = paciente.ID_paciente
                    AND consulta.ID_medico IN (SELECT funcionario.ID_func
                                            FROM medico,funcionario
                                            WHERE funcionario.nome LIKE '%{nome_busca}%' AND funcionario.ID_func = medico.ID_func)
                    UNION
                    SELECT paciente.nome AS "paciente", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", cirurgia.especialidade, procedimento.data_procedimento AS "data"
                    FROM procedimento, paciente, cirurgia
                    WHERE procedimento.ID_paciente = paciente.ID_paciente
                    AND procedimento.ID_procedimento = cirurgia.ID_procedimento
                    AND procedimento.ID_medico IN (SELECT funcionario.ID_func
                                                FROM medico,funcionario
                                                WHERE funcionario.nome LIKE '%{nome_busca}%' AND funcionario.ID_func = medico.ID_func)
                    UNION
                    SELECT paciente.nome AS "paciente", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", exame.tipo AS "especialidade", procedimento.data_procedimento AS "data"
                    FROM procedimento, paciente, exame
                    WHERE procedimento.ID_paciente = paciente.ID_paciente
                    AND procedimento.ID_procedimento = exame.ID_procedimento
                    AND procedimento.ID_medico IN (SELECT funcionario.ID_func
                                                FROM medico,funcionario
                                                WHERE funcionario.nome LIKE '%{nome_busca}%' AND funcionario.ID_func = medico.ID_func)
                """.format(nome_busca=nome))
    rows = cur.fetchall()
    conn_db.close_db(conn)
    
    if rows:
        arr_eventos = []
        for row in rows:
            dict_evento = {
                'medico':row[0],
                'horario':row[1].strftime("%H:%M"),
                'status':row[2],
                'especialidade':row[3],
                'data':row[4].strftime("%d/%m/%Y")
            }
            arr_eventos.append(dict_evento)
        return {'eventos':arr_eventos}, 200
    
    else:
        return {"erro":"Nenhum evento encontrado"}, 404