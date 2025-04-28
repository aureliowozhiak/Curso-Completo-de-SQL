-- Exemplos de agregações

-- Contagem e soma
SELECT 
    categoria,
    COUNT(*) as total_produtos,
    SUM(estoque) as estoque_total,
    AVG(preco) as preco_medio
FROM produtos
GROUP BY categoria;

-- Funções de janela (Window Functions)
SELECT 
    nome,
    categoria,
    preco,
    AVG(preco) OVER (PARTITION BY categoria) as media_categoria,
    preco - AVG(preco) OVER (PARTITION BY categoria) as diff_media
FROM produtos;

-- Ranking
SELECT 
    u.nome,
    COUNT(*) as total_compras,
    RANK() OVER (ORDER BY COUNT(*) DESC) as ranking
FROM usuarios u
JOIN vendas v ON u.user_id = v.user_id
GROUP BY u.nome; 