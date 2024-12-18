USE ecommerce;
SHOW TABLES;

-- Inserindo dados em "departamento"
INSERT INTO departamento(nome_departamento, localidade)
VALUES ('TI', 'São Paulo'), ('Recursos Humanos', 'Rio de Janeiro'), ('Marketing', 'Curitiba');

-- Inserindo dados em "empregado"
INSERT INTO empregado(nome_empregado, cargo, salario, departamento_iddepartamento)
VALUES ('João Silva', 'Desenvolvedor', 4500, 1),
       ('Ana Santos', 'Analista', 3800, 1),
       ('Carlos Souza', 'Gerente RH', 7000, 2);

-- Inserindo dados em "projeto"
INSERT INTO projeto(nome_projeto, departamento_iddepartamento)
VALUES ('Sistema de Vendas', 1), ('Campanha de Marketing', 3);

-- Inserindo dados na tabela de ligação "empregado_projeto"
INSERT INTO empregado_projeto(idempregado, idprojeto, horas_trabalhadas)
VALUES (1, 1, 20), (2, 1, 15), (3, 2, 10);

-- Inserindo dados em "dependente"
INSERT INTO dependente(nome_dependente, relacao, empregado_idempregado)
VALUES ('Maria Silva', 'Filha', 1), ('Pedro Santos', 'Filho', 2);
