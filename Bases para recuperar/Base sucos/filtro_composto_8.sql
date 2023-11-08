-- Usando filtro composto em consultas

SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M';

SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins';

SELECT * FROM tbcliente WHERE (IDADE = 18 AND IDADE <= 22 AND SEXO = 'M') OR (CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins');

-- DESAFIO: Veja quais são os vendedores que estão de férias e que foram admitidos antes de 2016.
SELECT * FROM tbvendedores WHERE YEAR(DATA_ADMISSAO) < 2016 AND DE_FERIAS = 1;
