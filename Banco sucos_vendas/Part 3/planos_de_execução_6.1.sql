-- Planos de execução
/* Comando explain, traz o plano de execução da consulta, é como um pré-planejamento do que o MySQL vai fazer 
para resolver aquela consulta, independente do plano de execução que eu vou estar seguindo, eu posso tomar 
algumas atitudes em termos de performance do eu banco, para que as minhas consultas fiquem um pouco mais rápidas.
Por exemplo, essas consultas abaixo, quanto mais complexas mais tempo demoram */

SELECT A.NOME_DO_PRODUTO, C.QUANTIDADE FROM tabela_de_produtos A
INNER JOIN itens_notas_fiscais C ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO;

SELECT A.NOME_DO_PRODUTO, C.QUANTIDADE, YEAR(B.DATA_VENDA) FROM tabela_de_produtos A
INNER JOIN itens_notas_fiscais C 
ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais B ON C.NUMERO = B.NUMERO;

SELECT A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA), SUM(C.QUANTIDADE) AS QUANTIDADE FROM tabela_de_produtos A
INNER JOIN itens_notas_fiscais C 
ON A.CODIGO_DO_PRODUTO = C.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais B ON C.NUMERO = B.NUMERO
GROUP BY A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA)
ORDER BY A.NOME_DO_PRODUTO, YEAR(B.DATA_VENDA);

-- Plano de execução