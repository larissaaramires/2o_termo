-- Active: 1794485352621@@127.0.0.1@3308@biblioteca_senai_larissa
-- Criar tabelas - Usuario, Livro, Emprestimo, Categoria, Fornecedor

-- FASE 1 - Criação DDL estrutura
-- 1.
CREATE DATABASE if not EXISTS biblioteca_senai_larissa;
DROP DATABASE biblioteca_senai_larissa;
USE biblioteca_senai_larissa;

-- Criação de tabelas
-- 2.
CREATE Table usuario (
    id_usuario int AUTO_INCREMENT,
    nome VARCHAR(100) not null,
    email VARCHAR(120) not null unique,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT true,
    constraint pk_usuario PRIMARY KEY (id_usuario),
    constraint uq_email UNIQUE (email)
);

CREATE Table if not exists categoria (
    id_categoria int AUTO_INCREMENT,
    nome VARCHAR(80) not null UNIQUE,
    constraint pk_categoria PRIMARY KEY (id_categoria)
);

-- 3.
CREATE Table livro (
    id_livro int AUTO_INCREMENT,
    titulo VARCHAR(150) not null,
    autor VARCHAR(120) not null,
    ISBN char(13) not null UNIQUE,
    ano_publicacao int,
    quantidade_disponivel int DEFAULT 0 check (quantidade_disponivel >= 0),
    id_categoria int not null,
    constraint pk_livro PRIMARY KEY (id_livro),
    constraint uq_ISBN UNIQUE (ISBN),
    constraint fk_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

-- 4.
CREATE Table if NOT exists emprestimo (
    id_emprestimo int AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista date not null,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' check (status_emprestimo in ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    id_usuario INT not null,
    id_livro INT not null,
    constraint pk_emprestimo PRIMARY KEY (id_emprestimo),
    constraint fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) on delete RESTRICT,
    constraint fk_livro FOREIGN KEY (id_livro) REFERENCES livro (id_livro) on delete RESTRICT
);

CREATE Table if not exists fornecedor (
    id_fornecedor int AUTO_INCREMENT,
    CNPJ VARCHAR(20) not null unique,
    razao_social VARCHAR(80) not null,
    constraint pk_fornecedor PRIMARY KEY (id_fornecedor),
    constraint uq_CNPJ UNIQUE (CNPJ)
);

-- 5. 
ALTER Table livro add editora VARCHAR(100);
SELECT * FROM livro;

-- FASE 2 - DML
-- 6.
INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Bruno', 'bruno@gmail.com', '19999999999', true),
('Ana Clara', 'ana@gmail.com', '19999999998', true),
('Chica', 'chico@gmail.com', null, true),
('Raimundo', 'raimundo@gmail.com', '19999999997', true);

-- 7.
INSERT INTO categoria (nome) VALUES 
('Ficção'),
('Terror'),
('Fantasia'),
('Romance');
SELECT * FROM categoria;

insert into livro (titulo, autor, ISBN, ano_publicacao, quantidade_disponivel, id_categoria) VALUES
('Harry Potter', 'J K Rowling', '1234567891234', 1997, 30, 3);

--8.
INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo, id_usuario, id_livro) VALUES
(now(), '2026-12-11', null, 'ABERTO', 1, 1);

-- 9.
SELECT id_usuario, nome, telefone FROM usuario;
UPDATE usuario
set telefone = '19999999996'
where id_usuario = 3;

-- 10.
SELECT * FROM livro;
UPDATE livro
SET quantidade_disponivel = (quantidade_disponivel + 2)
WHERE ano_publicacao >= 1990;

-- 11.
INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Temporario', 'temporario@gmail.com', '19999999999', true);

DELETE FROM usuario
WHERE id_usuario = 5; 

DELETE FROM usuario
where id_usuario = 1;
-- ERRO - possui restrição com chave estrangeira que restringe a exclusão do usuário.

-- FASE 3 - DQL
-- 12.
SELECT titulo, autor, quantidade_disponivel FROM livro;

-- 13.
SELECT * FROM livro
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel DESC;

-- 14. 
SELECT titulo FROM livro 
WHERE titulo like '%Harry%';

-- 15.
SELECT titulo, ano_publicacao FROM livro
WHERE ano_publicacao BETWEEN 1900 and 2025;