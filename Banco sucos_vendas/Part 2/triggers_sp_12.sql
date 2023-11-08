-- TRIGGER E SP
/* Colocando o comando da trigger dentro da sp e quando chamar a trigger chamar ela
com a sp, vai ser melhor quando tiver que fazer manutenção no codigo, ao inves de mudar trigger
por trigger, é só mudar uma unica sp */

CREATE TABLE TAB_FATURAMENTO (DATA_VENDA DATE NULL, TOTAL_VENDA FLOAT);

-- não da pra alterar trigger entao apaga e cria a nova
DROP TRIGGER TG_CALCULA_FATURAMENTO_INSERT;
DROP TRIGGER TG_CALCULA_FATURAMENTO_UPDATE;
DROP TRIGGER TG_CALCULA_FATURAMENTO_DELETE;


-- sp com comando da trigger
USE sucos_vendas;
DROP procedure IF EXISTS p_calculo_faturamento;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE p_calculo_faturamento()
BEGIN
  DELETE FROM TAB_FATURAMENTO;
  INSERT INTO TAB_FATURAMENTO
  SELECT A.DATA_VENDA, SUM(B.QUANTIDADE * B.PRECO) AS TOTAL_VENDA FROM
  NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.DATA_VENDA;
END$$
DELIMITER ;


-- triggers com sp abaixo
DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_INSERT AFTER INSERT ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
	call p_calculo_faturamento;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_UPDATE AFTER UPDATE ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
	call p_calculo_faturamento;
END//

DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_DELETE AFTER DELETE ON ITENS_NOTAS_FISCAIS
FOR EACH ROW BEGIN
	call p_calculo_faturamento;
END//

-- criação de notas fiscais
call p_inserir_venda ('20190517', 3, 100);

SELECT * FROM TAB_FATURAMENTO WHERE DATA_VENDA = '20190517';
