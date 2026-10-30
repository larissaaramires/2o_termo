-- Active: 1788519228169@@127.0.0.1@3308@biblioteca_som2_larissa
-- FASE 1 — DDL: CRIAÇÃO E ESTRUTURA
-- 1. Criação do Banco
create database biblioteca_som2_larissa;
use biblioteca_som2_larissa;

-- 2. Tabela USUARIO
CREATE Table usuario (
    id_usuario int AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100) not null,
    email VARCHAR(120) not null unique,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT true
);

-- 3. Tabela LIVRO
CREATE Table livro (
    id_livro int AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) not null,
    autor VARCHAR(120) not null,
    isbn CHAR(17) not null unique,
    ano_publicacao int, 
    quantidade_disponivel int DEFAULT 0 check (quantidade_disponivel >= 1)
);

-- 4. Tabela EMPRESTIMO
CREATE TABLE emprestimo (
    id_emprestimo int AUTO_INCREMENT PRIMARY KEY,
    id_usuario int not null,
    id_livro int not null,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE not null,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' check (status_emprestimo in ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    constraint fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE RESTRICT,
    constraint fk_emprestimo_livro FOREIGN KEY (id_livro) REFERENCES livro (id_livro) ON DELETE RESTRICT
);

-- 2 TABELAS A MAIS 
-- Tabela FUNCIONARIOS
-- Para ter cadastrado todos os funcionarios
create table funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    CPF char(14) not null unique,
    data_nascimento date not null,
    telefone char(15) not null,
    setor varchar(20) not null,
    endereco varchar(100) not null
);

-- Tabela PRATELEIRA
-- Para facilitar a localização dos livros
CREATE Table prateleira (
    id_prateleira int AUTO_INCREMENT PRIMARY KEY,
    corredor varchar(1)
);

-- 5. ALTER TABLE
ALTER Table livro add editora VARCHAR(100);
ALTER Table livro add id_prateleira int not null;


-- CHAVES ESTRANGEIRAS
ALTER TABLE livro add FOREIGN KEY (id_prateleira) REFERENCES prateleira (id_prateleira);


-- FASE 2 — DML: MANIPULAÇÃO DE DADOS
-- 6. INSERT de usuários
INSERT INTO usuario (nome, email, telefone) VALUES
('Larissa', 'larissa@email.com', '19999999999'),
('Dandara', 'dandara@email.com', null),
('Flávia', 'flavia@email.com', '19999999999'),
('Victor Hugo', 'victor@email.com', '19999999999');

-- 7. INSERT de livroS
INSERT INTO prateleira (corredor) VALUES
('A'),
('B'),
('C'),
('D'),
('E'),
('F'),
('G'),
('H'),
('I'),
('J');

SELECT * FROM prateleira;

INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora, id_prateleira) VALUES
('Torto Arado', 'Itamar Vieira Junior', '978-65-80309-31-3', 2019, 3, 'Todavia', 2),
('O Avesso da Pele', 'Jeferson Tenório', '978-85-359-3339-0', 2020, 4, 'Companhia das Letras', 5),
('Memórias Póstumas de Brás Cubas', 'Machado de Assis', '978-85-359-2512-8', 2014, 2, 'Companhia das Letras (Edição Penguin Companhia)', 1),
('Verity', 'Colleen Hoover', '978-85-01-11784-7', 2020, 2, 'Galera Record', 9),
(' O Sol é Para Todos', 'Harper Lee', '978-85-03-00949-2', 2006, 1, 'José Olympio', 4),
('A Hora da Estrela', 'Clarice Lispector', '978-65-5532-035-0', 2019, 3, 'Rocco', 6);

-- 8. INSERT de empréstimos
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES
(1, 4, DEFAULT, 2026-)