-- Exemplos de deleção de dados

-- Deleção simples
DELETE FROM vendas
WHERE data_venda < '2023-01-01';

-- Deleção com subquery
DELETE FROM produtos
WHERE produto_id NOT IN (
    SELECT DISTINCT produto_id
    FROM vendas
);

-- Deleção com JOIN
DELETE FROM vendas v
USING produtos p
WHERE v.produto_id = p.produto_id
AND p.estoque = 0; 