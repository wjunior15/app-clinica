CREATE TABLE paciente(
    ID_paciente UUID NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nasc DATE NOT NULL,
    end_logradouro VARCHAR(50) NOT NULL,
    end_numero INT NOT NULL,
    end_complemento VARCHAR(50),
    end_bairro VARCHAR(50) NOT NULL,
    end_cidade VARCHAR(50) NOT NULL,
    end_UF VARCHAR(2) NOT NULL,
    end_cep VARCHAR(8) NOT NULL,
    ctt_telefone VARCHAR(11) NOT NULL,
    ctt_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_paciente)
);

CREATE TABLE empresa(
    ID_empresa UUID NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    end_logradouro VARCHAR(50) NOT NULL,
    end_numero INT NOT NULL,
    end_complemento VARCHAR(50),
    end_bairro VARCHAR(50) NOT NULL,
    end_cidade VARCHAR(50) NOT NULL,
    end_UF VARCHAR(2) NOT NULL,
    end_cep VARCHAR(8) NOT NULL,
    ctt_telefone VARCHAR(11) NOT NULL,
    ctt_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_empresa)
);

CREATE TABLE plano_saude(
    ID_empresa UUID NOT NULL,
    num_plano INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_empresa, num_plano),
    FOREIGN KEY(ID_empresa) REFERENCES empresa(ID_empresa)
);

CREATE TABLE funcionario(
    ID_func UUID NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE NOT NULL,
    end_logradouro VARCHAR(50) NOT NULL,
    end_numero INT NOT NULL,
    end_complemento VARCHAR(50),
    end_bairro VARCHAR(50) NOT NULL,
    end_cidade VARCHAR(50) NOT NULL,
    end_UF VARCHAR(2) NOT NULL,
    end_cep VARCHAR(8) NOT NULL,
    ctt_telefone VARCHAR(11) NOT NULL,
    ctt_email VARCHAR(50) NOT NULL,
    ID_dept INT,
    PRIMARY KEY(ID_func)
);

CREATE TABLE departamento(
    ID_dept SERIAL NOT NULL,
    nome VARCHAR(50) NOT NULL,
    ctt_email VARCHAR(50) NOT NULL,
    ctt_telefone VARCHAR(11) NOT NULL,
    ID_gerente UUID NOT NULL,
    PRIMARY KEY(ID_dept),
    FOREIGN KEY(ID_gerente) REFERENCES funcionario(ID_func)
);

CREATE TABLE medico(
    ID_func UUID NOT NULL,
    crm INT NOT NULL UNIQUE,
    horas TIME NOT NULL,
    PRIMARY KEY(ID_func),
    FOREIGN KEY(ID_func) REFERENCES funcionario(ID_func)
);

CREATE TABLE func_clt(
    ID_func UUID NOT NULL,
    salario FLOAT NOT NULL,
    nss VARCHAR(11) NOT NULL UNIQUE,
    PRIMARY KEY(ID_func),
    FOREIGN KEY(ID_func) REFERENCES funcionario(ID_func)
);

CREATE TABLE ctt_emergencia(
    telefone VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY(telefone)
);

CREATE TABLE receita(
    ID_receita UUID NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    data_receita DATE NOT NULL,
    PRIMARY KEY(ID_receita)
);

CREATE TABLE medicamento(
    cod_remedio SERIAL NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dose INT not NULL,
    PRIMARY KEY(cod_remedio)
);

CREATE TABLE procedimento(
    ID_procedimento UUID NOT NULL,
    data_procedimento DATE NOT NULL,
    horas TIME NOT NULL,
    ID_receita UUID,
    ID_medico UUID NOT NULL,
    ID_paciente UUID NOT NULL,
    ID_empresa UUID,
    num_plano INT,
    status_procedimento VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_procedimento),
    FOREIGN KEY(ID_receita) REFERENCES receita(ID_receita),
    FOREIGN KEY(ID_medico) REFERENCES medico(ID_func),
    FOREIGN KEY(ID_paciente) REFERENCES paciente(ID_paciente),
    FOREIGN KEY(ID_empresa, num_plano) REFERENCES plano_saude(ID_empresa, num_plano)
);

CREATE TABLE exame(
    ID_procedimento UUID NOT NULL,
    laboratorio VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_procedimento),
    FOREIGN KEY(ID_procedimento) REFERENCES procedimento(ID_procedimento)
);

CREATE TABLE cirurgia(
    ID_procedimento UUID NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    sala INT NOT NULL,
    PRIMARY KEY(ID_procedimento),
    FOREIGN KEY(ID_procedimento) REFERENCES procedimento(ID_procedimento)
);


CREATE TABLE remedio_receita(
    ID_receita UUID NOT NULL,
    cod_remedio INT NOT NULL,
    PRIMARY KEY(ID_receita, cod_remedio),
    FOREIGN KEY(ID_receita) REFERENCES receita(ID_receita),
    FOREIGN KEY(cod_remedio) REFERENCES medicamento(cod_remedio)
);

CREATE TABLE ctt_emergencia_paciente(
    ID_paciente UUID NOT NULL,
    telefone_ctt VARCHAR(11) NOT NULL,
    parentesco VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_paciente, telefone_ctt),
    FOREIGN KEY(ID_paciente) REFERENCES paciente(ID_paciente),
    FOREIGN KEY(telefone_ctt) REFERENCES ctt_emergencia(telefone)
);

CREATE TABLE consulta(
    ID_paciente UUID NOT NULL,
    ID_medico UUID NOT NULL,
    ID_empresa UUID,
    num_plano INT,
    data_consulta DATE NOT NULL,
    horas TIME NOT NULL,
    status_consulta VARCHAR(50) NOT NULL,
    PRIMARY KEY(ID_paciente, ID_medico, data_consulta),
    FOREIGN KEY(ID_paciente) REFERENCES paciente(ID_paciente),
    FOREIGN KEY(ID_medico) REFERENCES medico(ID_func),
    FOREIGN KEY(ID_empresa, num_plano) REFERENCES plano_saude(ID_empresa, num_plano)
);

ALTER TABLE funcionario ADD CONSTRAINT fk_func_dept FOREIGN KEY(ID_dept) REFERENCES departamento(ID_dept);