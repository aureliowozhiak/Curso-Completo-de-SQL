-- Exemplos de Stored Procedures

-- Procedure para atualizar estoque
CREATE OR REPLACE PROCEDURE atualizar_estoque(
    p_produto_id INT,
    p_quantidade INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE produtos
    SET estoque = estoque - p_quantidade
    WHERE produto_id = p_produto_id;
    
    COMMIT;
END;
$$;

-- Procedure para registrar venda
CREATE OR REPLACE PROCEDURE registrar_venda(
    p_user_id INT,
    p_produto_id INT,
    p_quantidade INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_preco DECIMAL(10,2);
    v_venda_id INT;
BEGIN
    -- Obter preço do produto
    SELECT preco INTO v_preco
    FROM produtos
    WHERE produto_id = p_produto_id;
    
    -- Gerar novo ID de venda
    SELECT COALESCE(MAX(venda_id), 0) + 1 INTO v_venda_id
    FROM vendas;
    
    -- Inserir venda
    INSERT INTO vendas (venda_id, user_id, produto_id, quantidade, data_venda, valor_total)
    VALUES (v_venda_id, p_user_id, p_produto_id, p_quantidade, CURRENT_DATE, v_preco * p_quantidade);
    
    -- Atualizar estoque
    CALL atualizar_estoque(p_produto_id, p_quantidade);
    
    COMMIT;
END;
$$; 