USE ecommerce;
SHOW TABLES;

-- teste de seleção dos dados 01
SELECT c.idcliente, c.endereco, c.tipo_cliente, cp.primeiro_nome, cp.sobrenome, cp.cpf, cp.data_nascimento FROM cliente c
JOIN cliente_pf cp ON c.idcliente = cp.idcliente ORDER BY idcliente ASC;

-- teste de seleção de dados 02
-- testando junção de 3 tabelas
SELECT c.idcliente, cp.primeiro_nome, cp.sobrenome, c.endereco, p.descricao_pedido, p.status, p.frete, p.pagamento, p.codigo_rastreio
FROM cliente c
JOIN pedido p ON c.idcliente = p.cliente_idcliente
JOIN cliente_pf cp ON c.idcliente = cp.idcliente
ORDER BY idcliente ASC;

-- teste de seleção de dados 03
-- testando a junção de 4 tabelas através do id do cliente
SELECT 
    c.idcliente, cp.primeiro_nome, cp.sobrenome, c.endereco, pr.nome_produto,p.descricao_pedido, p.pagamento, p.frete, p.codigo_rastreio, p.status
FROM cliente c
JOIN pedido p ON c.idcliente = p.cliente_idcliente
JOIN cliente_pf cp ON c.idcliente = cp.idcliente
JOIN produto_pedido pp ON p.idpedido = pp.pedido_idpedido
JOIN produto pr ON pp.produto_idproduto = pr.idproduto
ORDER BY c.idcliente ASC;

-- teste de seleção de dados 04
-- Exibindo todos os clientes sejam PF ou PJ
SELECT c.idcliente, c.tipo_cliente, f.primeiro_nome, f.sobrenome, f.cpf, f.data_nascimento, j.razao_social, j.nome_fantasia, j.cnpj, j.data_abertura, c.endereco
FROM cliente c
LEFT JOIN cliente_pf f ON c.idcliente = f.idcliente
LEFT JOIN cliente_pj j ON c.idcliente = j.idcliente;

-- teste de seleção dos dados 05, 06 e 07
SELECT * FROM estoque;
SELECT * FROM fornecedor;
SELECT * FROM vendedor_terceiro;

-- teste de seleção dos dados 08, 09 e 10
SELECT * FROM produto_terceiro;
SELECT * FROM produto_fornecedor;
SELECT * FROM produto_estoque;

-- teste de seleção com WHERE
SELECT * 
FROM cliente 
WHERE tipo_cliente = 'PF';

-- teste de seleção com atributos derivados
SELECT p.idpedido, 
       SUM(pr.valor) AS valor_total_original,  -- Soma dos valores originais
       SUM(pr.valor * 1.10) AS valor_total_com_taxa  -- Soma dos valores com a taxa de 10%
FROM pedido p
JOIN produto_pedido pp ON p.idpedido = pp.pedido_idpedido
JOIN produto pr ON pp.produto_idproduto = pr.idproduto
GROUP BY p.idpedido;

-- perguntas criadas para resolução do desafio DIO
-- Quais são os produtos comprados por um cliente específico (CPF = "123456789")?
SELECT 
    pr.nome_produto, 
    pr.modelo, 
    pr.valor, 
    p.status AS status_pedido
FROM cliente_pf cpf
JOIN pedido p ON cpf.idcliente = p.cliente_idcliente
JOIN produto_pedido pp ON p.idpedido = pp.pedido_idpedido
JOIN produto pr ON pp.produto_idproduto = pr.idproduto
WHERE cpf.cpf = '123456789';

-- Qual o total arrecadado em pedidos entregues, considerando a taxa de 10% sobre o valor do produto?
SELECT 
    SUM(pr.valor * 1.10) AS total_arrecadado_com_taxa
FROM pedido p
JOIN produto_pedido pp ON p.idpedido = pp.pedido_idpedido
JOIN produto pr ON pp.produto_idproduto = pr.idproduto
WHERE p.status = 'Entregue';

-- Qual cliente que mais realizou pedidos no sistema?
SELECT 
    c.idcliente, 
    cpf.primeiro_nome, 
    cpf.sobrenome, 
    COUNT(p.idpedido) AS total_pedidos
FROM cliente c
LEFT JOIN cliente_pf cpf ON c.idcliente = cpf.idcliente
JOIN pedido p ON c.idcliente = p.cliente_idcliente
GROUP BY c.idcliente, cpf.primeiro_nome, cpf.sobrenome
ORDER BY total_pedidos DESC
LIMIT 1;