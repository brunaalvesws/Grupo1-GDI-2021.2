-- Clientes que moram em casa
SELECT C.nome FROM tb_cliente C WHERE C.endereco.complemento = 'Casa';
-- Clientes que são mulheres
SELECT nome FROM tb_cliente WHERE genero = 'M';

---- CONSULTAs Compra ----

---- Consulta Primária Compra ----
SELECT DEREF(C.cliente_consulta).cpf, DEREF(C.medico_consulta).cpf, datahora_consulta FROM tb_consulta C;
/
SELECT C.cliente_consulta.cpf AS cliente, C.medico_consulta.cpf AS medico, datahora_consulta FROM tb_consulta C;
/
---- Consultas no mês de fereveiro  ----

SELECT DEREF(C.cliente_consulta).cpf, DEREF(C.medico_consulta).cpf, datahora_consulta FROM tb_consulta C    
    WHERE TO_CHAR(C.datahora_consulta,'DD-MM-YYYY HH24:MI') LIKE '__-02-2022%';
/

---- Quantidade de medicamentos por consulta ----
select DEREF(C.cliente_consulta).nome, C.datahora_consulta, (select count(*) from table(C.medicamentos_prescritos))
    from tb_consulta C;
/

select DEREF(C.cliente_consulta).nome, C.datahora_consulta from tb_consulta C where (select count(*) from table(C.medicamentos_prescritos)) = 0;
/

---- Quantidades de consultas em um mês por ano ----

SELECT COUNT(*) as Quantidade, to_char(C.datahora_consulta, 'YYYY-MM') as Mês
    FROM tb_consulta C
    GROUP BY to_char(C.datahora_consulta, 'YYYY-MM')
    order by 1;

---- Quantidades de consultas em um mês ----

SELECT COUNT(*) as Quantidade, to_char(C.datahora_consulta, 'MM') as Mês
    FROM tb_consulta C
    GROUP BY to_char(C.datahora_consulta, 'MM')
    order by 1;

/**
Gustavo:
    Fornecedor e Consulta 

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
