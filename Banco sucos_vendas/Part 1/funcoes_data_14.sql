-- FUNÇÕES DE DATAS

-- CURDATE: retorna a data atual da consulta
SELECT CURDATE();

-- CURRENT_TIME: retorna a hora da data atual da consulta
SELECT CURRENT_TIME();

-- CURRENT_TIMESTAMP: retorna a data e hora atual da consulta
SELECT CURRENT_TIMESTAMP();

-- YEAR: retorna o ano
SELECT YEAR(CURRENT_TIMESTAMP());

-- DAY: retorna o dia
SELECT DAY(CURRENT_TIMESTAMP());

-- MONTH: retorna o mês
SELECT MONTH(CURRENT_TIMESTAMP());

-- MONTHNAME: retorna o nome do mês
SELECT MONTHNAME(CURRENT_TIMESTAMP());

-- DATEDIFF: retorna o número de dias entre duas datas
SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2019-01-01') AS RESULTADO;

-- Quantos dias eu já vivi?
SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2002-08-24') AS RESULTADO;

-- DATE_SUB: subtrai N dias de uma data e retorna a data
SELECT CURRENT_TIMESTAMP() AS DIA_ATUAL,
DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS '5 DIAS ATRÁS';

SELECT DISTINCT DATA_VENDA,
DAYNAME(DATA_VENDA) AS DIA, MONTHNAME(DATA_VENDA) AS MÊS, YEAR(DATA_VENDA) AS ANO FROM notas_fiscais;

/* TIMESTAMPDIFF() retorna um valor após subtrair uma expressão de data e hora de outra.
A unidade deve ser uma das seguintes: FRAC_SECOND (microssegundos), SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER ou YEAR.
TIMESTAMPDIFF(unidade,datetime_expr1,datetime_expr2);  */

-- DESAFIO:( Crie uma consulta que mostre o nome e a idade atual dos clientes.
SELECT NOME, TIMESTAMPDIFF(YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE FROM tabela_de_clientes;

