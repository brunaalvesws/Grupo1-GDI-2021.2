-- Definindo as tabelas 

/*Pessoa: tabela que contém as informações sobre uma pessoa, que pode assumir outros papéis como 
cliente, médico ou funcionário
*/
CREATE TABLE Pessoa(
    cpf VARCHAR2(11) NOT NULL, 
    nome VARCHAR2(255), 
    data_nascimento DATE, 
    genero CHAR,

    CONSTRAINT pessoa_pkey PRIMARY KEY (cpf),
    CONSTRAINT pessoa_checkGenero CHECK (genero = 'M' OR genero = 'F')
);

/*Endereço: tabela que contém os campos do atributo composto endereço, vinculado à pessoa
*/

CREATE TABLE Endereco(
    cpf_p VARCHAR2(11) NOT NULL,
    cidade VARCHAR2(20), 
    rua VARCHAR2(255), 
    numero number, 
    complemento VARCHAR2(255), 
    estado VARCHAR2 (20), 
    cep VARCHAR2(9),

    CONSTRAINT endereco_pkey PRIMARY KEY (cpf_p),
    CONSTRAINT endereco_fkey FOREIGN KEY (cpf_p) REFERENCES Pessoa (cpf)
); 

/*Telefone: tabela que contém os campos do atributo multivalorado telefone, vinculado à pessoa
*/

CREATE TABLE Telefone(
    cpf_p VARCHAR2(11) NOT NULL,
    telefone VARCHAR2(9) NOT NULL,

    CONSTRAINT telefone_pkey PRIMARY KEY (cpf_p,telefone),    
    CONSTRAINT telefone_fkey FOREIGN KEY (cpf_p) REFERENCES Pessoa (cpf)
);

/*Cliente: tabela que herda de pessoa e define a entidade cliente
*/

CREATE TABLE Cliente(
    cpf_p VARCHAR2(11) NOT NULL,
    plano_de_saude VARCHAR2(255),

    CONSTRAINT cliente_pkey PRIMARY KEY (cpf_p),
    CONSTRAINT cliente_fkey FOREIGN KEY (cpf_p) REFERENCES Pessoa (cpf)
);

-- Funcionario, Medico e Servico.

CREATE TABLE Funcionario (
    cpf VARCHAR2(11) NOT NULL,
    cargo VARCHAR2(255) NOT NULL,
    salario NUMBER,
    data_admissao DATE NOT NULL,

    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf),
    CONSTRAINT funcionario_fkey FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Medico (
    cpf VARCHAR2(11) NOT NULL,
    crm VARCHAR2(255) NOT NULL,
    CONSTRAINT medico_pkey PRIMARY KEY (cpf),
    CONSTRAINT medico_fkey FOREIGN KEY (cpf) REFERENCES Funcionario(cpf)
);

CREATE TABLE Servico (
   id INTEGER NOT NULL,
   tipo_servico VARCHAR2(255) NOT NULL,
   CONSTRAINT servico_pkey PRIMARY KEY (tipo_servico),
   CONSTRAINT servico_fkey FOREIGN KEY (tipo_servico) REFERENCES Preco_servicos(tipo_servico)
);

-- Preco_servicos, Medicamento, Fornecedor 

-- Tabela que contem o preco de um serviço
CREATE TABLE Preco_servicos (
    tipo_servico VARCHAR2(255) NOT NULL,
    preco_servico NUMBER(10, 2) NOT NULL,

    CONSTRAINT preco_servico_pkey PRIMARY KEY (tipo_servico),
    CONSTRAINT preco_servico CHECK (preco_servico >= 0)
);

-- Tabela de medicamentos
CREATE TABLE Medicamento (
    nome VARCHAR2(255) NOT NULL,

    CONSTRAINT medicamento_pkey PRIMARY KEY (nome)
);

