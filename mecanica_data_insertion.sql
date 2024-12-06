USE mecanica;

-- Inserindo dados na tabela cliente
INSERT INTO cliente (nome_completo, email, telefone_com_ddd, endereco_cep, endereco_logadouro)
VALUES 
('Carlos Silva', 'carlos.silva@gmail.com', '11987654321', '12345678', 'Rua das Flores, 123'),
('Maria Oliveira', 'maria.oliveira@yahoo.com', '21987654321', '87654321', 'Avenida Paulista, 456'),
('João Pereira', NULL, '31987654321', '65432178', 'Rua do Sol, 789');
-- Conferindo o resultado:
SELECT * FROM cliente;

-- Inserindo dados na tabela veiculo
INSERT INTO veiculo (placa, modelo, ano, id_cliente)
VALUES
('ABC1234', 'Toyota Corolla', 2015, 1),
('XYZ5678', 'Honda Civic', 2020, 2),
('LMN9012', 'Ford Focus', 2018, 3);
-- Conferindo o resultado:
SELECT * FROM veiculo;

-- Inserindo dados na tabela ordem_servico
INSERT INTO ordem_servico (data_inicio, data_entrega, valor, forma_pagamento, status_pagamento, status_servico, id_veiculo)
VALUES
('2024-01-10', '2024-01-15', 1500.00, 'PIX', 'Pagamento aprovado', 'Serviço finalizado', 1),
('2024-01-12', '2024-01-20', 1200.00, 'Crédito', 'Pagamento pendente', 'Pronto para retirada', 2);
-- Conferindo o resultado:
SELECT * FROM ordem_servico;

-- Inserindo dados na tabela peca
INSERT INTO peca (nome, valor_compra, id_os)
VALUES
('Filtro de óleo', 50.00, 1),
('Correia dentada', 80.00, 2),
('Pastilha de freio', 100.00, NULL); -- Peça ainda não associada a uma ordem de serviço
-- Conferindo o resultado:
SELECT * FROM peca;

-- Inserindo dados na tabela tipo_servico
INSERT INTO tipo_servico (descricao, id_pecas_necessarias, valor)
VALUES
('Troca de óleo', '1', 200.00),
('Substituição da correia dentada', '2', 500.00),
('Revisão completa', '1,2,3', 800.00);
-- Conferindo o resultado:
SELECT * FROM tipo_servico;

-- Inserindo dados na tabela funcionario
INSERT INTO funcionario (nome, cpf, tipo_funcionario)
VALUES
('Roberto Lima', '12345678901', 'CLT'),
('Ana Costa', '98765432100', 'Freelancer'),
('Paulo Mendes', '56789012345', 'PJ');
-- Conferindo o resultado:
SELECT * FROM funcionario;

-- Inserindo dados na tabela ordem_tipo
INSERT INTO ordem_tipo (tipo_id_tipo, ordem_id_os)
VALUES
(1, 1), -- Troca de óleo na OS 1
(2, 2), -- Substituição da correia dentada na OS 2
(3, 1); -- Revisão completa na OS 1
-- Conferindo o resultado:
SELECT * FROM ordem_tipo;

-- Inserindo dados na tabela ordem_funcionario
INSERT INTO ordem_funcionario (funcionario_id_funcionario, ordem_id_os)
VALUES
(1, 1), -- Roberto Lima trabalhou na OS 1
(2, 2), -- Ana Costa trabalhou na OS 2
(3, 1); -- Paulo Mendes também trabalhou na OS 1
-- Conferindo o resultado:
SELECT * FROM ordem_funcionario;
