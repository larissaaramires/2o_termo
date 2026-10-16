-- Aula 09 - DQL (DATA QUERY LANGUAGE) - Linguagem de consulta de dados 

-- Ex 01: SELECT simples
-- SELECT - coluna 
-- FROM - tabela;
SELECT * FROM cliente;
-- Consulta todas as colunas na tabela   

SELECT nome, telefone FROM cliente;
SELECT nome, ativo FROM produto;
-- Consulta dados com várias colunas

---------------------------------------------------------------------------
-- Ex 02: consultando e personizando a consulta
SELECT nome AS Nome_cliente, telefone AS Contato_cliente FROM cliente;

SELECT nome, preco, preco * 2 AS preco_ajustado FROM produto;

---------------------------------------------------------------------------
-- Ex 03: DISTINCT - eliminar repetições
SELECT DISTINCT cidade from cliente;
SELECT cidade FROM cliente;
-- Com DISTINCT cada resultado é apresentado uma única vez, sem repetir
-- Sem DISTINCT cada resultado é apresentado várias vezes, repetindo

---------------------------------------------------------------------------
-- Ex 04: uso de WHERE - filtro de registros
-- Inserir condições e utilizar operadores de comparação
-- = Igual
-- <> ou != Diferente 
-- > Maior que  
-- >= Maior ou igual
-- < Menor que   
-- <= Menor ou igual 
SELECT nome, preco FROM produto WHERE preco < 15;
--Consultar precos que possuem valor acima de 15.00 reais

SELECT nome, preco, ativo FROM produto WHERE ativo = FALSE;
-- Consultar produtos ativos ou inativos

SELECT id_pedido, data_pedido, valor_total FROM pedido WHERE valor_total >= 25.00;
-- Consultar valor total de produtos acima de 25.00 reais

---------------------------------------------------------------------------
-- Ex 05: uso de AND, OR e NOT
-- AND - todas as condições verdadeiras
SELECT nome, preco FROM produto WHERE preco >= 8.00 AND preco <= 25.00;

-- OR - uma das condições precisa ser verdadeira
SELECT nome, cidade FROM cliente WHERE cidade = 'Limeira' OR cidade = 'Boston';

-- NOT - criar uma condição de negação
SELECT nome, cidade FROM cliente WHERE NOT cidade = 'Limeira';

-- AND e OR - juntos precisamos inserir ()
SELECT nome, cidade, ativo FROM cliente WHERE ativo = TRUE AND (cidade = 'Limeira' OR cidade = 'Piracicaba');

---------------------------------------------------------------------------
-- Ex 06: BETWEEN - pesquisar por intervalos 
-- Limite inicial e final
SELECT nome, preco FROM produto WHERE preco BETWEEN 8.00 AND 15.00;
-- Consultar por intervalor de valores 

SELECT id_pedido, data_pedido, valor_total FROM pedido WHERE data_pedido BETWEEN '2026-01-01 00:00:00' AND '2026-09-30 23:59:59';
-- Consultar dados por intervalo de data

---------------------------------------------------------------------------
-- Ex 07: IN - muitas possibilidades
SELECT nome, cidade FROM cliente where cidade IN ('Limeira', 'Piracicaba', 'Americana');

SELECT nome, cidade FROM cliente WHERE cidade NOT IN ('Limeira', 'Piracicaba');

---------------------------------------------------------------------------
-- Ex 08: LIKE - perquisa por textos
-- Coringas 
-- % Vários caracteres
-- _ Apenas um caracter
SELECT nome FROM produto WHERE nome LIKE 'Café%';
SELECT nome FROM cliente WHERE nome LIKE '%Souza';
-- Consulta pela palavra que deseja, % no final: começa com a palavra, % no começo: termina com a palavra

SELECT nome FROM produto WHERE nome LIKE '%chocolate%';
-- Consulta pela palavra que contém chocolate

SELECT nome FROM produto WHERE nome LIKE '%o_a%'

---------------------------------------------------------------------------
-- Ex 09: NULL - ausência de valor
SELECT nome, telefone FROM cliente where telefone IS NULL;

SELECT nome, telefone from cliente WHERE telefone IS NOT NULL;

