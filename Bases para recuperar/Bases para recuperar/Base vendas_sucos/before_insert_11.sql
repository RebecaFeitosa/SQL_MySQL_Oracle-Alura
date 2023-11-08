/* Exemplo: Caso seja necessário calcular a idade de um(a) novo(a) cliente em anos baseado na data atual, 
que será inserido(a) na tabela CLIENTES, podemos utilizar o BEFORE INSERT */

SELECT CPF, IDADE, DATA_NASCIMENTO, timestampdiff(YEAR, DATA_NASCIMENTO, NOW()) AS ANOS FROM
CLIENTES;


DELIMITER //

CREATE TRIGGER TG_CLIENTES_IDADE_INSERT BEFORE INSERT ON CLIENTES

FOR EACH ROW

BEGIN

SET NEW.IDADE = timestampdiff(YEAR, NEW.DATA_NASCIMENTO, NOW());

END //