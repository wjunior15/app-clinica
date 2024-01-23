SELECT funcionario.nome AS "medico", consulta.horas AS "horario", consulta.status_consulta AS "status", consulta.especialidade
FROM consulta, funcionario
WHERE consulta.ID_medico = funcionario.ID_func
AND consulta.ID_paciente IN (SELECT ID_paciente
                             FROM paciente
                             WHERE nome LIKE '%John%')
UNION
SELECT funcionario.nome AS "medico", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", cirurgia.especialidade
FROM procedimento, funcionario, cirurgia
WHERE procedimento.ID_medico = funcionario.ID_func
AND procedimento.ID_procedimento = cirurgia.ID_procedimento
AND procedimento.ID_paciente IN (SELECT ID_paciente
                             FROM paciente
                             WHERE nome LIKE '%John%')
UNION
SELECT funcionario.nome AS "medico", procedimento.horas AS "horario", procedimento.status_procedimento AS "status", exame.tipo AS "especialidade"
FROM procedimento, funcionario, exame
WHERE procedimento.ID_medico = funcionario.ID_func
AND procedimento.ID_procedimento = exame.ID_procedimento
AND procedimento.ID_paciente IN (SELECT ID_paciente
                             FROM paciente
                             WHERE nome LIKE '%John%')