---------------------------------------------------------------------------
-- Ex 10: ORDER BY - ordenar resulados
-- ASC é crescente
-- DESC é decrescente
SELECT nome, preco FROM produto order BY preco ASC;

SELECT nome, preco FROM produto order BY preco DESC;

SELECT nome, preco FROM produto order BY nome ASC, preco DESC;

SELECT cidade, nome FROM cliente order BY cidade ASC, nome DESC;
-- Ordenar por mais de uma coluna

---------------------------------------------------------------------------
-- Ex 11: LIMIT - determinar uma quanidade de linhas
SELECT nome, preco FROM produto ORDER BY preco DESC LIMIT 5;

SELECT nome, preco FROM produto ORDER BY nome LIMIT 5 OFFSET 5;

---------------------------------------------------------------------------
-- Ex 12: cálculos em colunas
SELECT nome, preco, preco * 1.30 AS Preço_reajuste FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS Subtotal FROM item_pedido;

---------------------------------------------------------------------------
-- Ex 13: funções
SELECT UPPER(nome) AS NOME_M, LOWER (cidade) AS cidade_m FROM cliente;
-- Uso de maiusculo e minusculo

SELECT concat(nome, ' - ', cidade) AS cliente_cidade FROM cliente;
-- Junta Informações

SELECT nome, preco, ROUND(preco * 0.90, 2) AS preco_desconto FROM produto;
-- Números

SELECT id_pedido, data_pedido, valor_total, DATE(data_pedido) AS datas, MONTH(data_pedido) AS mês, YEAR(data_pedido) as ano, DAY(data_pedido) AS dias, time(data_pedido) AS horário from pedido;
-- Datas

SELECT nome, COALESCE(telefone, 'Não Informado') AS telefone FROM cliente;
-- Substituir o NULL no resultado com COALESCE

---------------------------------------------------------------------------
-- Ex 14: Funções de agregação
-- COUNT = Contar uma quantidade
-- SUM = Somar valores
-- AVG = Calcular média
-- MIN = Valor mínimo
-- MAX = Valor máximo
SELECT COUNT(*) AS total_cliente FROM cliente;
-- Quantos clientes existem na tabela

SELECT ROUND(AVG(preco), 2) AS preço_médio_produtos from produto;
-- Preço médio dos produtos

SELECT ROUND(MIN(preco), 2) AS preço_baixo,
        ROUND(MAX(preco), 2) AS preço_alto,
        ROUND(AVG(preco), 2) AS média_preços
FROM produto;
-- Resumo de preços

SELECT SUM(valor_total) AS fatutamento FROM pedido WHERE status_pedido = 'PREPARANDO';
-- Total de pedidos em critério

---------------------------------------------------------------------------
-- Ex 15: GROUP BY - agrupar dados 
SELECT  cidade, COUNT(*) AS qnt_clientes FROM cliente GROUP BY cidade;
-- Quantos clientes tem em cada cidade

SELECT id_categoria, COUNT(*) AS qnt_produtos from produto GROUP BY id_categoria;
-- Quantidade de produtos por categoria    

---------------------------------------------------------------------------
-- Ex 16: HAVING - criar condições em agrupamentos
-- WHERE filtra linhas antes do agrupamento
-- HAVIN filtra linhas depois do GROUP BY
SELECT cidade, COUNT(*) AS qnt_clientes FROM cliente GROUP BY cidade HAVING COUNT(*) >= 2;
-- Consulta para cidades com pelo menos dois clientes

---------------------------------------------------------------------------
-- Ex 17: resumo de uma consulta completa
SELECT colunas
FROM tabela
WHERE condição
GROUP BY agrupar_colunas
HAVING condição_agrupar
ORDER BY colunas
LIMIT quantidade;

---------------------------------------------------------------------------
-- PARTE II - RELAÇÕES ENTRE ENTIDADES
-- JOINS - consulta de entidades relacionadas
-- INNER JOIN - retorna registros que possuem correspondência entre duas tabelas
-- Ex 1: pedidos com o nome do cliente
SELECT P.id_pedido, P.data_pedido, C.nome AS cliente, P.valor_total 
FROM pedido AS P
INNER JOIN cliente AS C  
ON C.id_cliente = P.id_cliente;

