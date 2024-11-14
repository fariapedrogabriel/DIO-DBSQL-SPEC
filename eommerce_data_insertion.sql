USE ecommerce;
SHOW TABLES;

-- iniciando todos os ids com AUTO_INCREMENT para 1
ALTER TABLE cliente AUTO_INCREMENT = 1;
ALTER TABLE produto AUTO_INCREMENT = 1;
ALTER TABLE pedido AUTO_INCREMENT = 1;
ALTER TABLE fornecedor AUTO_INCREMENT = 1;
ALTER TABLE estoque AUTO_INCREMENT = 1;
ALTER TABLE vendedor_terceiro AUTO_INCREMENT = 1;

-- verificando as tabelas criadas
DESC cliente;
DESC cliente_pf;


-- inserindo dados na tabela cliente e cliente_pf
INSERT INTO cliente(tipo_cliente, endereco)
	VALUES("PF", "Rua Silva de Prata, 29, Carangola - Cidade das Flores");
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO cliente_pf(idcliente, primeiro_nome, sobrenome, cpf, data_nascimento)
	VALUES(@cliente_id, "Maria", "Silva", "123456789", "1990-06-10");

INSERT INTO cliente(tipo_cliente, endereco)
	VALUES("PF", "Rua Alemeda, 289, Centro - Cidade das Flores");
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO cliente_pf(idcliente, primeiro_nome, sobrenome, cpf, data_nascimento)
	VALUES(@cliente_id, "Matheus", "Pimentel", "987654321", "1993-05-23");

INSERT INTO cliente(tipo_cliente, endereco)
	VALUES("PF", "Av Alemeda Vinha, 1009, Centro - Cidade das Flores");
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO cliente_pf(idcliente, primeiro_nome, sobrenome, cpf, data_nascimento)
	VALUES(@cliente_id, "Ricardo", "Silva", "456789123", "1985-07-14");
    
INSERT INTO cliente(tipo_cliente, endereco)
	VALUES("PF", "Rua Laranjeiras, 861, Centro - Cidade das Flores");
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO cliente_pf(idcliente, primeiro_nome, sobrenome, cpf, data_nascimento)
	VALUES(@cliente_id, "Julia", "França", "789123456", "1999-03-07");
    
INSERT INTO cliente(tipo_cliente, endereco)
	VALUES("PF", "Av Koller, 19, Centro - Cidade das Flores");
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO cliente_pf(idcliente, primeiro_nome, sobrenome, cpf, data_nascimento)
	VALUES(@cliente_id, "Roberta", "Assis", "987612345", "1985-10-22");
    
INSERT INTO cliente(tipo_cliente, endereco)
	VALUES("PF", "Rua Alemeda das Flores, 28, Centro - Cidade das Flores");
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO cliente_pf(idcliente, primeiro_nome, sobrenome, cpf, data_nascimento)
	VALUES(@cliente_id, "Isabela", "Cruz", "123459876", "1993-05-23");


-- Inserindo clientes PJ   
INSERT INTO cliente(tipo_cliente, endereco)
	VALUES("PJ", "Rua das Rosas, 558, Centro - Cidade das Flores");
SET @cliente_id = LAST_INSERT_ID();
DESC cliente_pj;
INSERT INTO cliente_pj(idcliente, razao_social, nome_fantasia, cnpj, data_abertura)
	VALUES(@cliente_id, "JJ ELETRONICOS", "Rosas Tech", "12345678000134", "2010-10-23");
 
INSERT INTO cliente(tipo_cliente, endereco)
	VALUES("PJ", "Av Koller, 500, Centro - Cidade das Flores");
SET @cliente_id = LAST_INSERT_ID();
DESC cliente_pj;
INSERT INTO cliente_pj(idcliente, razao_social, nome_fantasia, cnpj, data_abertura)
	VALUES(@cliente_id, "BRINQ ROBERTA", "Koller Toys", "00100200300012", "2020-01-01");
    
-- no scrip "ecommerce_queries" rodar teste de seleção dos dados 01


-- inserindo produtos, por ser em uma única tabela sem dependência, vou inserir todos de uma vez
INSERT INTO produto (nome_produto, modelo, infantil, categoria, avaliacao, valor) VALUES
	("Fone de ouvido", "Sony 01", false, "Eletronico", "4", null),
	("Barbie", "Elsa", true, "Brinquedos", "3", null),
    ("Body carters", "azul", true, "Vestimenta", "5", null),
    ("Microfone Vedo", "Youtuber", false, "Eletronico", "4", null);

-- inserindo valor posterior aos produtos
UPDATE produto
SET valor = CASE 
              WHEN idproduto = 1 THEN 150.00
              WHEN idproduto = 2 THEN 200.00
              WHEN idproduto = 3 THEN 250.00
              WHEN idproduto = 4 THEN 300.00
            END
WHERE idproduto IN (1, 2, 3, 4);
    

-- inserindo dados na tabela orders
DESC PEDIDO;
INSERT INTO pedido(cliente_idcliente, status, descricao_pedido, frete, pagamento, codigo_rastreio) VALUES
	(1, "Entregue", "compra via app", NULL, "Crédito", "BR0010202"),
    (2, "Enviado", "compra via site", 14.50, "Pix", NULL),
    (3, "Processando", NULL, NULL, "Boleto", NULL),
    (4, NULL, NULL, NULL, "Crédito", NULL);
    
-- no scrip "ecommerce_queries" rodar teste de seleção dos dados 02


-- inserindo dados na tabela de junção produto_pedido
DESC produto_pedido;
INSERT INTO produto_pedido(pedido_idpedido, produto_idproduto) VALUES
	(1, 1), -- Fone de ouvido para o pedido 1
    (1, 2), -- Barbie para o pedido 1
    (2, 3), -- Body carters para o pedido 2
    (3, 4), -- Microfone Vedo para o pedido 3
    (4, 1); -- Fone de ouvido para o pedido 4
    
-- no scrip "ecommerce_queries" rodar teste de seleção dos dados 03
-- no scrip "ecommerce_queries" rodar teste de seleção dos dados 04


-- inserindo dados na tabela estoque
DESC estoque;
INSERT INTO estoque(local_estoque) VALUES ("Av Koller, 351, Centro - Cidade das Flores");

-- inserindo dados na tabela fornecedor
DESC fornecedor;
INSERT INTO fornecedor(razao_social, cnpj) VALUES ("ABC FORNEC", "00100300400015");

-- inserindo dados na vendedor_terceiro
DESC vendedor_terceiro;
INSERT INTO vendedor_terceiro(razao_social, cnpj, local_terceiro) VALUES ("LOJA FELIZ", "00300400500016", "Rua Laranjeiras, 1001, Centro - Cidade das Flores");

-- no scrip "ecommerce_queries" rodar teste de seleção dos dados 05, 06 e 07


-- inserindo dados na tabela de junção produto_terceiro
INSERT INTO produto_terceiro(terceiro_idterceiro, produto_idproduto) 
VALUES (1, 2); -- Relaciona o vendedor terceiro com ID 1 ao produto com ID 2

-- inserindo dados na tabela de junção produto_fornecedor
INSERT INTO produto_fornecedor(fornecedor_idfornecedor, produto_idproduto) 
VALUES (1, 3); -- Relaciona o fornecedor com ID 1 ao produto com ID 3

-- inserindo dados na tabela de junção produto_estoque
INSERT INTO produto_estoque(estoque_idestoque, produto_idproduto) 
VALUES (1, 4); -- Relaciona o local de estoque com ID 1 ao produto com ID 4

-- no scrip "ecommerce_queries" rodar teste de seleção dos dados 08, 09 e 10