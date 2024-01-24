-- Inserir mais dados de amostra na tabela paciente
INSERT INTO paciente (ID_paciente, nome, cpf, data_nasc, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_UF, end_cep, ctt_telefone, ctt_email)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440013', 'Maria Oliveira', '98765432123', '1987-08-18', 'Rua da Praia', 567, 'Casa 3', 'Beira Mar', 'Cidade C', 'CC', '56789012', '87654321012', 'maria.oliveira@email.com'),
    ('550e8400-e29b-41d4-a716-446655440014', 'Pedro Souza', '87654321098', '1991-02-25', 'Avenida Central', 78, 'Apt 12', 'Centro', 'Cidade D', 'CD', '98765432', '21098765432', 'pedro.souza@email.com');

-- Inserir mais dados de amostra na tabela empresa
INSERT INTO empresa (ID_empresa, nome, cnpj, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_UF, end_cep, ctt_telefone, ctt_email)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440005', 'EFG Medical Center', '56789012345678', 'Medical Avenue', 456, 'Floor 5', 'Health District', 'Medical City', 'MC', '23456789', '33445566778', 'info@efgmedical.com'),
    ('550e8400-e29b-41d4-a716-446655440006', 'LMN Health Solutions', '34567890123456', 'Health Street', 789, 'Suite 20', 'Med Park', 'Med Town', 'MT', '45678901', '11223344555', 'info@lmnhealth.com');

-- Inserir mais dados de amostra na tabela plano_saude
INSERT INTO plano_saude (ID_empresa, num_plano, nome)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440005', 2, 'Premium Plus Plan'),
    ('550e8400-e29b-41d4-a716-446655440006', 2, 'Extended Plan');

-- Inserir mais dados de amostra na tabela funcionario
INSERT INTO funcionario (ID_func, nome, data_nasc, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_UF, end_cep, ctt_telefone, ctt_email, ID_dept)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440007', 'Luana Rodrigues', '1989-12-03', 'Working Street', 303, 'Unit 8', 'Workerville', 'Job City', 'JC', '54321098', '2345678901', 'luana.rodrigues@email.com', NULL),
    ('550e8400-e29b-41d4-a716-446655440008', 'Ricardo Oliveira', '1990-09-22', 'Office Road', 404, 'Apt 15', 'Officetown', 'Employee City', 'EC', '10987654', '9876543211', 'ricardo.oliveira@email.com', NULL);

-- Inserir mais dados de amostra na tabela departamento
INSERT INTO departamento (ID_dept, nome, ctt_email, ctt_telefone, ID_gerente)
VALUES 
    (2, 'IT Department', 'it@example.com', '8765432101', '550e8400-e29b-41d4-a716-446655440007'),
    (3, 'Finance Department', 'finance@example.com', '7654321098', '550e8400-e29b-41d4-a716-446655440008');

-- Inserir mais dados de amostra na tabela medico
INSERT INTO medico (ID_func, crm, horas)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440007', 56789, '08:30:00'),
    ('550e8400-e29b-41d4-a716-446655440008', 12354, '09:00:00');

-- Inserir mais dados de amostra na tabela func_clt
INSERT INTO func_clt (ID_func, salario, nss)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440007', 75000, '456-78-9012'),
    ('550e8400-e29b-41d4-a716-446655440008', 80000, '890-12-3456');

-- Inserir mais dados de amostra na tabela ctt_emergencia
INSERT INTO ctt_emergencia (telefone, nome)
VALUES 
    ('7778889999', 'Emergency Contact 3'),
    ('2223334444', 'Emergency Contact 4');

-- Inserir mais dados de amostra na tabela receita
INSERT INTO receita (ID_receita, descricao, data_receita)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440009', 'Prescription 3', '2024-05-15'),
    ('550e8400-e29b-41d4-a716-446655440010', 'Prescription 4', '2024-06-20'),
    ('550e8400-e29b-41d4-a716-446655440017', 'Prescription 5', '2024-07-15'),
    ('550e8400-e29b-41d4-a716-446655440018', 'Prescription 6', '2024-08-25');

-- Inserir mais dados de amostra na tabela medicamento
INSERT INTO medicamento (cod_remedio, nome, dose)
VALUES 
    (5, 'Medicine C', 15),
    (6, 'Medicine D', 8);

-- Inserir mais dados de amostra na tabela procedimento
-- Inserir dados adicionais na tabela procedimento
INSERT INTO procedimento (ID_procedimento, data_procedimento, horas, ID_receita, ID_medico, ID_paciente, ID_empresa, num_plano, status_procedimento)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440011', '2024-05-20', '14:00:00', '550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', 1, 'Scheduled'),
    ('550e8400-e29b-41d4-a716-446655440012', '2024-06-15', '15:30:00', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440003', 2, 'Completed');

-- Inserir mais dados de amostra na tabela exame
INSERT INTO exame (ID_procedimento, laboratorio, tipo)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440011', 'Lab Z', 'MRI'),
    ('550e8400-e29b-41d4-a716-446655440012', 'Lab W', 'Blood Test');

-- Inserir mais dados de amostra na tabela cirurgia
INSERT INTO cirurgia (ID_procedimento, especialidade, sala)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440011', 'Neurosurgery', 301),
    ('550e8400-e29b-41d4-a716-446655440012', 'Ophthalmology', 401);

-- Inserir mais dados de amostra na tabela remedio_receita
INSERT INTO remedio_receita (ID_receita, cod_remedio)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440009', 3),
    ('550e8400-e29b-41d4-a716-446655440010', 4),
    ('550e8400-e29b-41d4-a716-446655440017', 5),
    ('550e8400-e29b-41d4-a716-446655440018', 6); 

-- Inserir mais dados de amostra na tabela ctt_emergencia_paciente
INSERT INTO ctt_emergencia_paciente (ID_paciente, telefone_ctt, parentesco)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440013', '7778889999', 'Friend'),
    ('550e8400-e29b-41d4-a716-446655440014', '2223334444', 'Relative');

-- Inserir dados adicionais na tabela consulta
-- Inserir dados adicionais na tabela consulta
INSERT INTO consulta (ID_paciente, ID_medico, ID_empresa, num_plano, data_consulta, horas, status_consulta, especialidade, ID_receita)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440005', 2, '2024-09-10', '10:30:00', 'Scheduled', 'Cardiology', '550e8400-e29b-41d4-a716-446655440017'),
    ('550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440005', 2, '2024-10-15', '11:45:00', 'Completed', 'Orthopedics', '550e8400-e29b-41d4-a716-446655440018');


-- Atualizar registros existentes na tabela funcionario para definir id_dept como NULL
UPDATE funcionario
SET ID_dept = 2
WHERE ID_func = '550e8400-e29b-41d4-a716-446655440007';

UPDATE funcionario
SET ID_dept = 3
WHERE ID_func = '550e8400-e29b-41d4-a716-446655440008';