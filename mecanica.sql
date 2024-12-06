-- Criando o DB
SHOW DATABASES;
CREATE DATABASE mecanica;
USE mecanica;
SHOW CREATE DATABASE mecanica;

-- Criando a tabela cliente
CREATE TABLE cliente(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY COMMENT "Identificador único do cliente",
    nome_completo VARCHAR(100) NOT NULL COMMENT "Cliente deve informar seu nome completo",
    email VARCHAR(45) COMMENT "Email para contato, opcional",
    telefone_com_ddd VARCHAR(11) NOT NULL COMMENT "Cliente deve informar seu telefone com ddd sem espaço ou caracteres especiais",
    endereco_cep VARCHAR(8) NOT NULL COMMENT "Cliente deve informar o CEP sem espaços",
    endereco_logadouro VARCHAR(150) NOT NULL COMMENT "Cliente deve informar nome da Rua/Av/Etc e número");
-- Criando uma alteração proposital para ajustar tamanho do email
ALTER TABLE cliente MODIFY COLUMN email VARCHAR(100);
-- Conferindo a alteração proposital
DESC cliente;
    
-- Criando a tabela Veículo
CREATE TABLE veiculo(
	id_veiculo INT AUTO_INCREMENT PRIMARY KEY COMMENT "Identificador único do veículo",
    placa VARCHAR(45) NOT NULL COMMENT "Placa do veículo",
    modelo VARCHAR(45) NOT NULL COMMENT "Modelo do veículo",
    ano VARCHAR(4) COMMENT "Ano do veículo, opcional", 
    id_cliente INT COMMENT "Chave estrangeira que referencia a tabela 'cliente'",
    CONSTRAINT veiculo_fk FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
    );
-- Criando uma alteração proposital para ajustar tamanho do email
ALTER TABLE veiculo MODIFY COLUMN ano YEAR;
-- Conferindo a alteração proposital
DESC cliente;

-- Criando a tabela ordem_servico
CREATE TABLE ordem_servico(
    id_os INT AUTO_INCREMENT PRIMARY KEY COMMENT "Identificador da ordem de serviço",
	data_inicio DATE NOT NULL COMMENT "Data da criação da ordem",
    data_entrega DATE NOT NULL COMMENT "Data da finalização da ordem",
    valor DECIMAL(10,2) COMMENT "Valor final acordado",
    forma_pagamento ENUM("Crédito", "Débito", "PIX") COMMENT "Forma de pagamento do serviço pelo cliente",
    status_pagamento ENUM("Aguardando sinal", "Pagamento pendente", "Pagamento aprovado") COMMENT "Estado atual do pagamento",
    status_servico ENUM("Em aberto", "Serviço iniciado", "Pronto para retirada", "Serviço finalizado") DEFAULT "Em aberto" COMMENT "Estado atual do serviço",
    id_veiculo INT,
    CONSTRAINT ordem_fk FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
    );

-- Criando a tabela peça programada para calcular automáticamente o valor de revenda das peças
CREATE TABLE peca(
	id_peca INT AUTO_INCREMENT PRIMARY KEY COMMENT "Identificador único da peça",
    nome VARCHAR(100) NOT NULL COMMENT "Nome da peça",
    valor_compra DECIMAL(10,2) NOT NULL COMMENT "Valor da peça",
    valor_venda DECIMAL(10,2) AS (valor_compra * 1.1) STORED COMMENT "Valor de revenda da peça, igual ao valor original somados 10%",
    id_os INT,
    CONSTRAINT peca_fk FOREIGN KEY (id_os) REFERENCES ordem_servico(id_os)
    );

-- Criando a tabela para padronizar serviços e valores
CREATE TABLE tipo_servico(
	id_tipo INT AUTO_INCREMENT PRIMARY KEY COMMENT "Identificador único para o tipo de serviço", 
    descricao VARCHAR(250) NOT NULL COMMENT "Descrição do serviço",
    id_pecas_necessarias VARCHAR(250) COMMENT "Previsão de peças necessárias para o serviço, deve ser informado o ID da peça",
    valor DECIMAL(10,2)
    );
    
-- Criando a tabela de funcionários
CREATE TABLE funcionario(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY COMMENT "Identificador único do funcionário", 
    nome VARCHAR(100) NOT NULL COMMENT "Nome do funcionário", 
    cpf VARCHAR(11) NOT NULL UNIQUE COMMENT "CPF para identificação do funcionário, deve ser anotado com apenas números", 
    tipo_funcionario ENUM("PJ", "Freelancer", "CLT") COMMENT "Tipo de relação de emprego"
    );
    
SHOW TABLES;

-- Criando a tabela de junção ordem x tipo de serviço
CREATE TABLE ordem_tipo(
	tipo_id_tipo INT,
	ordem_id_os INT,
    CONSTRAINT ordem_tipo_pk PRIMARY KEY (tipo_id_tipo, ordem_id_os) COMMENT "Aqui criei uma PK composta para a tabela de junção", 
    CONSTRAINT ordem_tipo_fk1 FOREIGN KEY (tipo_id_tipo) REFERENCES tipo_servico(id_tipo) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT ordem_tipo_fk2 FOREIGN KEY (ordem_id_os) REFERENCES ordem_servico(id_os) ON UPDATE CASCADE ON DELETE CASCADE
    );
    
-- Criando a tabela de junção ordem x funcionário
CREATE TABLE ordem_funcionario(
	funcionario_id_funcionario INT,
	ordem_id_os INT,
    CONSTRAINT ordem_funcionario_pk PRIMARY KEY (funcionario_id_funcionario, ordem_id_os) COMMENT "Aqui criei uma PK composta para a tabela de junção", 
    CONSTRAINT ordem_funcionario_fk1 FOREIGN KEY (funcionario_id_funcionario) REFERENCES funcionario(id_funcionario) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT ordem_funcionario_fk2 FOREIGN KEY (ordem_id_os) REFERENCES ordem_servico(id_os) ON UPDATE CASCADE ON DELETE CASCADE
    );