# Curso Completo de SQL para Engenharia de Dados (2025)

Este repositório contém todo o material necessário para o Curso Completo de SQL para Engenharia de Dados, desde conceitos básicos até tópicos avançados.

## Estrutura do Curso

### 1. Introdução ao SQL e Ambiente de Desenvolvimento
- Configuração do ambiente com Docker
- Introdução ao PostgreSQL
- Ferramentas de administração (pgAdmin)
- Conceitos básicos de banco de dados

### 2. Fundamentos de SQL (DDL - Data Definition Language)
- Criação de banco de dados
- Criação de tabelas
- Tipos de dados
- Constraints e chaves
- Alteração de estruturas
- Exclusão de objetos

### 3. Manipulação de Dados (DML - Data Manipulation Language)
- INSERT: Inserção de dados
- UPDATE: Atualização de dados
- DELETE: Remoção de dados
- TRUNCATE
- Transações e controle de concorrência

### 4. Consultas Básicas (DQL - Data Query Language)
- SELECT básico
- Filtros com WHERE
- Ordenação com ORDER BY
- Limitação de resultados
- Operadores lógicos e de comparação
- Funções básicas

### 5. JOINs e Relacionamentos
- INNER JOIN
- LEFT/RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- Self JOIN
- Subqueries

### 6. Funções de Agregação e Agrupamento
- COUNT, SUM, AVG, MAX, MIN
- GROUP BY
- HAVING
- Funções de data e hora
- Funções de string
- Funções matemáticas

### 7. Técnicas Avançadas
- Window Functions
- CTEs (Common Table Expressions)
- Views e Views Materializadas
- Índices e otimização
- Particionamento de tabelas

### 8. Programação SQL
- Stored Procedures
- Functions
- Triggers
- Eventos
- Exception Handling

### 9. Controle de Acesso (DCL - Data Control Language)
- Usuários e roles
- Privilégios
- GRANT e REVOKE
- Políticas de segurança

### 10. Tópicos Avançados para Engenharia de Dados
- Performance e otimização
- Análise de plano de execução
- Backup e recuperação
- Replicação
- Integração com ferramentas de ETL

## Como Usar Este Repositório

1. Clone o repositório:
```bash
git clone https://github.com/aureliowozhiak/Curso-Completo-de-SQL
```
3. Execute o Docker Compose:
```bash
docker-compose up -d
```

3. Execute os scripts Python para gerar e inserir dados:
```bash
python scripts/generate_data.py
python scripts/insert_data.py
```

4. Acesse o pgAdmin:
- URL: http://localhost:5050
- Email: admin@admin.com
- Senha: admin

5. Siga as queries na ordem das pastas em `/queries`

## Requisitos
- Docker e Docker Compose
- Python 3.8+
- Bibliotecas Python: pandas, psycopg2-binary

## Contribuições
Contribuições são bem-vindas! Por favor, sinta-se à vontade para submeter pull requests.

## Licença
MIT 
