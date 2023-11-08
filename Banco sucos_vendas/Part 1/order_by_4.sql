-- Por padrão ele ordena em ordem crescente (menor para maior)
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;

-- Para oordenar em ordem descrescente (DESC)
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;


SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO;

SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC; 

-- EXECUTAR E OBSERVAR
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

-- EXECUTAR E OBSERVAR
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

/* DESAFIO (muita dificuldade): Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto 
“Linha Refrescante - 1 Litro - Morango/Limão”, em quantidade? (Obtenha este resultado usando 2 SQLs). */
SELECT * FROM tabela_de_produtos WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão';

SELECT * FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' ORDER BY QUANTIDADE DESC;
