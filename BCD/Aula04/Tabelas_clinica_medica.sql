-- COMANDO PARA CRIAR UM BANCO DE DADOS
create database clinica_medica_larissa;
create database clinica_medica_larissa2;

-- COMANDO PARA APAGAR UM BANCO DE DADOS
drop database clinica_medica_larissa2;

-- COMANDO PARA ATIVAR BANCO DE DADOS
use clinica_medica_larissa;

-- CRIAR TABELAS
create table Pacientes (
Id_paciente int auto_increment primary key,
Nome_paciente varchar(60) not null,
Data_nascimento date not null,
CPF varchar(14) not null unique,
Telefone varchar(15) not null,
Email varchar(60) not null unique,
Endereco varchar(100) not null,
Convenio char(3) default "Sim",
Data_cadastro timestamp default current_timestamp
);

create table Medicos (
Id_medico int auto_increment primary key,
Nome_medico varchar(60) not null,
CPF varchar(14) not null unique,
Setor varchar(20) not null,
Horario_atendimento time not null,
Especificacao char(14) default "Pediatria"
);

create table Funcionarios (
Id_funcionario int auto_increment primary key,
Nome_funcionario varchar(60) not null,
CPF varchar(14) not null unique,
Telefone varchar(15) not null,
Horario_trabalhado time not null,
Setor varchar(20) not null
);

drop table medicos;
