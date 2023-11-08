-- O gerente da area de vendas quer um relatorio que mostre quais vendas foram válidas e inválidas (PASSO A PASSO)

-- 1) Juntando as duas tabelas necessárias
SELECT * FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO;

-- 2) Quanto foi vendido em quantidade para cada cliente por data
SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO;

-- 3) Quanto foi vendido em quantidade para cada cliente por data, sendo apenas mês e ano
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y - %m') AS MES_ANO, INF.QUANTIDADE FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO;

-- 4) Agrupar e somar esses valores, consulta de vendas de clientes por mês
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y - %m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y - %m');

-- 5) Consultar o limite de compra por cliente
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE
FROM tabela_de_clientes TC;

-- 6) Comparar tabela do passo 4 com a do passo 5
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y - %m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS, MAX(TC.VOLUME_DE_COMPRA) AS VOLUME_LIMITE
FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y - %m');

-- Informar se cada linha foi válida ou inválida
SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.VOLUME_LIMITE,
CASE WHEN (X.VOLUME_LIMITE - X.QUANTIDADE_VENDAS) <0 THEN 'Inválida'
ELSE 'Válida' END AS STATUS_VENDA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y - %m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS, MAX(TC.VOLUME_DE_COMPRA) AS VOLUME_LIMITE
FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y - %m'))X;

/* DESAFIO :( Nesta aula construímos um relatório que apresentou os clientes que tiveram vendas inválidas. 
Complemente este relatório listando somente os que tiveram vendas inválidas e calculando a 
diferença entre o limite de venda máximo e o realizado, em percentuais. */
SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
ELSE 'VÁLIDA' END AS STATUS_VENDA, (1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100 AS PERCENTUAL
FROM (SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO
, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS 
, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X
WHERE (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;