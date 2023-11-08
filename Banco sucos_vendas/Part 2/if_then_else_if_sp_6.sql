SELECT * FROM tabela_de_produtos;

-- Classificação
-- >= 12,00 --- CARO
-- >= 7 E 12 --- EM CONTA
-- <7 --- BARATO

-- SP achar status preço
USE `sucos_vendas`;
DROP procedure IF EXISTS `acha_status_preco_2`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `acha_status_preco_2` (vProduto VARCHAR(50))
BEGIN
   DECLARE vPreco FLOAT;
   DECLARE vMensagem VARCHAR(30);
   SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
   WHERE codigo_do_produto = vProduto;
   IF vPreco >= 12 THEN
      SET vMensagem = 'PRODUTO CARO.';
   ELSEIF vPreco >= 7  AND vPreco < 12 THEN
      SET vMensagem = 'PRODUTO EM CONTA.';
   ELSE
      SET vMensagem = 'PRODUTO BARATO.';
   END IF;
   SELECT vMensagem;
END$$
DELIMITER ;
call acha_status_preco_2 ('1000889');


/* DESAFIO ): Desafio! Veja a consulta abaixo:
SELECT SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = '20170301'COPIAR CÓDIGO
Ela retorna o valor do faturamento em uma determinada data.
Construa uma Stored Procedure chamada Comparativo_Vendas que compara as vendas em duas datas 
(Estas duas datas serão parâmetros da SP). Se a variação percentual destas vendas for maior que 10% a 
resposta deve ser "Verde". Se for entre -10% e 10% deve retornar "Amarela". Se o retorno for menor 
que -10% deve retornar "Vermelho". */
USE `sucos_vendas`;
DROP procedure IF EXISTS `Comparativo_Vendas`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Comparativo_Vendas`(DataInicial DATE, DataFinal DATE)
BEGIN
DECLARE FaturamentoInicial FLOAT;
DECLARE FaturamentoFinal FLOAT;
DECLARE Variacao float;
SELECT SUM(B.QUANTIDADE * B.PRECO) INTO FaturamentoInicial FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = DataInicial;
SELECT SUM(B.QUANTIDADE * B.PRECO) INTO FaturamentoFinal FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE A.DATA_VENDA = DataFinal ;
SET Variacao = ((FaturamentoFinal / FaturamentoInicial) -1) * 100;
IF Variacao > 10 THEN
SELECT 'Verde';
ELSEIF Variacao >= -10 AND Variacao <= 10 THEN
SELECT 'Amarelo';
ELSE
SELECT 'Vermelho';
END IF;   
END$$
DELIMITER ;
call Comparativo_Vendas();