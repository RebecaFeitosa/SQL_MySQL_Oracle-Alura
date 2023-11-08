-- 19/02/2023 Tentando fazer os exercicios que tive dúvida novamente, antes de avançar

-- DESAFIO (CONSEGUI): Quais são os bairros da cidade do Rio de Janeiro que possuem clientes?
SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';

/* DESAFIO (CONSEGUI): Queremos obter as 10 primeiras vendas do dia 01/01/2017. 
Qual seria o comando SQL para obter este resultado? */
SELECT * FROM notas_fiscais WHERE DATA_VENDA = '2017-01-01' LIMIT 10;

/* DESAFIO (CONSEGUI): Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto 
“Linha Refrescante - 1 Litro - Morango/Limão”, em quantidade? 
(Obtenha este resultado usando 2 SQLs). */
SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limão';
SELECT * FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' ORDER BY QUANTIDADE DESC;

/* DESAFIO (CONSEGUI NA NET): Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, 
nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. Liste o nome do cliente e esta classificação. */
SELECT NOME, DATA_DE_NASCIMENTO,
	CASE 
		WHEN YEAR(DATA_DE_NASCIMENTO) < 1990 THEN 'Velhos'
        WHEN YEAR(DATA_DE_NASCIMENTO) >= 1990 AND YEAR(DATA_DE_NASCIMENTO) <= 1995 THEN 'Jovens'
        ELSE 'Crianças' END AS 'Classificação por idade'
FROM tabela_de_clientes;

-- DESAFIO (DIFICULDADE MAS CONSEGUI ENTENDER): Aproveitando o exercício do vídeo anterior quantos itens de venda existem com a maior quantidade do produto '1101035'? 
SELECT MAX(QUANTIDADE) AS MAIOR_QUANTIDADE FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035';

SELECT COUNT(*) FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' AND QUANTIDADE = 99;

-- DESAFIO (MUITA DIFICULDADE MAS CONSEGUI ENTENDER): Quais foram os clientes que fizeram mais de 2000 compras em 2016?
SELECT CPF, COUNT(*) AS QTD_COMPRA FROM notas_fiscais WHERE YEAR(DATA_VENDA) = '2016' GROUP BY CPF HAVING COUNT(*) > 2000;

/* DESAFIO (Não consegui fazer só)  
Obtenha o faturamento anual da empresa. Leve em consideração que o valor financeiro 
das vendas consiste em multiplicar a quantidade pelo preço.  */