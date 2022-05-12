-- Clientes que moram em casa
SELECT nome FROM tb_cliente WHERE endereco.complemento = "Casa";
-- Clientes que são mulheres
SELECT nome FROM tb_cliente WHERE genero = "F";