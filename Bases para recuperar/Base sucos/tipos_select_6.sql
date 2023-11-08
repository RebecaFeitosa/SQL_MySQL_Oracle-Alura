-- Aprendendo tipos de SELECT
SELECT * FROM tbcliente;

SELECT CPF, NOME FROM tbcliente;

SELECT CPF, NOME FROM tbcliente LIMIT 5;

SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;

SELECT NOME, CPF, SEXO, IDADE, DATA_NASCIMENTO FROM tbcliente;

SELECT * FROM tbcliente WHERE IDADE = 22;

-- DESAFIO: Selecione nome e matrícula dos vendedores
SELECT NOME, MATRICULA FROM tbvendedores;
