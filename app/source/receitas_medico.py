import psycopg2
import source.conn_db as conn_db
from datetime import datetime

def receitas_medico(dados):
    crm = dados["crm"]
    conn = conn_db.conn_db()
    cur = conn.cursor()
    cur.execute("""
                    SELECT funcionario.nome AS "medico", paciente.nome AS "paciente", medicamento.nome AS "medicamento", medicamento.dose AS "dose", receita.data_receita AS "data"
                    FROM funcionario, paciente, medicamento, receita, procedimento, remedio_receita
                    WHERE procedimento.ID_receita = receita.ID_receita
                    AND receita.ID_receita = remedio_receita.ID_receita
                    AND remedio_receita.cod_remedio = medicamento.cod_remedio
                    AND procedimento.ID_paciente = paciente.ID_paciente
                    AND procedimento.ID_medico = funcionario.ID_func
                    AND procedimento.ID_medico IN (SELECT ID_func FROM medico WHERE medico.crm = {crm_busca})
                    UNION
                    SELECT funcionario.nome AS "medico", paciente.nome AS "paciente", medicamento.nome AS "medicamento", medicamento.dose AS "dose", receita.data_receita AS "data"
                    FROM funcionario, paciente, medicamento, receita, consulta, remedio_receita
                    WHERE consulta.ID_receita = receita.ID_receita
                    AND receita.ID_receita = remedio_receita.ID_receita
                    AND remedio_receita.cod_remedio = medicamento.cod_remedio
                    AND consulta.ID_paciente = paciente.ID_paciente
                    AND consulta.ID_medico = funcionario.ID_func
                    AND consulta.ID_medico IN (SELECT ID_func FROM medico WHERE medico.crm = {crm_busca})
                """.format(crm_busca = crm))
    rows = cur.fetchall()
    conn_db.close_db(conn)
    
    if rows:
        arr_receitas = []
        for row in rows:
            dict_receita = {
                'medico':row[0],
                'paciente':row[1],
                'medicamento':row[2],
                'dose':row[3],
                'data':row[4].strftime("%d/%m/%Y")
            }
            arr_receitas.append(dict_receita)
        return {'receitas':arr_receitas}, 200
    else:
        return {"erro":"Nenhuma receita encontrada"}, 404