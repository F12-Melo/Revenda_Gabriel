# Revenda_Gabriel

Este repositório contém o projeto do banco de dados desenvolvido para o trabalho do SENAI, cujo objetivo era modelar um banco de dados de revenda de produtos, seguindo as seguintes instruções:

## Requisitos do Trabalho

- **Criar um banco de dados** chamado `<db_revenda_seunome>`, onde você será o dono do negócio e irá revender algum tipo de produto.
- **Criar 6 tabelas** (sendo uma tabela de ligação com chave primária composta).
- Cada tabela deve ter **no mínimo 5 atributos**, exceto a tabela de ligação.
- Definir restrições adequadas: campos obrigatórios, únicos, valores padrão, condições, etc.
- **Criar 2 views** que combinem colunas de diferentes tabelas.
- **Fazer 10 inserts** em cada uma das 6 tabelas.
- Realizar uma consulta para cada view criada.

## Sobre o Negócio

O banco de dados foi modelado para uma loja de revenda de eletrônicos chamada **Revenda_Gabriel**.

## Estrutura do Banco de Dados

### 1. Tabela: `clientes`
- `id_cliente` (PK, INT, NOT NULL, AUTO_INCREMENT)
- `nome` (VARCHAR(100), NOT NULL)
- `cpf` (CHAR(11), NOT NULL, UNIQUE)
- `telefone` (VARCHAR(15), NOT NULL)
- `email` (VARCHAR(100), NOT NULL, UNIQUE)
- `data_cadastro` (DATE, NOT NULL, DEFAULT CURRENT_DATE)

### 2. Tabela: `produtos`
- `id_produto` (PK, INT, NOT NULL, AUTO_INCREMENT)
- `nome` (VARCHAR(100), NOT NULL)
- `descricao` (TEXT, NOT NULL)
- `preco` (DECIMAL(10,2), NOT NULL, CHECK (preco > 0))
- `estoque` (INT, NOT NULL, DEFAULT 0)
- `marca` (VARCHAR(50), NOT NULL)

### 3. Tabela: `fornecedores`
- `id_fornecedor` (PK, INT, NOT NULL, AUTO_INCREMENT)
- `nome` (VARCHAR(100), NOT NULL)
- `cnpj` (CHAR(14), NOT NULL, UNIQUE)
- `telefone` (VARCHAR(15), NOT NULL)
- `email` (VARCHAR(100), NOT NULL, UNIQUE)
- `cidade` (VARCHAR(50), NOT NULL)

### 4. Tabela: `vendas`
- `id_venda` (PK, INT, NOT NULL, AUTO_INCREMENT)
- `id_cliente` (FK, INT, NOT NULL)
- `data_venda` (DATE, NOT NULL, DEFAULT CURRENT_DATE)
- `valor_total` (DECIMAL(10,2), NOT NULL, CHECK (valor_total > 0))
- `status` (VARCHAR(20), NOT NULL, DEFAULT 'PENDENTE')
- `forma_pagamento` (VARCHAR(20), NOT NULL)

### 5. Tabela: `produto_fornecedor` (Tabela de ligação)
- `id_produto` (FK, INT, NOT NULL)
- `id_fornecedor` (FK, INT, NOT NULL)
- **PRIMARY KEY (`id_produto`, `id_fornecedor`)**

### 6. Tabela: `itens_venda`
- `id_venda` (FK, INT, NOT NULL)
- `id_produto` (FK, INT, NOT NULL)
- `quantidade` (INT, NOT NULL, CHECK (quantidade > 0))
- `preco_unitario` (DECIMAL(10,2), NOT NULL, CHECK (preco_unitario > 0))
- `desconto` (DECIMAL(10,2), NOT NULL, DEFAULT 0)
- **PRIMARY KEY (`id_venda`, `id_produto`)**

## Restrições e Condições

- **Campos obrigatórios**: Todos os campos principais possuem NOT NULL.
- **Campos únicos**: CPF, CNPJ e e-mails são únicos.
- **Valores padrão**: datas, status, estoque e desconto.
- **Checks**: preço e quantidade devem ser maiores que zero.

## Views Criadas

### 1. `vw_vendas_clientes`
View que mostra o resumo das vendas junto com informações do cliente.

```sql
CREATE VIEW vw_vendas_clientes AS
SELECT v.id_venda, c.nome AS nome_cliente, v.data_venda, v.valor_total, v.status
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente;
```

### 2. `vw_produtos_fornecedores`
View que lista os produtos, marcas e seus fornecedores.

```sql
CREATE VIEW vw_produtos_fornecedores AS
SELECT p.nome AS produto, p.marca, f.nome AS fornecedor, f.cidade
FROM produtos p
JOIN produto_fornecedor pf ON p.id_produto = pf.id_produto
JOIN fornecedores f ON pf.id_fornecedor = f.id_fornecedor;
```

## Inserts de Exemplo

Foram realizados **10 inserts** em cada tabela, simulando um cenário real de funcionamento da revenda.

## Exemplos de Consultas às Views

```sql
SELECT * FROM vw_vendas_clientes;
SELECT * FROM vw_produtos_fornecedores;
```

## Como Utilizar

1. Execute os scripts SQL de criação das tabelas no seu SGBD (MySQL, MariaDB, etc).
2. Execute os inserts para popular as tabelas.
3. Crie as views informadas acima.
4. Utilize as queries de SELECT para visualizar os dados nas views.

## Autor

Gabriel (F12-Melo) - Projeto para avaliação no SENAI.

---

Sinta-se à vontade para reutilizar, adaptar e evoluir este projeto!
