-- Definindo as tabelas 

/*Pessoa: tabela que contém as informações sobre uma pessoa, que pode assumir outros papéis como 
cliente, médico ou funcionário
*/
CREATE TABLE Pessoa(
    cpf CHAR(11) NOT NULL, 
    nome VARCHAR2(255), 
    data_nascimento DATE, 
    genero CHAR,

    CONSTRAINT pessoa_pkey PRIMARY KEY (cpf),
    CONSTRAINT pessoa_checkGenero CHECK (genero = 'M' OR genero = 'F')
);

/*Endereço: tabela que contém os campos do atributo composto endereço, vinculado à pessoa
*/

CREATE TABLE Endereco(
    cpf_p CHAR(11) NOT NULL,
    cidade VARCHAR2(20), 
    rua VARCHAR2(255), 
    numero NUMBER, 
    complemento VARCHAR2(255), 
    estado VARCHAR2(20), 
    cep CHAR(9),

    CONSTRAINT endereco_pkey PRIMARY KEY (cpf_p),
    CONSTRAINT endereco_fkey FOREIGN KEY (cpf_p) REFERENCES Pessoa (cpf)
); 

/*Telefone: tabela que contém os campos do atributo multivalorado telefone, vinculado à pessoa
*/

CREATE TABLE Telefone(
    cpf_p CHAR(11) NOT NULL,
    telefone VARCHAR2(9) NOT NULL,

    CONSTRAINT telefone_pkey PRIMARY KEY (cpf_p,telefone),    
    CONSTRAINT telefone_fkey FOREIGN KEY (cpf_p) REFERENCES Pessoa (cpf)
);

/*Cliente: tabela que herda de pessoa e define a entidade cliente
*/

CREATE TABLE Cliente(
    cpf_p CHAR(11) NOT NULL,
    plano_de_saude VARCHAR2(255),

    CONSTRAINT cliente_pkey PRIMARY KEY (cpf_p),
    CONSTRAINT cliente_fkey FOREIGN KEY (cpf_p) REFERENCES Pessoa (cpf)
);

/*Funcionário: tabela que herda de pessoa e define a entidade Funcionario
*/

