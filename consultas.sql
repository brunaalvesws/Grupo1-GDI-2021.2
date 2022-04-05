/* Bruna
SQL
1. ALTER TABLE - colocar check caso nao ache erro
7. BETWEEN
13. MIN
19. SUBCONSULTA COM ANY
25. CREATE VIEW

PL
3. BLOCO ANÔNIMO
9. CASE WHEN
15. EXCEPTION WHEN
*/
Set serveroutput on;
--ALTER TABLE
--Restrição para evitar que o mesmo funcionário seja seu próprio supervisor
ALTER TABLE Supervisiona 
ADD CHECK (cpf_supervisionado != cpf_supervisor);

-- BETWEEN - operador que substitui >= e <=
-- Consulta: selecionar os serviços que custam entre 100 e 300 reais

SELECT * FROM Preco_servicos WHERE preco_servico BETWEEN 100.00 AND 300.00;

-- SUBCONSULTA COM ANY
-- Consulta: selecionar o nome e salário das funcionárias que ganham mais que algum funcionário
SELECT P.nome, F.salario FROM Pessoa P, Funcionario F WHERE P.cpf = F.cpf AND P.genero = 'F' and F.salario > ANY(SELECT F.salario FROM Funcionario F, Pessoa P WHERE P.genero = 'M');

--MIN, CREATE VIEW
-- Criar uma view que mostre o estoque que tá mais perto de acabar
CREATE VIEW Estoque_critico(nome_comercial,estoque) AS SELECT nome_comercial, estoque FROM Produto WHERE estoque IN (SELECT MIN(estoque) FROM Produto);

--BLOCO ANONIMO, CASE WHEN, EXCEPTION WHEN
-- Informar o serviço realizado em um dia e horário
DECLARE 
    v_datetime TIMESTAMP := TO_TIMESTAMP('15-11-2021 08:53', 'DD-MM-YYYY HH24:MI');
    v_idservico VARCHAR2(255);
    v_servico VARCHAR2(255);
BEGIN
SELECT id_servico INTO v_idservico FROM Atende WHERE datahora_atende = v_datetime;
CASE v_idservico
    WHEN 01 THEN v_servico := 'Consulta';
    WHEN 02 THEN v_servico := 'Dermatoscopia';
    WHEN 03 THEN v_servico := 'Cirurgia Dermatológica';
    WHEN 04 THEN v_servico := 'Toxina botulínica';
    WHEN 05 THEN v_servico := 'Biópsia';
    WHEN 06 THEN v_servico := 'Exames básicos';
    WHEN 07 THEN v_servico := 'Cauterização química';
    WHEN 08 THEN v_servico := 'Crioterapia';
    WHEN 09 THEN v_servico := 'Curetagem';
END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put('Não houve serviço realizado nesse dia e horário.');
END;