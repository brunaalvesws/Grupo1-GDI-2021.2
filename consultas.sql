/* Bruna
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