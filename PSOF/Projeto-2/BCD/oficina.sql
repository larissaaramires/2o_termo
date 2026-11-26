-- Active: 1795691758338@@127.0.0.1@3308@oficina_mecanica
-- criar e selecionar
create database oficina_mecanica;
use oficina_mecanica;
DROP DATABASE OFICINA_MECANICA;

-- tabelas (cliente, veiculo, funcionario, peças, servicos e ordem_servico)

CREATE TABLE IF NOT EXISTS CLIENTE (
    ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(60) NOT NULL,
    CPF CHAR(14) NOT NULL UNIQUE,
    EMAIL VARCHAR(60), 
    TELEFONE VARCHAR(13) NOT NULL,
    ENDERECO VARCHAR(80) NOT NULL,
    STATUS_CLIENTE BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS FUNCIONARIO (
    ID_FUNCIONARIO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(60) NOT NULL,
    CPF CHAR(14) NOT NULL UNIQUE,
    EMAIL VARCHAR(120), 
    TELEFONE VARCHAR(13) NOT NULL,
    ENDERECO VARCHAR(80) NOT NULL,
    CARGO VARCHAR(60) NOT NULL,
    SALARIO DECIMAL(6,2) NOT NULL,
    STATUS_FUNCIONARIO BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS VEICULO (
    ID_VEICULO INT AUTO_INCREMENT PRIMARY KEY,
    ID_CLIENTE INT NOT NULL,
    MODELO VARCHAR(60) NOT NULL,
    MARCA VARCHAR(60) NOT NULL,
    PLACA CHAR(7) NOT NULL UNIQUE,
    ANO_LANCAMENTO DATE NOT NULL,
    CONSTRAINT FK_VEICULO_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
);

CREATE TABLE IF NOT EXISTS PECAS (
    ID_PECA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(60) NOT NULL,
    DESCRICAO VARCHAR(120) NOT NULL,
    FORNECEDOR VARCHAR(60) NOT NULL,
    QTD_ESTOQUE INT NOT NULL
);

CREATE TABLE IF NOT EXISTS SERVICOS (
    ID_SERVICO INT AUTO_INCREMENT PRIMARY KEY,
    PRECO DECIMAL(5,2) NOT NULL,
    TIPO VARCHAR(60) NOT NULL,
    DESCRICAO VARCHAR(120) NOT NULL,
    OBSERVACAO VARCHAR (120)
);

CREATE TABLE IF NOT EXISTS ORDEM_SERVICO (
    ID_ORDEM INT AUTO_INCREMENT PRIMARY KEY,
    ID_CLIENTE INT NOT NULL,
    ID_SERVICO INT NOT NULL,
    ID_FUNCIONARIO INT NOT NULL,
    DATA_INICIO DATETIME DEFAULT CURRENT_TIMESTAMP,
    DATA_PREVISTA DATE NOT NULL,
    DATA_TERMINO DATE,
    STATUS_SERVICO VARCHAR(20) DEFAULT 'ABERTO' check (STATUS_SERVICO in ('ABERTO', 'EM ANDAMENTO', 'FINALIZADO')),
    VALOR_TOTAL DECIMAL(6,2) NOT NULL,
    FORMA_PAGAMENTO VARCHAR(20) DEFAULT 'CRÉDITO' check (FORMA_PAGAMENTO in ('CRÉDITO', 'DÉBITO', 'DINHEIRO', 'PIX')),
    CONSTRAINT FK_ORDEM_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
    CONSTRAINT FK_ORDEM_SERVICO FOREIGN KEY (ID_SERVICO) REFERENCES SERVICOS(ID_SERVICO),
    CONSTRAINT FK_ORDEM_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO(ID_FUNCIONARIO)
);

-- INSERINDO DADOS NO BD
INSERT INTO CLIENTE (NOME, CPF, EMAIL, TELEFONE, ENDERECO, STATUS_CLIENTE) VALUES
('Ana Silva', '123.456.789-01', 'ana.silva@email.com', '19 98765-1001', 'Rua das Flores, 100', TRUE),
('Bruno Santos', '234.567.890-12', 'bruno.santos@email.com', '19 98765-1002', 'Rua das Palmeiras, 200', TRUE),
('Carla Oliveira', '345.678.901-23', 'carla.oliveira@email.com', '19 98765-1003', 'Av. Central, 300', TRUE),
('Daniel Costa', '456.789.012-34', NULL, '19 98765-1004', 'Rua do Comércio, 400', TRUE),
('Eduarda Souza', '567.890.123-45', 'eduarda.souza@email.com', '19 98765-1005', 'Rua Primavera, 500', TRUE),
('Felipe Almeida', '678.901.234-56', NULL, '19 98765-1006', 'Rua São Paulo, 600', TRUE),
('Gabriela Lima', '789.012.345-67', 'gabriela.lima@email.com', '19 98765-1007', 'Av. Brasil, 700', TRUE),
('Henrique Martins', '890.123.456-78', 'henrique.martins@email.com', '19 98765-1008', 'Rua das Acácias, 800', TRUE),
('Isabela Rodrigues', '901.234.567-89', 'isabela.rodrigues@email.com', '19 98765-1009', 'Rua das Orquídeas, 900', TRUE),
('João Ferreira', '112.345.678-90', 'joao.ferreira@email.com', '19 98765-1010', 'Rua do Sol, 1000', TRUE),
('Karen Barbosa', '223.456.789-01', 'karen.barbosa@email.com', '19 98765-1011', 'Rua Azul, 1100', TRUE),
('Lucas Ribeiro', '334.567.890-12', 'lucas.ribeiro@email.com', '19 98765-1012', 'Rua Verde, 1200', TRUE),
('Mariana Gomes', '445.678.901-23', NULL, '19 98765-1013', 'Av. Paulista, 1300', TRUE),
('Nicolas Teixeira', '556.789.012-34', 'nicolas.teixeira@email.com', '19 98765-1014', 'Rua das Rosas, 1400', TRUE),
('Olivia Mendes', '667.890.123-45', 'olivia.mendes@email.com', '19 98765-1015', 'Rua das Margaridas, 1500', FALSE),
('Paulo Carvalho', '778.901.234-56', 'paulo.carvalho@email.com', '19 98765-1016', 'Rua da Liberdade, 1600', TRUE),
('Queila Nunes', '889.012.345-67', 'queila.nunes@email.com', '19 98765-1017', 'Rua dos Ipês, 1700', TRUE),
('Rafael Moreira', '990.123.456-78', 'rafael.moreira@email.com', '19 98765-1018', 'Av. Independência, 1800', FALSE),
('Sabrina Castro', '101.234.567-89', 'sabrina.castro@email.com', '19 98765-1019', 'Rua dos Lírios, 1900', TRUE),
('Thiago Lopes', '212.345.678-90', 'thiago.lopes@email.com', '19 98765-1020', 'Rua das Violetas, 2000', TRUE);

INSERT INTO FUNCIONARIO (NOME, CPF, EMAIL, TELEFONE, ENDERECO, CARGO, SALARIO, STATUS_FUNCIONARIO) VALUES
('Alexandre Vieira', '123.456.789-01', 'alexandre.vieira@oficina.com', '19 98765-3001', 'Rua do Lago, 101', 'Mecânico Automotivo', 3800.00, TRUE),
('Beatriz Ramos', '234.567.890-12', 'beatriz.ramos@oficina.com', '19 98765-3002', 'Rua das Palmeiras, 202', 'Recepcionista', 2100.00, TRUE),
('Caio Monteiro', '345.678.901-23', 'caio.monteiro@oficina.com', '19 98765-3003', 'Rua das Árvores, 303', 'Eletricista Automotivo', 3500.00, TRUE),
('Denise Freitas', '456.789.012-34', 'denise.freitas@oficina.com', '19 98765-3004', 'Av. das Nações, 404', 'Auxiliar de Mecânico', 1900.00, TRUE),
('Emanuel Cardoso', '567.890.123-45', 'emanuel.cardoso@oficina.com', '19 98765-3005', 'Rua do Bosque, 505', 'Mecânico de Motores', 4000.00, TRUE),
('Fernanda Azevedo', '678.901.234-56', 'fernanda.azevedo@oficina.com', '19 98765-3006', 'Rua das Palmeiras, 606', 'Consultora Técnica', 2800.00, TRUE),
('Gustavo Neves', '789.012.345-67', 'gustavo.neves@oficina.com', '19 98765-3007', 'Rua da Paz, 707', 'Mecânico de Freios', 3200.00, TRUE),
('Helena Duarte', '890.123.456-78', 'helena.duarte@oficina.com', '19 98765-3008', 'Av. Principal, 808', 'Atendente', 2100.00, TRUE),
('Igor Batista', '901.234.567-89', 'igor.batista@oficina.com', '19 98765-3009', 'Rua do Parque, 909', 'Técnico em Injeção Eletrônica', 3700.00, TRUE),
('Juliana Moraes', '112.345.678-90', 'juliana.moraes@oficina.com', '19 98765-3010', 'Rua das Acácias, 1010', 'Gerente da Oficina', 5000.00, TRUE),
('Leandro Pires', '223.456.789-01', 'leandro.pires@oficina.com', '19 98765-3011', 'Rua do Mercado, 1111', 'Alinhador e Balanceador', 3000.00, TRUE),
('Manuela Farias', '334.567.890-12', 'manuela.farias@oficina.com', '19 98765-3012', 'Av. das Flores, 1212', 'Auxiliar de Mecânico', 1900.00, TRUE),
('Nelson Correia', '445.678.901-23', 'nelson.correia@oficina.com', '19 98765-3013', 'Rua do Jardim, 1313', 'Mecânico de Suspensão', 3400.00, TRUE),
('Patrícia Tavares', '556.789.012-34', 'patricia.tavares@oficina.com', '19 98765-3014', 'Rua dos Lírios, 1414', 'Administradora', 3200.00, TRUE),
('Renato Coelho', '667.890.123-45', 'renato.coelho@oficina.com', '19 98765-3015', 'Av. Central, 1515', 'Funileiro', 3500.00, FALSE),
('Simone Rocha', '778.901.234-56', 'simone.rocha@oficina.com', '19 98765-3016', 'Rua das Palmeiras, 1616', 'Pintora Automotiva', 3300.00, TRUE),
('Vinícius Nascimento', '889.012.345-67', 'vinicius.nascimento@oficina.com', '19 98765-3017', 'Rua do Comércio, 1717', 'Mecânico Automotivo', 3800.00, TRUE),
('Wellington Moraes', '990.123.456-78', 'wellington.moraes@oficina.com', '19 98765-3018', 'Rua da Estação, 1818', 'Estoquista', 2300.00, FALSE),
('Yasmin Correia', '101.234.567-89', 'yasmin.correia@oficina.com', '19 98765-3019', 'Av. Independência, 1919', 'Mecânico Automotivo', 3600.00, TRUE),
('Zeca Fernandes', '212.345.678-90', 'zeca.fernandes@oficina.com', '19 98765-3020', 'Rua das Flores, 2020', 'Supervisor de Oficina', 4300.00, TRUE);

SELECT * FROM CLIENTE;
INSERT INTO VEICULO (ID_CLIENTE, MODELO, MARCA, PLACA, ANO_LANCAMENTO) VALUES
(7, 'Civic', 'Honda', 'ABC1D23', '2020-01-01'),
(15, 'Corolla', 'Toyota', 'DEF2E34', '2021-01-01'),
(3, 'Onix', 'Chevrolet', 'GHI3F45', '2019-01-01'),
(19, 'HB20', 'Hyundai', 'JKL4G56', '2022-01-01'),
(11, 'Gol', 'Volkswagen', 'MNO5H67', '2018-01-01'),
(2, 'Argo', 'Fiat', 'PQR6I78', '2020-01-01'),
(18, 'Ka', 'Ford', 'STU7J89', '2019-01-01'),
(5, 'T-Cross', 'Volkswagen', 'VWX8K90', '2021-01-01'),
(13, 'Compass', 'Jeep', 'YZA9L01', '2022-01-01'),
(1, 'Creta', 'Hyundai', 'BCD0M12', '2020-01-01'),
(20, 'Kwid', 'Renault', 'EFG1N23', '2019-01-01'),
(9, 'Virtus', 'Volkswagen', 'HIJ2O34', '2021-01-01'),
(16, 'Tracker', 'Chevrolet', 'KLM3P45', '2022-01-01'),
(4, 'City', 'Honda', 'NOP4Q56', '2020-01-01'),
(12, 'Renegade', 'Jeep', 'QRS5R67', '2018-01-01'),
(8, 'Pulse', 'Fiat', 'TUV6S78', '2022-01-01'),
(17, 'Ranger', 'Ford', 'WXY7T89', '2019-01-01'),
(6, 'S10', 'Chevrolet', 'ZAB8U90', '2021-01-01'),
(14, 'HR-V', 'Honda', 'CDE9V01', '2020-01-01'),
(10, 'Taos', 'Volkswagen', 'FGH0W12', '2022-01-01');
 
INSERT INTO PECAS (NOME, DESCRICAO, FORNECEDOR, QTD_ESTOQUE) VALUES
('Filtro de Óleo', 'Filtro para sistema de lubrificação do motor', 'Auto Peças Brasil', 25),
('Filtro de Ar', 'Filtro responsável pela limpeza do ar do motor', 'Distribuidora MotorMais', 30),
('Filtro de Combustível', 'Filtro para retenção de impurezas do combustível', 'Peças Nacional', 18),
('Pastilha de Freio', 'Pastilha para sistema de freio dianteiro', 'Freios Express', 20),
('Disco de Freio', 'Disco de freio ventilado para veículos', 'Auto Center Peças', 15),
('Vela de Ignição', 'Vela utilizada no sistema de ignição do motor', 'NGK Distribuidora', 40),
('Correia Dentada', 'Correia para sincronização do motor', 'Contitech Brasil', 12),
('Correia Alternador', 'Correia para acionamento do alternador', 'Gates Distribuidora', 16),
('Bateria Automotiva', 'Bateria de 60Ah para veículos leves', 'Baterias Moura', 10),
('Amortecedor Dianteiro', 'Amortecedor para suspensão dianteira', 'Monroe Distribuidora', 8),
('Amortecedor Traseiro', 'Amortecedor para suspensão traseira', 'Cofap Distribuidora', 10),
('Terminal de Direção', 'Peça para ligação entre direção e roda', 'TRW Auto Peças', 14),
('Bomba de Combustível', 'Bomba elétrica para alimentação do motor', 'Bosch Auto Peças', 7),
('Bomba de Água', 'Bomba responsável pela circulação do líquido de arrefecimento', 'SKF Distribuidora', 9),
('Radiador', 'Radiador para sistema de arrefecimento do motor', 'Visconde Auto Peças', 6),
('Rolamento de Roda', 'Rolamento para conjunto de roda automotiva', 'SKF Auto Peças', 13),
('Junta do Motor', 'Junta para vedação do conjunto do motor', 'Sabó Distribuidora', 11),
('Lâmpada Automotiva', 'Lâmpada para iluminação externa do veículo', 'Osram Distribuidora', 35),
('Palheta Limpador', 'Palheta para limpeza do para-brisa', 'Dyna Auto Peças', 22),
('Sensor de Temperatura', 'Sensor para monitoramento da temperatura do motor', 'Bosch Distribuidora', 17);

INSERT INTO SERVICOS (PRECO, TIPO, DESCRICAO, OBSERVACAO) VALUES
(120.00, 'Manutenção', 'Troca de óleo e filtro do motor', 'Utilizar óleo conforme especificação do veículo'),
(180.00, 'Freios', 'Troca de pastilhas de freio dianteiras', 'Verificar estado dos discos'),
(250.00, 'Freios', 'Troca de discos e pastilhas dianteiras', 'Inclui mão de obra'),
(150.00, 'Suspensão', 'Troca de amortecedores dianteiros', 'Verificar componentes da suspensão'),
(130.00, 'Suspensão', 'Troca de amortecedores traseiros', 'Verificar estado das molas'),
(90.00, 'Alinhamento', 'Alinhamento das rodas dianteiras', 'Recomendado após troca de pneus'),
(70.00, 'Balanceamento', 'Balanceamento das quatro rodas', 'Verificar pressão dos pneus'),
(220.00, 'Motor', 'Troca da correia dentada', 'Verificar tensionador e rolamentos'),
(160.00, 'Motor', 'Troca das velas de ignição', 'Verificar cabos e bobinas'),
(200.00, 'Elétrica', 'Diagnóstico do sistema elétrico', 'Utilizar equipamento de diagnóstico'),
(180.00, 'Elétrica', 'Troca da bateria automotiva', 'Verificar sistema de carga'),
(300.00, 'Injeção', 'Limpeza dos bicos injetores', 'Realizar teste após a limpeza'),
(250.00, 'Injeção', 'Diagnóstico da injeção eletrônica', 'Utilizar scanner automotivo'),
(140.00, 'Ar Condicionado', 'Higienização do ar-condicionado', 'Verificar filtro de cabine'),
(200.00, 'Ar Condicionado', 'Recarga do gás do ar-condicionado', 'Verificar possíveis vazamentos'),
(100.00, 'Arrefecimento', 'Troca do líquido de arrefecimento', 'Verificar nível e possíveis vazamentos'),
(350.00, 'Motor', 'Troca da bomba de água', 'Verificar correia e sistema de arrefecimento'),
(80.00, 'Manutenção', 'Troca do filtro de ar do motor', 'Verificar caixa do filtro'),
(60.00, 'Manutenção', 'Troca do filtro de combustível', 'Verificar conexões do sistema'),
(450.00, 'Diagnóstico', 'Revisão completa do veículo', 'Inclui inspeção dos principais sistemas');


SELECT * FROM CLIENTE;

SELECT* FROM SERVICO;

SELECT * FROM FUNCIONARIO;

INSERT INTO ORDEM_SERVICO (ID_CLIENTE, ID_SERVICO, ID_FUNCIONARIO, DATA_PREVISTA, DATA_TERMINO, STATUS_SERVICO, VALOR_TOTAL, FORMA_PAGAMENTO) VALUES
(7, 3, 12, '2026-11-20', '2026-11-20', 'FINALIZADO', 250.00, 'PIX'),
(15, 8, 4, '2026-11-21', '2026-11-21', 'FINALIZADO', 220.00, 'CRÉDITO'),
(3, 1, 17, '2026-11-22', '2026-11-22', 'FINALIZADO', 120.00, 'DÉBITO'),
(19, 5, 9, '2026-11-23', NULL, 'EM ANDAMENTO', 130.00, 'DINHEIRO'),
(11, 12, 2, '2026-11-24', NULL, 'ABERTO', 250.00, 'PIX'),
(2, 7, 14, '2026-11-25', '2026-11-25', 'FINALIZADO', 70.00, 'CRÉDITO'),
(18, 10, 6, '2026-11-26', NULL, 'EM ANDAMENTO', 200.00, 'DÉBITO'),
(5, 15, 19, '2026-11-27', NULL, 'ABERTO', 200.00, 'PIX'),
(13, 20, 8, '2026-11-28', NULL, 'ABERTO', 450.00, 'CRÉDITO'),
(1, 4, 15, '2026-11-29', '2026-11-29', 'FINALIZADO', 150.00, 'DINHEIRO'),
(20, 6, 3, '2026-11-30', NULL, 'EM ANDAMENTO', 90.00, 'PIX'),
(9, 13, 11, '2026-12-01', NULL, 'ABERTO', 250.00, 'DÉBITO'),
(16, 18, 20, '2026-12-02', '2026-12-02', 'FINALIZADO', 80.00, 'CRÉDITO'),
(4, 2, 7, '2026-12-03', NULL, 'ABERTO', 180.00, 'PIX'),
(12, 17, 16, '2026-12-04', NULL, 'EM ANDAMENTO', 350.00, 'DINHEIRO'),
(8, 9, 1, '2026-12-05', '2026-12-05', 'FINALIZADO', 160.00, 'DÉBITO'),
(17, 14, 13, '2026-12-06', NULL, 'ABERTO', 140.00, 'CRÉDITO'),
(6, 11, 18, '2026-12-07', NULL, 'EM ANDAMENTO', 130.00, 'PIX'),
(14, 16, 5, '2026-12-08', '2026-12-08', 'FINALIZADO', 100.00, 'DINHEIRO'),
(10, 19, 10, '2026-12-09', NULL, 'ABERTO', 60.00, 'DÉBITO');

---------------------------------------------------------------------------------------------------------------------------------

