import pandas as pd
import psycopg2
from psycopg2.extras import execute_values

def connect_to_db():
    """Estabelece conexão com o banco de dados"""
    return psycopg2.connect(
        dbname="curso_sql",
        user="curso_user",
        password="curso_password",
        host="localhost",
        port="5432"
    )

def create_tables(conn):
    """Cria as tabelas no banco de dados"""
    with conn.cursor() as cur:
        # Tabela de Usuários
        cur.execute("""
            CREATE TABLE IF NOT EXISTS usuarios (
                user_id INTEGER PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                email VARCHAR(100) UNIQUE NOT NULL,
                estado CHAR(2) NOT NULL,
                data_cadastro DATE NOT NULL
            );
        """)
        
        # Tabela de Produtos
        cur.execute("""
            CREATE TABLE IF NOT EXISTS produtos (
                produto_id INTEGER PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                categoria VARCHAR(50) NOT NULL,
                preco DECIMAL(10,2) NOT NULL,
                estoque INTEGER NOT NULL
            );
        """)
        
        # Tabela de Vendas
        cur.execute("""
            CREATE TABLE IF NOT EXISTS vendas (
                venda_id INTEGER PRIMARY KEY,
                user_id INTEGER REFERENCES usuarios(user_id),
                produto_id INTEGER REFERENCES produtos(produto_id),
                quantidade INTEGER NOT NULL,
                data_venda DATE NOT NULL,
                valor_total DECIMAL(10,2) NOT NULL
            );
        """)
        
        conn.commit()

def insert_data(conn):
    """Insere os dados dos arquivos CSV nas tabelas"""
    # Carregar dados dos CSVs
    usuarios_df = pd.read_csv('data/usuarios.csv')
    produtos_df = pd.read_csv('data/produtos.csv')
    vendas_df = pd.read_csv('data/vendas.csv')
    
    with conn.cursor() as cur:
        # Inserir usuários
        execute_values(cur,
            "INSERT INTO usuarios (user_id, nome, email, estado, data_cadastro) VALUES %s",
            [tuple(x) for x in usuarios_df.values]
        )
        
        # Inserir produtos
        execute_values(cur,
            "INSERT INTO produtos (produto_id, nome, categoria, preco, estoque) VALUES %s",
            [tuple(x) for x in produtos_df.values]
        )
        
        # Inserir vendas
        execute_values(cur,
            """INSERT INTO vendas 
               (venda_id, user_id, produto_id, quantidade, data_venda, valor_total) 
               VALUES %s""",
            [tuple(x) for x in vendas_df.values]
        )
        
        conn.commit()

if __name__ == "__main__":
    conn = connect_to_db()
    create_tables(conn)
    insert_data(conn)
    conn.close()
    print("Dados inseridos com sucesso!") 