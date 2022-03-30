CREATE SEQUENCE servico_id INCREMENT BY 1 START WITH 1;

-- povoamento de Pessoa
INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32145678900', 'Bruna Alves',to_date('15/07/2001', 'dd/mm/yy'),'F');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32146678900', 'Artur Carvalho',to_date('28/08/2001', 'dd/mm/yy'),'M');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32146670900', 'Gustavo Campos',to_date('10/12/2001', 'dd/mm/yy'),'M');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('12146678900', 'Lucas Cavalcanti',to_date('07/03/2001', 'dd/mm/yy'),'M');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32146679900', 'Matheus Frej',to_date('10/10/2001', 'dd/mm/yy'),'M');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32146578900', 'Raissa Heimann',to_date('30/03/2001', 'dd/mm/yy'),'F');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32246678900', 'Maria do Socorro Alves',to_date('09/09/2001', 'dd/mm/yy'),'F');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32146677900', 'Ana Carla Guerra',to_date('26/03/2001', 'dd/mm/yy'),'F');

    

INSERT INTO Funcionario(cpf, cargo, salario, data_de_admissao )
    VALUES ('321', '100',to_date('05/07/2021', 'dd/mm/yy'),'Supervisor', 2000.00);

INSERT INTO Funcionario(cpf, matricula, data_de_admissao, cargo, salario, cpf_supervisor)
    VALUES ('558', '101',to_date('05/08/2020', 'dd/mm/yy'),'Veterinário', 1200.00, '123');

INSERT INTO Funcionario(cpf, matricula, data_de_admissao, cargo, salario, cpf_supervisor)
    VALUES ('609', '102',to_date('05/10/2020', 'dd/mm/yy'),'Veterinário', 1200.00, '123');

INSERT INTO Funcionario(cpf, matricula, data_de_admissao, cargo, salario,cpf_supervisor)
    VALUES ('777', '103',to_date('15/07/2021', 'dd/mm/yy'),'Veterinário', 2000.00, '123');
    
INSERT INTO Funcionario(cpf, matricula, data_de_admissao, cargo, salario, cpf_supervisor)
    VALUES ('888', '104',to_date('25/07/2021', 'dd/mm/yy'),'Atendente', 1200.00, '123');

/*povoamento de Preco_servicos*/

/* povoamento de Produto */
INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('REFERENCE', );
/* povoamento de TipoProduto */

/*povoamento compra*/
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('12/02/22', 'dd/mm/yyyy'), '15:25')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('13/02/22', 'dd/mm/yyyy'), '09:15')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('05/03/22', 'dd/mm/yyyy'), '16:26')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('25/01/22', 'dd/mm/yyyy'), '14:17')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('16/03/22', 'dd/mm/yyyy'), '08:13')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('24/02/22', 'dd/mm/yyyy'), '10:05')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('30/01/22', 'dd/mm/yyyy'), '11:35')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('26/03/22', 'dd/mm/yyyy'), '17:23')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('19/02/22', 'dd/mm/yyyy'), '07:43')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h) VALUES ('00000000000', '00000000000000', 'nomecomercial', to_date('17/03/22', 'dd/mm/yyyy'), '09:57')
/*povoamento supervisiona*/
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao) VALUES ('00000000000', '00000000000', 'avaliação')
/*povoamento de Atende (CPF_func, CP_cliente e id_serviço precisam existir nas outras tabelas*/ 
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco) VALUES ('00000000000', '00000000000', 'xxx', to_date('17/11/2021', 'dd/mm/yyyy'), '14:20', '100');

/*povoamento de consulta (CPF_med, CP_cliente e nome_medicamento precisam existir nas outras tabelas*/
INSERT INTO Consulta(cpf_cliente, cpf_medico, data_consulta, hora, nome_medicamento) VALUES ('00000000000', '00000000000', to_date('16/11/2021', 'dd/mm/yyyy'), '10:00', 'XXXXX');