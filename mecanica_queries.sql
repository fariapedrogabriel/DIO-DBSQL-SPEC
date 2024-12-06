-- Recuperações simples com SELECT Statement
-- Listando todos os clientes com seus respectivos telefones e endereços
SELECT nome_completo, telefone_com_ddd, endereco_logadouro, endereco_cep
FROM cliente;

-- Filtros com WHERE Statement
-- Buscando os veículos fabricados após 2018
SELECT placa, modelo, ano
FROM veiculo
WHERE ano > 2018;

-- Expressões para gerar atributos derivados
-- Calculando o valor total de uma ordem de serviço (valor da ordem + valor das peças)
SELECT os.id_os, os.valor AS valor_ordem, 
       SUM(p.valor_compra) AS valor_pecas,
       (os.valor + SUM(p.valor_compra)) AS valor_total
FROM ordem_servico os
LEFT JOIN peca p ON os.id_os = p.id_os
GROUP BY os.id_os;

-- Definindo ordenações dos dados com ORDER BY
-- Listando os funcionários ordenados pelo nome
SELECT nome, cpf, tipo_funcionario
FROM funcionario
ORDER BY nome;

-- Condições de filtros aos grupos – HAVING Statement
-- Filtrando as ordens de serviço cujo valor total (valor + peças) exceda 2000
SELECT os.id_os, os.valor AS valor_ordem, 
       SUM(p.valor_compra) AS valor_pecas,
       (os.valor + SUM(p.valor_compra)) AS valor_total
FROM ordem_servico os
LEFT JOIN peca p ON os.id_os = p.id_os
GROUP BY os.id_os
HAVING valor_total > 1500;

-- Criando junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Listando as ordens de serviço com informações do cliente e veículo
SELECT os.id_os, c.nome_completo AS cliente, v.modelo AS veiculo, os.data_inicio, os.data_entrega, os.valor
FROM ordem_servico os
JOIN veiculo v ON os.id_veiculo = v.id_veiculo
JOIN cliente c ON v.id_cliente = c.id_cliente;

-- Listando os tipos de serviço realizados em cada ordem com o nome do funcionário
SELECT os.id_os, t.descricao AS tipo_servico, f.nome AS funcionario
FROM ordem_servico os
JOIN ordem_tipo ot ON os.id_os = ot.ordem_id_os
JOIN tipo_servico t ON ot.tipo_id_tipo = t.id_tipo
JOIN ordem_funcionario ofunc ON os.id_os = ofunc.ordem_id_os
JOIN funcionario f ON ofunc.funcionario_id_funcionario = f.id_funcionario;

-- Perguntas hipotéticas para exploração dos dados
-- Quantos veículos de cada cliente existem registrados?
SELECT c.nome_completo AS cliente, COUNT(v.id_veiculo) AS total_veiculos
FROM cliente c
LEFT JOIN veiculo v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY total_veiculos DESC;

-- Qual o total de ordens de serviço e o valor médio por cliente?
SELECT c.nome_completo AS cliente, 
       COUNT(os.id_os) AS total_ordens,
       TRUNCATE(AVG(os.valor), 2) AS valor_medio
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
JOIN ordem_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY c.id_cliente
ORDER BY valor_medio DESC;
