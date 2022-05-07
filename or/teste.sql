----- POVOAMENTO DETALHAMENTO -----
INSERT INTO  tb_detalhamento VALUES (
    tp_detalhamento(
        (SELECT REF(P) FROM tb_pedido P WHERE P.data_pedido = '01-JAN-2020 17:00'),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '1'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '90'),
        (SELECT nome_prato FROM TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '90') WHERE codigo = 110)
    )
);
/
INSERT INTO  tb_detalhamento VALUES (
    tp_detalhamento(
        (SELECT REF(P) FROM tb_pedido P WHERE P.data_pedido = '01-JAN-2021 17:00'),
        (SELECT REF(C) FROM tb_cliente C WHERE C.cpf = '2'),
        (SELECT REF(R) FROM tb_restaurante R WHERE R.cnpj = '91'),
        (SELECT nome_prato FROM TABLE(SELECT R.pratos FROM tb_restaurante R WHERE R.cnpj = '91') WHERE codigo = 220)
    )
);
/