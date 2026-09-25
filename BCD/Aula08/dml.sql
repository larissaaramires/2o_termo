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
)
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
-------------------------------------------------

-- VERIFICAR ÚLTIMO INSERT REALIZADO OU FEITO
INSERT INTO categoria (nome) VALUES
('Doces');

SET @categoria = LAST_INSERT_ID();

SELECT @categoria;
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
DELETE FROM cliente
where id_cliente = 10;
-------------------------------------------------

-- CONSULTAR NO BD
select * FROM cliente
WHERE id_cliente = 10;

SELECT * FROM categoria;