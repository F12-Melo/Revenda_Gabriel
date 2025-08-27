-- 1° cmd
SELECT * FROM clientes WHERE nome LIKE '%Maria%';

-- 2° cmd
EXPLAIN SELECT * FROM clientes WHERE nome LIKE '%Maria%';

--3° cmd
CREATE INDEX idx_nome_clientes ON clientes(nome);

--4° cmd
EXPLAIN SELECT * FROM clientes WHERE nome LIKE '%Maria%';

--5° cmd
ALTER TABLE clientes ALTER COLUMN telefone TYPE INT;

--6° cmd
ALTER TABLE clientes ALTER COLUMN id_cliente TYPE VARCHAR;

--7°cmd
CREATE USER toledo WITH PASSWORD 'senai';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO toledo;

--8°cmd
CREATE USER auxiliar WITH PASSWORD 'auxiliar1';
GRANT SELECT ON clientes TO auxiliar;

--ala dos joins
-- INNER JOIN
SELECT * FROM vendas v INNER JOIN clientes c ON v.id_cliente = c.id_cliente;

-- LEFT JOIN
SELECT * FROM vendas v LEFT JOIN clientes c ON v.id_cliente = c.id_cliente;

-- RIGHT JOIN
SELECT * FROM vendas v RIGHT JOIN clientes c ON v.id_cliente = c.id_cliente;

-- INNER JOIN com aviao
SELECT * FROM aviao_venda av INNER JOIN aviao a ON av.id_aviao = a.id_aviao;

-- LEFT JOIN com aviao
SELECT * FROM aviao_venda av LEFT JOIN aviao a ON av.id_aviao = a.id_aviao;

-- RIGHT JOIN com aviao
SELECT * FROM aviao_venda av RIGHT JOIN aviao a ON av.id_aviao = a.id_aviao;

-- INNER JOIN com vendedor
SELECT * FROM vendas v INNER JOIN vendedor vd ON v.id_vendedor = vd.id_vendedor;

-- LEFT JOIN com vendedor
SELECT * FROM vendas v LEFT JOIN vendedor vd ON v.id_vendedor = vd.id_vendedor;

-- RIGHT JOIN com vendedor
SELECT * FROM vendas v RIGHT JOIN vendedor vd ON v.id_vendedor = vd.id_vendedor;

-- INNER JOIN com avaliações
SELECT * FROM avaliacoes avl INNER JOIN aviao a ON avl.id_aviao = a.id_aviao;

-- LEFT JOIN com avaliações
SELECT * FROM avaliacoes avl LEFT JOIN aviao a ON avl.id_aviao = a.id_aviao;

-- RIGHT JOIN com avaliações
SELECT * FROM avaliacoes avl RIGHT JOIN aviao a ON avl.id_aviao = a.id_aviao;

--nuls

UPDATE avaliacoes 
SET comentario = NULL 
WHERE nota < 3;

UPDATE avaliacoes 
SET comentario = NULL 
WHERE nota < 3;
