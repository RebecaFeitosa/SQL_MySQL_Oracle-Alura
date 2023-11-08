-- FUNÇÕES MATEMÁTICAS

-- CEILING: arredonda mostrando o maior inteiro das casas decimais 'Arredonda para cima'
SELECT CEILING(12.333322323233) AS RESULTADO;

-- ROUND: arredonda normalmente
SELECT ROUND(12.333322323233) AS RESULTADO;

-- FLOOR: traz apenas o valor antes das casas decimais 'Arredonda para baixo'
SELECT FLOOR(12.777323233) AS RESULTADO;

-- RAND: retorna um número aleatório a cada consulta
SELECT RAND() AS RESULTADO;

-- Faturamento de cada item, sem arredondamento
SELECT NUMERO, QUANTIDADE * PRECO AS FATURAMENTO FROM itens_notas_fiscais;

-- Faturamento de cada item, com arredondamento
SELECT NUMERO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO FROM itens_notas_fiscais;

/* DESAFIO:( Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens temos 
a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro. */
SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) AS IMPOSTO_DE_2016
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016 GROUP BY YEAR(DATA_VENDA);
