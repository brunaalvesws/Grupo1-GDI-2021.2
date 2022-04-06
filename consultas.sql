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
SELECT P.nome, F.salario FROM Pessoa P, Funcionario F 
    WHERE P.cpf = F.cpf AND P.genero = 'F' and F.salario > ANY 
    (SELECT F.salario FROM Funcionario F, Pessoa P WHERE P.genero = 'M');

--MIN, CREATE VIEW
-- Criar uma view que mostre o estoque que tá mais perto de acabar
CREATE VIEW Estoque_critico(nome_comercial,estoque) AS SELECT nome_comercial, estoque 
    FROM Produto WHERE estoque IN (SELECT MIN(estoque) FROM Produto);

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

/*Rodrigo
5. DELETE
11. INNER JOIN
17. SUBCONSULTA COM OPERADOR RELACIONAL
23. HAVING
*/

/*5.DELETE
Descrição: Remoção de um medicamento da tabela Medicamento.*/
DELETE FROM Medicamento
    WHERE nome = 'Xeomin';

/*11. INNER JOIN
Descrição: Será retornado o cpf o nome e o telefone das pessoas.*/
SELECT P.cpf, P.nome, T.telefone FROM Pessoa P
    INNER JOIN Telefone T
    ON P.cpf = T.cpf_p
    ORDER BY P.nome;

/*17. SUBCONSULTA COM OPERADOR RELACIONAL
Descrição: Será retornado o nome comercial, o estoque e o lote da tabela produto que forem vencer antes da data estimada.*/
SELECT Pr.nome_comercial, Pr.estoque, Pr.lote FROM Produto Pr
    WHERE data_de_vencimento <= to_date('21/03/2025', 'dd/mm/yyyy')
    ORDER BY Pr.estoque;

/*23. HAVING
Descrição: Retorna o genero e o número de pessoas, onde os nomes começam com A ou M, caso haja mais que uma.*/
SELECT genero, COUNT(*) FROM Pessoa
    WHERE nome IN(SELECT nome FROM Pessoa 
    WHERE nome like 'A%' or nome like 'M%')
    GROUP BY genero HAVING COUNT(*) > 1;

/* Filipe
9. LIKE
15. COUNT
21. ORDER BY
*/

/* 9. LIKE
Descrição: Seleciona todos cpfs de cliente para consultas que aconteceram no mês de fevereiro de 2022 */
SELECT Consulta.cpf_cliente FROM Consulta 
    WHERE TO_CHAR(Consulta.datahora_consulta,'DD-MM-YYYY HH24:MI') LIKE '__-02-2022%'
    GROUP BY Consulta.cpf_cliente;

/* 15. COUNT
Descrição: Mostra a quantidade de supervisionados para cada supervisor */
SELECT Supervisiona.cpf_supervisor, COUNT(Supervisiona.cpf_supervisionado)
    FROM Supervisiona GROUP BY Supervisiona.cpf_supervisor ORDER BY COUNT(Supervisiona.cpf_supervisionado);

/* 21. ORDER BY
Descrição: Mostra os produtos em ordem crescente de lucro */
SELECT Produto.nome_comercial, (Produto.preco_de_revenda-Produto.preco_de_compra) as Lucro FROM Produto
    ORDER BY (Produto.preco_de_revenda-Produto.preco_de_compra);

/* Filipe
5. CREATE FUNCTION
11. WHILE LOOP
17. CREATE OR REPLACE PACKAGE
*/

/*
5. CREATE FUNCTION
Descrição: Calcula todo o gasto do cliente com serviços e compras
*/
CREATE OR REPLACE FUNCTION totalGastoCliente(cpf_cliente Cliente.cpf_p%TYPE)
RETURN NUMBER
IS
    p_servico Preco_servicos.preco_servico%TYPE;
    p_produto Produto.preco_de_revenda%TYPE;
    retorno Produto.preco_de_revenda%TYPE;
