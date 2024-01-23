SELECT consulta.horas AS "horario", consulta.status_consulta AS "status", consulta.especialidade, consulta.data_consulta AS "data", funcionario.nome AS "profissional", plano_saude.nome AS "plano", paciente.cpf AS "paciente"
FROM consulta, funcionario, plano_saude, paciente
WHERE consulta.ID_empresa = plano_saude.ID_empresa
AND consulta.ID_medico = funcionario.ID_func
AND consulta.ID_paciente = paciente.ID_paciente
AND consulta.ID_empresa IN (SELECT empresa.ID_empresa
                           FROM empresa
                           WHERE empresa.cnpj LIKE '%98765432109876%')
UNION
SELECT procedimento.horas AS "horario", procedimento.status_procedimento AS "status", cirurgia.especialidade, procedimento.data_procedimento AS "data", funcionario.nome AS "profissional", plano_saude.nome AS "plano", paciente.cpf AS "paciente"
FROM procedimento, paciente, cirurgia, plano_saude, funcionario
WHERE procedimento.ID_empresa = plano_saude.ID_empresa
AND procedimento.ID_medico = funcionario.ID_func
AND procedimento.ID_paciente = paciente.ID_paciente
AND procedimento.ID_procedimento = cirurgia.ID_procedimento
AND procedimento.ID_empresa IN (SELECT empresa.ID_empresa
                                FROM empresa
                                WHERE empresa.cnpj LIKE '%98765432109876%')
UNION
SELECT procedimento.horas AS "horario", procedimento.status_procedimento AS "status", exame.tipo AS "especialidade", procedimento.data_procedimento AS "data", funcionario.nome AS "profissional", plano_saude.nome AS "plano", paciente.cpf AS "paciente"
FROM procedimento, paciente, exame, plano_saude, funcionario
WHERE procedimento.ID_empresa = plano_saude.ID_empresa
AND procedimento.ID_medico = funcionario.ID_func
AND procedimento.ID_paciente = paciente.ID_paciente
AND procedimento.ID_procedimento = exame.ID_procedimento
AND procedimento.ID_empresa IN (SELECT empresa.ID_empresa
                                FROM empresa
                                WHERE empresa.cnpj LIKE '%98765432109876%')