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
--ALTER TABLE - faz alterações na definição da tabela
--Restrição para evitar que o mesmo funcionário seja seu próprio supervisor
ALTER TABLE Supervisiona 
    ADD CHECK (cpf_supervisionado != cpf_supervisor);

--ALTER TABLE
--Adicionar chave estrangeira que ficou faltando na tabela Consulta em relação à tabela Medicamento
ALTER TABLE Consulta 
ADD CONSTRAINT nomeMedicamento_fkey FOREIGN KEY (nome_medicamento) REFERENCES Medicamento(nome);

-- BETWEEN - operador que substitui >= e <= (entre)
-- Consulta: selecionar os serviços que custam entre 100 e 300 reais

SELECT * FROM Preco_servicos WHERE preco_servico BETWEEN 100.00 AND 300.00;

-- SUBCONSULTA COM ANY - operador que indica qualquer um entre uma série de valores (listados ou vindo de subselect)
-- Consulta: selecionar o nome e salário das funcionárias que ganham mais que algum funcionário
SELECT P.nome, F.salario FROM Pessoa P, Funcionario F 
    WHERE P.cpf = F.cpf AND P.genero = 'F' and F.salario > ANY 
    (SELECT F.salario FROM Funcionario F, Pessoa P WHERE P.genero = 'M');

-- MIN - operador que retorna o mínimo entre uma série de valores
-- CREATE VIEW - cria uma view (tabela virtual que não ocupa memória)
-- Criar uma view que mostre o estoque que está mais perto de acabar (usando min)
CREATE VIEW Estoque_critico(nome_comercial,estoque) AS SELECT nome_comercial, estoque 
    FROM Produto WHERE estoque IN (SELECT MIN(estoque) FROM Produto);
-- Para ver a view: SELECT * FROM Estoque_critico

--BLOCO ANONIMO: bloco de operações sem um nome, 
--CASE WHEN: comando condicional para que seja feito uma determinada ação caso a variável de controle assuma o valor definido, 
--EXCEPTION WHEN: bloco de tratamento de exceção
-- Informar o serviço realizado em um dia e horário
DECLARE 
    v_datetime TIMESTAMP := TO_TIMESTAMP('15-11-2021 08:53', 'DD-MM-YYYY HH24:MI');
    v_idservico INTEGER;
    v_servico VARCHAR2(255);
BEGIN
SELECT id_servico INTO v_idservico FROM Atende WHERE datahora_atende = v_datetime;
CASE v_idservico
    WHEN 1 THEN v_servico := 'Consulta';
    WHEN 2 THEN v_servico := 'Dermatoscopia';
    WHEN 3 THEN v_servico := 'Cirurgia Dermatológica';
    WHEN 4 THEN v_servico := 'Toxina botulínica';
    WHEN 5 THEN v_servico := 'Biópsia';
    WHEN 6 THEN v_servico := 'Exames básicos';
    WHEN 7 THEN v_servico := 'Cauterização química';
    WHEN 8 THEN v_servico := 'Crioterapia';
    WHEN 9 THEN v_servico := 'Curetagem';
END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put('Não houve serviço realizado nesse dia e horário.');
END;
/

/*Rodrigo
5. DELETE
11. INNER JOIN
17. SUBCONSULTA COM OPERADOR RELACIONAL
23. HAVING
*/

/*5.DELETE - Remover elementos de uma tabela
Descrição: Remoção de uma tupla da tabela Supervisão.*/
DELETE FROM Supervisiona
    WHERE cpf_supervisor = '32146679900' AND cpf_supervisionado = '32177765322';

/*11. INNER JOIN - une duas ou mais tabelas a partir de um atributo identificador
Descrição: Será retornado o cpf, o nome e o telefone das pessoas.*/
SELECT P.cpf, P.nome, T.telefone FROM Pessoa P
    INNER JOIN Telefone T
    ON P.cpf = T.cpf_p
    ORDER BY P.nome;

/*17. SUBCONSULTA COM OPERADOR RELACIONAL - operador escolhido: >
Descrição: Será retornado o nome comercial, o estoque e o lote da tabela produto dos produtos com preço de revenda maior que a média
de preços de revenda.*/
SELECT Pr.nome_comercial, Pr.estoque, Pr.lote FROM Produto Pr
    WHERE Pr.preco_de_revenda > (SELECT AVG(preco_de_revenda) FROM Produto);

