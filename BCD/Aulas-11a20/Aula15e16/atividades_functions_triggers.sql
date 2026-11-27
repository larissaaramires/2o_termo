-- Active: 1795776950494@@127.0.0.1@3308@smartcoffee_procedures_larissa
-- ATIVIDADE AMPLIADA - AULAS 14 E 15
-- Aluno: Larissa Ramires
-- Turma: 2DEVIS

-- 1. Function calcular_total_produtos
DELIMITER $$
CREATE FUNCTION calcular_total_produtos
(p_preco DECIMAL(10,2), p_quantidade INT)
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
    RETURN p_preco * p_quantidade;
END $$
DELIMITER;

SELECT nome, preco, calcular_total_produtos(preco, 3) AS total_produtos
FROM produto;

---------------------------------------------------------------------------------------------------------------------

-- 2. Function classificando_fidelidade
DELIMITER $$
CREATE FUNCTION classificando_fidelidade
(p_pontos INT)
RETURNS varchar(20)
DETERMINISTIC
BEGIN
    IF p_pontos >= 500 THEN 
        RETURN 'OURO';
    ELSEIF p_pontos >= 250 THEN
        RETURN 'PRATA';
    ELSE
        RETURN 'BRONZE';
    END IF;
END $$
DELIMITER;

SELECT nome, pontos_fidelidade, classificando_fidelidade
(pontos_fidelidade) AS Nível
FROM cliente;

---------------------------------------------------------------------------------------------------------------------

-- 3. Function aplicando_desconto
DELIMITER $$
CREATE FUNCTION aplicando_desconto
(p_valor DECIMAL(10,2), p_pontos INT)
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN   
    DECLARE v_percentual DECIMAL (5,2);
    IF p_pontos >= 500 THEN
        SET v_percentual = 0.15;
    ELSEIF p_pontos >= 250 THEN
        SET v_percentual = 0.10;
    ELSE
        SET v_percentual = 0;
    END IF;
    RETURN p_valor * v_percentual;
END $$
DELIMITER;

SELECT aplicando_desconto(200.00, 1200) AS valor_desconto;

---------------------------------------------------------------------------------------------------------------------

-- 4. Function situacao_estoque
DELIMITER $$ 
CREATE FUNCTION situacao_estoque
(p_quantidade INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF p_quantidade = 0 THEN
        RETURN 'SEM ESTOQUE';
    ELSEIF p_quantidade <= 10 THEN
        RETURN 'ESTOQUE BAIXO';
    ELSE
        RETURN 'ESTOQUE NORMAL';
    END IF;
END $$
DELIMITER;

SELECT e.id_produto, p.nome AS produto, situacao_estoque(e.quantidade) AS situacao_estoque
FROM estoque AS e 
INNER JOIN produto AS p 
ON e.id_produto = p.id_produto
ORDER BY id_produto;

---------------------------------------------------------------------------------------------------------------------

-- 5. Testar todas em SELECT
-- 1
SELECT nome, preco, calcular_total_produtos(preco, 3) AS total_produtos
FROM produto;

-- 2
SELECT nome, pontos_fidelidade, classificando_fidelidade
(pontos_fidelidade) AS Nível
FROM cliente;

-- 3
SELECT aplicando_desconto(200.00, 1200) AS valor_desconto;

-- 4 
SELECT e.id_produto, p.nome AS produto, situacao_estoque(e.quantidade) AS situacao_estoque
FROM estoque AS e 
INNER JOIN produto AS p 
ON e.id_produto = p.id_produto
ORDER BY id_produto;