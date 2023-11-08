SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

-- Selecionar todos os clientes cujos bairros tenham escritorio de vendedores - maneira menos usada
SELECT * FROM tabela_de_clientes WHERE BAIRRO IN ('Tijuca', 'Jardins', 'Copacabana', 'Santo Amaro');

-- Selecionar todos os clientes cujos bairros tenham escritorio de vendedores - maneira mais usada
SELECT * FROM tabela_de_clientes WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

-- Quais são as embalagens cujo maior preço é maior que 10
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos GROUP BY EMBALAGEM) X
WHERE X.PRECO_MAXIMO >= 10;

/* DESAFIO: Qual seria a consulta usando subconsulta que seria equivalente a:
  SELECT CPF, COUNT(*) FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF
  HAVING COUNT(*) > 2000 */
SELECT X.CPF, X.CONTADOR FROM 
(SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF) X WHERE X.CONTADOR > 2000