-- OBS: Relacione o cliente cujo id_cliente é igual ao id_cliente feito no pedido
-- Apelidos como referências ou alias - P e C são aliases que deixam a consulta com várias tabelas mais curtas e legíveis.

---------------------------------------------------------------------------
-- Ex 2.1: todos os clientes, incluindo quem nunca comprou
-- LEFT JOIN - mantem todos os registros da esquerda, mesmo sem correspondência na direita
SELECT C.nome, P.id_pedido, P.data_pedido
FROM cliente AS C
LEFT JOIN pedido AS P 
ON P.id_cliente = C.id_cliente
ORDER BY C.nome;

-- Ex 2.2: clientes sem pedidos
SELECT C.id_cliente, C.nome 
FROM cliente AS C 
LEFT JOIN pedido AS P  
ON P.id_cliente = C.id_cliente
WHERE P.id_pedido IS NULL;

---------------------------------------------------------------------------
-- Ex 3.1: itens de pedido com nome de produto 
-- JOIN com três tabelas
SELECT P.id_pedido, PR.nome AS produto, IP.quantidade, IP.preco_unitario,
IP.quantidade * IP.preco_unitario AS subtotal
FROM pedido AS P 
INNER JOIN item_pedido AS IP 
ON IP.id_pedido = P.id_pedido
INNER JOIN produto AS PR 
ON PR.id_produto = IP.id_produto 
ORDER BY P.id_pedido;

-- Ex 3.2: produto e nome de sua categoria
SELECT PR.nome AS produto, CA.nome AS categoria, PR.preco 
FROM produto AS PR 
INNER JOIN categoria AS CA 
ON CA.id_categoria = PR.id_categoria
ORDER BY CA.nome, PR.nome;

---------------------------------------------------------------------------
-- Ex 4.1: quantidade de produtos por categoria
-- Agregação e JOIN
SELECT CA.nome AS categoria, COUNT(PR.id_produto) AS qnt_produtos
FROM categoria AS CA  
LEFT JOIN produto AS PR 
ON PR.id_categoria = CA.id_categoria
GROUP BY CA.id_categoria, CA.nome
ORDER BY qnt_produtos DESC;

-- Ex 4.2: total de compras por cliente
SELECT C.nome AS cliente, COUNT(P.id_pedido) AS qnt_pedidos, SUM(P.valor_total) AS total_comprado 
FROM cliente AS C 
INNER JOIN pedido AS P 
ON P.id_cliente = C.id_cliente
WHERE P.status_pedido = 'ABERTO'
GROUP BY C.id_cliente, C.nome 
ORDER BY total_comprado;

---------------------------------------------------------------------------
-- Ex 5: várias entidades ou tabelas em uma consulta de relatório
-- Relatório completo do pedido
SELECT P.id_pedido, DATE_FORMAT(P.data_pedido, '%d %m %Y %H:%i') AS data, 
C.nome AS cliente, PR.nome AS produto, IP.quantidade, IP.preco_unitario, 
IP.quantidade * IP.preco_unitario AS subtotal
FROM pedido AS P 
INNER JOIN cliente AS C 
ON C.id_cliente = P.id_cliente 
INNER JOIN item_pedido AS IP 
ON IP.id_pedido = P.id_pedido 
INNER JOIN produto AS PR 
ON PR.id_produto = IP.id_produto
ORDER BY P.id_pedido, PR.nome;

-- DATE_FORMAT(P.data_pedido, '%d %m %Y %H:%i') - Padrão de formatação Brasil
-- D = dia
-- M = mês
-- Y = ano
-- H = hora
-- i = minutos

---------------------------------------------------------------------------
-- Ex 6: (CASE) permite criar classificações baseadas em regras
-- CASE - criar classificações em resultados
SELECT nome, preco,
CASE 
WHEN preco < 8.00 THEN 'ECONÔMICO'
WHEN preco <= 15.00 THEN 'INTERMEDIÁRIO'
ELSE 'PREMIUM'
END AS faixa_precos
FROM produto
ORDER BY preco;

---------------------------------------------------------------------------
-- Ex 7: é uma consulta dentro de uma outra consulta 
-- Subconsulta
-- Produtos acima do preço médio
SELECT nome, preco 
FROM produto 
WHERE preco > (SELECT AVG(preco) FROM produto)
ORDER BY preco DESC;