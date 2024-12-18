-- Criando tabela "departamento"
CREATE TABLE departamento(
    iddepartamento INT PRIMARY KEY AUTO_INCREMENT COMMENT "Identificação única do departamento",
    nome_departamento VARCHAR(50) NOT NULL,
    localidade VARCHAR(50)
);

-- Criando tabela "empregado"
CREATE TABLE empregado(
    idempregado INT PRIMARY KEY AUTO_INCREMENT COMMENT "Identificação única do funcionário",
    nome_empregado VARCHAR(50) NOT NULL,
    cargo VARCHAR(50),
    salario FLOAT,
    departamento_iddepartamento INT,
    gerente_idempregado INT NULL,
    CONSTRAINT fk_departamento FOREIGN KEY (departamento_iddepartamento) REFERENCES departamento(iddepartamento),
    CONSTRAINT fk_gerente FOREIGN KEY (gerente_idempregado) REFERENCES empregado(idempregado)
);

-- Criando tabela "projeto"
CREATE TABLE projeto(
    idprojeto INT PRIMARY KEY AUTO_INCREMENT COMMENT "Identificação única do projeto",
    nome_projeto VARCHAR(50) NOT NULL,
    departamento_iddepartamento INT,
    CONSTRAINT fk_projeto_departamento FOREIGN KEY (departamento_iddepartamento) REFERENCES departamento(iddepartamento)
);

-- Criando tabela de ligação "empregado_projeto"
CREATE TABLE empregado_projeto(
    idempregado INT COMMENT "Identificação única do projeto, composta por idempregado e idprojeto",
    idprojeto INT COMMENT "Identificação única do projeto, composta por idempregado e idprojeto",
    horas_trabalhadas INT,
    CONSTRAINT pk_empregado_projeto PRIMARY KEY (idempregado, idprojeto),
    CONSTRAINT fk_empregado FOREIGN KEY (idempregado) REFERENCES empregado(idempregado),
    CONSTRAINT fk_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto)
);

-- Criando tabela "dependente"
CREATE TABLE dependente(
    iddependente INT PRIMARY KEY AUTO_INCREMENT,
    nome_dependente VARCHAR(50) NOT NULL,
    relacao VARCHAR(50),
    empregado_idempregado INT,
    CONSTRAINT fk_dependente_empregado FOREIGN KEY (empregado_idempregado) REFERENCES empregado(idempregado)
);
