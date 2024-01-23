SELECT paciente.nome AS "paciente", consulta.horas AS "horario", consulta.status_consulta AS "status", consulta.especialidade
FROM consulta, paciente
WHERE consulta.ID_paciente = paciente.ID_paciente
AND consulta.data_consulta = '2024-03-10'
AND consulta.ID_medico IN (SELECT funcionario.ID_func
                           FROM medico,funcionario
                           WHERE funcionario.nome LIKE '%Alice%' AND funcionario.ID_func = medico.ID_func)
UNION
SELECT paciente.nome AS "paciente", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", cirurgia.especialidade
FROM procedimento, paciente, cirurgia
WHERE procedimento.ID_paciente = paciente.ID_paciente
AND procedimento.ID_procedimento = cirurgia.ID_procedimento
AND procedimento.data_procedimento = '2024-03-10'
AND procedimento.ID_medico IN (SELECT funcionario.ID_func
                               FROM medico,funcionario
                               WHERE funcionario.nome LIKE '%Alice%' AND funcionario.ID_func = medico.ID_func)
UNION
SELECT paciente.nome AS "paciente", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", exame.tipo AS "especialidade"
FROM procedimento, paciente, exame
WHERE procedimento.ID_paciente = paciente.ID_paciente
AND procedimento.ID_procedimento = exame.ID_procedimento
AND procedimento.data_procedimento = '2024-03-10'
AND procedimento.ID_medico IN (SELECT funcionario.ID_func
                               FROM medico,funcionario
                               WHERE funcionario.nome LIKE '%Alice%' AND funcionario.ID_func = medico.ID_func)