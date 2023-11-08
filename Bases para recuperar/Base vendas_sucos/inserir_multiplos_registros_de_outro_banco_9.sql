USE vendas_sucos;

-- Consultando uma tabela de outro banco
SELECT * FROM sucos_vendas.tabela_de_produtos;

/* Consultando tabela fonte(sucos_vendas) colocando apelidos iguais do banco atual (vendas_sucos), 
e só quero itens que não existam na minha tabela atual */
SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA AS PRECO_LISTA
FROM sucos_vendas.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM PRODUTOS);

-- Inserindo dados de outro banco no banco atual
INSERT INTO PRODUTOS
SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA AS PRECO_LISTA
FROM sucos_vendas.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM PRODUTOS);

SELECT * FROM PRODUTOS;

/* DESAFIO:) Inclua todos os clientes na tabela CLIENTES baseados 
nos registros da tabela TABELA_DE_CLIENTES da base SUCOS_VENDAS.
Cuidado com o nome dos campos e lembre-se que já incluímos 3 clientes na nossa tabela. */
INSERT INTO CLIENTES
SELECT CPF, NOME, ENDERECO_1 AS ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO AS DATA_NASCIMENTO,
IDADE, SEXO, LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUME_DE_COMPRA AS VOLUME_COMPRA, PRIMEIRA_COMPRA
FROM sucos_vendas.tabela_de_clientes
WHERE CPF NOT IN (SELECT CPF FROM CLIENTES);

SELECT * FROM CLIENTES;