/*23. HAVING - expressa a condição de agrupamento
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

/* 9. LIKE - comando que relaciona uma expressão geral para ser parâmetro de busca de expressões parecidas
Descrição: Seleciona todos cpfs de cliente para consultas que aconteceram no mês de fevereiro de 2022 */
SELECT Consulta.cpf_cliente FROM Consulta 
    WHERE TO_CHAR(Consulta.datahora_consulta,'DD-MM-YYYY HH24:MI') LIKE '__-02-2022%'
    GROUP BY Consulta.cpf_cliente;

/* 15. COUNT - comando para contar o número de tuplas
Descrição: Mostra a quantidade de supervisionados para cada supervisor */
SELECT Supervisiona.cpf_supervisor, COUNT(Supervisiona.cpf_supervisionado)
    FROM Supervisiona GROUP BY Supervisiona.cpf_supervisor ORDER BY COUNT(Supervisiona.cpf_supervisionado);

/* 21. ORDER BY - comando para ordenar as tuplas na tabela dado critério especificado
Descrição: Mostra os produtos em ordem crescente de lucro */
SELECT Produto.nome_comercial, (Produto.preco_de_revenda-Produto.preco_de_compra) as Lucro FROM Produto
    ORDER BY (Produto.preco_de_revenda-Produto.preco_de_compra);

/* Filipe
5. CREATE FUNCTION
11. WHILE LOOP
17. CREATE OR REPLACE PACKAGE
*/

/*
5. CREATE FUNCTION - cria uma função com parâmetros e retornos
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
/

/*
11. WHILE LOOP - comando de repetição com condição
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
/

/*
17. CREATE OR REPLACE PACKAGE - cria pacotes de funções, métodos e procedures que podem ser usadas para um fim específico
Descrição: Criação do PACKAGE responsável por criar clientes, funcionarios ou médicos
*/

/* 3. INSERT INTO - comando para inserir uma tupla noav na tabela
Descrição: Pacote contem comandos insert para inserir clientes, funcionarios ou médicos*/
CREATE OR REPLACE PACKAGE cadastros AS
    PROCEDURE new_cliente(aux Pessoa%ROWTYPE, plano_de_saude Cliente.plano_de_saude%TYPE);
    PROCEDURE new_funcionario(aux Pessoa%ROWTYPE, cargo Funcionario.cargo%TYPE,
        salario Funcionario.salario%TYPE, data_admissao Funcionario.data_admissao%TYPE);
    PROCEDURE new_medico(aux Pessoa%ROWTYPE, cargo Funcionario.cargo%TYPE,
        salario Funcionario.salario%TYPE, data_admissao Funcionario.data_admissao%TYPE, crm Medico.crm%TYPE);
END cadastros;
/
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
/

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

/*2. CREATE INDEX - cria um índice, normalmente numério para uma tabela
Descrição: Cria uma estrutura mais otimizada, quando comparado com a leitura padrão de uma tabela, para consulta do campo que foi indexado, neste caso nome_comercial. */

CREATE INDEX idx_nome_comercial ON Compra(nome_comercial);

/*2. IN - operador que verifica a existência do valor na estrutura correspondente
Descrição: Retorna os CPFs dos supervisionados que obtiveram uma avaliação Ótima ou Boa. */

SELECT cpf_supervisionado FROM Supervisiona WHERE avaliacao IN ('Ótimo', 'Boa');

/*14. AVG - operador que calcula a média aritmetica entre numeros
Descrição: Retorna a média do precos dos serviços ofertados pela clínica. */

SELECT AVG(preco_servico) FROM Preco_servicos;

/*20. SUBCONSULTA COM ALL - operador que compara com todos os valores de uma série (listados ou de subselect)
Descrição: Selecionando o CPF, cargo e salário dos médicos que ganham menos do que todos os funcionários que não são médicos. */

SELECT cpf, cargo, salario FROM Funcionario WHERE salario  <ALL ( SELECT salario FROM Funcionario WHERE cargo NOT LIKE 'Médico'); 

/*
26. GRANT E REVOKE - Ceder e revogar privilégios de acesso
Descrição: Concedendo todos os privilégios de acesso (SELECT, INSERT, DELETE,
UPDATE), para todos os usuário, sobre a tabela Funcionario e removendo em seguida a permissão para deleção, para todos os usuários, sobre a tabela Funcionario.
*/

