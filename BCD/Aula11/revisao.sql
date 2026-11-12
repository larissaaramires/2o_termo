-- Active: 1794485352621@@127.0.0.1@3308@biblioteca_senai_larissa
-- Criar tabelas - Usuario, Livro, Emprestimo, Categoria, Fornecedor

CREATE DATABASE if not EXISTS biblioteca_senai_larissa;

USE biblioteca_senai_larissa;

-- Criação de tabelas
CREATE Table usuario (
    id_usuario int AUTO_INCREMENT,
    nome VARCHAR(100) not null,
    email VARCHAR(120) not null unique,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT true,
    constraint pk_usuario PRIMARY KEY (id_usuario),
    constraint uq_email UNIQUE (email)
);

CREATE Table livro (
    id_livro int AUTO_INCREMENT,
    titulo
)