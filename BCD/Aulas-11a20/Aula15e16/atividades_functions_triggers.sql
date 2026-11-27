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

---------------------------------------------------------------------------------------------------------------------

-- 6. Criar auditoria_preco
CREATE TABLE AUDITORIA_PRECO (
    ID_AUDITORIA INT AUTO_INCREMENT,
    ID_PRODUTO INT NOT NULL,
    PRECO_ANTERIOR DECIMAL(10,2),
    PRECO_NOVO DECIMAL(10,2),
    ALTERADO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ID_AUDITORIA PRIMARY KEY (ID_AUDITORIA),
    CONSTRAINT FK_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

---------------------------------------------------------------------------------------------------------------------

-- 7. Trigger AFTER UPDATE de preço
DELIMITER $$
CREATE TRIGGER TRG_PRODUTO_PRECO_UPDATE
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN
    IF OLD.PRECO <> NEW.PRECO THEN
        INSERT INTO AUDITORIA_PRECO (ID_PRODUTO, PRECO_ANTERIOR, PRECO_NOVO) VALUES
        (NEW.ID_PRODUTO, OLD.PRECO, NEW.PRECO);
    END IF;
END $$
DELIMITER;

UPDATE PRODUTO
SET PRECO = 13.00
WHERE ID_PRODUTO = 4;

SELECT * FROM AUDITORIA_PRECO 
ORDER BY ID_AUDITORIA DESC;

---------------------------------------------------------------------------------------------------------------------

-- 8. Trigger BEFORE UPDATE impedindo estoque negativo
DELIMITER $$
CREATE TRIGGER TRG_ESTOQUE_BEFORE_UPDATE
BEFORE UPDATE ON ESTOQUE
FOR EACH ROW
BEGIN
    IF NEW.QUANTIDADE < 0 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ESTOQUE NÃO PODE FICAR NEGATIVO';
    END IF;
END $$
DELIMITER;

---------------------------------------------------------------------------------------------------------------------

-- 9. Criar log_exclusao_produto
CREATE TABLE LOG_EXCLUSAO_PRODUTO (
    ID_LOG INT AUTO_INCREMENT,
    ID_PRODUTO INT,
    NOME_PRODUTO VARCHAR(120),
    EXCLUIDO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ID_LOG PRIMARY KEY (ID_LOG),
    CONSTRAINT FK_PRODUTO_ID FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

---------------------------------------------------------------------------------------------------------------------

-- 10. Trigger AFTER DELETE
DELIMITER $$
CREATE TRIGGER TRG_PRODUTO_AFTER_DELETE
AFTER DELETE ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_EXCLUSAO_PRODUTO (ID_PRODUTO, NOME_PRODUTO) VALUES
    (OLD.ID_PRODUTO, OLD.NOME);
END $$
DELIMITER;

---------------------------------------------------------------------------------------------------------------------

-- 11. Demonstrar operação bloqueada
INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES
(1, 'Latte', -7.00, true);

---------------------------------------------------------------------------------------------------------------------

-- 12. Demonstrar histórico gerado automaticamente
INSERT INTO LOG_EXCLUSAO_PRODUTO (ID_PRODUTO, NOME_PRODUTO) VALUES
(2, 'Isso é um teste');

SELECT * FROM LOG_EXCLUSAO_PRODUTO;

DELETE FROM log_exclusao_produto 
WHERE ID_LOG = 2;

---------------------------------------------------------------------------------------------------------------------

-- 13. SHOW TRIGGERS
SHOW TRIGGERS;

---------------------------------------------------------------------------------------------------------------------

-- 14. SHOW CREATE TRIGGER
SHOW CREATE TRIGGER TRG_ESTOQUE_BEFORE_UPDATE;

---------------------------------------------------------------------------------------------------------------------

-- 15. Explique: Function x Procedure x View x Trigger
-- FUNCTION: Armazena uma rotina criada dentro do MYSQL que recebe parâmetros, executa uma lógica e devolve um valor com RETURN.
-- PROCEDURE: É um conjunto de instruções SQL; que após criado podemos executar sempre que necessário usando CALL.
-- VIEW: Consulta reutilizável.
-- TRIGGER: É uma tabela que é executada automaticamente quando ocorre um INSERT, UPDATE e DELETE.

---------------------------------------------------------------------------------------------------------------------

-- 16. Cite 3 regras em que CHECK/UNIQUE/FK seriam melhores que Trigger
-- CHECK: 
-- Garantir que o preço de um produto seja maior que zero. 
-- É melhor porque valida diretamente uma condição antes de inserir ou atualizar os dados.

-- UNIQUE: 
-- Garantir que não existam dois usuários com o mesmo e-mail. 
-- É melhor porque impede valores duplicados de forma simples e automática.

-- FOREIGN KEY: 
-- Garantir que um pedido esteja associado a um cliente existente. 
-- É melhor porque mantém a integridade referencial entre as tabelas, impedindo referências a registros inexistentes.

---------------------------------------------------------------------------------------------------------------------

-- DESAFIO: crie uma automação própria e justifique a escolha do recurso.
DELIMITER $$
CREATE TRIGGER baixar_estoque
AFTER UPDATE ON pedido
FOR EACH ROW
BEGIN
    IF NEW.status_pedido = 'PAGO'
       AND OLD.status_pedido <> 'PAGO' THEN
        UPDATE estoque e
        INNER JOIN item_pedido i
            ON e.id_produto = i.id_produto
        SET e.quantidade = e.quantidade - i.quantidade
        WHERE i.id_pedido = NEW.id_pedido;

    END IF;
END $$
DELIMITER;

-- Justificativa: 
-- Escolhi utilizar uma Trigger porque ela permite executar ações automaticamente após uma alteração no banco de dados.
-- Nesse caso, quando o status de um pedido mudar para PAGO, a Trigger identifica os produtos relacionados na tabela item_pedido e diminui suas quantidades na tabela estoque.