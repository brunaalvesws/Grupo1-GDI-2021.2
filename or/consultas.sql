-- Clientes que moram em casa
SELECT C.nome FROM tb_cliente C WHERE C.endereco.complemento = 'Casa';
-- Clientes que são mulheres
SELECT nome FROM tb_cliente WHERE genero = 'M';

---- Consultas Compra ----
SELECT DEREF(C.cliente_compra).nome, C.datahora_compra FROM tb_compra C;
SELECT C.cliente_compra.nome AS cliente, C.datahora_compra AS DataHora FROM tb_compra C;
/

---- Consultas no mês de março ----
SELECT DEREF(C.cliente_compra).nome, datahora_compra FROM tb_compra C    
    WHERE TO_CHAR(C.datahora_compra,'DD-MM-YYYY HH24:MI') LIKE '__-03-2022%';
/

---- Quantidade de produtos por compra ----
SELECT DEREF(C.cliente_compra).nome, C.datahora_compra, 
    (SELECT count(*) FROM TABLE(C.produto_compra))
    FROM tb_compra C;
/

---- Compras com mais de um produto ----
SELECT DEREF(C.cliente_compra).nome, C.datahora_compra 
    FROM tb_compra C
    WHERE (SELECT count(*) from table(C.produto_compra)) > 1;
/

---- Quantidades de compras em um mês ----

SELECT COUNT(*) as Quantidade, to_char(C.datahora_compra, 'YYYY-MM') as Mês
    FROM tb_compra C
    GROUP BY to_char(C.datahora_compra, 'YYYY-MM')
    order by 1;
/
---- Quantidades de consultas em um mês ----

SELECT COUNT(*) as Quantidade, to_char(C.datahora_compra, 'MM') as Mês
    FROM tb_compra C
    GROUP BY to_char(C.datahora_compra, 'MM')
    order by 1;
/

---- Todos medicamentos em uma consulta ----
SELECT * FROM TABLE(SELECT C.produto_compra
    FROM tb_compra C WHERE C.datahora_compra = TO_TIMESTAMP('06-02-2022 14:28', 'DD-MM-YYYY HH24:MI'));
SELECT * FROM TABLE(SELECT C.produto_compra
    FROM tb_compra C WHERE C.datahora_compra = TO_TIMESTAMP('06-12-2021 11:05', 'DD-MM-YYYY HH24:MI'));
SELECT * FROM TABLE(SELECT C.produto_compra
    FROM tb_compra C WHERE C.datahora_compra = TO_TIMESTAMP('06-12-2021 10:04', 'DD-MM-YYYY HH24:MI'));
/

---- Todos medicamentos em todas consultas ----
SELECT C.cliente_compra.nome, C.datahora_compra, M.nome_comercial
    FROM tb_compra C, TABLE(C.produto_compra) M;
/

---- Consultas Consulta ----

---- Consulta Primária Consulta ----
SELECT DEREF(C.cliente_consulta).cpf, DEREF(C.medico_consulta).cpf, datahora_consulta FROM tb_consulta C;
/
SELECT C.cliente_consulta.cpf AS cliente, C.medico_consulta.cpf AS medico, datahora_consulta FROM tb_consulta C;
/
---- Consultas no mês de fereveiro  ----

SELECT DEREF(C.cliente_consulta).cpf, DEREF(C.medico_consulta).cpf, datahora_consulta FROM tb_consulta C    
    WHERE TO_CHAR(C.datahora_consulta,'DD-MM-YYYY HH24:MI') LIKE '__-02-2022%';
/

---- Quantidade de medicamentos por consulta ----
SELECT DEREF(C.cliente_consulta).nome, C.datahora_consulta, (SELECT count(*) FROM TABLE(C.medicamentos_prescritos))
    FROM tb_consulta C;
/

-- Consultas onde não foram dados medicamentos --

SELECT DEREF(C.cliente_consulta).nome, C.datahora_consulta 
    FROM tb_consulta C
    WHERE (SELECT count(*) from table(C.medicamentos_prescritos)) = 0;
/

---- Quantidades de consultas em um mês por ano ----

SELECT COUNT(*) as Quantidade, to_char(C.datahora_consulta, 'YYYY-MM') as Mês
    FROM tb_consulta C
    GROUP BY to_char(C.datahora_consulta, 'YYYY-MM')
    order by 1;
/
---- Quantidades de consultas em um mês ----

SELECT COUNT(*) as Quantidade, to_char(C.datahora_consulta, 'MM') as Mês
    FROM tb_consulta C
    GROUP BY to_char(C.datahora_consulta, 'MM')
    order by 1;
/
---- Todos medicamentos em uma consulta ----
SELECT * FROM TABLE(SELECT C.medicamentos_prescritos
    FROM tb_consulta C WHERE C.datahora_consulta = TO_TIMESTAMP('06-02-2022 14:28', 'DD-MM-YYYY HH24:MI'));
SELECT * FROM TABLE(SELECT C.medicamentos_prescritos
    FROM tb_consulta C WHERE C.datahora_consulta = TO_TIMESTAMP('06-12-2021 11:05', 'DD-MM-YYYY HH24:MI'));
SELECT * FROM TABLE(SELECT C.medicamentos_prescritos
    FROM tb_consulta C WHERE C.datahora_consulta = TO_TIMESTAMP('06-12-2021 10:04', 'DD-MM-YYYY HH24:MI'));