CREATE TABLE Funcionario (
    cpf CHAR(11) NOT NULL,
    cargo VARCHAR2(255) NOT NULL,
    salario NUMBER(*,2),
    data_admissao DATE NOT NULL,

    CONSTRAINT funcionario_check CHECK (salario >= 1212.00),
    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fkey FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

/*Médico: tabela que herda de pessoa e define a entidade Médico
*/

CREATE TABLE Medico (
    cpf_med CHAR(11) NOT NULL,
    crm VARCHAR2(255) NOT NULL,

    CONSTRAINT medico_pkey PRIMARY KEY (cpf_med),
    CONSTRAINT medico_fkey FOREIGN KEY (cpf_med) REFERENCES Funcionario(cpf)
);

-- Tabela que contem o preco de um serviço (atributo multivalorado)
CREATE TABLE Preco_servicos (
    tipo_servico VARCHAR2(255) NOT NULL,
    preco_servico NUMBER(*, 2) NOT NULL,

    CONSTRAINT preco_servicos_check CHECK (preco_servico >= 0.00),
    CONSTRAINT preco_servico_pkey PRIMARY KEY (tipo_servico),
    CONSTRAINT preco_servico CHECK (preco_servico >= 0)
);

/*Serviço: tabela que define a entidade Serviço
*/

CREATE TABLE Servico (
   id INTEGER NOT NULL,
   tipo_servico VARCHAR2(255) NOT NULL,

   CONSTRAINT servico_pkey PRIMARY KEY (id),
   CONSTRAINT servico_fkey FOREIGN KEY (tipo_servico) REFERENCES Preco_servicos(tipo_servico)
);

/*Medicamento: tabela que define a entidade Medicamento
*/

CREATE TABLE Medicamento (
    nome VARCHAR2(255) NOT NULL,

    CONSTRAINT medicamento_pkey PRIMARY KEY (nome)
);

/*Fornecedor: tabela que define a entidade Fornecedor
*/

CREATE TABLE Fornecedor (
    cnpj CHAR(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,

    CONSTRAINT fornecedor_pkey PRIMARY KEY (cnpj)   
);

/*TipoProduto: atributo multivalorado de Fornecedor
*/
CREATE TABLE TipoProduto (
    cnpj_fornecedor CHAR(14) NOT NULL,
    tipo_produto VARCHAR2(30) NOT NULL,

    CONSTRAINT tipo_produto_pkey PRIMARY KEY (cnpj_fornecedor, tipo_produto),
    CONSTRAINT tipo_produto_fkey FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
);

/*Produto: tabela que define a entidade Produto
*/

CREATE TABLE Produto (
    cnpj_fornecedor CHAR(14) NOT NULL,
    nome_comercial VARCHAR2(30) NOT NULL,
    preco_de_compra NUMBER(*, 2),
    preco_de_revenda NUMBER(*, 2),
    estoque INTEGER,
    data_de_fabricacao DATE,
    data_de_vencimento DATE,
    lote INTEGER,

    CONSTRAINT produto_preco_de_compra_check CHECK (preco_de_compra >= 0.00),
    CONSTRAINT produto_preco_de_revenda_check CHECK (preco_de_revenda > preco_de_compra),
    CONSTRAINT produto_estoque_check CHECK (estoque > 0),
    CONSTRAINT produto_lote_check CHECK (lote > 0 AND lote < 10000),
    CONSTRAINT produto_pkey PRIMARY KEY (cnpj_fornecedor, nome_comercial), --entidade fraca
    CONSTRAINT produto_fkey FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
);

/*Compra: tabela que define o relacionamento Compra
*/
CREATE TABLE Compra (
    cpf_cliente CHAR(11) NOT NULL,
    cnpj_fornecedor CHAR(14) NOT NULL,
    nome_comercial VARCHAR2(255) NOT NULL,
    datahora_compra TIMESTAMP NOT NULL,
    
    CONSTRAINT compra_pkey PRIMARY KEY (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra),
    CONSTRAINT compra_fkey1 FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_p),
    CONSTRAINT compra_fkey3 FOREIGN KEY (cnpj_fornecedor, nome_comercial) REFERENCES Produto(cnpj_fornecedor, nome_comercial)
);

/*Suporvisiona: tabela que define o relacionamento Supervisiona
*/

CREATE TABLE Supervisiona (
    cpf_supervisor CHAR(11) NOT NULL,
    cpf_supervisionado CHAR(11) NOT NULL,
    avaliacao VARCHAR2(255),
    
    CONSTRAINT supervisiona_pkey PRIMARY KEY (cpf_supervisor, cpf_supervisionado),
    CONSTRAINT supervisiona_fkey1 FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf),
    CONSTRAINT supervisiona_fkey2 FOREIGN KEY (cpf_supervisionado) REFERENCES Funcionario(cpf)
);

/*Atende: tabela que define o relacionamento Atende
*/

CREATE TABLE Atende(
    cpf_funcionario CHAR(11) NOT NULL,
    cpf_cliente CHAR(11) NOT NULL,
    id_servico INTEGER NOT NULL,
    datahora_atende TIMESTAMP NOT NULL,
    
    CONSTRAINT atende_pkey PRIMARY KEY (cpf_funcionario, cpf_cliente, id_servico, datahora_atende),
    CONSTRAINT cpfFunc_fkey FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf),
    CONSTRAINT cpfClienteat_fkey FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_p),
    CONSTRAINT idServico_fkey FOREIGN KEY (id_servico) REFERENCES Servico(id)
);


/*Consulta: tabela que define o relacionamento Consulta
*/

CREATE TABLE Consulta(
    cpf_cliente CHAR(11) NOT NULL,
    cpf_medico CHAR(11) NOT NULL,
    datahora_consulta TIMESTAMP NOT NULL,
    nome_medicamento VARCHAR2(255), -- Prescreve

    CONSTRAINT consulta_pkey PRIMARY KEY (cpf_cliente, cpf_medico, datahora_consulta),
    CONSTRAINT cpfClientecs_fkey FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_p), 
    CONSTRAINT cpfMedico_fkey FOREIGN KEY (cpf_medico) REFERENCES Medico(cpf_med)
);
    
    
