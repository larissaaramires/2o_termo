-- Comandos para criar BD
-- 1
create database clinica_medica_larissa2;
create database if not exists clinica_medica_larissa2;

-- Ativar BD e atualizar schemas
-- 2
use clinica_medica_larissa2;

-- Criar tabelas
-- 3
create table if not exists pacientes (
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

create table if not exists funcionarios (
Id_funcionario int primary key,
Nome_funcionario varchar(60) not null,
CPF varchar(14) not null unique,
Telefone varchar(15),
Horario_trabalhado time not null,
Setor_trabalhado varchar(20) not null,
Salario decimal(5,2) default 0.00
);

-- Alterar informações da tabela - Alter table
-- Adicionar um campo (atribuido) ou coluna na tabela
alter table funcionarios add email varchar(100) not null;
-- Alterar tipo de dados de campo (atributo) ou coluna na tabela
alter table funcionarios modify Email varchar(100) not null;
-- Apagar o campo (atributo) ou coluna na tabela
alter table funcionarios drop column Horario_trabalhado;

-- Renomear tabelas
rename table funcionarios to funcionarioss;
rename table funcionarioss to funcionarios;

-- Comandos de apagar
-- Apagar dados da tabela (valores/informações)
truncate table pacientes;
-- Apagar BD
drop database clinica_medica_larissa2;
-- Apagar tabelas
drop table funcionarios;

-- Mostrar tabelas
show tables;
-- Mostrar todos os BD
show databases;


-- Inserir dados no BD
insert into funcionarios (Id_funcionario,Nome_funcionario,CPF,Telefone,Setor_trabalhado,Salario)
values (1,'Larissa','505.642.998-80','(19) 99937-9112','Pediatria','999');
insert into pacientes (id_paciente,Nome_paciente,Data_nascimento,CPF,Telefone,Email,Endereco,Convenio,Data_cadastro)
values (default,'Larissa','2009-07-09','505.642.998-80','(19) 99937-9112','larissa.souza.ramires@gmal.com','Anna Mendes de Salvi, 168 - Jardim Campo Verde','Sim',default), 
(default,'Keynan','2009-11-24','505.456.876-86','(19) 98675-8997','keynan.santos@gmail.com','Roberto Sales, 190 - Jardim Lagoa nova',default,default);
-- PADRÃO PARA DATA: ANO-MÊS-DIA

-- Consultar dados no BD
select * from pacientes