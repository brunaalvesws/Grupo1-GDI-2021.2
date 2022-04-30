-- Pessoa --
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    telefone VARCHAR(9)
);

/

CREATE OR REPLACE TYPE tp_telefones AS VARRAY(5) OF tp_telefone;
/

CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    cidade VARCHAR2(20), 
    rua VARCHAR2(255), 
    numero NUMBER, 
    complemento VARCHAR2(255), 
    estado VARCHAR2(20), 
    cep CHAR(9)
);

/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT (
    -- Basicos
    cpf CHAR(11), 
    nome VARCHAR2(255), 
    data_nascimento DATE, 
    genero CHAR,
    -- Referencias
    telefone tp_telefones,
    endereco tp_endereco,

    MEMBER PROCEDURE print_info

) NOT FINAL NOT INSTANTIABLE;

/

CREATE OR REPLACE TYPE BODY tp_pessoa AS
    MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(cpf)
        DBMS_OUTPUT.PUT_LINE(nome)
        DBMS_OUTPUT.PUT_LINE(data_nascimento)
        DBMS_OUTPUT.PUT_LINE(genero)
    End;
END;

/

-- Cliente e Médico --

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa (
    plano_de_saude VARCHAR2(255),

    OVERRIDING MEMBER PROCEDURE print_info
);

/

CREATE OR REPLACE TYPE BODY tp_cliente AS
    OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(data_nascimento);
        DBMS_OUTPUT.PUT_LINE(genero);
        DBMS_OUTPUT.PUT_LINE(plano_de_saude);
    End;
END;

/

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa (
    cargo VARCHAR2(255),
    salario NUMBER(*,2),
    data_admissao DATE

    OVERRIDING MEMBER PROCEDURE print_info
) NOT FINAL;

/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
    OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(data_nascimento);
        DBMS_OUTPUT.PUT_LINE(genero);
        DBMS_OUTPUT.PUT_LINE(cargo);
        DBMS_OUTPUT.PUT_LINE(salario);
        DBMS_OUTPUT.PUT_LINE(data_admissao);
    End;
END;

/

CREATE OR REPLACE TYPE tp_supervisiona AS OBJECT (
    contratante REF tp_funcionario,
    contratado REF tp_funcionario,
    avaliacao VARCHAR2(255)
);

/

CREATE OR REPLACE TYPE tp_medico UNDER tp_funcionario (
    crm VARCHAR2(255)

    OVERRIDING MEMBER PROCEDURE print_info
);

/

CREATE OR REPLACE TYPE BODY tp_medico AS
    OVERRIDING MEMBER PROCEDURE print_info IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(cpf);
        DBMS_OUTPUT.PUT_LINE(nome);
        DBMS_OUTPUT.PUT_LINE(data_nascimento);
        DBMS_OUTPUT.PUT_LINE(genero);
        DBMS_OUTPUT.PUT_LINE(cargo);
        DBMS_OUTPUT.PUT_LINE(salario);
        DBMS_OUTPUT.PUT_LINE(data_admissao);
        DBMS_OUTPUT.PUT_LINE(crm);
    End;
END;

/


-- Mendicamento --

CREATE OR REPLACE TYPE tp_medicamento AS OBJECT (
    nome VARCHAR2(255)
);

-- Produto --
-- REVER ESSA PARTE COM OS MONITORES --
CREATE OR REPLACE TYPE tp_produto AS OBJECT (
    nome_comercial VARCHAR2(30),
    preco_de_compra NUMBER(*, 2),
    preco_de_revenda NUMBER(*, 2),
    estoque INTEGER,
    data_de_fabricacao DATE,
    data_de_vencimento DATE,
    lote INTEGER
);

/

CREATE OR REPLACE TYPE tp_nt_produto AS TABLE OF tp_produto;

/

-- Tipo Produto --

CREATE OR REPLACE TYPE tp_tipo_produto AS OBJECT (
    tipo_produto VARCHAR2(30);
);

CREATE OR REPLACE TYPE tp_varr_tipos_produto AS VARRAY (4) OF tp_tipo_produto;

--  Fornecedor --

CREATE OR REPLACE TYPE tp_fornecedor AS OBJECT (
    cnpj CHAR(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    tipos_produto tp_varr_tipos_produto,
    produtos tp_nt_produto,
    
) NESTED TABLE produtos STORE AS tp_produto;

/

-- Compra --

 
/** Checklist de tipos

Todo mundo:
    Pessoa ✅ (create type)
    Endereco ✅
    Telefone ✅ (nested table)

    Cliente ✅ (herança(under/not final)) 
    Funcionario ✅
    Medico ✅

    Preco_servicos
    Servico
    Medicamento ✅

Fiquei em dúvida como fazer o 
relacionamento forte fraco Fornecedor Produto
    Fornecedor 
    TipoProduto ✅
    Produto

Compra

Verificar esse supervisiona
Supervisiona ✅

Atende
Consulta

**/

/** Checklist de comandos

1. CREATE OR REPLACE TYPE ✅
2. CREATE OR REPLACE TYPE BODY (bruna) ✅
3. MEMBER PROCEDURE (gustavo) ✅
4. MEMBER FUNCTION (walmir)
5. ORDER MEMBER FUNCTION (rodrigo)
6. MAP MEMBER FUNCTION (carlos)
7. CONSTRUCTOR FUNCTION (filipe)
8. OVERRIDING MEMBER ✅
9. FINAL MEMBER ✅
10. NOT INSTANTIABLE TYPE/MEMBER ✅
11. HERANÇA DE TIPOS (UNDER/NOT FINAL) ✅
12. ALTER TYPE (altera a definição do tipo)
13. CREATE TABLE OF (povoamento)
14. WITH ROWID REFERENCES
15. REF ✅
16. SCOPE IS
17. INSERT INTO (povoamento)
18. VALUE
19. VARRAY ✅
20. NESTED TABLE ✅

**/