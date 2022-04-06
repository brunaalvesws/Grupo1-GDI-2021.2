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

--ALTER TABLE
--Adicionarr chave estrangeira que ficou faltando na tabela consulta em relação à tabela Medicamento
ALTER TABLE Consulta 
ADD CONSTRAINT nomeMedicamento_fkey FOREIGN KEY (nome_medicamento) REFERENCES Medicamento(nome);

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

/*Carlos 

SQL
2. CREATE INDEX
8. IN
14. AVG
20. SUBCONSULTA COM ALL  
26. GRANT / REVOKE       

PL
4. CREATE PROCEDURE      
10. LOOP EXIT WHEN       
16. USO DE PARÂMETROS (IN, OUT ou IN OUT) 
*/

/*2. CREATE INDEX
Descrição: Cria uma estrutura mais otimizada, quando comparado com a leitura padrão de uma tabela, para consulta do campo que foi indexado, neste caso nome_comercial. */

CREATE INDEX idx_nome_comercial ON Compra(nome_comercial);

/*2. IN
Descrição: Retorna os CPFs dos supervisionados que obtiveram uma avaliação Ótima ou Boa. */

SELECT cpf_supervisionado FROM Supervisiona WHERE avaliacao IN ('Ótimo', 'Boa');

/*14. AVG
Descrição: Retorna a média do precos dos serviços ofertados pela clínica. */

SELECT AVG(preco_servico) FROM Preco_servicos;

/*20. SUBCONSULTA COM ALL  
Descrição: Selecionando o CPF, cargo e salário dos médicos que ganham menos do que todos os funcionários que não são médicos. */

SELECT cpf, cargo, salario FROM Funcionario WHERE salario  <ALL ( SELECT salario FROM Funcionario WHERE cargo NOT LIKE 'Médico'); 

/*
26. GRANT E REVOKE
Descrição: Concedendo todos os privilégios de acesso (SELECT, INSERT, DELETE,
UPDATE), para todos os usuário, sobre a tabela Funcionario e removendo em seguida a permissão para deleção, para todos os usuários, sobre a tabela Funcionario.
*/

GRANT ALL PRIVILEGES ON Funcionario TO PUBLIC;
REVOKE DELETE ON Funcionario FROM PUBLIC;

/*PL*/

/*
.4 CREATE PROCEDURE E .16 USO DE PARÂMETROS (IN, OUT ou IN OUT)
Descrição: Criando procedure com parâmetro IN para inserir um medicamento na tabela de Mendicamento.
*/

CREATE OR REPLACE PROCEDURE InserirMedicamento (
nomeMedicamento IN Medicamento.nome%TYPE
) IS
BEGIN
    INSERT INTO Medicamento (nome) VALUES (nomeMedicamento);
END InserirMedicamento;

/*Bloco que chama o procedimento.*/
BEGIN
    InserirMedicamento('Flebon');
END; 

/*10. LOOP EXIT WHEN 
Descrição: Usando como condição de parada a falta de dados no cursor declarado (cursor_func), o LOOP foi programado para armazenar em uma variável (cpfESalario_func) o CPF e o salário dos funcionários que recebem um salário de 2500.00 ou mais. */
DECLARE
    
    i BINARY_INTEGER := 0;
    func_cpf Funcionario.cpf%TYPE;
    func_salario Funcionario.salario%TYPE;
    TYPE funcInfo IS RECORD (salario INTEGER,cpf CHAR(11));
    TYPE TabelaFunc IS TABLE OF funcInfo INDEX BY BINARY_INTEGER;
    cpfESalario_func TabelaFunc;
    CURSOR cursor_func IS SELECT cpf, salario FROM Funcionario;
    
