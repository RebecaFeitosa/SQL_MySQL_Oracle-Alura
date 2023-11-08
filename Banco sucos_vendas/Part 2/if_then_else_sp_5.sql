-- Usando IF THEN ELSE Stored Procedure

SELECT * FROM tabela_de_clientes;
SELECT DATA_DE_NASCIMENTO FROM tabela_de_clientes WHERE CPF = '1471156710';


-- SP define cliente idade
USE `sucos_vendas`;
DROP procedure IF EXISTS `cliente_novo_velho`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cliente_novo_velho`(vCPF VARCHAR(20))
BEGIN
   DECLARE vResultado VARCHAR(20);
   DECLARE vDataNascimento DATE;
   SELECT DATA_DE_NASCIMENTO INTO vDataNascimento FROM
   tabela_de_clientes WHERE CPF = vCPF;
   IF vDataNascimento < '20000101' THEN
      SET vResultado = 'CLIENTE VELHO';
   ELSE
      SET vResultado = 'CLIENTE NOVO';
   END IF;
   SELECT vResultado;
END$$
DELIMITER ;
call cliente_novo_velho ('1471156710');


/* DESAFIO :) Crie uma Stored Procedure que, baseado em uma data, contamos o número de notas fiscais. 
Se houverem mais que 70 notas exibimos a mensagem: ‘Muita nota’. Ou então exibimos a mensagem ‘Pouca nota’. 
Também exibir o número de notas. Chame esta Stored Procedure de Testa_Numero_Notas.
A data a ser usada para testar a nota será um parâmetro da Stored Procedure. */
USE `sucos_vendas`;
DROP procedure IF EXISTS `Testa_Numero_Notas`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Testa_Numero_Notas` (DATANOTA date)
BEGIN
    DECLARE NUMNOTAS INT;
    SELECT COUNT(*) INTO NUMNOTAS FROM NOTAS_FISCAIS WHERE DATA_VENDA = DATANOTA;
    IF NUMNOTAS > 70 THEN
        SELECT 'Muita Nota', NUMNOTAS;
    ELSE
        SELECT 'Pouca Nota', NUMNOTAS;
    END IF;
END$$
DELIMITER ;
SELECT * FROM notas_fiscais; 
call Testa_Numero_Notas ('2015-01-01');