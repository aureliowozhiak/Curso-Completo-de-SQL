-- Exemplos de Views

-- View simples
CREATE VIEW vw_vendas_detalhadas AS
SELECT 
    v.venda_id,
    u.nome as cliente,
    p.nome as produto,
    v.quantidade,
    v.valor_total,
    v.data_venda
FROM vendas v
JOIN usuarios u ON v.user_id = u.user_id
JOIN produtos p ON v.produto_id = p.produto_id;

-- View materializada
CREATE MATERIALIZED VIEW vw_resumo_vendas_mensal AS
SELECT 
    DATE_TRUNC('month', data_venda) as mes,
    COUNT(*) as total_vendas,
    SUM(valor_total) as valor_total
FROM vendas
GROUP BY DATE_TRUNC('month', data_venda); 