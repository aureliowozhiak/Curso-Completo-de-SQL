-- Criação das tabelas principais do sistema

-- Tabela de Usuários
CREATE TABLE usuarios (
    user_id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    estado CHAR(2) NOT NULL,
    data_cadastro DATE NOT NULL
);

-- Tabela de Produtos
CREATE TABLE produtos (
    produto_id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INTEGER NOT NULL
);

-- Tabela de Vendas
CREATE TABLE vendas (
    venda_id INTEGER PRIMARY KEY,
    user_id INTEGER REFERENCES usuarios(user_id),
    produto_id INTEGER REFERENCES produtos(produto_id),
    quantidade INTEGER NOT NULL,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL
);

-- Comentários nas tabelas
COMMENT ON TABLE usuarios IS 'Tabela que armazena informações dos usuários';
COMMENT ON TABLE produtos IS 'Tabela que armazena informações dos produtos';
COMMENT ON TABLE vendas IS 'Tabela que armazena as transações de vendas'; 