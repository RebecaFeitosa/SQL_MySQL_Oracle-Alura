-- Consultando duas tabelas separadas
SELECT DISTINCT BAIRRO FROM tabela_de_clientes;
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

-- Consultando duas tabelas com UNION
SELECT BAIRRO FROM tabela_de_clientes
UNION
SELECT  BAIRRO FROM tabela_de_vendedores;

-- Consultando duas tabelas com UNION ALL
SELECT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT BAIRRO FROM tabela_de_vendedores;

-- O union escreve o nome das colunas do primeiro select
SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' AS TIPO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO FROM tabela_de_vendedores;

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

