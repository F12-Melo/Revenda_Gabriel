
--1°cmd auxiliar

SELECT * FROM clientes WHERE nome LIKE '%Maria%';

--2°cmd auxiliar
EXPLAIN SELECT * FROM clientes WHERE nome LIKE '%Maria%';

--3°cmd auxiliar
CREATE INDEX idx_nome_clientes ON clientes(nome);

--4°cmd auxiliar
EXPLAIN SELECT * FROM clientes WHERE nome LIKE '%Maria%';