CREATE SEQUENCE servico_id INCREMENT BY 1 START WITH 1;
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI';

-- TODO Nos atributos que são REF os povoamentos devem ser com select

-- TODO falta povoar fornecedor, produto, tipo produto e consulta

-- POVOAMENTO PESSOA

INSERT INTO tb_cliente VALUES (
    tp_cliente('32145678900', 'Bruna Alves',to_date('15/07/2001', 'dd/mm/yy'),'F', tp_arr_telefones(tp_telefone('992199222')), tp_endereco('Recife', 'Jaguaribe', '78', 'Casa', 'Pernambuco', '50610510'), 'Unimed')
);

INSERT INTO tb_cliente VALUES (
    tp_cliente('32146678900', 'Artur Carvalho',to_date('28/08/2001', 'dd/mm/yy'),'M', tp_arr_telefones(tp_telefone('991681119'), tp_telefone('988886543')), tp_endereco('Recife', 'Santos Dumont', '456', 'Apartamento', 'Pernambuco', '50350510'), 'Sulamerica')
);

INSERT INTO tb_cliente VALUES (
    tp_cliente('32146670900', 'Gustavo Campos',to_date('10/12/2001', 'dd/mm/yy'),'M', tp_arr_telefones(tp_telefone('988346613')), tp_endereco('Recife', 'Tabaiares', '886', 'Apartamento', 'Pernambuco', '50350511'), 'Hapvida')
);

INSERT INTO tb_cliente VALUES (
    tp_cliente('12146678900', 'Lucas Cavalcanti',to_date('07/03/2001', 'dd/mm/yy'),'M', tp_arr_telefones(tp_telefone('988338212'),tp_telefone('988335566')), tp_endereco('Recife', 'Sport Clube do Recife', '586', 'Apartamento', 'Pernambuco', '50351511'), 'Notredame')
);

INSERT INTO tb_cliente VALUES (
    tp_cliente('32146677900', 'Ana Carla Guerra',to_date('26/03/2001', 'dd/mm/yy'),'F', tp_arr_telefones(tp_telefone('994025554')), tp_endereco('Recife', 'Engenheiro Sampaio', '199', 'Casa', 'Pernambuco', '58881599'), 'Fachesf')
);


INSERT INTO tb_funcionario VALUES (
    tp_funcionario('32146679900', 'Matheus Frej',to_date('10/10/2001', 'dd/mm/yy'),'M', tp_arr_telefones(tp_telefone('994022444')), tp_endereco('Recife', 'Sigismundo Gonçalves', '230', 'Apartamento', 'Pernambuco', '51351511'), 'Recepcionista', 2200.00, TO_DATE('01/02/2022', 'dd/mm/yy'),
        NULL, NULL)
);

INSERT INTO tb_funcionario VALUES (
    tp_funcionario('32146578900', 'Raissa Heimann',to_date('30/03/2001', 'dd/mm/yy'),'F', tp_arr_telefones(tp_telefone('994022333')), tp_endereco('Recife', 'Boa Viagem', '20', 'Apartamento', 'Pernambuco', '51371511'), 'Recepcionista', 2200.00, TO_DATE('05/08/2021', 'dd/mm/yy'),
        NULL, NULL)
);

