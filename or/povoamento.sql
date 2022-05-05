CREATE SEQUENCE servico_id INCREMENT BY 1 START WITH 1;
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';

-- TODO Nos atributos que são REF os povoamentos devem ser com select

-- POVOAMENTO PESSOA

INSERT INTO tb_cliente
    VALUES ('32145678900', 'Bruna Alves',to_date('15/07/2001', 'dd/mm/yy'),'F', tp_telefones(tp_telefone('992199222')), tp_endereco('Recife', 'Jaguaribe', '78', 'Casa', 'Pernambuco', '50610510'), 'Unimed');

INSERT INTO tb_cliente
    VALUES ('32146678900', 'Artur Carvalho',to_date('28/08/2001', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('991681119'), tp_telefone('988886543')), tp_endereco('Recife', 'Santos Dumont', '456', 'Apartamento', 'Pernambuco', '50350510'), 'Sulamerica');

INSERT INTO tb_cliente
    VALUES ('32146670900', 'Gustavo Campos',to_date('10/12/2001', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('988346613')), tp_endereco('Recife', 'Tabaiares', '886', 'Apartamento', 'Pernambuco', '50350511'), 'Hapvida');

INSERT INTO tb_cliente
    VALUES ('12146678900', 'Lucas Cavalcanti',to_date('07/03/2001', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('988338212'),tp_telefone('988335566')), tp_endereco('Recife', 'Sport Clube do Recife', '586', 'Apartamento', 'Pernambuco', '50351511'), 'Notredame');

INSERT INTO tb_funcionario
    VALUES ('32146679900', 'Matheus Frej',to_date('10/10/2001', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('994022444')), tp_endereco('Recife', 'Sigismundo Gonçalves', '230', 'Apartamento', 'Pernambuco', '51351511'), 'Recepcionista', 2200.00, TO_DATE('01/02/2022', 'dd/mm/yy'));

INSERT INTO tb_funcionario
    VALUES ('32146578900', 'Raissa Heimann',to_date('30/03/2001', 'dd/mm/yy'),'F', tp_telefones(tp_telefone('994022333')), tp_endereco('Recife', 'Boa Viagem', '20', 'Apartamento', 'Pernambuco', '51371511'), 'Recepcionista', 2200.00, TO_DATE('05/08/2021', 'dd/mm/yy'));

INSERT INTO tb_medico
    VALUES ('32246678900', 'Maria do Socorro Alves',to_date('09/09/2001', 'dd/mm/yy'),'F', tp_telefones(tp_telefone('999287566'), tp_telefone('999287500'), tp_telefone('999547566')), tp_endereco('Recife', 'Dom Manoel da Costa', '117', 'Casa', 'Pernambuco', '58881511'), 'Médico', 3000.00, TO_DATE('07/07/2018', 'dd/mm/yy'), '123');

INSERT INTO tb_cliente
    VALUES ('32146677900', 'Ana Carla Guerra',to_date('26/03/2001', 'dd/mm/yy'),'F', tp_telefones(tp_telefone('994025554')), tp_endereco('Recife', 'Engenheiro Sampaio', '199', 'Casa', 'Pernambuco', '58881599'), 'Fachesf');

INSERT INTO tb_medico
    VALUES ('67885321900', 'Tiago Medeiros',to_date('30/05/1977', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('992155111')), tp_endereco('Recife', 'Boa Viagem', '220', 'Casa', 'Pernambuco', '51111221'), 'Médico', 2000.00, TO_DATE('01/10/2019', 'dd/mm/yy'), '345');

INSERT INTO tb_medico
    VALUES ('17846781900', 'Sabrina Rocha',to_date('02/07/1967', 'dd/mm/yy'),'F', tp_telefones(tp_telefone('993345211')), tp_endereco('Recife', 'Ilha do Leite', '333', 'Casa', 'Pernambuco', '51121221'), 'Médico', 2000.00, TO_DATE('01/10/2019', 'dd/mm/yy'), '567');

INSERT INTO tb_medico
    VALUES ('12246221900', 'Walmir Bispo',to_date('05/10/1972', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('993100017')), tp_endereco('Recife', 'Cajueiro', '111', 'Casa', 'Pernambuco', '51155521'), 'Médico', 3500.00, TO_DATE('22/04/2020', 'dd/mm/yy'), '789');