GRANT ALL PRIVILEGES ON Funcionario TO PUBLIC;
REVOKE DELETE ON Funcionario FROM PUBLIC;

/*PL*/

/*
.4 CREATE PROCEDURE(cria uma função sem retornos) E .16 USO DE PARÂMETROS (IN, OUT ou IN OUT)(parâmetros utilizados em funções)
Descrição: Criando procedure com parâmetro IN para inserir um medicamento na tabela de Mendicamento.
*/

CREATE OR REPLACE PROCEDURE InserirMedicamento (
nomeMedicamento IN Medicamento.nome%TYPE
) IS
BEGIN
    INSERT INTO Medicamento (nome) VALUES (nomeMedicamento);
END InserirMedicamento;
/

/*Bloco que chama o procedimento.*/
BEGIN
    InserirMedicamento('Flebon');
END; 
/

/*10. LOOP EXIT WHEN - comando de repetição com critério de saída definido
Descrição: Usando como condição de parada a falta de dados no cursor declarado (cursor_func), o LOOP foi programado para 
armazenar em uma variável (cpfESalario_func) o CPF e o salário dos funcionários que recebem um salário de 2500.00 ou mais. */
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
/

/*
Rodrigo
1. USO DE RECORD
7. %ROWTYPE
13. SELECT … INTO
19. CREATE OR REPLACE TRIGGER (COMANDO)*/

/*1. USO DE RECORD - criação de um tipo de registro com atributos específicos
Descrição: Será criado uma nova pessoa e está será inserida na tabela Pessoa, atraves de RECORD.*/
<<record_block>>
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
END record_block;
/     

/*13. SELECT … INTO - comando de atribuição do retorno de um select a uma variável
Descrição: A função ira retornar se foi recitado algum medicamento para o paciente.*/
CREATE OR REPLACE FUNCTION verconsulta (cpfcliente Consulta.cpf_cliente%type, cpfmedico Consulta.cpf_medico%type, datahoraconsulta Consulta.datahora_consulta%TYPE)
RETURN VARCHAR2
IS
    medicamento Consulta.nome_medicamento%type;
    retorna VARCHAR2(255);
BEGIN
    SELECT C.nome_medicamento INTO medicamento
        FROM Consulta C
        WHERE C.cpf_cliente = cpfcliente AND C.cpf_medico = cpfmedico AND C.datahora_consulta = datahoraconsulta;

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
/

/*19. CREATE OR REPLACE TRIGGER (COMANDO) - comando gatilho, a ação é realizada dado a ocorrência de um evento especificado
Descrição: Será retornado uma mensagem de erro caso tente inserir uma compra fora do horário de funcionamento da loja
(a inserção é feita fora do horário, não a compra feita fora do horário).*/
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
    Raise_application_error(-20202, 'FORA DO HORÁRIO DE FUNCIONAMENTO' || 'A clínica funciona entre 7 e 21h. Tente novante em outro horario.');
END;
/

/*WALMIR
SQL
6. SELECT-FROM-WHERE (✔)
12. MAX (✔)
18. SUBCONSULTA COM IN (✔)
24. UNION ou INTERSECT ou MINUS (✔)

PL
2. USO DE ESTRUTURA DE DADOS DO TIPO TABLE
8. IF ELSIF (✔)
14. CURSOR (OPEN, FETCH e CLOSE)
20. CREATE OR REPLACE TRIGGER (LINHA) (✔)
*/

/* SELECT-FROM-WHERE - comando que seleciona tuplas de uma tabela mediante uma condição
Retorna todos Médicos com salarios acima de 3000 reais*/
SELECT * FROM Funcionario WHERE salario > 3000 AND cargo = 'Médico';

/* MAX (operador que retorna o máximo entre uma lista de valores) + SUBCONSULTA IN (subselect com operador in, que verifica pertencimento)
Retorna o maior salario dentre todos os funcionarios*/
SELECT * FROM Funcionario WHERE salario IN (SELECT MAX(salario) FROM Funcionario);

