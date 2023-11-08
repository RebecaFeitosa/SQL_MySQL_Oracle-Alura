-- Filtrar registros específicos da tabela

SELECT * FROM tbcliente WHERE PRODUTO = '544931';

SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro';

SELECT * FROM tbproduto WHERE SABOR = 'Limão';

UPDATE tbproduto SET SABOR = 'Cítricos' WHERE SABOR = 'Limão';

-- DESAFIO: Verifique os dados cadastrais da vendedora Claudia Morais
SELECT * FROM tbvendedores WHERE NOME = 'Claudia Morais';


-- Clientes com 22 anos
SELECT * FROM tbcliente WHERE IDADE = 22;

-- Clientes maiores de 22 anos
SELECT * FROM tbcliente WHERE IDADE > 22;

-- Clientes menores de 22 anos
SELECT * FROM tbcliente WHERE IDADE < 22;

-- Clientes menores ou com 22 anos
SELECT * FROM tbcliente WHERE IDADE <= 22;

-- Clientes que não tem 22 anos
SELECT * FROM tbcliente WHERE IDADE <> 22;


-- O SQL respeita uma ordem alfabética, então vai exibir os nomes em ordem alfabética
SELECT * FROM tbcliente WHERE NOME >= 'Fernando Cavalcante';


SELECT * FROM tbproduto WHERE PRECO_LISTA > 16.008;

SELECT * FROM tbproduto WHERE PRECO_LISTA <> 16.008;

SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;


-- DESAFIO: Veja quais são os vendedores que possuem comissão maior que 10%.
SELECT * FROM tbvendedores WHERE PERCENTUAL_COMISSAO > 0.1; 


SELECT * FROM tbcliente WHERE DATA_NASCIMENTO = '1995-01-13';

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO > '1995-01-13';

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO <= '1995-01-13';

SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) = 1995;

SELECT * FROM tbcliente WHERE MONTH(DATA_NASCIMENTO) = 10;

-- DESAFIO: Veja quais são os vendedores que foram admitidos da empresa a partir de 2016.
SELECT * FROM tbvendedores WHERE YEAR(DATA_ADMISSAO) >= 2016;
