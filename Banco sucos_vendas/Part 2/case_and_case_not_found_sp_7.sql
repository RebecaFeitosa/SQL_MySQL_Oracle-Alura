-- case sp

select *from tabela_de_produtos;

-- sp case acha sabor
USE `sucos_vendas`;
DROP procedure IF EXISTS `acha_tipo_sabor`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `acha_tipo_sabor`(vProduto VARCHAR(50))
BEGIN
  DECLARE vSabor VARCHAR(50);
  SELECT SABOR INTO vSabor FROM tabela_de_Produtos
  WHERE codigo_do_produto = vProduto;
  CASE vSabor
  WHEN 'Lima/Limão' THEN SELECT 'Cítrico';
  WHEN 'Laranja' THEN SELECT 'Cítrico';
  WHEN 'Morango/Limão' THEN SELECT 'Cítrico';
  WHEN 'Uva' THEN SELECT 'Neutro';
  WHEN 'Morango' THEN SELECT 'Neutro';
  ELSE SELECT 'Ácidos';
  END CASE;
END$$
DELIMITER ;
call acha_tipo_sabor ('1002334');


-- case not found erro
USE `sucos_vendas`;
DROP procedure IF EXISTS `acha_tipo_sabor_erro`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE  PROCEDURE `acha_tipo_sabor_erro`(vProduto VARCHAR(50))
BEGIN
  DECLARE vSabor VARCHAR(50);
  DECLARE msgErro VARCHAR(30);
  DECLARE CONTINUE HANDLER FOR 1339 SET msgErro = 'O case não está completo';
  SELECT SABOR INTO vSabor FROM tabela_de_Produtos
  WHERE codigo_do_produto = vProduto;
  CASE vSabor
  WHEN 'Lima/Limão' THEN SELECT 'Cítrico';
  WHEN 'Laranja' THEN SELECT 'Cítrico';
  WHEN 'Morango/Limão' THEN SELECT 'Cítrico';
  WHEN 'Uva' THEN SELECT 'Neutro';
  WHEN 'Morango' THEN SELECT 'Neutro';
  END CASE;
  SELECT msgErro;
END$$
DELIMITER ;
call acha_tipo_sabor_erro('1004327');