-- TODO Definir chaves primárias

-- Pessoa --
CREATE OR REPLACE TYPE tp_telefonek AS OBJECT (
    telefone VARCHAR(9)
);

/

CREATE OR REPLACE TYPE tp_arr_telefones AS VARRAY(5) OF tp_telefonek;
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
    telefones tp_arr_telefones,
    endereco tp_endereco,

    MEMBER PROCEDURE print_info,
    MAP MEMBER FUNCTION comparaSalario RETURN NUMBER  /*Será implementado no subtipo funcionario*/

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

-- Funcionário, Cliente e Médico --

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
    salario NUMBER(4,2),
    data_admissao DATE,

    OVERRIDING MEMBER PROCEDURE print_info,
    CONSTRUCTOR FUNCTION tp_funcionario (x1 tp_funcionario) RETURN SELF AS RESULT,
    MEMBER FUNCTION salarioAnual RETURN NUMBER,
    OVERRIDING MAP MEMBER FUNCTION comparaSalario RETURN NUMBER    
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
    
    CONSTRUCTOR FUNCTION tp_funcionario (new_func tp_funcionario) RETURN SELF AS RESULT BEGIN
        cpf := new_func.cpf;
        nome := new_func.nome;
        data_nascimento := new_func.data_nascimento;
        genero := new_func.genero;
        telefones := new_func.telefones;
        endereco := new_func.endereco;
        cargo := new_func.cargo;
        salario := new_func.salario;
        data_admissao := new_func.data_admissao;
        RETURN;
    END;

    MEMBER FUNCTION salarioAnual RETURN NUMBER IS
    BEGIN
        RETURN salario*12;
    END;

    OVERRIDING MAP MEMBER FUNCTION comparaSalario IS
    BEGIN
        RETURN salario;
    End;
END;

/

CREATE OR REPLACE TYPE tp_medico UNDER tp_funcionario (
    crm VARCHAR2(255),

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

-- Supervisiona --

CREATE OR REPLACE TYPE tp_supervisiona AS OBJECT (
    supervisor REF tp_funcionario,
    supervisionado REF tp_funcionario,
    avaliacao VARCHAR2(255)
);

/

-- Mendicamento --

CREATE OR REPLACE TYPE tp_medicamento AS OBJECT (
    nome VARCHAR2(255)
);

/

-- Produto --
CREATE OR REPLACE TYPE tp_produto AS OBJECT (
    nome_comercial VARCHAR2(30),
    preco_de_compra NUMBER(4, 2),
    preco_de_revenda NUMBER(4, 2),
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
    tipo_produto VARCHAR2(30)
);

/

CREATE OR REPLACE TYPE tp_varr_tipos_produto AS VARRAY (4) OF tp_tipo_produto;

/

--  Fornecedor --

CREATE OR REPLACE TYPE tp_fornecedor AS OBJECT (
    cnpj CHAR(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,
    tipos_produto tp_varr_tipos_produto,
    produtos tp_nt_produto
    
);

/

-- Compra -- 

CREATE OR REPLACE TYPE tp_compra AS OBJECT (
    datahora_compra TIMESTAMP,
    cliente_compra REF tp_cliente,
    produto_compra tp_nt_produto
);

/

-- Serviço e preço de serviço --

CREATE OR REPLACE TYPE tp_servico AS OBJECT (
    id INTEGER NOT NULL,
    tipo_servico VARCHAR2 (255),
    preco_servico NUMBER(4, 2),

    ORDER MEMBER FUNCTION compararpservico (SELF IN OUT NOCOPY tp_servico, p tp_servico) RETURN NUMBER
);

/

/*Compara o preço do serviço e retorna 1 caso um serviço sejá mais barato que outro,
 0 caso um serviço sejá mais caro e -1 caso seja o mesmo preço*/
CREATE OR REPLACE TYPE BODY tp_servico AS
ORDER MEMBER FUNCTION compararpservico (SELF IN OUT NOCOPY tp_servico, p tp_servico) RETURN NUMBER IS
    BEGIN 
        IF SELF.preco_servico < p.tp_servico THEN
            RETURN 1;
        ELSIF SELF.preco_servico > p.tp_servico THEN
            RETURN 0;
        ELSE
            RETURN -1;
        END IF;
    END;
END;

/ 
-- Atende --

CREATE OR REPLACE TYPE tp_atende AS OBJECT (
    cliente_atendimento REF tp_cliente,
    funcionario_atendimento REF tp_funcionario,
    servico_atendimento REF tp_servico,
    datahora_atendimento TIMESTAMP
);

/

-- Consulta --

CREATE OR REPLACE TYPE tp_nt_medicamentos AS TABLE OF tp_medicamento;

/

CREATE OR REPLACE TYPE tp_consulta AS OBJECT (
    medico_consulta REF tp_medico,
    cliente_consulta REF tp_cliente,
    medicamentos_prescritos tp_nt_medicamentos
);

/

ALTER TYPE tp_consulta ADD ATRIBUTE (datahora_consulta TIMESTAMP) CASCADE;

/
 
/** Checklist de tipos

Todo mundo:
    Pessoa ✅ (create type)
    Endereco ✅
    Telefone ✅ (nested table)

    Cliente ✅ (herança(under/not final)) 
    Funcionario ✅
    Medico ✅

    Preco_servicos ✅
    Servico ✅
    Medicamento ✅

Fiquei em dúvida como fazer o 
relacionamento forte fraco Fornecedor Produto
    Fornecedor  ✅
    TipoProduto ✅
    Produto ✅

    Compra

    Verificar esse supervisiona
    Supervisiona ✅

    Atende ✅
    Consulta ✅

**/

/** Checklist de comandos

1. CREATE OR REPLACE TYPE ✅
2. CREATE OR REPLACE TYPE BODY (bruna) ✅
3. MEMBER PROCEDURE (gustavo) ✅
4. MEMBER FUNCTION (walmir) ✅
5. ORDER MEMBER FUNCTION (rodrigo)✅
6. MAP MEMBER FUNCTION (carlos)
7. CONSTRUCTOR FUNCTION (filipe) ✅
6. MAP MEMBER FUNCTION (carlos) ✅
9. FINAL MEMBER ✅
10. NOT INSTANTIABLE TYPE/MEMBER ✅
11. HERANÇA DE TIPOS (UNDER/NOT FINAL) ✅
12. ALTER TYPE (altera a definição do tipo) ✅
13. CREATE TABLE OF (povoamento) ✅
14. WITH ROWID REFERENCES
15. REF ✅
16. SCOPE IS
17. INSERT INTO (povoamento) ✅
18. VALUE (em algum método) 
19. VARRAY ✅
20. NESTED TABLE ✅

**/