INSERT INTO tb_medico
    VALUES ('55511121900', 'Jean Carlos',to_date('02/11/1992', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('993103010'), tp_telefone('991586284')), tp_endereco('Recife', 'Rosa e Silva', '95', 'Casa', 'Pernambuco', '57740821'), 'Médico', 4500.00, TO_DATE('09/09/2019', 'dd/mm/yy'), '999');

INSERT INTO tb_medico
    VALUES ('32217721111', 'Meiry Lanunce',to_date('02/11/1969', 'dd/mm/yy'),'F', tp_telefones(tp_telefone('993111010')), tp_endereco('Olinda', 'Peixinhos', '95', 'Casa', 'Pernambuco', '57123821'), 'Médico', 2500.00, TO_DATE('15/03/2022', 'dd/mm/yy'), '111');

INSERT INTO tb_funcionario
    VALUES ('32177765322', 'Gilberto Luiz',to_date('02/10/1980', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('993777710')), tp_endereco('Camaragibe', 'Estação Nova', '100', 'Casa', 'Pernambuco', '57161111'), 'Segurança', 3200.00, TO_DATE('25/05/2019', 'dd/mm/yy'));

INSERT INTO tb_funcionario
    VALUES ('55566621111', 'Junior Tavares',to_date('07/05/1992', 'dd/mm/yy'),'M', tp_telefones(tp_telefone('993277733')), tp_endereco('Olinda', 'Rio Doce', '05', 'Casa', 'Pernambuco', '57178899'), 'Segurança', 3200.00, TO_DATE('22/07/2020', 'dd/mm/yy'));


--FALTA PASSAR PARA OR:
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

INSERT INTO tb_medicamento VALUES (
    tp_medicamento('Xeomin')
);

INSERT INTO tb_medicamento VALUES (
    tp_medicamento('Aloxidil')
);

INSERT INTO tb_medicamento VALUES (
    tp_medicamento('Pantogar Neo')
);

INSERT INTO tb_medicamento VALUES (
    tp_medicamento('Avicis')
);

INSERT INTO tb_medicamento VALUES (
    tp_medicamento('Finalop')
);

INSERT INTO tb_medicamento VALUES (
    tp_medicamento('Finasterida')
);

INSERT INTO tb_medicamento VALUES (
    tp_medicamento('Restylane')
);

INSERT INTO tb_medicamento VALUES (
    tp_medicamento('Helioral')
);


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

INSERT INTO tb_compra VALUES (
    tp_compra (TO_TIMESTAMP('12-02-2022 15:25', 'DD-MM-YYYY HH24:MI')),
    (SELECT REF(c) FROM tb tb_cliente c WHERE c.cpf = '32145678900'),
    tp_nt_produto(tp_produto('Actine', 5.99, 109.99, 10, to_date('12/12/2021', 'dd/mm/yyyy'), to_date('12/12/2026', 'dd/mm/yyyy'), 876))
);

INSERT INTO tb_compra VALUES (
    tp_compra (TO_TIMESTAMP('13-02-2022 09:15', 'DD-MM-YYYY HH24:MI')),
    (SELECT REF(c) FROM tb tb_cliente c WHERE c.cpf = '12146678900'),
    tp_nt_produto(tp_produto('Acnen', 8.99, 200.00, 5, to_date('08/10/2021', 'dd/mm/yyyy'), to_date('20/07/2025', 'dd/mm/yyyy'), 9591))
);

INSERT INTO tb_compra VALUES (
    tp_compra (TO_TIMESTAMP('05-03-2022 16:26', 'DD-MM-YYYY HH24:MI')),
    (SELECT REF(c) FROM tb tb_cliente c WHERE c.cpf = '32146670900'),
    tp_nt_produto(tp_produto('Hidramais', 5.99, 30.00, 40, to_date('01/04/2020', 'dd/mm/yyyy'), to_date('12/08/2023', 'dd/mm/yyyy'), 109))
);

