-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Larissa Ramires de Souza
-- Turma: 2DEVIS Data: 02/10/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_larissa;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Victor Hugo Silva', 'vt.hugo@gmail.com', '19999999999', 'Limeira', TRUE),
('Flávia Batista Ramires de Souza', 'flavia@gmail.com', '19999999999', 'Penápolis', TRUE);

-- 2. Cadastre a categoria 'Sorvetes'.
INSERT INTO categoria (nome) VALUES
('Sorvete');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Picolé de Uva', 8.00, TRUE, 9),
('Paleta Mexicana de Ninho com Nutella', 15.00, TRUE, 9),
('Ituzinho de Morango', 6.00, TRUE, 9);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Marco José', 'marco.jose@gmail.com', '', 'Divinolândia', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(now(), 'PREPARANDO', 44.00, 18);

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @pedido_atividade = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_atividade, 68, 1, 18.00), (@pedido_atividade, 66, 1, 6.00), (@pedido_atividade, 65, 1, 20.00);

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação: cliente
-- UPDATE: 19999993434
-- SELECT final: 18
UPDATE cliente
SET telefone = '19999993434'
WHERE id_cliente = 18;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE cliente
SET cidade = 'Casa Branca',
    telefone = '19999996767'
WHERE id_cliente = 20;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Sorvete'.
START TRANSACTION;
UPDATE produto
set preco = (preco * 0.08) + preco
where id_categoria = 9;
COMMIT;

-- 10. Altere o status do pedido criado para 'FINALIZADO'.
UPDATE pedido
SET status_pedido = 'FINALIZADO'
WHERE id_pedido = 7;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
UPDATE pedido
SET valor_total = 44.00
WHERE id_pedido = @pedido_atividade;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
UPDATE produto
SET ativo = FALSE
WHERE id_produto = 73;

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Cecília Ramires', 'cecilia@gmail.com', '19999359836', 'Piracicaba', TRUE);
DELETE FROM cliente
where id_cliente = 20;

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado: Deu erro pois possui relação
-- DELETE FROM cliente
-- where id_cliente = 12;

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta: Porque o cliente está relacionado com outra tabela e tem informações nela. Criando uma restrição, pois ambas as tabelas dependem dessa informação, assim, não podendo apagar apenas uma.

-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (nome) VALUES
('Excluir Depois');
DELETE FROM categoria
where id_categoria = 10;