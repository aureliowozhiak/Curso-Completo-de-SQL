-- Exemplos de atualização de dados

-- Atualização simples
UPDATE produtos
SET preco = preco * 1.1
WHERE categoria = 'Eletrônicos';

-- Atualização com JOIN
UPDATE vendas v
SET valor_total = p.preco * v.quantidade
FROM produtos p
WHERE v.produto_id = p.produto_id;

-- Atualização com subquery
UPDATE usuarios
SET estado = 'RJ'
WHERE user_id IN (
    SELECT user_id
    FROM vendas
    GROUP BY user_id
    HAVING COUNT(*) > 10
); 