-- TODO Definir chaves primárias


CREATE TABLE tb_cliente OF tp_cliente (
    cpf PRIMARY KEY,
    nome NOT NULL,
    data_nascimento NOT NULL, 
    genero NOT NULL  CHECK (genero = 'M' OR genero = 'F'),
    /*telefone, endereco e plano de saude são opcionais. Por isso não botei especifiquei na tabela. */
);

CREATE TABLE tb_funcionario OF tp_funcionario(
    cpf PRIMARY KEY,
    nome NOT NULL,
    data_nascimento NOT NULL, 
    genero NOT NULL CHECK (genero = 'M' OR genero = 'F'),
    cargo NOT NULL,
    salario NOT NULL CHECK (salario >= 1212.00),
    data_admissao NOT NULL
);


CREATE TABLE tb_medico OF tp_medico (
    cpf PRIMARY KEY,
    nome NOT NULL,
    data_nascimento NOT NULL, 
    genero NOT NULL CHECK (genero = 'M' OR genero = 'F'),
    cargo NOT NULL,
    salario NOT NULL,
    data_admissao NOT NULL,
    crm NOT NULL
);

CREATE TABLE tb_supervisiona OF tp_supervisiona (
    supervisor  WITH ROWID REFERENCES tp_funcionario NOT NULL, 
    supervisionado WITH ROWID REFERENCES tp_funcionario NOT NULL,
    avaliacao NOT NULL
);


CREATE TABLE tb_fornecedor OF tp_fornecedor (  /*usa produto como nt */
    cnpj PRIMARY KEY,
    nome NOT NULL,
    tipos_produto NOT NULL
)NESTED TABLE produtos STORE AS nt_produtos; 


CREATE TABLE tb_compra OF tp_compra (
    datahora_compra NOT NULL,
    cliente_compra WITH ROWID REFERENCES tb_cliente NOT NULL
)NESTED TABLE produto_compra STORE AS nt_produtos;



CREATE TABLE tb_servico OF tp_servico (
    id PRIMARY KEY,
    tipo_servico NOT NULL,
    preco_servico NOT NULL
);

CREATE TABLE tb_atende OF tp_atende (
    cliente_atendimento SCOPE IS tb_cliente NOT NULL,
    funcionario_atendimento SCOPE IS tb_funcionario NOT NULL,
    servico_atendimento SCOPE IS tb_servico NOT NULL,
    datahora_atendimento NOT NULL
);

CREATE TABLE tb_consulta OF tp_consulta(
    medico_consulta WITH ROWID REFERENCES tb_medico NOT NULL,
    cliente_consulta WITH ROWID REFERENCES tb_cliente NOT NULL,
    datahora_consulta NOT NULL                                     
)NESTED TABLE medicamentos_prescritos STORE AS tp_medicamento;



CREATE TABLE tb_medicamento OF tp_medicamento(
    nome_medicamento NOT NULL
);