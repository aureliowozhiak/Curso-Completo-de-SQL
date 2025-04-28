-- Consultas básicas

-- Seleção simples
SELECT * FROM usuarios;

-- Seleção com WHERE
SELECT nome, email
FROM usuarios
WHERE estado = 'SP';

-- Seleção com ORDER BY
SELECT nome, preco
FROM produtos
ORDER BY preco DESC;

-- Seleção com LIMIT
SELECT *
FROM vendas
ORDER BY data_venda DESC
LIMIT 10; 