/

---- Todos medicamentos em todas consultas ----
SELECT C.cliente_consulta.nome, C.datahora_consulta, M.nome
    FROM tb_consulta C, TABLE(C.medicamentos_prescritos) M;
/

----Consulta os serviços que tem preço entre 50 e 200----
SELECT * FROM tb_preco_servico WHERE preco_servico BETWEEN 50 AND 200;
/
----Consulta retorna o id o serviço e o valor sendo ordenado do menor valor para o maior valor----

SELECT id, S.preco.tipo_servico,  S.preco.preco_servico FROM tb_servico S ORDER BY S.preco.preco_servico;
/

----ORDER MEMBER FUNCTION----

DECLARE
    aux NUMBER;
    preco1 tp_preco_servico;
    preco2 tp_preco_servico;
BEGIN
    SELECT VALUE(p) INTO preco1 FROM tb_preco_servico p WHERE tipo_servico = 'Dermatoscopia';
    SELECT VALUE(p) INTO preco2 FROM tb_preco_servico p WHERE tipo_servico = 'Crioterapia';
    aux := preco1.compararpservico(preco2);
    IF aux = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Os serviços têm o mesmo preço');
    ELSIF aux = -1 THEN
        DBMS_OUTPUT.PUT_LINE('O produto: ' || TO_CHAR(preco2.tipo_servico) || 'é mais caro!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O produto: ' || TO_CHAR(preco1.tipo_servico) || 'é mais caro!');
    END IF;
END;
/
/**
Gustavo: consultas com varrays
*/
-- Imprime os tipos de produtos fornecidos pelo fornecedor de CNPJ 54640597000168 em ordem descrescente
DECLARE
    arr tp_arr_tipos_produtos_fornecidos;
BEGIN
    SELECT f.tipos_produtos INTO arr FROM tb_fornecedor f WHERE f.cnpj = '54640597000168';
    FOR rec IN ( SELECT COLUMN_VALUE tipo_produto FROM TABLE (arr) ORDER BY tipo_produto DESC )  
    LOOP 
        DBMS_OUTPUT.PUT_LINE(rec.tipo_produto);  
    END LOOP;
END;
/
/*Output:
Hidratante
Acne
*/
-- Médicos que possuem ao menos um telefone reserva
DECLARE
    arr tp_arr_telefones;
BEGIN
    FOR cur IN ( SELECT m.telefones, m.nome FROM tb_medico m )  
    LOOP
        IF cur.telefones.COUNT > 1 THEN
            DBMS_OUTPUT.PUT_LINE(cur.nome || ' possui ao menos um telefone reserva');  
        END IF;
    END LOOP;
END;
/
/*Output:
Maria do Socorro Alves possui ao menos um telefone reserva
Jean Carlos possui ao menos um telefone reserva
*/
-- Consulta primária a VARRAY telefones da tabela de clientes (antes do update)
SELECT c.nome, c.cpf, t.* FROM tb_cliente c, TABLE(c.telefones) t;
/

-- Caso o cliente tenha um telefone reserva, ele deve vir DEPOIS na ordem lexicográfica
DECLARE
    arr tp_arr_telefones;
BEGIN
    FOR cur IN ( SELECT c.telefones, c.cpf, c.nome FROM tb_cliente c )  
    LOOP
        IF cur.telefones.COUNT = 2 AND cur.telefones(1).telefone > cur.telefones(2).telefone THEN
            arr := tp_arr_telefones(cur.telefones(2), cur.telefones(1));
            UPDATE tb_cliente c SET c.telefones = arr WHERE c.cpf = cur.cpf;
        END IF;
    END LOOP;
END;
/

-- Consulta primária a VARRAY telefones da tabela de clientes (após o update)
SELECT c.nome, c.cpf, t.* FROM tb_cliente c, TABLE(c.telefones) t;
/

--- Retorna cpf, nome e salario dos funcionários que residem na cidade do Recife.
SELECT F.cpf, F.nome, F.salario FROM tb_funcionario F WHERE F.endereco.cidade = 'Recife';
/
--- Retorna cpf, nome e salario dos médicos que são funcionários e ganham mais de 3000.00 ---
SELECT M.crm, M.nome FROM tb_medico M WHERE M.salario > 3000.00
/
--- Retorna os clientes atendidos e os serviços vendidos pelo funcionário (a) Raissa Heimann ---
SELECT DEREF(A.cliente_atendimento).nome, A.servico_atendimento FROM tb_atende A WHERE DEREF(A.funcionario_atendimento).nome = 'Raissa Heimann';
/
--ORDENA OS PRODUTOS, DO MAIOR PRO MENOR, POR QUANTIDADE EM ESTOQUE
SELECT P.nome_comercial, P.estoque FROM nt_produtos_compra P ORDER BY P.comparaEstoque() DESC;
/
-- Retorna o salário anual dos médicos que ganham mais do que 30mil no ano
SELECT M.crm, M.salarioAnual() FROM tb_medico M WHERE M.salarioAnual() > 30000.00;
/

/**
Filipe:
    Compra

Rodrigo:
    preco serviço e servico

Bruna:
    Cliente

Carlos:
    Funcionario, Atende

Walmir:
    Médico
**/