-- Tabela de fornecedores
CREATE TABLE Fornecedor (
    cnpj VARCHAR2(14) NOT NULL,
    nome VARCHAR2(255) NOT NULL,

    CONSTRAINT fornecedor_pkey PRIMARY KEY (cnpj)   
);

-- TipoProduto, Produtos
CREATE TABLE TipoProduto (
    cnpj_fornecedor VARCHAR2(14) NOT NULL,
    tipo_produto VARCHAR2(30) NOT NULL,

    CONSTRAINT tipo_produto_pkey PRIMARY KEY (cnpj_fornecedor, tipo_produto),
    CONSTRAINT tipo_produto_fkey FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
);

CREATE TABLE Produto (
    cnpj_fornecedor VARCHAR2(14) NOT NULL,
    nome_comercial VARCHAR2(30) NOT NULL,
    preco_de_compra NUMBER(10, 2),
    preco_de_revenda NUMBER (10, 2),
    estoque INTEGER,
    data_de_fabricacao DATE,
    data_de_vencimento DATE,
    lote INTEGER,

    CONSTRAINT produto_pkey PRIMARY KEY (cnpj_fornecedor, nome_comercial),
    CONSTRAINT produto_fkey FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
);

-- Compra, Supervisiona
CREATE TABLE Compra (
    cpf_cliente VARCHAR2(11) NOT NULL,
    cnpj_fornecedor VARCHAR2(14) NOT NULL,
    nome_comercial VARCHAR2(255) NOT NULL,
    data_compra DATE NOT NULL,
    hora VARCHAR2(255) NOT NULL,
    
    CONSTRAINT compra_pkey PRIMARY KEY (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, hora),
    CONSTRAINT compra_fkey1 FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_p),
    CONSTRAINT compra_fkey2 FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj),
    CONSTRAINT compra_fkey3 FOREIGN KEY (nome_comercial) REFERENCES Produto(nome_comercial)
);

CREATE TABLE Supervisiona (
    cpf_supervisor VARCHAR2(11) NOT NULL,
    cpf_supervisionado VARCHAR2(11) NOT NULL,
    avaliacao VARCHAR2(255),
    
    CONSTRAINT supervisiona_pkey PRIMARY KEY (cpf_supervisor, cpf_supervisionado),
    CONSTRAINT supervisiona_fkey1 FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf_funcionario),
    CONSTRAINT supervisiona_fkey2 FOREIGN KEY (cpf_supervisionado) REFERENCES Funcionario(cpf_funcionario)
);



-- Atende, Consulta
CREATE TABLE Atende(
    cpf_funcionario VARCHAR2 (11) NOT NULL,
    cpf_cliente VARCHAR2 (11) NOT NULL,
    id_servico INTEGER NOT NULL,
    data_atende DATE NOT NULL,
    hora VARCHAR2 (255) NOT NULL,
    preco NUMBER NOT NULL,
    
    CONSTRAINT atende_pkey PRIMARY KEY (cpf_funcionario, cpf_cliente, id_servico, data_atende, hora),
    CONSTRAINT atende_checkPreco CHECK (preco > 0),
    CONSTRAINT cpfFunc_fkey FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(cpf_funcionario),
    CONSTRAINT cpfCliente_fkey FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_p),
    CONSTRAINT idServico_fkey FOREIGN KEY (id_servico) REFERENCES Servico(id)
);



CREATE TABLE Consulta(
    cpf_cliente VARCHAR2 (11) NOT NULL,
    cpf_medico VARCHAR2 (11) NOT NULL,
    data_consulta DATE NOT NULL,
    hora VARCHAR2 (255) NOT NULL,
    nome_medicamento VARCHAR2 (255),

    CONSTRAINT consulta_pkey PRIMARY KEY (cpf_cliente, cpf_medico, data_consulta, hora),
    CONSTRAINT cpfCliente_fkey FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf_p), 
    CONSTRAINT cpfMedico_fkey FOREIGN KEY (cpf_medico) REFERENCES Medico(cpf_med)
);
    
    
