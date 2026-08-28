create database somativa_larissa;

use somativa_larissa;

create table Clientes (
Id_cliente int auto_increment primary key,
Nome_paciente varchar(60) not null,
Email varchar(100),
Data_nascimento date not null,
CPF varchar(14) not null unique,
Telefone varchar(15) not null,
Data_cadastro timestamp default current_timestamp,
Endereco varchar(100) not null
);

create table Veiculos ( 
Id_veiculo int auto_increment primary key,
Nome_cliente varchar(60) not null,
Telefone_cliente varchar(60) not null,
Marca_veiculo varchar(40) not null,
Modelo_veiculo varchar(40) not null, 
Placa varchar(8) not null unique,
O_que_concertar varchar(300)
);

create table Marcas (
Id_marca int auto_increment primary key,
Dono_marca varchar(60) not null,
Nacionalidade_marca enum('Nacional', 'Internacional') not null,
Ano_lancamento year,
Modelos_veiculos varchar(1000)
);

create table Modelos (
Id_modelo int auto_increment primary key,
Marca varchar(40) not null,
Nacionalidade_modelo enum('Nacional', 'Internacional') not null,
Ano_lancamento year,
Dono_modelo varchar(60) not null,
Media_preco float
);

create table Funcionarios (
Id_funcionario int auto_increment primary key,
Nome_funcionario varchar(60) not null,
CPF varchar(14) not null unique,
Telefone varchar(15) not null,
Horario_trabalhado time not null,
Setor_trabalhado varchar(20) not null,
Salario float
);

create table Servicos (
Id_servico int auto_increment primary key,
Marca_veiculo varchar(40) not null,
Modelo_veiculo varchar(40) not null,
Placa varchar(8) not null,
Nome_dono varchar(60) not null,
O_que_concertar varchar(300) not null,
Pecas_utiliadas varchar(300)
);

create table Pecas (
Id_peca int auto_increment primary key,
Nome varchar(60) not null,
Preco float,
Marca varchar(40) not null,
Quantidade int
);

create table Ordens_de_Servico (
Id_ordem int auto_increment primary key,
Nome_cliente varchar(60) not null,
Placa_veiculo varchar(8) not null,
O_que_concertou varchar(300) not null, 
Valor float
);

create table Pagamentos (
Id_pagamento int auto_increment primary key,
Valor float,
Observacoes varchar(100),
Quando_pagar varchar(40) not null,
Forma_pagamento char(10) default "Pix"
);

create table Fornecedores (
Id_fornecedor int auto_increment primary key,
Nome_fornecedor varchar(60) not null,
CEP varchar(10) not null unique,
Produtos varchar(300) not null,
Quantidade_produtos int,
Data_entrega date not null
);

-- Criar novo campo
alter table Clientes add teste varchar(12) not null;
alter table Servicos add teste varchar(12) not null;
alter table Pecas add teste varchar(12) not null;
alter table Pagamentos add teste varchar(12) not null;
alter table Ordens_de_servico add teste varchar(12) not null;
alter table Modelos add teste varchar(12) not null;
alter table Marcas add teste varchar(12) not null;
alter table Funcionarios add teste varchar(12) not null;
alter table Fornecedores add teste varchar(12) not null;
alter table Veiculos add teste varchar(12) not null;

-- Apagar novo campo
alter table Clientes drop column teste;
alter table Servicos drop column teste;
alter table Pecas drop column teste;
alter table Pagamentos drop column teste;
alter table Ordens_de_servico drop column teste;
alter table Modelos drop column teste;
alter table Marcas drop column teste;
alter table Funcionarios drop column teste;
alter table Fornecedores drop column teste;
alter table Veiculos drop column teste;

-- Renomear
rename table Modelos to modelos_fab;