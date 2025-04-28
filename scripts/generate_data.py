import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

# Configurações para reprodutibilidade
np.random.seed(42)
random.seed(42)

def generate_users(n_users=1000):
    """Gera dados de usuários"""
    estados = ['SP', 'RJ', 'MG', 'RS', 'PR', 'BA', 'SC', 'PE', 'CE', 'GO']
    
    data = {
        'user_id': range(1, n_users + 1),
        'nome': [f'Usuario_{i}' for i in range(1, n_users + 1)],
        'email': [f'usuario_{i}@email.com' for i in range(1, n_users + 1)],
        'estado': [random.choice(estados) for _ in range(n_users)],
        'data_cadastro': [
            (datetime.now() - timedelta(days=random.randint(0, 365))).strftime('%Y-%m-%d')
            for _ in range(n_users)
        ]
    }
    
    df = pd.DataFrame(data)
    df.to_csv('data/usuarios.csv', index=False)
    return df

def generate_products(n_products=100):
    """Gera dados de produtos"""
    categorias = ['Eletrônicos', 'Roupas', 'Alimentos', 'Livros', 'Casa', 'Jardim']
    
    data = {
        'produto_id': range(1, n_products + 1),
        'nome': [f'Produto_{i}' for i in range(1, n_products + 1)],
        'categoria': [random.choice(categorias) for _ in range(n_products)],
        'preco': np.random.uniform(10, 1000, n_products).round(2),
        'estoque': np.random.randint(0, 100, n_products)
    }
    
    df = pd.DataFrame(data)
    df.to_csv('data/produtos.csv', index=False)
    return df

def generate_sales(users_df, products_df, n_sales=5000):
    """Gera dados de vendas"""
    data = {
        'venda_id': range(1, n_sales + 1),
        'user_id': np.random.choice(users_df['user_id'], n_sales),
        'produto_id': np.random.choice(products_df['produto_id'], n_sales),
        'quantidade': np.random.randint(1, 5, n_sales),
        'data_venda': [
            (datetime.now() - timedelta(days=random.randint(0, 180))).strftime('%Y-%m-%d')
            for _ in range(n_sales)
        ]
    }
    
    df = pd.DataFrame(data)
    # Adiciona o preço unitário da venda
    df = df.merge(products_df[['produto_id', 'preco']], on='produto_id')
    df['valor_total'] = df['quantidade'] * df['preco']
    df = df.drop('preco', axis=1)
    
    df.to_csv('data/vendas.csv', index=False)
    return df

if __name__ == "__main__":
    # Criar diretório de dados se não existir
    import os
    os.makedirs('data', exist_ok=True)
    
    # Gerar dados
    users_df = generate_users()
    products_df = generate_products()
    sales_df = generate_sales(users_df, products_df)
    
    print("Arquivos CSV gerados com sucesso!") 