BEGIN
    DBMS_OUTPUT.Put_line('Funcionários que recebem 2500.00 ou mais');
    OPEN cursor_func;
    
        LOOP
            FETCH cursor_func INTO func_cpf, func_salario;
            IF func_salario >= 2500.00 THEN
                cpfESalario_func(i).cpf := func_cpf;
                cpfESalario_func(i).salario := func_salario;
                DBMS_OUTPUT.Put_line(cpfESalario_func(i).cpf || ' ' || cpfESalario_func(i).salario);
                i := i+1;
            END IF;
            EXIT WHEN cursor_func%NOTFOUND;
        END LOOP;
    
    CLOSE cursor_func;
    
END;
/*
Rodrigo
1. USO DE RECORD
7. %ROWTYPE
13. SELECT … INTO
19. CREATE OR REPLACE TRIGGER (COMANDO)*/

/*1. USO DE RECORD
Descrição: Será criado uma nova pessoa e está será inserida na tabela Pessoa, atraves de RECORD.*/
 <<recod_block>>
 DECLARE
    TYPE n_pessoa IS RECORD(
        cpf CHAR(11), 
        nome VARCHAR2(255), 
        data_nascimento DATE, 
        genero CHAR);
        nova_pessoa n_pessoa;
BEGIN
    nova_pessoa.cpf := '54566621611';
    nova_pessoa.nome := 'Perna Longa';
    nova_pessoa.data_nascimento := to_date('28/07/2001', 'dd/mm/yy');
    nova_pessoa.genero := 'M';
    INSERT INTO Pessoa VALUES nova_pessoa;
END recod_block;        


/*13. SELECT … INTO
Descrição: A função ira retornar se foi recitado algum medicamento para o paciente.*/
CREATE OR REPLACE FUNCTION verconsulta (cpfcliente Consulta.cpf_cliente%type, cpfmedico Consulta.cpf_medico%type)
RETURN VARCHAR2
IS
    medicamento Consulta.nome_medicamento%type;
    retorna VARCHAR2(255);
BEGIN
    SELECT C.nome_medicamento INTO medicamento
    FROM Consulta C
    WHERE C.cpf_cliente = cpfcliente AND C.cpf_medico = cpfmedico;

    IF medicamento is NULL THEN
        retorna := 'Nenhum medicamento foi receitado!';
    ELSIF medicamento = 'Xeomin' THEN
        retorna := 'O medicamento Xeomin foi receitado!';
    ELSIF medicamento = 'Aloxidil' THEN
        retorna := 'O medicamento Aloxidil foi receitado!';
    ELSIF medicamento = 'Pantogar Neo' THEN
        retorna := 'O medicamento Pantogar Neo foi receitado!';
    ELSIF medicamento = 'Avicis' THEN
        retorna := 'O medicamento Avicis foi receitado!';
    ELSIF medicamento = 'Finalop' THEN
        retorna := 'O medicamento Finalop foi receitado!';
    ELSIF medicamento = 'Finasterida' THEN
        retorna := 'O medicamento Finasterida foi receitado!';
    ELSIF medicamento = 'Restylane' THEN
        retorna := 'O medicamento Restylane foi receitado!';
    ELSIF medicamento = 'Helioral' THEN
        retorna := 'O medicamento Helioral foi receitado!'; 
    END IF;
    RETURN retorna;
END;

/*19. CREATE OR REPLACE TRIGGER (COMANDO)
Descrição: Será retornado uma mensagem de erro caso tente fazer uma compra fora do horário.*/
CREATE OR REPLACE TRIGGER compra_fora_do_horario
BEFORE INSERT ON Compra
DECLARE
    hora NUMBER;
    compra_fora_do_horario EXCEPTION;
BEGIN
    SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) INTO hora FROM dual;
    IF hora > 21 OR hora < 7
    THEN
        RAISE compra_fora_do_horario;
    END IF;
EXCEPTION
WHEN compra_fora_do_horario THEN
    Raise_application_error(-20202, 'FORA DO HORÁrio DE FUNCIONAMENTO' || 'A clínica funciona entre 7 e 21h. Tente novante em outro horario.');
END;