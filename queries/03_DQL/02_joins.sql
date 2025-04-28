-- Exemplos de JOINS

-- INNER JOIN
SELECT 
    v.venda_id,
    u.nome as usuario,
    p.nome as produto,
    v.quantidade,
    v.valor_total
FROM vendas v
INNER JOIN usuarios u ON v.user_id = u.user_id
INNER JOIN produtos p ON v.produto_id = p.produto_id;

-- LEFT JOIN
SELECT 
    p.nome as produto,
    COUNT(v.venda_id) as total_vendas
FROM produtos p
LEFT JOIN vendas v ON p.produto_id = v.produto_id
GROUP BY p.nome;

-- FULL OUTER JOIN
SELECT 
    u.nome,
    COALESCE(COUNT(v.venda_id), 0) as total_compras
FROM usuarios u
FULL OUTER JOIN vendas v ON u.user_id = v.user_id
GROUP BY u.nome; 