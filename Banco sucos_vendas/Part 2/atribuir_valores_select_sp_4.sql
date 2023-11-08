-- Atribuição de valor usando SELECT na SP

-- Executar essa rotina e jogar o valor desse select dentro de uma variável
SELECT SABOR FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '4000001';


-- SP achar sabor do produto
USE `sucos_vendas`;
DROP procedure IF EXISTS `acha_sabor_produto`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `acha_sabor_produto`(vProduto VARCHAR(50))
BEGIN
   DECLARE vSabor VARCHAR(50);
   SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto = vProduto;
   SELECT vSabor;
END$$
DELIMITER ;
-- chamar a sp e insirir o código do produto para saber o sabor
call acha_sabor_produto('4000001');
call acha_sabor_produto('1013793');
SELECT * FROM tabela_de_produtos;


/* DESAFIO: Crie uma variável chamada NUMNOTAS e atribua a ela o número de 
notas fiscais do dia 01/01/2017. Mostre na saída do script o valor da variável. 
(Chame esta Stored Procedure de Quantidade_Notas). */
USE `sucos_vendas`;
DROP procedure IF EXISTS `Quantidade_Notas`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Quantidade_Notas`()
BEGIN
DECLARE NUMNOTAS INT;
SELECT COUNT(*) INTO NUMNOTAS  FROM NOTAS_FISCAIS WHERE DATA_VENDA = '20170101';
SELECT NUMNOTAS;
END$$
DELIMITER ;
call Quantidade_Notas;
