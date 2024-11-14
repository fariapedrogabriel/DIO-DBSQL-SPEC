-- criando o db 'ecommerce'
SHOW DATABASES;
CREATE DATABASE ecommerce;
USE ecommerce;


-- criando a tabela mãe "cliente"
CREATE TABLE cliente(
	idcliente INT PRIMARY KEY AUTO_INCREMENT,
	endereco VARCHAR(45) NOT NULL,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL
    );

-- ajustanto o tamenho da coluna "endereco" na tabela "cliente"
ALTER TABLE cliente MODIFY COLUMN endereco VARCHAR(70) NOT NULL;
    
-- conferindo se deu certo
DESC cliente;


-- criando a tabela filha "cliente_pf"
CREATE TABLE cliente_pf(
	idcliente INT PRIMARY KEY ,
    primeiro_nome VARCHAR(15) NOT NULL,
    sobrenome VARCHAR(15),
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE,
    CONSTRAINT cliente_pf_fk FOREIGN KEY (idcliente) REFERENCES cliente(idcliente)
    );
    
-- conferindo se deu certo usando o comando "SHOW CREATE TABLE"
DESC cliente_pf;
SHOW CREATE TABLE cliente_pf;


-- criando a tabela filha "cliente_pj"
CREATE TABLE cliente_pj(
	idcliente INT PRIMARY KEY,
    razao_social VARCHAR(15) NOT NULL,
    nome_fantasia VARCHAR(15),
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    data_abertura DATE,
    CONSTRAINT cliente_pj_fk FOREIGN KEY (idcliente) REFERENCES cliente(idcliente) 
    );
    
-- conferindo se deu certo
SHOW TABLES;
SHOW CREATE TABLE cliente_pj;


-- criando a tabela "produto"
CREATE TABLE produto(
	idproduto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(15) NOT NULL,
    modelo VARCHAR(10),
    infantil BOOL DEFAULT FALSE,
    categoria ENUM("Eletronico", "Vestimenta", "Brinquedos", "Alimentos"),
    avaliacao FLOAT,
    valor FLOAT
    );
    
    
-- criando a tabela "pedido"
CREATE TABLE pedido(
	idpedido INT PRIMARY KEY AUTO_INCREMENT,
    cliente_idcliente INT,
    status ENUM("Em andamento", "Processando", "Enviado", "Entregue") DEFAULT "Em andamento",
    descricao_pedido VARCHAR(45),
    frete FLOAT,
    pagamento ENUM("Crédito", "Boleto", "Pix") NOT NULL,
    codigo_rastreio VARCHAR(20),
    CONSTRAINT pedido_fk FOREIGN KEY (cliente_idcliente) REFERENCES cliente(idcliente)
    );
    
-- criando uma situação para correçao de FK em "pedido"
ALTER TABLE pedido DROP FOREIGN KEY pedido_fk;
ALTER TABLE pedido ADD CONSTRAINT pedido_fk FOREIGN KEY (cliente_idcliente) REFERENCES cliente(idcliente) 
ON UPDATE CASCADE 
ON DELETE SET NULL;


-- criando a tabela "fornecedor"
CREATE TABLE fornecedor(
	idfornecedor INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(45) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE
    );
    
    
-- criando a tabela "estoque"
CREATE TABLE estoque(
	idestoque INT PRIMARY KEY AUTO_INCREMENT,
    local_estoque VARCHAR(45) NOT NULL
    );


-- criando a tabela "vendedor_terceiro"
CREATE TABLE vendedor_terceiro(
	idterceiro INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(45) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    local_terceiro VARCHAR(45) NOT NULL
    );
    
-- ajustanto o tamenho da coluna "local_terceiro" na tabela "vendedor_terceiro"
ALTER TABLE vendedor_terceiro MODIFY COLUMN local_terceiro VARCHAR(70) NOT NULL;
    
    
-- criando a tabela de ligação "produto_fornecedor"
CREATE TABLE produto_fornecedor(
	fornecedor_idfornecedor INT,
    produto_idproduto INT,
    CONSTRAINT produto_fornecedor_pk PRIMARY KEY (fornecedor_idfornecedor, produto_idproduto),
    CONSTRAINT produto_fornecedor_fk1 FOREIGN KEY (fornecedor_idfornecedor) REFERENCES fornecedor(idfornecedor),
    CONSTRAINT produto_fornecedor_fk2 FOREIGN KEY (produto_idproduto) REFERENCES produto(idproduto)
    );
    
    
-- criando a tabela de ligação "produto_terceiro" para vendedor_terceiro
CREATE TABLE produto_terceiro(
	terceiro_idterceiro INT,
    produto_idproduto INT,
    CONSTRAINT produto_terceiro_pk PRIMARY KEY (terceiro_idterceiro, produto_idproduto),
    CONSTRAINT produto_terceiro_fk1 FOREIGN KEY (terceiro_idterceiro) REFERENCES vendedor_terceiro(idterceiro),
    CONSTRAINT produto_terceiro_fk2 FOREIGN KEY (produto_idproduto) REFERENCES produto(idproduto)
    );
    
-- criando a tabela de ligação "produto_pedido"
CREATE TABLE produto_pedido(
	pedido_idpedido INT,
    produto_idproduto INT,
    CONSTRAINT produto_pedido_pk PRIMARY KEY (pedido_idpedido, produto_idproduto),
    CONSTRAINT produto_pedido_fk1 FOREIGN KEY (pedido_idpedido) REFERENCES pedido(idpedido),
    CONSTRAINT produto_pedido_fk2 FOREIGN KEY (produto_idproduto) REFERENCES produto(idproduto)
    );


-- criando a tabela de ligação "produto_estoque"
CREATE TABLE produto_estoque(
	estoque_idestoque INT,
    produto_idproduto INT,
    CONSTRAINT produto_estoque_pk PRIMARY KEY (estoque_idestoque, produto_idproduto),
    CONSTRAINT produto_estoque_fk1 FOREIGN KEY (estoque_idestoque) REFERENCES estoque(idestoque) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT produto_estoque_fk2 FOREIGN KEY (produto_idproduto) REFERENCES produto(idproduto) ON UPDATE CASCADE ON DELETE CASCADE
    );
    

-- conferindo se deu certo
USE information_schema;
SHOW TABLES;
SELECT * FROM referential_constraints WHERE CONSTRAINT_SCHEMA = "ecommerce";