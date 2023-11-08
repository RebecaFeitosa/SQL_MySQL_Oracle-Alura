SELECT * FROM tabela_de_clientes;

-- Mostra o limite de crédio de todos os clientes nos estados
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;

-- Para mostrar o limite de crédito de cada estado, agrupar:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO;


SELECT EMBALAGEM, PRECO_DE_LISTA FROM tabela_de_produtos;

/* Saber qual é o produto mais caro pet, garrafa e lata, 
exemplo do professor, mas fiz sozinha antes dele resolver, deu alguns erros mas resolvi sz */
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAIOR FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM;

-- Filtro e agrupamento
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;

-- Mais de um agrupamento com filtro
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO;

-- Mais de um agrupamento, com filtro e ordenação 
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO ORDER BY BAIRRO;

-- DESAFIO (NÃO CONSEGUI): Aproveitando o exercício do vídeo anterior quantos itens de venda existem com a maior quantidade do produto '1101035'?
SELECT MAX(QUANTIDADE) AS MAIOR_QUANTIDADE FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035';

SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;