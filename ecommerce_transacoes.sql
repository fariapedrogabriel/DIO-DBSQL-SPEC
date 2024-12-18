-- Script para resolução do desafio proposto em "DIO - Criando Transações, Executando Backup e Recovery de Banco de Dados"
USE ecommerce;


-- PARTE 1 – Transações
-- Desabilitando o autocommit
SET autocommit = 0;

-- Executando a transação com modificações de dados
START TRANSACTION;

-- Exemplo de consulta para verificar a situação atual
SELECT * FROM cliente WHERE tipo_cliente = 'PF';

-- Exemplo de modificação de dados: Atualizando o salário de um empregado
UPDATE empregado SET salario_base = salario_base * 1.05 WHERE id_empregado = 1;

-- Exemplo de inserção: Inserindo um novo cliente
INSERT INTO cliente (nome, cpf_cnpj, tipo_cliente) VALUES ('João Silva', '12345678901', 'PF');

-- Confirmando a transação
COMMIT;

-- Executando uma transação com erro (Rollback)
START TRANSACTION;

-- Tentando atualizar um salário inválido para efeito de exemplo
UPDATE empregado SET salario_base = salario_base * 1.1 WHERE id_empregado = 9999;  -- empregado não existe

-- Em caso de erro, rollback
ROLLBACK;


-- PARTE 2 – Transação com procedure

-- Criando o procedure
DELIMITER $$

CREATE PROCEDURE transacao_com_erro()
BEGIN
    -- Iniciando a transação
    START TRANSACTION;

    -- Consulta e modificação dentro da transação para efeito de exemplo
    SELECT * FROM cliente WHERE tipo_cliente = 'PJ';

    -- Modificando dados: Atualizando salário de um empregado
    UPDATE empregado SET salario_base = salario_base * 1.05 WHERE id_empregado = 2;

    -- Tentativa de modificação que poderia gerar erro 
    -- Tentando atualizar um cliente inexistente para efeito de exemplo
    UPDATE cliente SET nome = 'Carlos Souza' WHERE id_cliente = 99999;  -- cliente não existe

    -- Verificando se houve erro na operação
    IF (ROW_COUNT() = 0) THEN
        -- Caso ocorra erro, rollback total
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro na transação, rollback realizado';
    ELSE
        -- Caso contrário, transação confirmada
        COMMIT;
    END IF;
END$$

DELIMITER ;

-- Chamando a procedure para realizar a transação com erro para efeito de exemplo
CALL transacao_com_erro();
