create database if not exists sesi_extensaovsTA;

use sesi_extensaovsTA;

show tables;

-- Visualizar todos os BD
show SCHEMAS;

create table if not exists alunos (
    id_aluno int AUTO_INCREMENT primary key,
    nome_aluno varchar(60) not null,
    CPF_aluno char(14) not null unique,
    data_nascimento date not null,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Visualizar informações sobre os dados da tabela
describe alunos;

