-- Script para resolução do desafio proposto em "DIO - SQL Specialist - Personalizando o Banco de Dados com Índices e Procedures"


-- Índice na coluna "departamento_iddepartamento" da tabela "empregado"
-- Justificativa: A tabela "empregado" seria frequentemente consultada por "departamento_iddepartamento" para buscar todos os empregados de um determinado departamento.
CREATE INDEX idx_empregado_departamento_id ON empregado(departamento_iddepartamento);

-- Índice na coluna "localidade" da tabela "departamento"
-- Justificativa: A consulta para obter departamentos por cidade precisaria buscar rapidamente a "localidade" do departamento.
CREATE INDEX idx_departamento_localidade ON departamento(localidade);

-- Índice na coluna "nome_empregado" da tabela "empregado"
-- Motivo: Quando fosse necessário buscar empregados por nome, esse índice ajudaria a acelerar as buscas por nome.
CREATE INDEX idx_empregado_nome ON empregado(nome_empregado);


-- Parte 1 - Resolução das perguntas propostas
-- Pergunta 1: Qual o departamento com maior número de pessoas?
SELECT 
    d.nome_departamento, 
    COUNT(e.idempregado) AS total_empleados
FROM 
    departamento d
JOIN 
    empregado e ON d.iddepartamento = e.departamento_iddepartamento
GROUP BY 
    d.iddepartamento
ORDER BY 
    total_empleados DESC
LIMIT 1;


-- Pergunta 2: Quais são os departamentos por cidade?
SELECT 
    d.nome_departamento, 
    d.localidade
FROM 
    departamento d
ORDER BY 
    d.localidade, d.nome_departamento;


-- Pergunta 3: Relação de empregados por departamento
SELECT 
    e.nome_empregado, 
    d.nome_departamento
FROM 
    empregado e
JOIN 
    departamento d ON e.departamento_iddepartamento = d.iddepartamento
ORDER BY 
    d.nome_departamento, e.nome_empregado;
    
-- Parte 2 - Utilização de procedures para manipulação de dados em Banco de Dados

DELIMITER $$
CREATE PROCEDURE manipular_cliente(
    IN p_idcliente INT,
    IN p_tipo_cliente ENUM('PF', 'PJ'),
    IN p_endereco VARCHAR(70),
    IN p_primeiro_nome VARCHAR(15),
    IN p_sobrenome VARCHAR(15),
    IN p_cpf VARCHAR(11),
    IN p_razao_social VARCHAR(15),
    IN p_cnpj VARCHAR(14),
    IN p_acao INT -- sendo 1 para inserção, 2 para atualização e 3 para exclusão
)
BEGIN
    DECLARE v_tipo_cliente ENUM('PF', 'PJ');
    
    -- Controle de ação e inserção de um novo cliente
    IF p_acao = 1 THEN
        INSERT INTO cliente (endereco, tipo_cliente)
        VALUES (p_endereco, p_tipo_cliente);
        
        -- Determinando o tipo de cliente para inserir nas tabelas específicas
        IF p_tipo_cliente = 'PF' THEN
            INSERT INTO cliente_pf (idcliente, primeiro_nome, sobrenome, cpf)
            VALUES (LAST_INSERT_ID(), p_primeiro_nome, p_sobrenome, p_cpf);
        ELSEIF p_tipo_cliente = 'PJ' THEN
            INSERT INTO cliente_pj (idcliente, razao_social, cnpj)
            VALUES (LAST_INSERT_ID(), p_razao_social, p_cnpj);
        END IF;
    
    ELSEIF p_acao = 2 THEN
        -- Atualizando da tabela cliente e dados do cliente
        UPDATE cliente 
        SET endereco = p_endereco
        WHERE idcliente = p_idcliente;
        
        -- Atualizando dados na tabela cliente_pf ou cliente_pj
        IF p_tipo_cliente = 'PF' THEN
            UPDATE cliente_pf 
            SET primeiro_nome = p_primeiro_nome, sobrenome = p_sobrenome, cpf = p_cpf
            WHERE idcliente = p_idcliente;
        ELSEIF p_tipo_cliente = 'PJ' THEN
            UPDATE cliente_pj 
            SET razao_social = p_razao_social, cnpj = p_cnpj
            WHERE idcliente = p_idcliente;
        END IF;
        
    ELSEIF p_acao = 3 THEN
        -- Excluindo de dados do cliente em tabelas específicas
        IF p_tipo_cliente = 'PF' THEN
            DELETE FROM cliente_pf WHERE idcliente = p_idcliente;
        ELSEIF p_tipo_cliente = 'PJ' THEN
            DELETE FROM cliente_pj WHERE idcliente = p_idcliente;
        END IF;
        
        -- Excluindo dados na tabela cliente
        DELETE FROM cliente WHERE idcliente = p_idcliente;
    END IF;
END$$
DELIMITER ;