INSERT INTO tb_funcionario VALUES (
    tp_funcionario('32177765322', 'Gilberto Luiz',to_date('02/10/1980', 'dd/mm/yy'),'M', tp_arr_telefones(tp_telefone('993777710')), tp_endereco('Camaragibe', 'Estação Nova', '100', 'Casa', 'Pernambuco', '57161111'), 'Segurança', 3200.00, TO_DATE('25/05/2019', 'dd/mm/yy'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146679900'), 'Ruim')
);

INSERT INTO tb_funcionario VALUES (
    tp_funcionario('55566621111', 'Junior Tavares',to_date('07/05/1992', 'dd/mm/yy'),'M', tp_arr_telefones(tp_telefone('993277733')), tp_endereco('Olinda', 'Rio Doce', '05', 'Casa', 'Pernambuco', '57178899'), 'Segurança', 3200.00, TO_DATE('22/07/2020', 'dd/mm/yy'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32177765322'), 'Excelente')
);

INSERT INTO tb_medico VALUES (
    tp_medico('32246678900', 'Maria do Socorro Alves',to_date('09/09/2001', 'dd/mm/yy'),'F', tp_arr_telefones(tp_telefone('999287566'), tp_telefone('999287500'), tp_telefone('999547566')), tp_endereco('Recife', 'Dom Manoel da Costa', '117', 'Casa', 'Pernambuco', '58881511'), 'Médico', 3000.00, TO_DATE('07/07/2018', 'dd/mm/yy'),
        NULL, NULL, '123')
);

INSERT INTO tb_medico VALUES (
    tp_medico('67885321900', 'Tiago Medeiros',to_date('30/05/1977', 'dd/mm/yy'),'M', tp_arr_telefones(tp_telefone('992155111')), tp_endereco('Recife', 'Boa Viagem', '220', 'Casa', 'Pernambuco', '51111221'), 'Médico', 2000.00, TO_DATE('01/10/2019', 'dd/mm/yy'),
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '32246678900'), 'Bom', '345')
);

INSERT INTO tb_medico VALUES (
    tp_medico('17846781900', 'Sabrina Rocha',to_date('02/07/1967', 'dd/mm/yy'),'F', tp_arr_telefones(tp_telefone('993345211')), tp_endereco('Recife', 'Ilha do Leite', '333', 'Casa', 'Pernambuco', '51121221'), 'Médico', 2000.00, TO_DATE('01/10/2019', 'dd/mm/yy'),
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '67885321900'), 'Excelente', '567')
);

INSERT INTO tb_medico VALUES (
    tp_medico('12246221900', 'Walmir Bispo',to_date('05/10/1972', 'dd/mm/yy'), 'M', tp_arr_telefones(tp_telefone('993100017')), tp_endereco('Recife', 'Cajueiro', '111', 'Casa', 'Pernambuco', '51155521'), 'Médico', 3500.00, TO_DATE('22/04/2020', 'dd/mm/yy'),
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '32246678900'), 'Satisfatório', '789')
);

INSERT INTO tb_medico VALUES (
    tp_medico('55511121900', 'Jean Carlos',to_date('02/11/1992', 'dd/mm/yy'),'M', tp_arr_telefones(tp_telefone('993103010'), tp_telefone('991586284')), tp_endereco('Recife', 'Rosa e Silva', '95', 'Casa', 'Pernambuco', '57740821'), 'Médico', 4500.00, TO_DATE('09/09/2019', 'dd/mm/yy'),
        NULL, NULL, '999')
);

INSERT INTO tb_medico VALUES (
    tp_medico('32217721111', 'Meiry Lanunce',to_date('02/11/1969', 'dd/mm/yy'),'F', tp_arr_telefones(tp_telefone('993111010')), tp_endereco('Olinda', 'Peixinhos', '95', 'Casa', 'Pernambuco', '57123821'), 'Médico', 2500.00, TO_DATE('15/03/2022', 'dd/mm/yy'),
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '55511121900'), 'Bom', '111')
);


/* povoamento de tb_preco_servico */

INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Consulta', 150.00) );
INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Dermatoscopia', 240.00) );
INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Cirurgia Dermatológica', 500.00) );
INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Toxina botulínica', 100.00) );
INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Biópsia', 120.00) ); 
INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Exames básicos', 400.00) );
INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Cauterização química', 210.00) );
INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Crioterapia', 500.00) );
INSERT INTO tb_preco_servico VALUES ( tp_preco_servico('Curetagem', 50.00) );

-- POVOAMENTO SERVICO

INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL,  (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Consulta')) );
INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL, (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Dermatoscopia')) );
INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL, (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Cirurgia Dermatológica')) );
INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL, (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Toxina botulínica')) );
INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL, (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Biópsia')) );
INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL, (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Exames básicos')) );
INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL, (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Cauterização química')) );
INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL, (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Crioterapia')) );
INSERT INTO tb_servico VALUES ( tp_servico(servico_id.NEXTVAL, (SELECT REF(p) FROM tb_preco_servico p WHERE p.tipo_servico = 'Curetagem')) );

/* povoamento de Medicamentos */
/*
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
*/

/*povoamento de Atende (CPF_func, CP_cliente e id_serviço precisam existir nas outras tabelas*/ 

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32145678900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146679900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '01' ),
        TO_TIMESTAMP('06-02-2022 14:20', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146678900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146578900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '03' ),
        TO_TIMESTAMP('07-08-2021 09:32', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32145678900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146578900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '02' ),
        TO_TIMESTAMP('07-08-2021 09:15', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146670900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146578900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '04' ),
        TO_TIMESTAMP('10-09-2021 16:08', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '12146678900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146679900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '09' ),
        TO_TIMESTAMP('08-02-2022 10:47', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146670900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146679900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '05' ),
        TO_TIMESTAMP('11-02-2022 15:12', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '12146678900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146679900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '01' ),
        TO_TIMESTAMP('27-02-2022 09:10', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146678900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146578900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '01' ),
        TO_TIMESTAMP('06-01-2021 07:00', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_atende VALUES (
    tp_atende(
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146677900'),
        (SELECT REF(f) FROM tb_funcionario f WHERE f.cpf = '32146679900'),
        (SELECT REF(s) FROM tb_servico s WHERE s.id = '01' ),
        TO_TIMESTAMP('12-02-2021 10:47', 'DD-MM-YYYY HH24:MI')
    )

);

INSERT INTO tb_fornecedor VALUES (
    tp_fornecedor(
        '44328278000168',
        'Grupo Acripel',
        tp_tipos_produtos_fornecidos('Acne', NULL),
        tp_fornece(
            tp_produto('Actine', 5.99, 109.99, 10, to_date('12/12/2021', 'dd/mm/yyyy'), to_date('12/12/2026', 'dd/mm/yyyy'), 876)
        )
    )
);

INSERT INTO tb_fornecedor VALUES (
    tp_fornecedor(
        '54640597000168',
        'Dermage',
        tp_tipos_produtos_fornecidos('Acne', 'Hidratante'),
        tp_fornece(
            tp_produto('Acnen', 8.99, 200.00, 5, to_date('08/10/2021', 'dd/mm/yyyy'), to_date('20/07/2025', 'dd/mm/yyyy'), 9591),
            tp_produto('Hidramais', 5.99, 30.00, 40, to_date('01/04/2020', 'dd/mm/yyyy'), to_date('12/08/2023', 'dd/mm/yyyy'), 109)
        )
    )
);

INSERT INTO tb_fornecedor VALUES (
    tp_fornecedor(
        '44037886000113',
        'Pharmapele',
        tp_tipos_produtos_fornecidos('Acne', NULL),
        tp_fornece(
            tp_produto('Acnex', 1.99, 110.98, 3, to_date('03/06/2018', 'dd/mm/yyyy'), to_date('21/03/2025', 'dd/mm/yyyy'), 74)
        )
    )
);

INSERT INTO tb_fornecedor VALUES (
    tp_fornecedor(
        '67873558000152',
        'DISTRIFARMA',
        tp_tipos_produtos_fornecidos('Filtro Solar', NULL),
        tp_fornece(
            tp_produto('UVSafe', 25.50, 69.99, 25, to_date('01/09/2020', 'dd/mm/yyyy'), to_date('09/03/2022', 'dd/mm/yyyy'), 4887)
        )
    )
);

INSERT INTO tb_fornecedor VALUES (
    tp_fornecedor(
        '72727498000108',
        'Amigo Fiel',
        tp_tipos_produtos_fornecidos('Pomada', NULL),
        tp_fornece(
            tp_produto('Hipoalergenico', 12.50, 40.99, 69, to_date('02/05/2020', 'dd/mm/yyyy'), to_date('11/03/2026', 'dd/mm/yyyy'), 975)
        )
    )
);

INSERT INTO tb_fornecedor VALUES (
    tp_fornecedor(
        '56823657000103',
        'Centralerg',
        tp_tipos_produtos_fornecidos('Filtro Solar', NULL),
        tp_fornece(
            tp_produto('Sunless', 20.50, 50.98, 40, to_date('02/09/2021', 'dd/mm/yyyy'), to_date('11/04/2024', 'dd/mm/yyyy'), 1756)
        )
    )
);

INSERT INTO tb_consulta VALUES (
    tp_consulta(
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '32246678900'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32145678900'),
        tp_prescreve( 
            tp_medicamento('Helioral'),
            tp_medicamento('Pantogar Neo')
        ),
        TO_TIMESTAMP('06-02-2022 14:28', 'DD-MM-YYYY HH24:MI')
    )
);

INSERT INTO tb_consulta VALUES (
    tp_consulta(
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '32246678900'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146678900'),
        tp_prescreve( 
            tp_medicamento('Xeomin')
        ),
        TO_TIMESTAMP('06-12-2021 11:05', 'DD-MM-YYYY HH24:MI')
    )
);

INSERT INTO tb_consulta VALUES (
    tp_consulta(
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '67885321900'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146678900'),
        tp_prescreve( 
            tp_medicamento('Finasterida')
        ),
        TO_TIMESTAMP('06-12-2021 10:04', 'DD-MM-YYYY HH24:MI')
    )
);

INSERT INTO tb_consulta VALUES (
    tp_consulta(
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '17846781900'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146670900'),
        tp_prescreve( 
            tp_medicamento('Avicis')
        ),
        TO_TIMESTAMP('06-01-2021 07:07', 'DD-MM-YYYY HH24:MI')
    )
);

INSERT INTO tb_consulta VALUES (
    tp_consulta(
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '17846781900'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '12146678900'),
        tp_prescreve( 
            tp_medicamento('Restylane')
        ),
        TO_TIMESTAMP('06-02-2022 14:20', 'DD-MM-YYYY HH24:MI')
    )
);

INSERT INTO tb_consulta VALUES (
    tp_consulta(
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '12246221900'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146677900'),
        tp_prescreve( 
            tp_medicamento('Aloxidil')
        ),
        TO_TIMESTAMP('12-02-2022 10:50', 'DD-MM-YYYY HH24:MI')
    )
);

INSERT INTO tb_consulta VALUES (
    tp_consulta(
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '55511121900'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146677900'),
        tp_prescreve( 
            tp_medicamento('Finalop')
        ),
        TO_TIMESTAMP('27-02-2022 09:18', 'DD-MM-YYYY HH24:MI')
    )
);

INSERT INTO tb_consulta VALUES (
    tp_consulta(
        (SELECT REF(m) FROM tb_medico m WHERE m.cpf = '55511121900'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32145678900'),
        tp_prescreve(),
        TO_TIMESTAMP('14-03-2022 10:50', 'DD-MM-YYYY HH24:MI')
    )
);


INSERT INTO tb_compra VALUES (
    tp_compra(
        TO_TIMESTAMP('12-02-2022 15:25', 'DD-MM-YYYY HH24:MI'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32145678900'),
        tp_fornece(
            (SELECT VALUE(p) FROM TABLE(SELECT f.produtos FROM tb_fornecedor f WHERE f.cnpj = '44328278000168') p WHERE p.nome_comercial = 'Actine')
        )
    )
);

INSERT INTO tb_compra VALUES (
    tp_compra(
        TO_TIMESTAMP('13-02-2022 09:15', 'DD-MM-YYYY HH24:MI'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '12146678900'),
        tp_fornece(
            (SELECT VALUE(p) FROM TABLE(SELECT f.produtos FROM tb_fornecedor f WHERE f.cnpj = '54640597000168') p WHERE p.nome_comercial = 'Acnen')
        )
    )
);

INSERT INTO tb_compra VALUES (
    tp_compra(
        TO_TIMESTAMP('05-03-2022 16:26', 'DD-MM-YYYY HH24:MI'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146670900'),
        tp_fornece(
            (SELECT VALUE(p) FROM TABLE(SELECT f.produtos FROM tb_fornecedor f WHERE f.cnpj = '54640597000168') p WHERE p.nome_comercial = 'Hidramais')
        )
    )
);

INSERT INTO tb_compra VALUES (
    tp_compra (
        TO_TIMESTAMP('25-01-2022 14:17', 'DD-MM-YYYY HH24:MI'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '12146678900'),
        tp_fornece(
            (SELECT VALUE(p) FROM TABLE(SELECT f.produtos FROM tb_fornecedor f WHERE f.cnpj = '44037886000113') p WHERE p.nome_comercial = 'Acnex')
        )
    )
);

INSERT INTO tb_compra VALUES (
    tp_compra (
        TO_TIMESTAMP('16-03-2022 08:13', 'DD-MM-YYYY HH24:MI'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146670900'),
        tp_fornece(
            (SELECT VALUE(p) FROM TABLE(SELECT f.produtos FROM tb_fornecedor f WHERE f.cnpj = '56823657000103') p WHERE p.nome_comercial = 'Sunless')
        )
    )
);

INSERT INTO tb_compra VALUES (
    tp_compra (
        TO_TIMESTAMP('24-02-2022 10:05', 'DD-MM-YYYY HH24:MI'),
        (SELECT REF(c) FROM tb_cliente c WHERE c.cpf = '32146677900'),
        tp_fornece(
            (SELECT VALUE(p) FROM TABLE(SELECT f.produtos FROM tb_fornecedor f WHERE f.cnpj = '67873558000152') p WHERE p.nome_comercial = 'UVSafe')
        )
    )
);