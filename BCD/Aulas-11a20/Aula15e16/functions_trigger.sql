-- Active: 1795776950494@@127.0.0.1@3308@smartcoffee_procedures_larissa
-- Function: Armazena uma rotina criada dentro do MYSQL que recebe parâmetros, executa uma lógica e devolve um valor com RETURN.
-- Exemplos de utilização:
-- - Calculo de frete (valor do frete)
-- - Escola (cálculo de média com aprovado e reprovado)
-- - Financeiro (calcular juros - valor corrigido)
-- - Estoque (situação estoque - opções de checagem)

---------------------------------------------------------------------------------------------------------------------

-- Ex 0: Estrutura básica (modelo)
CREATE FUNCTION nome_funcao(parametro TIPO)
RETURNS TIPO_DE_RETORNO
DETERMINISTIC
BEGIN
    --PROCESSAMENTO
    RETURN VALOR;
END $$
DELIMITER;
-- Obs: RETURNS: informa qual tipo será devolvido. RETURN: informa o resultado devolvido

---------------------------------------------------------------------------------------------------------------------

-- Ex 1: Total de Item
DELIMITER $$
CREATE FUNCTION calcular_total_item
(p_preco DECIMAL(10,2), p_quantidade INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_preco * p_quantidade;
END $$
DELIMITER;

-- Obs: Agora a função pode ser usada como se fosse uma função nativa
SELECT nome, preco, calcular_total_item(preco, 3) AS Total_3_Unidades
FROM produto;

---------------------------------------------------------------------------------------------------------------------

-- Ex 2: COM DECISÃO - Base em Fidelidade
DELIMITER $$
CREATE FUNCTION classificar_fidelidade
(p_pontos INT)
RETURNS varchar(20)
DETERMINISTIC
BEGIN
    IF p_pontos >= 500 THEN
        RETURN 'OURO';
    ELSEIF p_pontos >= 200 THEN
        RETURN 'PRATA';
    ELSE
        RETURN 'BRONZE';
    END IF;
END $$
DELIMITER;

SELECT nome, pontos_fidelidade, classificar_fidelidade
(pontos_fidelidade) AS Nível
FROM cliente;

---------------------------------------------------------------------------------------------------------------------

-- Ex 3: Exemplo com Variável Local
DELIMITER $$
CREATE FUNCTION calcular_desconto 
(
    p_valor DECIMAL(10,2),
    p_pontos INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_percentual DECIMAL (5,2);
    IF p_pontos >= 500 THEN
        SET v_percentual = 0.10;
    ELSEIF p_pontos >= 200 THEN
        SET v_percentual = 0.05;
    ELSE
        SET v_percentual = 0;
    END IF;
    RETURN p_valor * v_percentual;
END $$
DELIMITER;

-- Obs: DETERMINISTIC?
-- Uma função marcada como DETERMINISTIC declara que, para os mesmos valores de entrada, o resultado será o mesmo.

-- Comparações entre FUNCTION x PROCEDURE x VIEW
-- VIEW: SELECT ... FROM view - Consulta reutilizável - vw_pedidos_abertos
-- PROCEDURE: CALL ... - Processo com várias etapas - registrar_pedido
-- FUNCTION: Dentro da expressão / SELECT - Cálculo ou classificação - calcular_desconto

---------------------------------------------------------------------------------------------------------------------

-- TRIGGERS
-- TRIGGER É UMA ROTINA ASSOCIADA A UMA TABELA QUE É EXECUTADA AUTOMATICAMENTE QUANDO OCORRE UM INSERT, UPDATE, DELETE
-- APLICAÇÕES NO DIA A DIA
-- AUDITORIA: REGISTRAR PRECO ANTIGO E NOVO SEMPRE QUE UM PRODUTO MUDA 
-- SEGURANÇA: REGISTAR EXCLUSÕES IMPORTANTES
-- ESTOQUE: IMPEDIR QUANTIDADE NEGATIVA
-- HOSPITAL: REGISTRAR ALTERAÇÕES EM DADOS CRITICOS
-- FINANCEIRA: CRIAR HISTÓRICO DE MUDANÇA DE STATUS DE PAGAMENTO

-- Ex 1: Auditoria de preço
CREATE TABLE AUDITORIA_PRECO (
    ID_AUDITORIA INT AUTO_INCREMENT,
    ID_PRODUTO INT NOT NULL,
    PRECO_ANTERIOR DECIMAL(10,2),
    PRECO_NOVO DECIMAL(10,2),
    ALTERADO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ID_AUDITORIA PRIMARY KEY (ID_AUDITORIA),
    CONSTRAINT FK_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

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

SELECT ID_PRODUTO, NOME, PRECO 
FROM PRODUTO 
WHERE ID_PRODUTO = 1;

UPDATE PRODUTO
SET PRECO = 10.50
WHERE ID_PRODUTO = 1;

SELECT * FROM AUDITORIA_PRECO 
ORDER BY ID_AUDITORIA DESC;

-- Obs: BOA PRÁTICA - Sempre mostre o estado antes (before), execute a mudança e depois consulte o estado depois (after)
-- BEFORE antes de gravar validar estoque negativo
-- AFTER depois de gravar registrar histórico/auditoria
-- INSERT (OLD não) (NEW sim)
-- UPDATE (OLD sim) (NEW sim)
-- DELETE (OLD sim) (NEW não)

---------------------------------------------------------------------------------------------------------------------

-- Ex 2: Validação automática com signal
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

-- Ex 3: BEFORE INSERT - Antes de inserir dados
DELIMITER $$
CREATE TRIGGER TRG_PRODUTO_BEFORE_INSERT
BEFORE INSERT ON PRODUTO
FOR EACH ROW 
BEGIN
    IF NEW.PRECO <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'PREÇO DEVE SER MAIOR QUE ZERO';
    END IF;
END $$
DELIMITER;

SELECT * FROM produto;

INSERT INTO PRODUTO (ID_CATEGORIA, NOME, PRECO, ATIVO) VALUES
(1, 'Café Americano', -2.00, true);

---------------------------------------------------------------------------------------------------------------------

-- Ex 4: AFTER DELETE - Exclusão de registro
CREATE TABLE LOG_EXCLUSAO_PRODUTO (
    ID_LOG INT AUTO_INCREMENT,
    ID_PRODUTO INT,
    NOME_PRODUTO VARCHAR(120),
    EXCLUIDO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_ID_LOG PRIMARY KEY (ID_LOG),
    CONSTRAINT FK_PRODUTO_ID FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);

DELIMITER $$
CREATE TRIGGER TRG_PRODUTO_AFTER_DELETE
AFTER DELETE ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_EXCLUSAO_PRODUTO (ID_PRODUTO, NOME_PRODUTO) VALUES
    (OLD.ID_PRODUTO, OLD.NOME);
END $$
DELIMITER;

-- TESTANDO
INSERT INTO LOG_EXCLUSAO_PRODUTO (ID_PRODUTO, NOME_PRODUTO) VALUES
(1, 'TESTE');

SELECT * FROM LOG_EXCLUSAO_PRODUTO;

DELETE FROM log_exclusao_produto 
WHERE ID_LOG = 1;

-- COMO GERENCIAR
SHOW TRIGGERS;
SHOW CREATE TRIGGER NOME_TRIGGER;
DROP TRIGGER IF EXISTS NOME_TRIGGER;