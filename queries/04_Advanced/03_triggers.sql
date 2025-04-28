-- Exemplos de Triggers

-- Trigger para atualizar data de modificação
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.ultima_modificacao = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_produtos_modtime
    BEFORE UPDATE ON produtos
    FOR EACH ROW
    EXECUTE FUNCTION update_modified_column();

-- Trigger para validar estoque
CREATE OR REPLACE FUNCTION validar_estoque()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantidade > (SELECT estoque FROM produtos WHERE produto_id = NEW.produto_id) THEN
        RAISE EXCEPTION 'Quantidade maior que estoque disponível';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_estoque
    BEFORE INSERT ON vendas
    FOR EACH ROW
    EXECUTE FUNCTION validar_estoque(); 