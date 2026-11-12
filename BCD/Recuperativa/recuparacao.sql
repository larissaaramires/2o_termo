-- Active: 1794485352621@@127.0.0.1@3308@mysql
-- FASE 1
-- 1. Criar e selecionar BD
CREATE DATABASE if not EXISTS retrogame_recuperacao;
DROP DATABASE retrogame_recuperacao;
use retrogame_recuperacao;

-- 2. Tabela cliente 
CREATE Table if not exists cliente (
    id_cliente int AUTO_INCREMENT,
    nome VARCHAR(100) not null,
    email VARCHAR(120) not null unique,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT true,
    constraint pk_cliente PRIMARY KEY (id_cliente),
    constraint uq_email UNIQUE (email)
);

-- 3. Plateforma e categoria 
CREATE Table if not exists plataforma (
    id_plataforma int AUTO_INCREMENT,
    nome VARCHAR(80) not null UNIQUE,
    constraint pk_plataforma PRIMARY KEY (id_plataforma),
    constraint uq_nome UNIQUE (nome)
);

create TABLE if not exists categoria (
    id_categoria int AUTO_INCREMENT,
    descricao VARCHAR(80) not null UNIQUE,
    constraint pk_categoria PRIMARY KEY (id_categoria),
    constraint uq_descricao UNIQUE (descricao)
);

-- 4. Tabela jogo 
CREATE Table if not exists jogo (
    id_jogo int AUTO_INCREMENT,
    titulo varchar(150) not null,
    codigo varchar(15) not null UNIQUE, 
    ano_lancamento int not null,
    quantidade_disponivel int DEFAULT 0 check (quantidade_disponivel >= 0),
    id_plataforma int not null,
    id_categoria int not null,
    constraint pk_jogo PRIMARY KEY (id_jogo),
    constraint uq_codigo UNIQUE (codigo),
    constraint fk_plataforma FOREIGN KEY (id_plataforma) REFERENCES plataforma (id_plataforma),
    constraint fk_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

-- 5. Tabela locacao
CREATE Table if not exists locacao (
    id_locacao int AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista date not null,
    data_devolucao date,
    status_locacao varchar(20) DEFAULT 'ABERTA' CHECK (status_locacao in ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    id_cliente int not null,
    id_jogo int not null,
    constraint pk_locacao PRIMARY KEY (id_locacao),
    constraint fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) on delete RESTRICT,
    constraint fk_jogo FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo) on delete RESTRICT
);

-- 6. Alter table 
ALTER Table jogo add desenvolvedora VARCHAR(100);

-- FASE 2
-- 7. Inserir clientes
INSERT INTO cliente (nome, email, telefone, ativo) VALUES
('Larissa', 'larissa@gmail.com', '19999999998', true),
('Victor Hugo', 'victor@gmail.com', null, true),
('Flávia', 'flavia@gmail.com', '19999999997', true),
('Marco', 'marco@gmail.com', '19999999996', true);
SELECT * FROM cliente;

-- 8. Inserir plataformas, categorias e jogos
INSERT INTO plataforma (nome) VALUES
('PlayStation 4'),
('Nintendo Switch'),
('Consoles');
SELECT * FROM plataforma;

INSERT INTO categoria (descricao) VALUES
('Ação e Aventura'),
('Sobrevivência'),
('RPG de Ação');
SELECT * FROM categoria;

INSERT INTO jogo (titulo, codigo, ano_lancamento, quantidade_disponivel, id_plataforma, id_categoria, desenvolvedora) VALUES
('Grand Theft Auto V', 'CUSA-00419', 2013, 5, 1, 1, 'Rockstar North'),
('The Witcher 3: Wild Hunt', 'CUSA-00527', 2015, 8, 3, 1, 'CD PROJEKT RED'),
('The Legend of Zelda: Breath of the Wild', 'HAC-P-AAAAA', 2017, 6, 1, 2, 'Nintendo EPD'),
('Red Dead Redemption 2', 'CUSA-03041', 2018, 20, 1, 1, 'Rockstar Games'),
('God of War (2018)', 'CUSA-07408', 2018, 15, 1, 1, 'Santa Monica Studio'),
('Minecraft', 'CUSA-00744', 2009, 30, 2, 3, 'Programador sueco Markus "Notch" Persson');
SELECT * FROM jogo;