BEGIN

    SELECT SUM(Preco_servicos.preco_servico) INTO p_servico FROM Preco_servicos, Servico, Atende
        Where Atende.cpf_cliente=cpf_cliente AND Servico.id = Atende.id_servico
        AND  Preco_servicos.tipo_servico = Servico.tipo_servico;
    
    SELECT SUM(Produto.preco_de_revenda) INTO p_produto FROM Produto, Compra
        Where Compra.cpf_cliente=cpf_cliente AND Produto.cnpj_fornecedor = Compra.cnpj_fornecedor
        AND Produto.nome_comercial = Compra.nome_comercial;

    retorno := p_produto + p_servico;

    RETURN retorno;
END totalGastoCliente;

/*
11. WHILE LOOP
Descrição: 
*/
CREATE OR REPLACE FUNCTION countServicos(cpf_cliente Cliente.cpf_p%TYPE)
RETURN NUMBER
IS
    i INTEGER;
    x INTEGER;
    aux_preco Preco_servicos.preco_servico%TYPE;
    curr_serv_count NUMBER;
    total_serv NUMBER;
BEGIN
    i := 1;
    total_serv := 0;
    SELECT COUNT(*) INTO x FROM Servico;
    WHILE i < x LOOP
        SELECT Preco_servicos.preco_servico INTO aux_preco FROM Preco_servicos, Servico
            WHERE Servico.id = i AND Preco_servicos.tipo_servico = Servico.tipo_servico;
        
        SELECT COUNT(*) INTO curr_serv_count FROM Atende
            WHERE Atende.cpf_cliente = cpf_cliente AND Atende.id_servico = i;

        total_serv := total_serv + (curr_serv_count * aux_preco);

        i := i + 1;
    END LOOP;
    
    RETURN total_serv;
END countServicos;

/*
17. CREATE OR REPLACE PACKAGE
Descrição: Criação do PACKAGE responsável por criar clientes, funcionarios ou médicos
*/

/* 3. INSERT INTO
Descrição: Pacote contem comandos insert para inserir clientes, funcionarios ou médicos*/
CREATE OR REPLACE PACKAGE cadastros AS
    PROCEDURE new_cliente(aux Pessoa%ROWTYPE, plano_de_saude Cliente.plano_de_saude%TYPE);
    PROCEDURE new_funcionario(aux Pessoa%ROWTYPE, cargo Funcionario.cargo%TYPE,
        salario Funcionario.salario%TYPE, data_admissao Funcionario.data_admissao%TYPE);
    PROCEDURE new_medico(aux Pessoa%ROWTYPE, cargo Funcionario.cargo%TYPE,
        salario Funcionario.salario%TYPE, data_admissao Funcionario.data_admissao%TYPE, crm Medico.crm%TYPE);
END cadastros;

CREATE OR REPLACE PACKAGE BODY cadastros AS
    PROCEDURE new_cliente(aux Pessoa%ROWTYPE, plano_de_saude Cliente.plano_de_saude%TYPE) IS
    BEGIN
        INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
            VALUES (aux.cpf, aux.nome, aux.data_nascimento, aux.genero);

        INSERT INTO Cliente(cpf_p, plano_de_saude)
            VALUES (aux.cpf, plano_de_saude);
    END new_cliente;

    PROCEDURE new_funcionario(aux Pessoa%ROWTYPE, cargo Funcionario.cargo%TYPE,
        salario Funcionario.salario%TYPE, data_admissao Funcionario.data_admissao%TYPE) IS
    BEGIN
        INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
            VALUES (aux.cpf, aux.nome, aux.data_nascimento, aux.genero);

        INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
            VALUES (aux.cpf, cargo, salario, data_admissao);
    END new_funcionario;

    PROCEDURE new_medico(aux Pessoa%ROWTYPE, cargo Funcionario.cargo%TYPE,
        salario Funcionario.salario%TYPE, data_admissao Funcionario.data_admissao%TYPE, crm Medico.crm%TYPE) IS
        BEGIN
        INSERT INTO Pessoa(cpf, nome, data_nascimento, genero)
            VALUES (aux.cpf, aux.nome, aux.data_nascimento, aux.genero);

        INSERT INTO Funcionario(cpf, cargo, salario, data_admissao)
            VALUES (aux.cpf, cargo, salario, data_admissao);

        INSERT INTO Medico(cpf_med, crm) VALUES (aux.cpf, crm);
    END new_medico;
END cadastros;