INSERT INTO tb_compra VALUES (
    tp_compra (TO_TIMESTAMP('25-01-2022 14:17', 'DD-MM-YYYY HH24:MI')),
    (SELECT REF(c) FROM tb tb_cliente c WHERE c.cpf = '32146677900'),
    tp_nt_produto(tp_produto('Acnex', 1.99, 110.98, 3, to_date('03/06/2018', 'dd/mm/yyyy'), to_date('21/03/2025', 'dd/mm/yyyy'), 74))
);

INSERT INTO tb_compra VALUES (
    tp_compra (TO_TIMESTAMP('16-03-2022 08:13', 'DD-MM-YYYY HH24:MI')),
    (SELECT REF(c) FROM tb tb_cliente c WHERE c.cpf = '32146678900'),
    tp_nt_produto(tp_produto('Sunless', 20.50, 50.98, 40, to_date('02/09/2021', 'dd/mm/yyyy'), to_date('11/04/2024', 'dd/mm/yyyy'), 1756))
);

INSERT INTO tb_compra VALUES (
    tp_compra (TO_TIMESTAMP('24-02-2022 10:05', 'DD-MM-YYYY HH24:MI')),
    (SELECT REF(c) FROM tb tb_cliente c WHERE c.cpf = '32146677900'),
    tp_nt_produto(tp_produto('UVSafe', 25.50, 69.99, 25, to_date('01/09/2020', 'dd/mm/yyyy'), to_date('09/03/2022', 'dd/mm/yyyy'), 4887))
);


/*povoamento supervisiona*/

INSERT INTO tb_supervisiona VALUES (
    tp_supervisiona(
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '32146679900'),
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '32177765322'),
        'Boa')
);

INSERT INTO tb_supervisiona VALUES (
    tp_supervisiona(
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '32146578900'),
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '32146679900'),
        'Ótimo')
);

INSERT INTO tb_supervisiona VALUES (
    tp_supervisiona(
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '55511121900'),
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '67885321900'),
        'Desejável')
);

INSERT INTO tb_supervisiona VALUES (
    tp_supervisiona(
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '12246221900'),
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '17846781900'),
        'Desejável')
);

INSERT INTO tb_supervisiona VALUES (
    tp_supervisiona(
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '32177765322'),
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '67885321900'),
        'Boa')
);

INSERT INTO tb_supervisiona VALUES (
    tp_supervisiona(
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '12246221900'),
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '32146679900'),
        'Ótimo')
);

INSERT INTO tb_supervisiona VALUES (
    tp_supervisiona(
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '32146578900'),
        (SELECT REF(f) FROM tp_funcionario f WHERE f.cpf = '17846781900'),
        'Boa')
);

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
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146679900', '32145678900', '01', TO_TIMESTAMP('06-02-2022 14:20', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146578900', '32146678900', '03', TO_TIMESTAMP('07-08-2021 09:32', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146578900', '32145678900', '02', TO_TIMESTAMP('07-08-2021 10:47', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146578900', '32146670900', '04', TO_TIMESTAMP('10-09-2021 16:08', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146679900', '12146678900', '09', TO_TIMESTAMP('08-02-2022 10:47', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146578900', '32145678900', '09', TO_TIMESTAMP('15-11-2021 08:53', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146578900', '12146678900', '01', TO_TIMESTAMP('01-10-2021 13:30', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146679900', '32146670900', '05', TO_TIMESTAMP('11-02-2022 15:12', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146679900', '32146677900', '01', TO_TIMESTAMP('12-02-2021 10:47', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146578900', '32145678900', '01', TO_TIMESTAMP('06-12-2021 11:00', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146578900', '32146678900', '01', TO_TIMESTAMP('06-01-2021 07:00', 'DD-MM-YYYY HH24:MI'));
INSERT INTO Atende(cpf_funcionario, cpf_cliente, id_servico, datahora_atende)
    VALUES ('32146679900', '12146678900', '01', TO_TIMESTAMP('27-02-2022 09:10', 'DD-MM-YYYY HH24:MI'));


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
    VALUES ('12146678900', '67885321900', TO_TIMESTAMP('27-02-2022 09:18', 'DD-MM-YYYY HH24:MI'), 'Finalop');
INSERT INTO Consulta(cpf_cliente, cpf_medico, datahora_consulta, nome_medicamento)
    VALUES ('12146678900', '55511121900', TO_TIMESTAMP('14-03-2022 10:50', 'DD-MM-YYYY HH24:MI'), NULL);