-- Inserir locacoes
INSERT INTO locacao (data_retirada, data_prevista, data_devolucao, status_locacao, id_cliente, id_jogo) VALUES
('2026-10-12', '2026-11-12', '2026-11-10', 'DEVOLVIDA', 2, 4),
(now(), '2026-12-12', null, 'ABERTA', 2, 6),
(now(), '2026-12-12', null, 'ABERTA', 1, 5),
(now(), '2026-12-12', null, 'ABERTA', 4, 3);

UPDATE jogo
SET quantidade_disponivel = (quantidade_disponivel - 1)
where id_jogo = 6;

UPDATE jogo
SET quantidade_disponivel = (quantidade_disponivel - 1)
where id_jogo = 5;

UPDATE jogo
SET quantidade_disponivel = (quantidade_disponivel - 1)
where id_jogo = 3;

-- 10. SELECT + UPDATE
SELECT* FROM cliente;
UPDATE cliente
SET telefone = '19999999999'
WHERE id_cliente = 4;

-- 11. UPDATE em lote 
-- Mudei o ano para 2015 para ficar alguns sem alterar
UPDATE jogo
set quantidade_disponivel = (quantidade_disponivel + 2)
WHERE ano_lancamento >= 2015;

-- 12. DELETE e proteção do histórico
INSERT INTO cliente (nome, email, telefone, ativo) VALUES
('Bruno', 'bruno@gmail.com', '19999999988', true);

SELECT * FROM cliente;

DELETE FROM cliente
WHERE id_cliente = 5;

DELETE FROM cliente
WHERE id_cliente = 1;
-- Da erro, já que existe uma restrição na chave estrangeira para não deletar clientes que possuem locação.

-- 13. SELECT básico
SELECT titulo, ano_lancamento, quantidade_disponivel FROM jogo;

-- 14. WHERE + ORDER BY
-- Mudei para estoque maior que 8 para não aparecer todos
SELECT * FROM jogo
WHERE quantidade_disponivel > 8
ORDER BY quantidade_disponivel DESC;

-- 15. LIKE
SELECT * FROM jogo
WHERE titulo like '%of%';

-- 16. BETWEEN
-- Mudei para 2005 a 2015 para mostrar alguns
SELECT * FROM jogo
WHERE ano_lancamento BETWEEN 2005 and 2015;

-- 17. Funções agregadas
-- COUNT
SELECT COUNT(*) AS quantidade_disponivel FROM jogo;
-- SUM
SELECT SUM(quantidade_disponivel) AS quantidade_total FROM jogo;
-- AVG
SELECT ROUND(AVG(quantidade_disponivel)) AS media_quantidade from jogo;
-- MIN
SELECT ROUND(MIN(quantidade_disponivel)) AS menor_quantidade from jogo;
-- MAX
SELECT ROUND(MAX(quantidade_disponivel)) AS maior_quantidade from jogo;

-- 18. INNER JOIN
SELECT L.id_locacao AS locacao, C.nome AS cliente, J.titulo AS jogo, L.data_retirada, L.status_locacao
FROM locacao AS L
INNER JOIN cliente AS C
ON C.id_cliente = L.id_cliente
INNER JOIN jogo AS J
ON J.id_jogo = L.id_jogo;

-- 19. JOIN + WHERE
SELECT L.id_locacao AS locacao, C.nome AS cliente, J.titulo AS jogo, L.data_retirada, L.status_locacao
FROM locacao AS L
INNER JOIN cliente AS C
ON C.id_cliente = L.id_cliente
INNER JOIN jogo AS J
ON J.id_jogo = L.id_jogo
WHERE status_locacao = 'ABERTA';

-- 20. GROUP BY
SELECT C.nome AS cliente, COUNT(L.id_cliente) AS qnt_locacoes
FROM cliente AS C
INNER JOIN locacao AS L
ON E.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nome
ORDER BY qnt_emprestimos
ASC;

-- 21. LEFT JOIN
SELECT U.nome AS usuario, COUNT(E.id_usuario) AS qnt_emprestimos
FROM usuario AS U 
INNER JOIN emprestimo AS E
ON E.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nome;