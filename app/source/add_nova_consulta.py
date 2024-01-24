import psycopg2
import source.conn_db as conn_db
from datetime import datetime

def add_consulta_plano(dados):
    cpf_paciente = dados['paciente']
    crm_medico = dados['medico']
    data = datetime.strptime(dados['data'], '%d/%m/%Y').strftime('%Y-%m-%d')
    horario = str(dados['hora'])+":00"
    empresa_plano = dados['empresa']
    nome_plano = dados['plano']
    especialidade = dados['especialidade']
    
    try:
        conn = conn_db.conn_db()
        cur = conn.cursor()
        cur.execute("""
                        SELECT ID_paciente
                        FROM paciente
                        WHERE cpf = {cpf}
                        LIMIT 1;
                    """.format(cpf = cpf_paciente))
        pacientes = cur.fetchall()
        if pacientes:
            ID_paciente = pacientes[0][0]
        else:
            return {'message':'Paciente não encontrado'}, 404
        
        cur.execute("""
                        SELECT ID_func
                        FROM medico
                        WHERE crm = {crm}
                        LIMIT 1;
                    """.format(crm = crm_medico))
        medicos = cur.fetchall()
        if medicos:
            ID_medico = medicos[0][0]
        else:
            return {'message':'Médico não encontrado'}, 404
        
        cur.execute("""
                        SELECT ID_empresa, num_plano
                        FROM plano_saude
                        WHERE nome LIKE '%{plano}%'
                        AND ID_empresa IN (SELECT ID_empresa FROM empresa WHERE nome LIKE '%{empresa}%';)
                        LIMIT 1;
                    """.format(plano=nome_plano, empresa=empresa_plano))
        planos = cur.fetchall()
        if planos:
            ID_empresa = planos[0][0]
            num_plano = planos[0][1]
        else:
            return {'message':'Plano não encontrado'}, 404
        
        cur.execute("""
                        INSERT INTO consulta(ID_paciente, ID_medico, ID_empresa, num_plano, data_consulta, horas, status_consulta, especialidade)
                        VALUES ('{ID_paciente}','{ID_medico}','{ID_empresa}',{num_plano},'{data}','{horario}','Scheduled','{especialidade}');
                    """.format(ID_paciente=ID_paciente, ID_medico=ID_medico, ID_empresa=ID_empresa, num_plano=num_plano, data=data, horario=horario, especialidade=especialidade))
        conn.commit()
        conn_db.close_db(conn)
        return {'message':'Consulta agendada com sucesso'}, 200
    
    except (Exception, psycopg2.Error) as error:
        conn_db.close_db(conn)
        return {'message':str(error)}, 400
    

def add_consulta_particular(dados):
    cpf_paciente = dados['paciente']
    crm_medico = dados['medico']
    data = datetime.strptime(dados['data'], '%d/%m/%Y').strftime('%Y-%m-%d')
    horario = str(dados['hora'])+":00"
    especialidade = dados['especialidade']
    
    try:
        conn = conn_db.conn_db()
        cur = conn.cursor()
        cur.execute("""
                        SELECT ID_paciente
                        FROM paciente
                        WHERE cpf = {cpf}
                        LIMIT 1;
                    """.format(cpf = cpf_paciente))
        pacientes = cur.fetchall()
        if pacientes:
            ID_paciente = pacientes[0][0]
        else:
            return {'message':'Paciente não encontrado'}, 404
        
        cur.execute("""
                        SELECT ID_func
                        FROM medico
                        WHERE crm = {crm}
                        LIMIT 1;
                    """.format(crm = crm_medico))
        medicos = cur.fetchall()
        if medicos:
            ID_medico = medicos[0][0]
        else:
            return {'message':'Médico não encontrado'}, 404
        
        cur.execute("""
                        INSERT INTO consulta(ID_paciente, ID_medico, ID_empresa, num_plano, data_consulta, horas, status_consulta, especialidade)
                        VALUES ('{ID_paciente}','{ID_medico}', NULL, NULL,'{data}','{horario}','Scheduled','{especialidade}');
                    """.format(ID_paciente=ID_paciente, ID_medico=ID_medico, data=data, horario=horario, especialidade=especialidade))
        conn.commit()
        conn_db.close_db(conn)
        return {'message':'Consulta agendada com sucesso'}, 200
    
    except (Exception, psycopg2.Error) as error:
        conn_db.close_db(conn)
        return {'message':str(error)}, 400