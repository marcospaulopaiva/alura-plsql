--criando tabela referente a seguemento de mercado.
CREATE TABLE segmercado (id NUMBER(5),
    descricao VARCHAR2(100));

--definindo primary key para a coluna id na tabela segmercado
ALTER TABLE segmercado
    ADD CONSTRAINT segmercado_id_pk PRIMARY KEY(ID);


--criando a tabela cliente
CREATE TABLE cliente
    ( ID NUMBER(5),
        razao_social VARCHAR2(100),
        CNPJ VARCHAR2(20),
        segmercado_id NUMBER(5),
        data_inclusao DATE,
        faturamento_previsto NUMBER(10,2),
        categoria VARCHAR2(20));

--definindo primary key para a coluna id na tabela cliente.
ALTER TABLE cliente
    ADD CONSTRAINT cliente_id_pk PRIMARY KEY(ID);