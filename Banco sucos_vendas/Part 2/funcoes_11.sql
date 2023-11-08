-- Funções

-- Comando para o MySQL permitir a criação de funções
SET GLOBAL log_bin_trust_function_creators = 1;


-- Função comando
USE `sucos_vendas`;
DROP function IF EXISTS `f_acha_tipo_sabor`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_acha_tipo_sabor`(vSabor VARCHAR(50)) RETURNS varchar(20) CHARSET utf8mb4
BEGIN
  DECLARE vRetorno VARCHAR(20) default "";
  CASE vSabor
  WHEN 'Lima/Limão' THEN SET vRetorno = 'Cítrico';
  WHEN 'Laranja' THEN SET vRetorno = 'Cítrico';
  WHEN 'Morango/Limão' THEN SET vRetorno = 'Cítrico';
  WHEN 'Uva' THEN SET vRetorno = 'Neutro';
  WHEN 'Morango' THEN SET vRetorno = 'Neutro';
  ELSE SET vRetorno = 'Ácidos';
  END CASE;
  RETURN vRetorno;
END$$
DELIMITER ;
-- chamar função simples
SELECT f_acha_tipo_sabor ("Laranja");
-- chamar função composto
SELECT NOME_DO_PRODUTO, SABOR, f_acha_tipo_sabor (SABOR) as TIPO FROM tabela_de_produtos;