UPDATE consulta
SET data_consulta = '2021-01-01', horas = '12:00:00'
WHERE ID_medico IN (SELECT funcionario.ID_func FROM medico,funcionario WHERE funcionario.nome LIKE '%Alice%' AND funcionario.ID_func = medico.ID_func)
AND ID_paciente IN (SELECT ID_paciente FROM paciente WHERE cpf LIKE '%12345678901%')
AND data_consulta = '2021-01-01'
AND horas = '10:00:00';

UPDATE consulta
SET status_consulta = 'Completed'
WHERE ID_medico IN (SELECT funcionario.ID_func FROM medico,funcionario WHERE funcionario.nome LIKE '%Alice%' AND funcionario.ID_func = medico.ID_func)
AND ID_paciente IN (SELECT ID_paciente FROM paciente WHERE cpf LIKE '%12345678901%')
AND data_consulta = '2021-01-01'
AND horas = '10:00:00';