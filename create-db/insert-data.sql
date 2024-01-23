-- Insert sample data into paciente table
INSERT INTO paciente (ID_paciente, nome, cpf, data_nasc, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_UF, end_cep, ctt_telefone, ctt_email)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440001', 'John Doe', '12345678901', '1990-01-15', 'Street A', 123, 'Apt 4', 'Neighborhood X', 'City Y', 'XY', '12345678', '98765432101', 'john.doe@email.com'),
    ('550e8400-e29b-41d4-a716-446655440002', 'Jane Doe', '98765432101', '1985-05-22', 'Street B', 456, 'Apt 7', 'Neighborhood Z', 'City W', 'ZW', '87654321', '12345678901', 'jane.doe@email.com');

-- Insert sample data into empresa table
INSERT INTO empresa (ID_empresa, nome, cnpj, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_UF, end_cep, ctt_telefone, ctt_email)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440003', 'ABC Healthcare', '12345678901234', 'Main Street', 789, 'Suite 10', 'Health District', 'Medical City', 'MC', '56789012', '11223344556', 'info@abchealthcare.com'),
    ('550e8400-e29b-41d4-a716-446655440004', 'XYZ Pharmaceuticals', '98765432109876', 'Pharma Avenue', 345, 'Floor 3', 'Med Park', 'Med Town', 'MT', '34567890', '99887766554', 'info@xyzpharma.com');

-- Insert sample data into plano_saude table
INSERT INTO plano_saude (ID_empresa, num_plano, nome)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440003', 1, 'Basic Plan'),
    ('550e8400-e29b-41d4-a716-446655440003', 2, 'Premium Plan'),
    ('550e8400-e29b-41d4-a716-446655440004', 1, 'Standard Plan');

-- Insert sample data into funcionario table
INSERT INTO funcionario (ID_func, nome, data_nasc, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_UF, end_cep, ctt_telefone, ctt_email, ID_dept)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440005', 'Alice Smith', '1988-07-12', 'Worker Street', 101, 'Unit 5', 'Workerville', 'Job City', 'JC', '54321098', '1234567890', 'alice.smith@email.com', NULL),
    ('550e8400-e29b-41d4-a716-446655440006', 'Bob Johnson', '1995-03-28', 'Staff Road', 202, 'Apt 8', 'Staffville', 'Employee City', 'EC', '10987654', '9876543210', 'bob.johnson@email.com', NULL);

-- Insert sample data into departamento table
INSERT INTO departamento (ID_dept, nome, ctt_email, ctt_telefone, ID_gerente)
VALUES 
    (1, 'HR Department', 'hr@example.com', '9876543210', '550e8400-e29b-41d4-a716-446655440005');

-- Insert sample data into medico table
INSERT INTO medico (ID_func, crm, horas)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440005', 12345, '08:00:00'),
    ('550e8400-e29b-41d4-a716-446655440006', 67890, '09:30:00');

-- Insert sample data into func_clt table
INSERT INTO func_clt (ID_func, salario, nss)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440005', 60000, '123-45-6789'),
    ('550e8400-e29b-41d4-a716-446655440006', 70000, '987-65-4321');

-- Insert sample data into ctt_emergencia table
INSERT INTO ctt_emergencia (telefone, nome)
VALUES 
    ('1112223333', 'Emergency Contact 1'),
    ('4445556666', 'Emergency Contact 2');

-- Insert sample data into receita table
INSERT INTO receita (ID_receita, descricao, data_receita)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440007', 'Prescription 1', '2024-01-15'),
    ('550e8400-e29b-41d4-a716-446655440008', 'Prescription 2', '2024-02-20');

-- Insert sample data into medicamento table
INSERT INTO medicamento (cod_remedio, nome, dose)
VALUES 
    (1, 'Medicine A', 10),
    (2, 'Medicine B', 5);

-- Insert sample data into procedimento table
-- Continue inserting sample data into procedimento table
INSERT INTO procedimento (ID_procedimento, data_procedimento, horas, ID_receita, ID_medico, ID_paciente, ID_empresa, num_plano, status_procedimento)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440009', '2024-03-10', '10:00:00', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', 1, 'Scheduled'),
    ('550e8400-e29b-41d4-a716-446655440010', '2024-04-05', '11:30:00', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440003', 2, 'Completed');

-- Insert sample data into exame table
INSERT INTO exame (ID_procedimento, laboratorio, tipo)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440009', 'Lab X', 'Blood Test'),
    ('550e8400-e29b-41d4-a716-446655440010', 'Lab Y', 'X-Ray');

-- Insert sample data into cirurgia table
INSERT INTO cirurgia (ID_procedimento, especialidade, sala)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440009', 'Orthopedics', 101),
    ('550e8400-e29b-41d4-a716-446655440010', 'Cardiology', 201);

-- Insert sample data into remedio_receita table
INSERT INTO remedio_receita (ID_receita, cod_remedio)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440007', 1),
    ('550e8400-e29b-41d4-a716-446655440008', 2);

-- Insert sample data into ctt_emergencia_paciente table
INSERT INTO ctt_emergencia_paciente (ID_paciente, telefone_ctt, parentesco)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440001', '1112223333', 'Family'),
    ('550e8400-e29b-41d4-a716-446655440002', '4445556666', 'Friend');

-- Insert sample data into consulta table
INSERT INTO consulta (ID_paciente, ID_medico, ID_empresa, num_plano, data_consulta, horas, status_consulta)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', 1, '2024-03-10', '10:00:00', 'Scheduled'),
    ('550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', 2, '2024-04-05', '11:30:00', 'Completed');

-- Update existing records in funcionario table to set id_dept to NULL
UPDATE funcionario
SET ID_dept = 1
WHERE ID_func IN ('550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440006');
