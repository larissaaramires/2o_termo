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
Telefone varchar(15),
Email varchar(100),
Endereco varchar(100) not null,
Convenio enum ('Sim', 'Não') not null,
Data_cadastro timestamp default current_timestamp
);

create table Medicos (
Id_medico int auto_increment primary key,
Nome_medico varchar(60) not null,
CPF varchar(14) not null unique,
Setor varchar(20) not null,
Horario_atendimento time not null,
Especificacao enum('Pediatria', 'Nutricionista', 'Dermatologista', 'Ginecologista') not null
);

create table Funcionarios (
Id_funcionario int primary key,
Nome_funcionario varchar(60) not null,
CPF varchar(14) not null unique,
Telefone varchar(15),
Horario_trabalhado time not null,
Setor_trabalhado varchar(20) not null,
Salario decimal(5,2) default 0.00
);

create table Agendamentos (
Id_agendamento int primary key,
Identificacao_paciente int,
Medico_consultado varchar(30) not null,
Data_agendamento date not null,
Horario_agendamento time not null,
Responsavel_agendamento varchar(30)
);

create table Medicamentos (
Id_medicamento int primary key,
Tipo varchar(30) not null,
Marca varchar(30),
Utilidade varchar(60) not null,
Estoque int not null,
Categoria varchar(30) not null
);

