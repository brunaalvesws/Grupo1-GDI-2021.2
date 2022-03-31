CREATE SEQUENCE servico_id INCREMENT BY 1 START WITH 1;

-- POVOAMENTO PESSOA

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

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('67885321900', 'Tiago Medeiros',to_date('30/05/1977', 'dd/mm/yy'),'M');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('17846781900', 'Sabrina Rocha',to_date('02/07/1967', 'dd/mm/yy'),'F');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('12246221900', 'Walmir Bispo',to_date('05/10/1972', 'dd/mm/yy'),'M');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('55511121900', 'Jean Carlos',to_date('02/11/1992', 'dd/mm/yy'),'M');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32217721111', 'Meiry Lanunce',to_date('02/11/1969', 'dd/mm/yy'),'F');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('32177765322', 'Gilberto Luiz',to_date('02/10/1980', 'dd/mm/yy'),'M');

INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
    VALUES ('55566621111', 'Junior Tavares',to_date('07/05/1992', 'dd/mm/yy'),'M');

-- POVOAMENTO ENDEREÇO

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32145678900', 'Recife', 'Jaguaribe', '78', 'Casa', 'Pernambuco', '50610510');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32146678900', 'Recife', 'Santos Dumont', '456', 'Apartamento', 'Pernambuco', '50350510');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32146670900', 'Recife', 'Tabaiares', '886', 'Apartamento', 'Pernambuco', '50350511');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('12146678900', 'Recife', 'Sport Clube do Recife', '586', 'Apartamento', 'Pernambuco', '50351511');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32146679900', 'Recife', 'Sigismundo Gonçalves', '230', 'Apartamento', 'Pernambuco', '51351511');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32146578900', 'Recife', 'Boa Viagem', '20', 'Apartamento', 'Pernambuco', '51371511');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32246678900', 'Recife', 'Dom Manoel da Costa', '117', 'Casa', 'Pernambuco', '58881511');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32146677900', 'Recife', 'Engenheiro Sampaio', '199', 'Casa', 'Pernambuco', '58881599');    

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('67885321900', 'Recife', 'Boa Viagem', '220', 'Casa', 'Pernambuco', '51111221');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('17846781900', 'Recife', 'Ilha do Leite', '333', 'Casa', 'Pernambuco', '51121221');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('12246221900', 'Recife', 'Cajueiro', '111', 'Casa', 'Pernambuco', '51155521');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('55511121900', 'Recife', 'Rosa e Silva', '95', 'Casa', 'Pernambuco', '57740821');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32217721111', 'Olinda', 'Peixinhos', '95', 'Casa', 'Pernambuco', '57123821');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('32177765322', 'Camaragibe', 'Estação Nova', '100', 'Casa', 'Pernambuco', '57161111');

INSERT INTO Endereco(cpf_p, cidade, rua, numero, complemento, estado, cep)
    VALUES ('55566621111', 'Olinda', 'Rio Doce', '05', 'Casa', 'Pernambuco', '57178899');

-- POVOAMENTO TELEFONE

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32145678900', '992199222');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32146678900', '991681119');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32146678900', '988886543');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32146670900', '988346613');
    
INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('12146678900', '988338212');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('12146678900', '988335566');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32146679900', '994022444');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32146578900', '994022333');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32246678900', '999287566');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32246678900', '999287500');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32246678900', '999547566');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32146677900', '994025554');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('67885321900', '992155111');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('17846781900', '993345211');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('12246221900', '993100017');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('55511121900', '993103010');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32217721111', '993111010');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('32177765322', '993777710');

INSERT INTO Telefone(cpf_p, telefone)
    VALUES ('55566621111', '993277733');


-- POVOAMENTO CLIENTE

INSERT INTO Cliente(cpf_p, plano_de_saude)
    VALUES ('32145678900', 'Unimed');  

INSERT INTO Cliente(cpf_p, plano_de_saude)
    VALUES ('32146678900', 'Sulamerica');  

INSERT INTO Cliente(cpf_p, plano_de_saude)
    VALUES ('32146670900', 'Hapvida');   
    
INSERT INTO Cliente(cpf_p, plano_de_saude)
    VALUES ('12146678900', 'Notredame'); 

INSERT INTO Cliente(cpf_p, plano_de_saude)
    VALUES ('32146677900', 'Fachesf');  


