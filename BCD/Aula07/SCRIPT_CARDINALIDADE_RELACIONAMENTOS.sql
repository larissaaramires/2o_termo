-- Sql ANSI 2003 - brModelo.
-- Relacionamentos e Cardinalidade - Banco de Dados, Exemplo

CREATE DATABASE IF NOT EXISTS SESI_CR_TA;
USE SESI_CR_TA;

CREATE TABLE Cliente (
Id_cliente int auto_increment primary key PRIMARY KEY,
Nome_cliente varchar(60) not null
)

CREATE TABLE Produto (
Id_produto int auto_increment primary key PRIMARY KEY,
Nome_produto varchar(60) not null
)

CREATE TABLE Pedido (
Id_pedido int auto_increment primary key PRIMARY KEY,
Data_pedido datetime not null
)

CREATE TABLE Item_produto (
Id_produto int not null,
Id_fornecedor int not null,
Id_item int auto_increment PRIMARY KEY,
Valor float not null,
Observacao text(300),
FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto)
)

CREATE TABLE Estoque (
Id_produto int not null unique,
Nome_produto varchar(100) not null,
Id_estoque int auto_increment PRIMARY KEY,
Quantidade int not null
)

CREATE TABLE Fornecedor (
Id_fornecedor int auto_increment PRIMARY KEY,
Razao_social varchar(100) not null
)

ALTER TABLE Item_produto ADD FOREIGN KEY(Id_fornecedor) REFERENCES Fornecedor (Id_fornecedor)


-- Desafios
-- Questão 1 
-- CATEGORIA --- POSSUI --- PRODUTOS
-- 1:N                      1:1

-- Questão 2
-- FUNCIONÁRIO --- REGISTRA --- PEDIDOS
-- 1:N                          1:1

--Questão 3 
-- FORNECEDOR --- COMERCIALIZA --- PRODUTOS
-- 1:N                             1:N

-- Questão 4
-- MESA --- EXISTE --- RESERVA FUTURA
-- 0:N                 1:1

-- Questão 5
-- PEDIDO --- POSSUI --- ITENS
-- 1:N                   1:1