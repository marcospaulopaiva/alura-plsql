--criando procedure para incluir item na tabela(segmercado).
CREATE PROCEDURE incluir_segmercado
    (p_id IN NUMBER ,
    p_descricao IN VARCHAR2)
IS
BEGIN
    INSERT into segmercado
            values(p_id, UPPER(p_descricao));
    COMMIT;
END;

--alterando procedure para mudar declaração de tipo dos parâmetros de entrada.  
--baseado no tipo da coluna da tabela.
CREATE OR REPLACE PROCEDURE incluir_segmercado
    (p_id IN segmercado.id%type ,
    p_descricao IN segmercado.descricao%type)
IS
BEGIN
    INSERT into segmercado
        values(p_id, UPPER(p_descricao));
    COMMIT;
END;

--adicionando itens na tabela (segmercado) utilizando a procedure.
EXECUTE incluir_segmercado(1,'varejista');
EXECUTE incluir_segmercado(2,'atacadista');
EXECUTE incluir_segmercado(3,'Farmaceutico');
EXECUTE incluir_segmercado(4,'industrial');

--criando procedure para adicionar cliente e definir sua categoria baseado no faturamento previsto.
CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE
    (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;

BEGIN
    IF p_faturamento_previsto < 10000 THEN
        v_categoria := 'PEQUENO';
    ELSIF p_faturamento_previsto < 50000 THEN
        v_categoria := 'MEDIO';
    ELSIF p_faturamento_previsto < 100000 THEN
        v_categoria := 'MEDIO GRANDE';
    ELSE
        v_categoria := 'GRANDE';
    END IF;

    INSERT INTO cliente
        VALUES (p_id, UPPER(p_razao_social),p_CNPJ,p_segmercado_id, SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;
END;

--adicionando itens na tabela (cliente) utilizando a procedure.
EXECUTE INCLUIR_CLIENTE(1, 'SUPERMERCADO XYZ', '12345', NULL, 150000);

--alterar procedure para utilizar função (categoria_cliente()) para definir sua categoria baseado no faturamento previsto
CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE 
    (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;

BEGIN
   v_categoria := categoria_cliente (p_faturamento_previsto);

    INSERT INTO cliente
        VALUES (p_id, UPPER(p_razao_social),p_CNPJ,p_segmercado_id, SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;
END;

--adicionando itens na tabela (cliente) utilizando a procedure.
EXECUTE INCLUIR_CLIENTE(2, 'SUPERMERCADO IJK', '67890', NULL, 90000);