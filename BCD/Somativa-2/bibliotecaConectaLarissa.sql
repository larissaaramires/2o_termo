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
ALTER Table usuario add id_emprestimo int not null;

-- CHAVES ESTRANGEIRAS
ALTER TABLE livro add FOREIGN KEY (id_prateleira) REFERENCES prateleira (id_prateleira);
ALTER TABLE usuario add FOREIGN KEY (id_emprestimo) REFERENCES emprestimo (id_emprestimo);

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
(1, 4, DEFAULT, '2026-11-30', null, DEFAULT),
(4, 6, DEFAULT, '2026-11-30', null, DEFAULT),
(2, 3, DEFAULT, '2026-11-30', null, DEFAULT);

-- 9. UPDATE
SELECT * FROM usuario;
UPDATE usuario
SET telefone = '19999888888'
WHERE id_usuario = 1;

-- 10. Atualização em lote
UPDATE livro
SET quantidade_disponivel = (quantidade_disponivel + 2)
WHERE ano_publicacao = 2020;

-- 11. DELETE e integridade
INSERT INTO usuario (nome, email, telefone) VALUES
('Beatriz', 'beatriz@email.com', '19999999999');
DELETE FROM usuario
where id_usuario = 6;
-- USUÁRIO COM EMPRÉSTIMO
DELETE FROM usuario
where id_usuario = 1;
-- Não apagou pois tem uma restrição na chave estrangeira (emprestimo), impedindo que usuários com empréstimos sejam apagados.


-- FASE 3 — DQL: CONSULTAS E ANÁLISE
-- 12. SELECT básico
SELECT titulo, autor, quantidade_disponivel
FROM livro;

-- 13. WHERE + ORDER BY
SELECT titulo, quantidade_disponivel
FROM livro
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel
DESC;

-- 14. LIKE
SELECT titulo
FROM livro
WHERE titulo LIKE '%estrela%';

-- 15. BETWEEN
SELECT titulo, ano_publicacao 
FROM livro
WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- 16. Funções agregadas
-- COUNT
SELECT COUNT(*) AS quantidade_disponivel FROM livro;
-- SUM
SELECT SUM(quantidade_disponivel) AS quantidade_total FROM livro;
-- AVG
SELECT ROUND(AVG(quantidade_disponivel)) AS media_quantidade from livro;
-- MIN
SELECT ROUND(MIN(quantidade_disponivel)) AS menor_quantidade from livro;
-- MAX
SELECT ROUND(MAX(quantidade_disponivel)) AS maior_quantidade from livro;

-- 17. INNER JOIN
SELECT E.id_emprestimo AS emprestimo, U.nome AS usuario, L.titulo AS livro, E.data_emprestimo, E.status_emprestimo
FROM emprestimo AS E 
INNER JOIN usuario AS U
ON U.id_usuario = E.id_usuario
INNER JOIN livro AS L
ON L.id_livro = E.id_livro;

-- 18. JOIN + WHERE
SELECT E.id_emprestimo AS emprestimo, U.nome AS usuario, L.titulo AS livro, E.data_emprestimo, E.status_emprestimo
FROM emprestimo AS E 
INNER JOIN usuario AS U
ON U.id_usuario = E.id_usuario
INNER JOIN livro AS L
ON L.id_livro = E.id_livro
WHERE status_emprestimo = 'ABERTO';

-- 19. GROUP BY
SELECT U.nome AS usuario, COUNT(E.id_usuario) AS qnt_emprestimos
FROM usuario AS U 
INNER JOIN emprestimo AS E
ON E.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nome
ORDER BY qnt_emprestimos
ASC;

-- 20. LEFT JOIN
SELECT U.nome AS usuario, COUNT(E.id_usuario) AS qnt_emprestimos
FROM usuario AS U 
INNER JOIN emprestimo AS E
ON E.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nome;


-- FASE 4 — TCL, TRANSAÇÕES E INTEGRIDADE
-- 21. Transação de empréstimo
START TRANSACTION;
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES
(1, 2, DEFAULT, '2026-11-30', null, DEFAULT);
UPDATE livro
SET quantidade_disponivel = (quantidade_disponivel - 1)
WHERE id_livro = 2;
SELECT quantidade_disponivel
from livro
where id_livro = 2;
COMMIT;

-- 22. ROLLBACK
START TRANSACTION;
UPDATE livro
SET quantidade_disponivel = (quantidade_disponivel - 2)
WHERE id_livro = 2;
ROLLBACK;

-- 23. SAVEPOINT
START TRANSACTION;
UPDATE livro
SET quantidade_disponivel = (quantidade_disponivel + 1)
WHERE id_livro = 2;
SAVEPOINT qnt_total_livros;
START TRANSACTION;
UPDATE livro
SET quantidade_disponivel = (quantidade_disponivel - 5)
WHERE id_livro = 2;
ROLLBACK;

-- 24. Transação de devolução
START TRANSACTION;
SELECT * FROM emprestimo;
UPDATE emprestimo
SET status_emprestimo = 'DEVOLVIDO',
    data_devolucao = '2026-11-30'
WHERE id_emprestimo = 1;
UPDATE livro
SET quantidade_disponivel = (quantidade_disponivel + 1)
WHERE id_livro = 1;
COMMIT;

-- 25. Análise técnica
-- Cadastrar dois usuários com o mesmo e-mail - constraint = utilizaria constraint pois seria uma regra 'unique'.
-- Cadastrar dois livros com o mesmo ISBN - constraint = utilizaria constraint pois seria uma regra 'unique'.
-- Permitir quantidade disponível negativa - constraint = utilizaria constraint pois seria uma regra 'restrict'.
-- Criar empréstimo para usuário inexistente - integridade referencial = já que não tem como um usuário que não existe fazer um empréstimo.
-- Excluir livro com histórico de empréstimos - integridade referencial = já que não pode excluir livros com histórico.
-- Gravar empréstimo e falhar na redução do estoque - transação = seria transação pois para gravar seria 'start TRANSACTION'.
-- Emprestar livro cuja quantidade disponível seja zero - regra da aplicação = já que é uma regra para ser aplicada.