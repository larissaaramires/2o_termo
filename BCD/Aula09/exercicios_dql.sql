-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Larissa Ramires de Souza
-- Turma: 2DEVIS Data: 09/10/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_larissa;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT nome FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email
FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade 
FROM cliente; 

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome, preco 
FROM produto 
ORDER BY preco 
ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco 
FROM produto 
ORDER BY preco 
ASC
LIMIT 5 
OFFSET 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco 
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Americana';

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome 
FROM produto 
WHERE nome LIKE '%café%';

-- 9. Liste os clientes que não informaram telefone.
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

-- 10. Mostre os pedidos ABERTOS com valor acima de R$ 12,00,
--     do maior para o menor valor.
SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE status_pedido = 'ABERTO' AND valor_total > 12.00
ORDER BY valor_total DESC;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS total_produtos 
FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT ROUND(MIN(preco), 2) AS preço_baixo,
        ROUND(MAX(preco), 2) AS preço_alto,
        ROUND(AVG(preco), 2) AS média_preços
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS qtd_clientes
FROM cliente
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS qnt_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos PREPARANDO.
SELECT ROUND(SUM(valor_total), 2) AS faturamento
FROM pedido
WHERE status_pedido = 'PREPARANDO';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.id_pedido, P.data_pedido, C.nome AS cliente, P.status_pedido, P.valor_total
FROM cliente AS C 
INNER JOIN pedido AS P 
ON C.id_cliente = P.id_cliente;

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT P.nome, CA.nome AS categoria
FROM produto AS P 
INNER JOIN categoria AS CA 
ON CA.id_categoria = P.id_categoria;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT P.id_pedido, PR.nome AS produto, IP.quantidade, IP.preco_unitario, 
IP.quantidade * IP.preco_unitario AS subtotal
FROM pedido AS P 
INNER JOIN item_pedido AS IP 
ON IP.id_pedido = P.id_pedido 
INNER JOIN produto AS PR 
ON PR.id_produto = IP.id_produto
ORDER BY P.id_pedido, PR.nome;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.nome, P.id_pedido, P.data_pedido
FROM cliente AS C
LEFT JOIN pedido AS P 
ON P.id_cliente = C.id_cliente
ORDER BY C.nome;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.nome 
FROM cliente AS C
LEFT JOIN pedido AS P
ON P.id_cliente = C.id_cliente
WHERE P.id_pedido IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta: