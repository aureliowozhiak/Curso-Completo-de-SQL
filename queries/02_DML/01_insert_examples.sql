-- Exemplos de inserção de dados

-- Inserção simples
INSERT INTO usuarios (user_id, nome, email, estado, data_cadastro)
VALUES (1, 'João Silva', 'joao@email.com', 'SP', '2024-01-01');

-- Inserção múltipla
INSERT INTO produtos (produto_id, nome, categoria, preco, estoque)
VALUES 
    (1, 'Notebook', 'Eletrônicos', 3500.00, 10),
    (2, 'Smartphone', 'Eletrônicos', 2000.00, 15),
    (3, 'Mouse', 'Eletrônicos', 50.00, 30);

-- Inserção com SELECT
INSERT INTO vendas (venda_id, user_id, produto_id, quantidade, data_venda, valor_total)
SELECT 
    1,
    user_id,
    1,
    2,
    CURRENT_DATE,
    7000.00
FROM usuarios
WHERE email = 'joao@email.com'; 