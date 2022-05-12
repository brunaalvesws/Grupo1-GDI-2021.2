-- Clientes que moram em casa
SELECT nome FROM tb_cliente WHERE endereco.complemento = "Casa";
-- Clientes que são mulheres
SELECT nome FROM tb_cliente WHERE genero = "F";

---- CONSULTAs Compra ----

---- Consulta Primária Compra ----
SELECT DEREF(C.cliente_consulta).cpf, DEREF(C.medico_consulta).cpf, datahora_consulta FROM tb_consulta C;
SELECT C.cliente_consulta.cpf AS cliente, C.medico_consulta.cpf AS medico, datahora_consulta FROM tb_consulta C;
/
---- Consultas no mês de fereveiro  ----

SELECT C.cpf_cliente FROM tb_consulta C
    WHERE TO_CHAR(C.datahora_consulta,'DD-MM-YYYY HH24:MI') LIKE '__-02-2022%'
    GROUP BY C.cpf_cliente;

---- Quantidades de consultas em um mês ----

SELECT COUNT(*), EXTRACT(month from C.data_hora) 
    FROM tb_consulta C
    GROUP BY EXTRACT(month from C.data_hora)
    ORDER BY EXTRACT(month from C.data_hora);

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
