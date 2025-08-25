CREATE DATABASE db_revenda_gabriel;

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(200) NOT NULL
);

CREATE TABLE aviao (
    id_aviao SERIAL PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    ano_fabricacao DATE NOT NULL,
    preco NUMERIC(15,2) NOT NULL CHECK (preco > 0)
);

CREATE TABLE vendedor (
    id_vendedor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    comissao_percentual NUMERIC(5,2)
);

CREATE TABLE vendas (
    id_venda SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES clientes(id_cliente),
    id_vendedor INTEGER NOT NULL REFERENCES vendedor(id_vendedor),
    data_venda DATE NOT NULL DEFAULT CURRENT_DATE,
    valor_total NUMERIC(15,2) NOT NULL CHECK (valor_total > 0)
);

CREATE TABLE aviao_venda (
    id_aviao INTEGER NOT NULL REFERENCES aviao(id_aviao),
    id_venda INTEGER NOT NULL REFERENCES vendas(id_venda),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    PRIMARY KEY (id_aviao, id_venda)
);

CREATE TABLE avaliacoes (
    id_avaliacao SERIAL PRIMARY KEY,
    id_aviao INTEGER NOT NULL REFERENCES aviao(id_aviao),
    id_cliente INTEGER NOT NULL REFERENCES clientes(id_cliente),
    nota INTEGER NOT NULL CHECK (nota >= 1 AND nota <= 5),
    comentario TEXT
);

CREATE VIEW view_vendas_detalhadas AS
SELECT
    v.id_venda,
    v.data_venda,
    c.nome AS nome_cliente,
    vd.nome AS nome_vendedor,
    a.modelo,
    a.fabricante,
    av.quantidade,
    v.valor_total
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN vendedor vd ON v.id_vendedor = vd.id_vendedor
JOIN aviao_venda av ON v.id_venda = av.id_venda
JOIN aviao a ON av.id_aviao = a.id_aviao;

CREATE VIEW view_avaliacoes_avioes AS
SELECT
    avl.id_avaliacao,
    a.modelo,
    c.nome AS nome_cliente,
    avl.nota,
    avl.comentario
FROM avaliacoes avl
JOIN aviao a ON avl.id_aviao = a.id_aviao
JOIN clientes c ON avl.id_cliente = c.id_cliente;

-- Clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('João Silva', 'joao@gmail.com', '11999999901', 'Rua A, 123'),
('Maria Oliveira', 'maria@gmail.com', '11999999902', 'Rua B, 456'),
('Pedro Santos', 'pedro@gmail.com', '11999999903', 'Rua C, 789'),
('Ana Paula', 'ana@gmail.com', '11999999904', 'Rua D, 101'),
('Lucas Lima', 'lucas@gmail.com', '11999999905', 'Rua E, 112'),
('Fernanda Costa', 'fernanda@gmail.com', '11999999906', 'Rua F, 131'),
('Marcos Vinícius', 'marcos@gmail.com', '11999999907', 'Rua G, 415'),
('Camila Rocha', 'camila@gmail.com', '11999999908', 'Rua H, 161'),
('Bruno Alves', 'bruno@gmail.com', '11999999909', 'Rua I, 718'),
('Patrícia Mendes', 'patricia@gmail.com', '11999999910', 'Rua J, 192');

-- Aviões
INSERT INTO aviao (modelo, fabricante, ano_fabricacao, preco) VALUES
('Cessna 172', 'Cessna', '2015-01-01', 300000.00),
('Piper PA-28', 'Piper', '2018-01-01', 350000.00),
('Beechcraft Bonanza', 'Beechcraft', '2012-01-01', 420000.00),
('Cirrus SR22', 'Cirrus', '2019-01-01', 550000.00),
('Diamond DA40', 'Diamond', '2016-01-01', 320000.00),
('Mooney M20', 'Mooney', '2014-01-01', 400000.00),
('Cessna 208 Caravan', 'Cessna', '2017-01-01', 650000.00),
('Piper PA-46', 'Piper', '2013-01-01', 700000.00),
('Cirrus Vision SF50', 'Cirrus', '2020-01-01', 2000000.00),
('Extra 330LX', 'Extra', '2011-01-01', 450000.00);

-- Vendedores
INSERT INTO vendedor (nome, email, telefone, comissao_percentual) VALUES
('Carlos Lima', 'carlos@revenda.com', '11777777001', 7.5),
('Ana Souza', 'ana@revenda.com', '11777777002', 5.0),
('Renato Alves', 'renato@revenda.com', '11777777003', 6.0),
('Mariana Pinto', 'mariana@revenda.com', '11777777004', 8.0),
('Felipe Dias', 'felipe@revenda.com', '11777777005', 4.5),
('Juliana Costa', 'juliana@revenda.com', '11777777006', 5.5),
('Ricardo Tavares', 'ricardo@revenda.com', '11777777007', 7.0),
('Camila Fernandes', 'camila@revenda.com', '11777777008', 6.5),
('Lucas Matos', 'lucas@revenda.com', '11777777009', 5.0),
('Beatriz Rocha', 'beatriz@revenda.com', '11777777010', 4.0);

-- Vendas
INSERT INTO vendas (id_cliente, id_vendedor, data_venda, valor_total) VALUES
(1, 1, '2025-08-01', 300000.00),
(2, 2, '2025-08-02', 350000.00),
(3, 3, '2025-08-03', 420000.00),
(4, 4, '2025-08-04', 550000.00),
(5, 5, '2025-08-05', 320000.00),
(6, 6, '2025-08-06', 400000.00),
(7, 7, '2025-08-07', 650000.00),
(8, 8, '2025-08-08', 700000.00),
(9, 9, '2025-08-09', 2000000.00),
(10, 10, '2025-08-10', 450000.00);

-- Aviao_Venda
INSERT INTO aviao_venda (id_aviao, id_venda, quantidade) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

-- Avaliações
INSERT INTO avaliacoes (id_aviao, id_cliente, nota, comentario) VALUES
(1, 1, 5, 'Ótimo avião, excelente condição.'),
(2, 2, 4, 'Muito bom, porém com pequenos detalhes.'),
(3, 3, 5, 'Excelente desempenho e conforto.'),
(4, 4, 3, 'Bom, mas poderia melhorar o consumo.'),
(5, 5, 4, 'Ótimo para viagens curtas.'),
(6, 6, 5, 'Muito estável e fácil de pilotar.'),
(7, 7, 4, 'Boa capacidade e potência.'),
(8, 8, 3, 'Preço um pouco alto, mas vale a pena.'),
(9, 9, 5, 'Tecnologia avançada e muito seguro.'),
(10, 10, 4, 'Excelente para acrobacias.');

SELECT * FROM view_vendas_detalhadas;

SELECT * FROM view_avaliacoes_avioes;



