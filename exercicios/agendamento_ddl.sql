CREATE TABLE Pessoa (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE Paciente (
    codigo SERIAL PRIMARY KEY,
    cpf CHAR(11) UNIQUE NOT NULL REFERENCES Pessoa(cpf),
    senha VARCHAR(10) NOT NULL,
    plano_saude BOOLEAN NOT NULL
);

CREATE TABLE Medico (
    crm CHAR(6) PRIMARY KEY,
    cpf CHAR(11) UNIQUE NOT NULL REFERENCES Pessoa(cpf)
);

CREATE TABLE Especialidade (
    identificador SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE Medico_Especialidade (
    crm CHAR(6) NOT NULL REFERENCES Medico(crm),
    identificador INT NOT NULL REFERENCES Especialidade(identificador),
    PRIMARY KEY (crm, identificador)
);

CREATE TABLE Agendamento (
    codigo SERIAL PRIMARY KEY,
    paciente_codigo INT NOT NULL REFERENCES Paciente(codigo),
    medico_crm CHAR(6) NOT NULL REFERENCES Medico(crm),
    data_hora_consulta TIMESTAMP NOT NULL,
    data_hora_agendamento TIMESTAMP NOT NULL,
    valor_consulta DECIMAL(10, 2) NOT NULL
);
