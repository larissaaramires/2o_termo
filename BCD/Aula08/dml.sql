-- Active: 1788519228169@@127.0.0.1@3308@smartcoffee_dml_larissa
drop database if EXISTS smartcoffee_dml_larissa;
create database smartcoffee_dml_larissa;
use smartcoffee_dml_larissa;

CREATE Table cliente (
    id_cliente int primary key AUTO_INCREMENT,
    nome VARCHAR(100) not null,
    email varchar(100) UNIQUE,
    telefone VARCHAR(15),
    cidade varchar(60) not null,
    ativo BOOLEAN not null
);

CREATE Table categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) not null UNIQUE
);

CREATE Table produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) not null,
    preco DECIMAL(10,2) not null,
    ativo BOOLEAN not null DEFAULT TRUE,
    id_categoria INT not null,
    constraint fk_produto_categoria foreign key (id_categoria) references categoria (id_categoria)
);

create TABLE pedido (
    id_pedido int primary key AUTO_INCREMENT,
    data_pedido datetime not null,
    status_pedido enum('ABERTO', 'PREPARANDO', 'FINALIZADO', 'CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente int NOT NULL,
    constraint fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade int not NULL,
    preco_unitario DECIMAL(10,2) not null,
    observacao VARCHAR(150),
    constraint fk_item_pedido Foreign Key (id_pedido) REFERENCES pedido (id_pedido),
    constraint fk_item_produto Foreign Key (id_produto) REFERENCES produto (id_produto)
);

CREATE table forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    constraint fk_pagamento_pedido Foreign Key (id_pedido) REFERENCES pedido (id_pedido),
    constraint fk_pagamento_forma_pagamento Foreign Key (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
);
-------------------------------------------------

-- INSERINDO DADOS NO BD
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Arthur Nunes', 'arthur@email.com', '1999999901', 'Rondonia', TRUE),
('Beatriz Raissa', 'beatriz@email.com', '1999999902', 'Limeira', TRUE),
('Dandara Dias', 'dandara@email.com', '1999999903', 'Limeira', TRUE),
('Davi Ferreira', 'davi@email.com', null, 'Limeira', TRUE),
('Felipe Rodrigues', 'felipe@email.com', null, 'Limeira', TRUE),
('Francisco Magri', 'chico@email.com', '1999999904', 'Limeira', TRUE),
('Franz Kramer', 'franz@email.com', '1999999905', 'Limeira', TRUE),
('Gabriel Nogueira', 'gabriel@email.com', '1999999906', 'Limeira', TRUE),
('Gabrielli Araujo', 'gabrielli@email.com', '1999999907', 'Americana', TRUE),
('Isabella Alvez', 'isabella@email.com', null, 'Limeira', TRUE),
('Keynan Santos', 'keynan@email.com', '1999999908', 'Santos', TRUE),
('Larissa Ramires', 'larissa@email.com', '1999999909', 'Limeira', TRUE),
('Leonardo Dias', 'leonardo@email.com', '1999999910', 'Valinhos', TRUE),
('Luana Lima', 'luana@email.com', '1999999911', 'Limeira', TRUE),
('Luccas Manfredi', 'luccas@email.com', '1999999912', 'Campinas', TRUE),
('Livia Stein', 'livia@email.com', '1999999913', 'Limeira', TRUE);

INSERT INTO categoria (nome) VALUES
('Cafés'), ('Bebidas Geladas'), ('Bebidas Quentes'), ('Salgados'), ('Sobremesas'), ('Combo');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Tradicional', 7.00, TRUE, 1),
('Morango Cravejado', 20.00, TRUE, 7),
('Coca-Cola', 6.00, TRUE, 2),
('Chá', 8.00, TRUE, 3),
('Croissant', 18.00, TRUE, 4),
('Torta de Morango', 12.00, TRUE, 5),
('Pão de Queijo com Café Tradicional', 14.00, TRUE, 6);

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(now(), 'ABERTO', 14.00, 3),
(now(), 'ABERTO', 44.00, 12),
(now(), 'PREPARANDO', 7.00, 13),
(now(), 'FINALIZADO', 8.00, 10),
(now(), 'CANCELADO', 20.00, 11);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1, 70, 1, 14.00, 'Tudo bem quente'),
(2, 65, 1, 20.00, ''),
(2, 68, 1, 18.00, ''),
(2, 66, 1, 6.00, ''),
(3, 64, 1, 7.00, ''),
(4, 67, 1, 8.00, ''),
(5, 65, 1, 20.00, '');

