CREATE SEQUENCE servico_id INCREMENT BY 1 START WITH 1;
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';

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

INSERT INTO Medico(cpf_med, crm) VALUES ('32246678900', '123');
INSERT INTO Medico(cpf_med, crm) VALUES ('67885321900', '345');
INSERT INTO Medico(cpf_med, crm) VALUES ('17846781900', '567');
INSERT INTO Medico(cpf_med, crm) VALUES ('12246221900', '789');
INSERT INTO Medico(cpf_med, crm) VALUES ('55511121900', '999');
INSERT INTO Medico(cpf_med, crm) VALUES ('32217721111', '111');

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

INSERT INTO Fornecedor(cnpj, nome) VALUES ('44328278000168', 'Grupo Acripel');
INSERT INTO Fornecedor(cnpj, nome) VALUES ('54640597000168', 'Dermage');
INSERT INTO Fornecedor(cnpj, nome) VALUES ('44037886000113', 'Pharmapele');
INSERT INTO Fornecedor(cnpj, nome) VALUES ('67873558000152', 'DISTRIFARMA');
INSERT INTO Fornecedor(cnpj, nome) VALUES ('72727498000108', 'Amigo Fiel');
INSERT INTO Fornecedor(cnpj, nome) VALUES ('56823657000103', 'Centralerg');

/* povoamento de TipoProduto */
INSERT INTO TipoProduto (cnpj_fornecedor, tipo_produto)
    VALUES ('44328278000168', 'Acne');

INSERT INTO TipoProduto (cnpj_fornecedor, tipo_produto)
    VALUES ('54640597000168', 'Acne');

INSERT INTO TipoProduto (cnpj_fornecedor, tipo_produto)
    VALUES ('54640597000168', 'Hidratante');

INSERT INTO TipoProduto (cnpj_fornecedor, tipo_produto)
    VALUES ('44037886000113', 'Acne');

INSERT INTO TipoProduto (cnpj_fornecedor, tipo_produto)
    VALUES ('56823657000103', 'Filtro Solar');

INSERT INTO TipoProduto (cnpj_fornecedor, tipo_produto)
    VALUES ('67873558000152', 'Filtro Solar');

INSERT INTO TipoProduto (cnpj_fornecedor, tipo_produto)
    VALUES ('72727498000108', 'Pomada');

/* povoamento de Produto */
INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('44328278000168', 'Actine', 5.99, 109.99, 10, to_date('12/12/2021', 'dd/mm/yyyy'), to_date('12/12/2026', 'dd/mm/yyyy'), 876);

INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('54640597000168', 'Acnen', 8.99, 200.00, 5, to_date('08/10/2021', 'dd/mm/yyyy'), to_date('20/07/2025', 'dd/mm/yyyy'), 9591);

INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('54640597000168', 'Hidramais', 5.99, 30.00, 40, to_date('01/04/2020', 'dd/mm/yyyy'), to_date('12/08/2023', 'dd/mm/yyyy'), 109);

INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('44037886000113', 'Acnex', 1.99, 110.98, 3, to_date('03/06/2018', 'dd/mm/yyyy'), to_date('21/03/2025', 'dd/mm/yyyy'), 74);

INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('56823657000103', 'Sunless', 20.50, 50.98, 40, to_date('02/09/2021', 'dd/mm/yyyy'), to_date('11/04/2024', 'dd/mm/yyyy'), 1756);

INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('67873558000152', 'UVSafe', 25.50, 69.99, 25, to_date('01/09/2020', 'dd/mm/yyyy'), to_date('09/03/2022', 'dd/mm/yyyy'), 4887);

INSERT INTO Produto (cnpj_fornecedor, nome_comercial, preco_de_compra, preco_de_revenda, estoque, data_de_fabricacao, data_de_vencimento, lote)
    VALUES ('72727498000108', 'Hipoalergenico', 12.50, 40.99, 69, to_date('02/05/2020', 'dd/mm/yyyy'), to_date('11/03/2026', 'dd/mm/yyyy'), 975);


