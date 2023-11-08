-- case condicional 

/* faz a mesma coisa que o if elseif, a diferença é que no if ele analisa 
cada opçao até chegar na certa, no case ele já vai pra certa, o case é mais eficiente mais isso é imperceptivel */
USE `sucos_vendas`;
DROP procedure IF EXISTS `acha_status_preco_case`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `acha_status_preco_case`(vProduto VARCHAR(50))
BEGIN
    DECLARE vPreco FLOAT;
    DECLARE vMensagem VARCHAR(30);
    SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
    WHERE codigo_do_produto = vProduto;
    CASE
    WHEN vPreco >= 12 THEN SET vMensagem = 'PRODUTO CARO.';
    WHEN vPreco >= 7 AND vPreco < 12 THEN  SET vMensagem = 'PRODUTO EM CONTA.';
    WHEN vPreco < 7 THEN SET vMensagem = 'PRODUTO BARATO';
    END CASE;
    SELECT vMensagem;
END$$
DELIMITER ;
CALL acha_status_preco_case('1004327');
call acha_status_preco_case('1000889');


/* DESAFIO : Implemente a Stored Procedure do exercício do vídeo 2, 
agora usando CASE CONDICIONAL. Chame de Comparativo_Vendas_Case_Cond. */
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Comparativo_Vendas_Case_Cond`(DataInicial DATE, DataFinal DATE)
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
CASE
WHEN Variacao > 10 THEN SELECT 'Verde';
WHEN Variacao > -10 AND Variacao < 10 THEN  SELECT 'Amarelo';
WHEN Variacao <= -10 THEN SELECT 'Vermelho';
END CASE;
END$$
DELIMITER ;