-- POVOAMENTO FUNCIONARIO

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('32146679900', 'Recepcionista', 2200.00, TO_DATE('01/02/2022', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('32146578900', 'Recepcionista', 2200.00, TO_DATE('05/08/2021', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('32246678900', 'Médico', 3000.00, TO_DATE('07/07/2018', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('67885321900', 'Médico', 2000.00, TO_DATE('01/10/2019', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('17846781900', 'Médico', 2000.00, TO_DATE('01/10/2019', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('12246221900', 'Médico', 3500.00, TO_DATE('22/04/2020', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('55511121900', 'Médico', 4500.00, TO_DATE('09/09/2019', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('32217721111', 'Médico', 2500.00, TO_DATE('15/03/2022', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('32177765322', 'Segurança', 3200.00, TO_DATE('25/05/2019', 'dd/mm/yy'));

INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
    VALUES ('55566621111', 'Segurança', 3200.00, TO_DATE('22/07/2020', 'dd/mm/yy'));

-- POVOAMENTO MÉDICO 

INSERT INTO Medico(cpf, crm) VALUES ('32246678900', '123');
INSERT INTO Medico(cpf, crm) VALUES ('67885321900', '345');
INSERT INTO Medico(cpf, crm) VALUES ('17846781900', '567');
INSERT INTO Medico(cpf, crm) VALUES ('12246221900', '789');
INSERT INTO Medico(cpf, crm) VALUES ('55511121900', '999');
INSERT INTO Medico(cpf, crm) VALUES ('32217721111', '111');

-- POVOAMENTO SERVICO

INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Consulta');
INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Dermatoscopia');
INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Cirurgia Dermatológica');
INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Toxina botulínica');
INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Biópsia');
INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Exames básicos');
INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Cauterização química');
INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Crioterapia');
INSERT INTO Servico(id, tipo_servico) VALUES (servico_id.NEXTVAL, 'Curetagem');

/* povoamento de Preco_servicos */

INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Consulta', 150.00);
INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Dermatoscopia', 240.00);
INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Cirurgia Dermatológica', 500.00);
INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Toxina botulínica', 100.00);
INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Biópsia', 120.00); 
INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Exames básicos', 400.00);
INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Cauterização química', 210.00);
INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Crioterapia', 500.00);
INSERT INTO Preco_servicos(tipo_servico, preco_servico) VALUES ('Curetagem', 50.00);

/* povoamento de Medicamentos */

INSERT INTO Medicamento(nome) VALUES ('Xeomin');
INSERT INTO Medicamento(nome) VALUES ('Aloxidil');
INSERT INTO Medicamento(nome) VALUES ('Pantogar Neo');
INSERT INTO Medicamento(nome) VALUES ('Avicis');
INSERT INTO Medicamento(nome) VALUES ('Finalop');
INSERT INTO Medicamento(nome) VALUES ('Finasterida');
INSERT INTO Medicamento(nome) VALUES ('Restylane');
INSERT INTO Medicamento(nome) VALUES ('Helioral');

/* povoamento de Fornecedor */

INSERT INTO Fornecedor(cnpj, nome) VALUES ("44328278000168", "Grupo Acripel");
INSERT INTO Fornecedor(cnpj, nome) VALUES ("54640597000168", "Dermage");
INSERT INTO Fornecedor(cnpj, nome) VALUES ("44037886000113", "Pharmapele");
INSERT INTO Fornecedor(cnpj, nome) VALUES ("67873558000152", "DISTRIFARMA");
INSERT INTO Fornecedor(cnpj, nome) VALUES ("72727498000108", "Amigo Fiel");
INSERT INTO Fornecedor(cnpj, nome) VALUES ("56823657000103", "Centralerg");

/* povoamento de Produto */
INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('REFERENCE', );
/* povoamento de TipoProduto */

/*povoamento compra*/
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('32145678900', '54640597000168', 'Acnex', to_date('12/02/22', 'dd/mm/yyyy'), '15:25')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('12146678900', '67873558000152', 'Hidramais', to_date('13/02/22', 'dd/mm/yyyy'), '09:15')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('32146670900', '56823657000103', 'Acnen', to_date('05/03/22', 'dd/mm/yyyy'), '16:26')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('32146677900', '44328278000168', 'Actine', to_date('25/01/22', 'dd/mm/yyyy'), '14:17')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('32146678900', '44037886000113', 'Hipoalergenico', to_date('16/03/22', 'dd/mm/yyyy'), '08:13')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('32146677900', '72727498000108', 'Hidramais', to_date('24/02/22', 'dd/mm/yyyy'), '10:05')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('32145678900', '56823657000103', 'Actine', to_date('30/01/22', 'dd/mm/yyyy'), '11:35')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('12146678900', '44328278000168', 'Sunless', to_date('26/03/22', 'dd/mm/yyyy'), '17:23')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('32146678900', '54640597000168', 'UVSafe', to_date('19/02/22', 'dd/mm/yyyy'), '07:43')
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, data_compra, h)
    VALUES ('32145678900', '67873558000152', 'Acnen', to_date('17/03/22', 'dd/mm/yyyy'), '09:57')
/*povoamento supervisiona*/
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32146679900', '32177765322', 'Boa')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32146578900', '32146679900', 'Ótimo')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('55511121900', '67885321900', 'Desejável')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('12246221900', '17846781900', 'Desejável')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32177765322', '67885321900', 'Boa')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('55566621111', '32217721111', 'Boa')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('12246221900', '32146679900', 'Ótimo')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32146578900', '17846781900', 'Boa')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32246678900', '12246221900', 'Desejável')
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('67885321900', '17846781900', 'Ótimo')

/*povoamento de Atende (CPF_func, CP_cliente e id_serviço precisam existir nas outras tabelas*/ 
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146679900', '32145678900', '01', to_date('06/02/2022', 'dd/mm/yyyy'), '14:20', '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146578900', '32146678900', '03', to_date('07/08/2021', 'dd/mm/yyyy'), '09:32', '500');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146578900', '32145678900', '02', to_date('07/08/2021', 'dd/mm/yyyy'), '10:47', '240');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146578900', '32146670900', '04', to_date('10/09/2021', 'dd/mm/yyyy'), '16:08', '100');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146679900', '12146678900', '09', to_date('08/02/2022', 'dd/mm/yyyy'), '07:15', '50');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146578900', '32145678900', '09', to_date('15/11/2021', 'dd/mm/yyyy'), '08:53', '50');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146578900', '12146678900', '01', to_date('01/10/2021', 'dd/mm/yyyy'), '13:30', '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146679900', '32146670900', '05', to_date('11/02/2022', 'dd/mm/yyyy'), '15:12', '120');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146679900', '32146677900', '01', to_date('12/02/2022', 'dd/mm/yyyy'), '10:47', '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146578900', '32145678900', '01', to_date('06/12/2021', 'dd/mm/yyyy'), '11:00', '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146578900', '32146678900', '01', to_date('06/01/2022', 'dd/mm/yyyy'), '07:00', '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, data_atende, hora, preco)
    VALUES ('32146679900', '12146678900', '01', to_date('30/02/2022', 'dd/mm/yyyy'), '09:10', '150');


/*povoamento de consulta (CPF_med, CP_cliente e nome_medicamento precisam existir nas outras tabelas*/
INSERT INTO Consulta(cpf_cliente, cpf_medico, data_consulta, hora, nome_medicamento)
    VALUES ('12146678900', '67885321900', to_date('06/02/2022', 'dd/mm/yyyy'), '14:28', 'Xeomin');
INSERT INTO Consulta(cpf_cliente, cpf_medico, data_consulta, hora, nome_medicamento)
    VALUES ('32145678900', '17846781900', to_date('06/12/2021', 'dd/mm/yyyy'), '11:05', 'Finasterida');
INSERT INTO Consulta(cpf_cliente, cpf_medico, data_consulta, hora, nome_medicamento)
    VALUES ('32146678900', '12246221900', to_date('06/01/2022', 'dd/mm/yyyy'), '07:07', 'Avicis');
INSERT INTO Consulta(cpf_cliente, cpf_medico, data_consulta, hora, nome_medicamento)
    VALUES ('32145678900', '55511121900', to_date('06/02/2022', 'dd/mm/yyyy'), '14:20', 'Restylane');
INSERT INTO Consulta(cpf_cliente, cpf_medico, data_consulta, hora, nome_medicamento)
    VALUES ('32146677900', '32217721111', to_date('12/02/2022', 'dd/mm/yyyy'), '10:50', 'Aloxidil');
INSERT INTO Consulta(cpf_cliente, cpf_medico, data_consulta, hora, nome_medicamento)
    VALUES ('12146678900', '67885321900', to_date('30/02/2022', 'dd/mm/yyyy'), '09:18', 'Finalop');
INSERT INTO Consulta(cpf_cliente, cpf_medico, data_consulta, hora, nome_medicamento)
    VALUES ('12146678900', '55511121900', to_date('14/03/2022', 'dd/mm/yyyy'), '10:50', NULL);