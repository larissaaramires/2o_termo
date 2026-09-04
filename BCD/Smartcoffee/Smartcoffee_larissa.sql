create database Smartcoffee_larissa;

use Smartcoffee_larissa;

create table clientes (
    Id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(60) NOT NULL,
    CPF char(14) not null unique,
    Telefone char(15) not null,
    Endereco varchar(100) not null,
    Data_nascimento date not null,
    Data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table produtos (
    Id_produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome_produto VARCHAR(60) NOT NULL,
    Marca VARCHAR(60) NOT NULL,
    Preco float,
    Tamanho float,
    Quantidade int
);

create table pedidos (
    Id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    Data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Produtos varchar(300) not null,
    Quantidade int,
    Valor float,
    Endereco varchar(100) not null
);

create table funcionarios (
    Id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(60) NOT NULL,
    CPF char(14) not null unique,
    Data_nascimento date not null,
    Telefone char(15) not null,
    Setor varchar(20) not null,
    Endereco varchar(100) not null
);

create table programa_de_fidelidade (
    Id_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
    Nome_cliente VARCHAR(60) NOT NULL,
    CPF char(14) not null unique,
    Email_cliente varchar(100),
    Pontos_obtidos int,
    Desconto_cupom varchar(30)
);

create table fornecedor (
    Id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome_fornecedor VARCHAR(60) NOT NULL,
    CEP char(9) not null unique,
    Produtos varchar(300) not null,
    Quantidade_produtos int,
    Data_nascimento date not null
);

create table estoque (
    Id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    Nome_produto VARCHAR(60) NOT NULL,
    Marca_produto VARCHAR(60) NOT NULL,
    Quantidade_estoque int,
    Tempo_estimado_acabar date not null,
    Quanto_repor int
);

create table pagamento (
    Id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Pagar_forma enum('No site', 'Na entrega') not null,
    Cupom_desconto varchar(20),
    Frete_CEP char(9) unique,
    Forma_pagamento enum('Parcelado', 'Crédito', 'Débito', 'Pix') not null,
    Observações varchar(100)
);

create table delivery (
    Id_delivery int auto_increment primary key,
    Nome_motoboy varchar(60) not null,
    Telefone char(15) not null,
    Produtos varchar(300) not null,
    Endereco varchar(100) not null,
    Tempo_estimado_entrega time not null
);

create table categoria (
    Id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nome_produto VARCHAR(60) NOT NULL,
    Marca VARCHAR(60) NOT NULL,
    Tipo varchar(60) not null,
    Quantidade int,
    Preco float
);
