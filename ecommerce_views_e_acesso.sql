-- Script para resolução do desafio proposto em "DIO - SQL Specialist - Personalizando Acessos e Automatizando ações no MySQL"
USE ecommerce;

-- Criando as views propostas

-- Número de empregados por departamento e localidade
CREATE VIEW numero_empregados_por_departamento AS
SELECT d.nome_departamento, d.localidade, COUNT(e.idempregado) AS numero_empregados
FROM departamento d
LEFT JOIN empregado e ON e.departamento_iddepartamento = d.iddepartamento
GROUP BY d.iddepartamento;

-- Lista de departamentos e seus gerentes 
CREATE VIEW lista_departamentos_e_gerentes AS
SELECT d.nome_departamento, e.nome_empregado AS gerente_nome
FROM departamento d
LEFT JOIN empregado e ON e.departamento_iddepartamento = d.iddepartamento
WHERE e.cargo = 'Gerente';

-- Projetos com maior número de empregados (ex: por ordenação desc) 
CREATE VIEW projetos_com_maior_numero_de_empregados AS
SELECT p.nome_projeto, COUNT(ep.idempregado) AS numero_empregados
FROM projeto p
LEFT JOIN empregado_projeto ep ON ep.idprojeto = p.idprojeto
GROUP BY p.idprojeto
ORDER BY numero_empregados DESC;

-- Lista de projetos, departamentos e gerentes 
CREATE VIEW lista_projetos_departamentos_e_gerentes AS
SELECT p.nome_projeto, d.nome_departamento, e.nome_empregado AS gerente_nome
FROM projeto p
JOIN departamento d ON d.iddepartamento = p.departamento_iddepartamento
LEFT JOIN empregado e ON e.departamento_iddepartamento = d.iddepartamento
WHERE e.cargo = 'Gerente';

-- Quais empregados possuem dependentes e se são gerentes 
CREATE VIEW empregados_com_dependentes_e_gerentes AS
SELECT e.nome_empregado, e.cargo, CASE 
    WHEN e.cargo = 'Gerente' THEN 'Sim'
    ELSE 'Não' 
END AS e_gerente, d.nome_dependente
FROM empregado e
JOIN dependente d ON d.empregado_idempregado = e.idempregado
WHERE d.empregado_idempregado IS NOT NULL;


-- Criação dos usuários e concessão de permissões

-- Criando o usuário "gerente" com senha
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha_gerente';

-- Concedendo permissões para o usuário "gerente" sobre as views
GRANT SELECT ON ecommerce.numero_empregados_por_departamento TO 'gerente'@'localhost';
GRANT SELECT ON ecommerce.lista_departamentos_e_gerentes TO 'gerente'@'localhost';
GRANT SELECT ON ecommerce.projetos_com_maior_numero_de_empregados TO 'gerente'@'localhost';
GRANT SELECT ON ecommerce.lista_projetos_departamentos_e_gerentes TO 'gerente'@'localhost';


-- Criando o usuário "empregado" com senha
CREATE USER 'empregado'@'localhost' IDENTIFIED BY 'senha_empregado';

-- Concedendo permissões para o usuário "empregado" sobre as views
GRANT SELECT ON ecommerce.numero_empregados_por_departamento TO 'empregado'@'localhost';
GRANT SELECT ON ecommerce.projetos_com_maior_numero_de_empregados TO 'empregado'@'localhost';

-- Visualizando as permissões para "empregado"
SHOW GRANTS FOR 'empregado'@'localhost';

-- Revogando permissões sobre departamentos e gerentes para o usuário "empregado"
-- Revogando permissões de SELECT sobre as views especificadas
REVOKE SELECT ON ecommerce.numero_empregados_por_departamento FROM 'empregado'@'localhost';
REVOKE SELECT ON ecommerce.projetos_com_maior_numero_de_empregados FROM 'empregado'@'localhost';