INSERT INTO forma_pagamento (descricao) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('Dinheiro'),
('Pix'), 
('Parcelado');

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(1, 2, 14.00, now()),
(2, 4, 44.00, now()),
(3, 3, 7.00, now()),
(4, 1, 8.00, now()),
(5, 1, 20.00, now());
-------------------------------------------------

-- VERIFICAR ÚLTIMO INSERT REALIZADO OU FEITO
INSERT INTO categoria (nome) VALUES
('Doces');

SET @categoria = LAST_INSERT_ID();

SELECT @categoria;
-------------------------------------------------

-- ATRIBUIR NOMES AOS IDS
INSERT INTO categoria (nome) VALUES
('Especiais da House');

SET @categorias_novas = (SELECT nome from categoria where nome = 'Especiais da House');

SELECT @categorias_novas;
-------------------------------------------------

-- ATUALIZANDO OU MODIFICANDO DADOS NO BD
-- LEMBRAR DE SEMPRE EXECUTAR O SELECT PARA ATUALIZAR (UPDATE)
-- EX 1: MODIFICANDO VALORES INDIVIDUAIS
UPDATE cliente
SET telefone = '1999999914'
WHERE id_cliente = 10;

-- E NUNCA JAMAIS NEVER FAÇA UM UPDATE SEM WHERE ⚠️⚠️
UPDATE cliente
SET telefone = '0000000000'

-- EX 2: MODIFICANDO VÁRIOS VALORES
UPDATE cliente
SET cidade = 'Piracicaba'
WHERE id_cliente = 10;
-------------------------------------------------

-- APAGAR DADOS DA TABELA NO BD
DELETE FROM item_pedido
where id_item = 14;
-------------------------------------------------

-- CONSULTAR NO BD
select * FROM cliente
WHERE id_cliente;

SELECT * FROM categoria;

SELECT * FROM produto;

SELECT * FROM pedido;

SELECT * FROM item_pedido;

SELECT * FROM forma_pagamento;

SELECT * FROM pagamento;
-------------------------------------------------

-- PROCEDIMENTO DE UMA COMPRA 
-- PASSO 1: REALIZAR CADASTRO CLIENTE
INSERT into cliente (nome, email, telefone, cidade, ativo) VALUES
('Carlos Silva', 'carlos.silva3@email.com', '19999999999', 'Santos', TRUE);

SET @cliente_compra = LAST_INSERT_ID();

-- PASSO 2: REALIZAR PEDIDO 
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(now(), 'ABERTO', 0.00, @cliente_compra);

SET @pedido_compra = LAST_INSERT_ID();

-- PASSO 3: INSERINDO ITENS
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_compra, 4, 1, 8.00), (@pedido_compra, 5, 1, 18.00);

-- PASSO 4: ATUALIZANDO TOTAL E STATUS
UPDATE pedido
SET valor_total = 26.00,
    status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

-- PASSO 5: REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido_compra, 2, 26.00, now());

-- PASSO 6: CONSULTAR PEDIDO E RESULTADO
SELECT p.id_pedido,
    c.nome AS Nome_Cliente,
    p.status_pedido AS Status_Pedido,
    p.valor_total AS  Compra_Total
FROM pedido p 
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;    
-------------------------------------------------

-- TRANSAÇÕES - SEGURANÇA PARA DML
-- EXEMPLO 1:
START TRANSACTION;
UPDATE produto
set preco = preco * 2.80
where id_categoria = 1;

-- EXEMPLO 2:
START TRANSACTION;
UPDATE cliente SET cidade = 'Santos' WHERE id_cliente = 121;
SELECT * FROM cliente where id_cliente = 121;

-- DESFAZ O QUE FIZEMOS ERRADO OU VOLTA UMA TRANSAÇÃO
ROLLBACK;

-- VALIDA O PROCEDIMENTO DE TRANSAÇÃO
COMMIT;