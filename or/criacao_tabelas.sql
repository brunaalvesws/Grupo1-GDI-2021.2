CREATE TABLE tb_cliente OF tp_cliente (
    cpf PRIMARY KEY,
    nome NOT NULL,
    data_nascimento NOT NULL, 
    genero NOT NULL  CHECK (genero = 'M' OR genero = 'F')
    /*telefone, endereco e plano de saude são opcionais. Por isso não botei especifiquei na tabela. */
);

CREATE TABLE tb_funcionario OF tp_funcionario(
    cpf PRIMARY KEY,
    nome NOT NULL,
    data_nascimento NOT NULL, 
    genero NOT NULL CHECK (genero = 'M' OR genero = 'F'),
    cargo NOT NULL,
    salario NOT NULL CHECK (salario >= 1212.00),
    data_admissao NOT NULL,
    supervisor SCOPE IS tb_funcionario
);


CREATE TABLE tb_medico OF tp_medico (
    cpf PRIMARY KEY,
    nome NOT NULL,
    data_nascimento NOT NULL, 
    genero NOT NULL CHECK (genero = 'M' OR genero = 'F'),
    cargo NOT NULL,
    salario NOT NULL,
    data_admissao NOT NULL,
    supervisor SCOPE IS tb_medico,
    crm NOT NULL UNIQUE
);

CREATE TABLE tb_fornecedor OF tp_fornecedor (  /*usa produto como nt */
    cnpj PRIMARY KEY,
    nome NOT NULL
    tipos_produtos NOT NULL,
) NESTED TABLE produtos STORE AS nt_tp_fornece;


CREATE TABLE tb_compra OF tp_compra (
    datahora_compra PRIMARY KEY,
    cliente_compra WITH ROWID REFERENCES tb_cliente NOT NULL
    -- produto_compra WITH ROWID REFERENCES tb_produto NOT NULL
    -- produto_compra NOT NULL
) NESTED TABLE produto_compra STORE AS nt_tp_fornece;

CREATE TABLE tb_preco_servico OF tp_preco_servico (
    tipo_servico PRIMARY KEY,
    preco_servico NOT NULL
);

CREATE TABLE tb_servico OF tp_servico (
    id PRIMARY KEY,
    preco WITH ROWID REFERENCES tb_preco_servico
);

CREATE TABLE tb_atende OF tp_atende (
    cliente_atendimento WITH ROWID REFERENCES tb_cliente NOT NULL,
    funcionario_atendimento WITH ROWID REFERENCES tb_funcionario NOT NULL,
    servico_atendimento WITH ROWID REFERENCES tb_servico NOT NULL,
    datahora_atendimento PRIMARY KEY
);

CREATE TABLE tb_consulta OF tp_consulta (
    medico_consulta WITH ROWID REFERENCES tb_medico NOT NULL,
    cliente_consulta WITH ROWID REFERENCES tb_cliente NOT NULL,
    datahora_consulta PRIMARY KEY                                    
) NESTED TABLE medicamentos_prescritos STORE AS nt_tp_prescreve;
