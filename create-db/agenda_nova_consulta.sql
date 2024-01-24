INSERT INTO consulta(ID_paciente, ID_medico, ID_empresa, num_plano, data_consulta, horas, status_consulta, especialidade)
VALUES ({},{},{},{},{},{},'Schedule',{});

SELECT ID_paciente
FROM paciente
WHERE cpf = {}
LIMIT 1;

SELECT ID_func
FROM medico
WHERE crm = {}
LIMIT 1;

SELECT ID_empresa, num_plano
FROM plano_saude
WHERE nome LIKE '%{}%'
AND ID_empresa IN (SELECT ID_empresa FROM empresa WHERE nome LIKE '%{}%';)
LIMIT 1;