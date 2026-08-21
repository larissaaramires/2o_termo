-- Projeto SmartCoffee - Larissa

create database smartcoffee_larissa;

use smartcoffee_larissa;

create table clientes (
Id_cliente int auto_increment primary key,
Nome varchar(60) not null,
CPF varchar(14) not null unique,
Data_nascimento date not null,
Telefone varchar(15),
Endereco varchar(100) not null
);

create table funcionarios (
Id_funcionario int auto_increment primary key,
Nome varchar(60) not null,
CPF varchar(14) not null unique,
Data_nascimento date not null,
Setor varchar(20) not null,
Telefone varchar(15),
Endereco varchar(100) not null
);

create table fornecedores (
Id_fornecedor int auto_increment primary key,
Nome varchar(60) not null,
CEP varchar(10) not null unique,
Produtos varchar(300) not null,
Quantidade_produtos int,
Data_entrega date not null
);

create table produtos (
Id_produto int auto_increment primary key,
Nome varchar(60) not null,
Preco float,
Marca varchar(40) not null,
Quantidade int
);

create table categoria (
Id_categoria int auto_increment primary key,
Nome_produto varchar(60) not null,
Marca varchar(40) not null,
Tipo varchar(60) not null,
Quantidade int,
Preco float
);

create table estoque (
Id_estoque int auto_increment primary key,
Nome_produto varchar(60) not null,
Marca_produto varchar(60) not null,
Quantidade int,
Quanto_repor int,
Tempo_estimado_acabar date not null
);

