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
