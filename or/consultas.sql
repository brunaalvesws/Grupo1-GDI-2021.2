-- Clientes que moram em casa
SELECT C.nome FROM tb_cliente C WHERE C.endereco.complemento = 'Casa';
-- Clientes que são mulheres
SELECT nome FROM tb_cliente WHERE genero = 'M';