-- Planos de execução comando pelo workbench
EXPLAIN SELECT A.NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS A;
EXPLAIN FORMAT=JSON SELECT A.NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS A;

-- Ao executar a consulta, do lado direito em "Execution Plan" é possível ver o plano de execução
SELECT A.NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS A;