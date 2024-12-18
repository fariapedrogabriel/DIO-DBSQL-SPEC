-- Script para resolução do desafio proposto em "DIO - SQL Specialist - Personalizando Acessos e Automatizando ações no MySQL"
-- Parte 2 – Criando gatilhos para cenário de e-commerce 

USE ecommerce;

DELIMITER $$
-- Gatilho para remoção de cliente
CREATE TRIGGER before_delete_cliente
BEFORE DELETE ON cliente
FOR EACH ROW
BEGIN
    -- Ação simples de remoção
END$$

-- Gatilho para atualização de cliente
CREATE TRIGGER before_update_cliente
BEFORE UPDATE ON cliente
FOR EACH ROW
BEGIN
    -- Ação simples de atualização
END$$

-- Gatilho para inserção de novo colaborador (empregado)
CREATE TRIGGER before_insert_empregado
BEFORE INSERT ON empregado
FOR EACH ROW
BEGIN
    -- Ação simples de inserção
END$$

-- Gatilho para atualização de salário de colaborador (empregado)
CREATE TRIGGER before_update_salario_empregado
BEFORE UPDATE ON empregado
FOR EACH ROW
BEGIN
    -- Ação simples de atualização de salário
END$$

DELIMITER ;
