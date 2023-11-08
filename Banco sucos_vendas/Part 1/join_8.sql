SELECT * FROM tabela_de_vendedores;
SELECT * FROM notas_fiscais;

-- INNER JOIN

SELECT * FROM tabela_de_vendedores A 
INNER JOIN notas_fiscais B 
ON A.MATRICULA = B.MATRICULA;

-- Quantas notas fiscais cada vendedor emitiu 
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM tabela_de_vendedores A 
INNER JOIN notas_fiscais B 
ON A.MATRICULA = B.MATRICULA 
GROUP BY A.MATRICULA, A.NOME;

/* Exemplo de cima sem o join (não usar), como se fizesse nas duas primeiras linhas um cross join
e depois aplicasse uma condição */
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM tabela_de_vendedores A, notas_fiscais B 
WHERE A.MATRICULA = B.MATRICULA 
GROUP BY A.MATRICULA, A.NOME;

/* DESAFIO: Obtenha o faturamento anual da empresa. Leve em consideração que o valor financeiro 
das vendas consiste em multiplicar a quantidade pelo preço.  */
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO 
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);


-- LEFT JOIN 

-- Ao consultar a tabela de clientes, retorna 15 clientes
SELECT COUNT(*) FROM tabela_de_clientes;

/* Porém ao consultar os clientes na tabela de compras, retorna apenas 14, ou seja, 
um cliente não comprou sucos de frutas */
SELECT CPF, COUNT(*) FROM notas_fiscais GROUP BY CPF;

/* Para descobrir quem é esse cliente que não comprou usaremos o left join,
que irá trazer todos os clientes da tabela_de_clientes (esquerda) e os seus correspondentes
da tabela notas_fiscais, e assim vemos que o cliente Fábio Carvalho nunca comprou na empresa*/
SELECT DISTINCT A.NOME, A.CPF, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B
ON A.CPF = B.CPF; 

-- Para trazer somente o cliente que não comprou podemos aplicar o WHERE B.CPF IS NULL:
SELECT DISTINCT A.NOME, A.CPF, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B
ON A.CPF = B.CPF WHERE B.CPF IS NULL;

-- Quais foram os clientes que nunca compraram no ano de 2015?
SELECT DISTINCT A.NOME, A.CPF, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B
ON A.CPF = B.CPF WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA) = 2015;


-- RIGHT JOIN

SELECT DISTINCT A.CPF, B.NOME, B.CPF FROM notas_fiscais A RIGHT JOIN tabela_de_clientes B
ON A.CPF = B.CPF WHERE A.CPF IS NULL;


-- Outra maneira de fazer o JOIN

-- INNER JOIN
/* Sem usar alias, usando apenas o nome das tabelas, para mostrar se o vendedor está de ferias ou não, 
não preciso colocar o nome da tabela.de_ferias, porque ele não aparece nas duas tabelas */
SELECT tabela_de_vendedores.NOME, tabela_de_vendedores.BAIRRO, DE_FERIAS,
tabela_de_clientes.NOME, tabela_de_clientes.BAIRRO FROM 
tabela_de_vendedores INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- LEFT JOIN, traz todos os vendedores e seus clientes correspondentes
SELECT tabela_de_vendedores.NOME, tabela_de_vendedores.BAIRRO, DE_FERIAS,
tabela_de_clientes.NOME, tabela_de_clientes.BAIRRO FROM 
tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- RIGHT JOIN, traz todos os clientes e seus vendedores correspondentes 
SELECT tabela_de_vendedores.NOME, tabela_de_vendedores.BAIRRO, DE_FERIAS,
tabela_de_clientes.NOME, tabela_de_clientes.BAIRRO FROM 
tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;


-- CROSS JOIN, análise combinatória

SELECT tabela_de_vendedores.NOME, tabela_de_vendedores.BAIRRO, DE_FERIAS,
tabela_de_clientes.NOME, tabela_de_clientes.BAIRRO FROM 
tabela_de_vendedores, tabela_de_clientes;


/* FULL JOIN, mostrará todos ao mesmo tempo (left and right)
 porém O MySQL NÃO suporta o full join */

SELECT tabela_de_vendedores.NOME, tabela_de_vendedores.BAIRRO, DE_FERIAS,
tabela_de_clientes.NOME, tabela_de_clientes.BAIRRO FROM 
tabela_de_vendedores FULL JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- Usando o UNION como full join 
SELECT tabela_de_vendedores.NOME, tabela_de_vendedores.BAIRRO, DE_FERIAS,
tabela_de_clientes.NOME, tabela_de_clientes.BAIRRO FROM 
tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.NOME, tabela_de_vendedores.BAIRRO, DE_FERIAS,
tabela_de_clientes.NOME, tabela_de_clientes.BAIRRO FROM 
tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;