/*UNION ou INTERSECT ou MINUS - operadores de conjuntos (união, interseção ou complemento)
Retorna todos os funcionarios com salarios acima de 3000 reais OU abaixo de 2500*/
SELECT * FROM Funcionario WHERE salario > 3000 UNION SELECT * FROM Funcionario;

-- CREATE OR REPLACE TRIGGER (LINHA)(gatilho ativado pela linha) + IF ELSIF (comando condicional)
    -- Impede que seja inserido um salário negativo na base
CREATE OR REPLACE TRIGGER salario_neg 
BEFORE UPDATE ON Funcionario 
FOR EACH ROW
    BEGIN
    IF :NEW.salario < 0 THEN
        RAISE_APPLICATION_ERROR(-20101, 'Salario não pode ser menor que 0');
    END IF;
END;
/
-- CURSOR(estrutura que itera pelos retornos de uma consulta, podendo operar em cada um deles) + ESTRUTURA TABLE (tabela)
-- Retorna todas as compras feitas antes de fevereiro de 2022
DECLARE
    i BINARY_INTEGER := 0;
    cpf_compra Compra.cpf_cliente%TYPE;
    nome_compra Compra.nome_comercial%TYPE;
    data_compra Compra.datahora_compra%TYPE;
    
    TYPE compraInfo IS RECORD (cpf_cliente CHAR(11), nome_comercial VARCHAR2(255));
    TYPE TabelaCompra IS TABLE OF compraInfo INDEX BY BINARY_INTEGER;
    cpf_nome_compra TabelaCompra;
    CURSOR cursor_compra IS SELECT cpf_cliente, nome_comercial, datahora_compra FROM Compra;
    
BEGIN
    DBMS_OUTPUT.Put_line('Compras realizadas antes de fevereiro de 2022');
    OPEN cursor_compra;
    
        LOOP
            FETCH cursor_compra INTO cpf_compra, nome_compra, data_compra;
            IF data_compra < TO_TIMESTAMP('01-02-2022 00:00', 'DD-MM-YYYY HH24:MI') THEN
                cpf_nome_compra(i).cpf_cliente := cpf_compra;
                cpf_nome_compra(i).nome_comercial := nome_compra;
                DBMS_OUTPUT.Put_line(cpf_nome_compra(i).cpf_cliente || ' ' || cpf_nome_compra(i).nome_comercial);
                i := i+1;
            END IF;
            EXIT WHEN cursor_compra%NOTFOUND;
        END LOOP;
    
    CLOSE cursor_compra;
END;
/

/* Gustavo */

/*
4. UPDATE - atualiza os valores contidos na tabela
Convertendo os preços dos produtos de real para dólar
*/

UPDATE Produto SET preco_de_compra = preco_de_compra/4.74;
UPDATE Produto SET preco_de_revenda = preco_de_revenda/4.74;

/*
16. LEFT ou RIGHT ou FULL OUTER JOIN (variações dos comandos de junção de tabelas mediante condição)
Lista os produtos de cada fornecedor
*/
INSERT INTO Fornecedor(cnpj, nome) VALUES ('18053593100139', 'Avene');

SELECT F.nome, P.nome_comercial, (P.preco_de_revenda - P.preco_de_compra) AS Lucro FROM Fornecedor F LEFT OUTER JOIN Produto P
    ON F.cnpj = P.cnpj_fornecedor;

/*
10. IS NULL ou IS NOT NULL (comando que verifica se o valor é nulo ou é não nulo)
Consultas em que nenhum medicamento foi passado
*/
SELECT cpf_cliente, cpf_medico, datahora_consulta FROM Consulta
    WHERE nome_medicamento IS NULL;

/*
12. FOR IN LOOP (comando de repetição com definições prévias de conclusão)
Funcionários que não possuem supervisor (autogerenciáveis)
*/

DECLARE
    grau BINARY_INTEGER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Funcionários auto-gerenciáveis (CPF):');
    FOR func_cur IN (SELECT cpf FROM Funcionario) LOOP
        grau := 0;
        FOR supervisiona_cur IN (SELECT cpf_supervisionado FROM Supervisiona) LOOP
            IF func_cur.cpf = supervisiona_cur.cpf_supervisionado THEN
                grau := grau + 1;
            END IF;
        END LOOP;
        IF grau = 0 THEN
            DBMS_OUTPUT.PUT_LINE(func_cur.cpf);
        END IF;
    END LOOP;
END;
/