/*povoamento compra*/
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('32145678900', '54640597000168', 'Acnex', TO_TIMESTAMP('12-02-2022 15:25', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('12146678900', '67873558000152', 'Hidramais', TO_TIMESTAMP('13-02-2022 09:15', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('32146670900', '56823657000103', 'Acnen', TO_TIMESTAMP('05-03-2022 16:26', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('32146677900', '44328278000168', 'Actine', TO_TIMESTAMP('25-01-2022 14:17', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('32146678900', '44037886000113', 'Hipoalergenico', TO_TIMESTAMP('16-03-2022 08:13', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('32146677900', '72727498000108', 'Hidramais', TO_TIMESTAMP('24-02-2022 10:05', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('32145678900', '56823657000103', 'Actine', TO_TIMESTAMP('30-01-2022 11:35', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('12146678900', '44328278000168', 'Sunless', TO_TIMESTAMP('26-03-2022 17:23', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('32146678900', '54640597000168', 'UVSafe', TO_TIMESTAMP('19-02-2022 07:43', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Compra (cpf_cliente, cnpj_fornecedor, nome_comercial, datahora_compra)
    VALUES ('32145678900', '67873558000152', 'Acnen', TO_TIMESTAMP('17-03-2022 09:57', 'DD-MM-YYYY HH24:MI'));
/*povoamento supervisiona*/
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32146679900', '32177765322', 'Boa');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32146578900', '32146679900', 'Ótimo');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('55511121900', '67885321900', 'Desejável');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('12246221900', '17846781900', 'Desejável');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32177765322', '67885321900', 'Boa');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('55566621111', '32217721111', 'Boa');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('12246221900', '32146679900', 'Ótimo');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32146578900', '17846781900', 'Boa');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('32246678900', '12246221900', 'Desejável');
INSERT INTO Supervisiona (cpf_supervisor, cpf_supervisionado, avaliacao)
    VALUES ('67885321900', '17846781900', 'Ótimo');

/*povoamento de Atende (CPF_func, CP_cliente e id_serviço precisam existir nas outras tabelas*/ 
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146679900', '32145678900', '01', TO_TIMESTAMP('06-02-2022 14:20', 'DD-MM-YYYY HH24:MI'), '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146578900', '32146678900', '03', TO_TIMESTAMP('07-08-2021 09:32', 'DD-MM-YYYY HH24:MI'), '500');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146578900', '32145678900', '02', TO_TIMESTAMP('07-08-2021 10:47', 'DD-MM-YYYY HH24:MI'), '240');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146578900', '32146670900', '04', TO_TIMESTAMP('10-09-2021 16:08', 'DD-MM-YYYY HH24:MI'), '100');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146679900', '12146678900', '09', TO_TIMESTAMP('08-02-2022 10:47', 'DD-MM-YYYY HH24:MI'), '50');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146578900', '32145678900', '09', TO_TIMESTAMP('15-11-2021 08:53', 'DD-MM-YYYY HH24:MI'), '50');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146578900', '12146678900', '01', TO_TIMESTAMP('01-10-2021 13:30', 'DD-MM-YYYY HH24:MI'), '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146679900', '32146670900', '05', TO_TIMESTAMP('11-02-2022 15:12', 'DD-MM-YYYY HH24:MI'), '120');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146679900', '32146677900', '01', TO_TIMESTAMP('12-02-2021 10:47', 'DD-MM-YYYY HH24:MI'), '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146578900', '32145678900', '01', TO_TIMESTAMP('06-12-2021 11:00', 'DD-MM-YYYY HH24:MI'), '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146578900', '32146678900', '01', TO_TIMESTAMP('06-01-2021 07:00', 'DD-MM-YYYY HH24:MI'), '150');
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende, preco)
    VALUES ('32146679900', '12146678900', '01', TO_TIMESTAMP('30-02-2022 09:10', 'DD-MM-YYYY HH24:MI'), '150');


/*povoamento de consulta (CPF_med, CP_cliente e nome_medicamento precisam existir nas outras tabelas*/
INSERT INTO Consulta(cpf_cliente, cpf_medico, datahora_consulta, nome_medicamento)
    VALUES ('12146678900', '67885321900', TO_TIMESTAMP('06-02-2022 14:28', 'DD-MM-YYYY HH24:MI'), 'Xeomin');
INSERT INTO Consulta(cpf_cliente, cpf_medico, datahora_consulta, nome_medicamento)
    VALUES ('32145678900', '17846781900', TO_TIMESTAMP('06-12-2021 11:05', 'DD-MM-YYYY HH24:MI'), 'Finasterida');
INSERT INTO Consulta(cpf_cliente, cpf_medico, datahora_consulta, nome_medicamento)
    VALUES ('32146678900', '12246221900', TO_TIMESTAMP('06-01-2021 07:07', 'DD-MM-YYYY HH24:MI'), 'Avicis');
INSERT INTO Consulta(cpf_cliente, cpf_medico, datahora_consulta, nome_medicamento)
    VALUES ('32145678900', '55511121900', TO_TIMESTAMP('06-02-2022 14:20', 'DD-MM-YYYY HH24:MI'), 'Restylane');
INSERT INTO Consulta(cpf_cliente, cpf_medico, datahora_consulta, nome_medicamento)
    VALUES ('32146677900', '32217721111', TO_TIMESTAMP('12-02-2022 10:50', 'DD-MM-YYYY HH24:MI'), 'Aloxidil');
INSERT INTO Consulta(cpf_cliente, cpf_medico, datahora_consulta, nome_medicamento)
    VALUES ('12146678900', '67885321900', TO_TIMESTAMP('30-02-2022 09:18', 'DD-MM-YYYY HH24:MI'), 'Finalop');
INSERT INTO Consulta(cpf_cliente, cpf_medico, datahora_consulta, nome_medicamento)
    VALUES ('12146678900', '55511121900', TO_TIMESTAMP('14-03-2022 10:50', 'DD-MM-YYYY HH24:MI'), NULL);