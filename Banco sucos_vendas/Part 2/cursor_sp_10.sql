-- Cursor vs select into
-- problemas do select into
-- o select into só pode retornar apenas uma linha, o cursor sim pode pegar resultados de mais de uma linha e coluna

-- Primeiro cursor
USE sucos_vendas;
DROP procedure IF EXISTS cursor_primeiro_contato;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `cursor_primeiro_contato` ()
BEGIN
  DECLARE vNome VARCHAR(50);
  DECLARE c CURSOR FOR SELECT NOME FROM tabela_de_clientes limit 4;
  OPEN c;
  FETCH c INTO vNome;
  SELECT vNome;
  FETCH c INTO vNome;
  SELECT vNome;
  FETCH c INTO vNome;
  SELECT vNome;
  FETCH c INTO vNome;
  SELECT vNome;
  CLOSE c;
END$$
DELIMITER ;
call cursor_primeiro_contato;

-- Cursor looping
USE `sucos_vendas`;
DROP procedure IF EXISTS `cursor_looping`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cursor_looping` ()
BEGIN
   DECLARE fim_do_cursor INT DEFAULT 0;
   DECLARE vNome VARCHAR(50);
   DECLARE c CURSOR FOR SELECT NOME FROM tabela_de_clientes;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_cursor = 1;
   OPEN c;
   WHILE fim_do_cursor = 0
   DO
       FETCH c INTO vNome;
       IF fim_do_cursor = 0 THEN
          SELECT vNome;
       END IF;
   END WHILE;
   CLOSE c;
END$$
DELIMITER ;
call cursor_looping;


-- Cursor suporta várias colunas
USE `sucos_vendas`;
DROP procedure IF EXISTS `looping_cursor_multiplas_colunas`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `looping_cursor_multiplas_colunas` ()
BEGIN
  DECLARE fim_do_cursor INT DEFAULT 0;
  DECLARE vCidade, vEstado, vCep VARCHAR(50);
  DECLARE vNome, vEndereco VARCHAR(150);
  DECLARE c CURSOR FOR
  SELECT nome, endereco_1, cidade, estado, cep FROM tabela_de_clientes;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_do_cursor = 1;
  OPEN c;
  WHILE fim_do_cursor = 0
  DO
     FETCH c INTO vNome, vEndereco, vCidade, vEstado, vCep;
     IF fim_do_cursor = 0 THEN
        SELECT CONCAT(vNome, ' Endereço: ',
        vEndereco, ', ', vCidade , ' - ', vEstado, ' CEP: ' , vCep);
     END IF;
  END WHILE;
  CLOSE c;
END$$
DELIMITER ;
call looping_cursor_multiplas_colunas;


-- Cursor notas
USE `sucos_vendas`;
DROP procedure IF EXISTS `Soma_Dias_Notas`;
USE `sucos_vendas`;
DELIMITER $$
CREATE PROCEDURE `Soma_Dias_Notas`()
BEGIN
DECLARE DATAINICIAL DATE;
DECLARE DATAFINAL DATE;
DECLARE NUMNOTAS INT;
SET DATAINICIAL = '20170101';
SET DATAFINAL = '20170110';
WHILE DATAINICIAL <= DATAFINAL
DO
SELECT COUNT(*) INTO NUMNOTAS  FROM notas_fiscais WHERE DATA_VENDA = DATAINICIAL;
SELECT concat(DATE_FORMAT(DATAINICIAL, '%d/%m/%Y'), '-' , CAST(NUMNOTAS as CHAR(50)));
SELECT ADDDATE(DATAINICIAL, INTERVAL 1 DAY) INTO DATAINICIAL;
END WHILE;
END$$
DELIMITER ;
call Soma_Dias_Notas;




-- CURSOR MULTIPLAS COLUNAS

call looping_cursor_multiplas_colunas;

/* Quando eu começar aqui o meu "LOOPING", o fim do cursor é zero e eu estou na primeira posição.
Vou dar um "FETCH" e vou dar um "SELECT. Volto para o "LOOPING", o fim do "CURSOR" é zero. 
Vou dar outro "FETCH" e outro select. "FETCH", select. Quando eu fizer a quarta vez, eu vou entrar aqui no "WHILE", 
o fim do "CURSOR" ainda é zero. E aí, eu vou dar meu quinto "FETCH". Ao dar o meu quinto "FETCH", eu desvio para o "ERROR HANDLER".
E como é do tipo "CONTINUE", ele não vai parar o programa. Mas antes de continuar, ele vai dizer que o fim do "CURSOR" 
é igual a 1. Aí, ele vai escrever de novo "VNOME", talvez seja um probleminha porque aí ele vai acabar tendo que escrever o 
"VNOME" duas vezes. Tudo bem. Depois a gente melhora isso. E aí, quando ele for para o "WHILE", esse cara vai ser igual a um, eu 
vou acabar e eu vou dar o "CLOSE". "IF FIM_DO_CURSOR = 0 THEN". Aí eu rodo o "SELECT NOME" e o "END IF" aqui. Ou seja, eu só vou executar 
o select se eu ainda não cheguei no fim. Então, quando ele fizer o "FETCH" pela quinta vez, o fim do "CURSOR" vai passar de 0 para 1, 
eu não faço o select e saio do "LOOPING". */
call cursor_looping;


/* DESAFIO /: Crie uma Stored Procedure usando um cursor para achar o valor total de todos os créditos de todos os clientes. 
Chame esta SP de Limite_Creditos.
Dicas:
Declare duas variáveis: Uma que recebe o limite de crédito do cursor e outra o limite de crédito total; Faça um loop no cursor 
e vá somando na variável limite de crédito total o valor do limite de cada cliente; Exiba o valor total do limite.  */
call Limite_Creditos;


/* DESAFIO /: Crie uma Stored Procedure usando um cursor para achar o valor total do faturamento para um mês e um ano.
Dicas:
Declare três variáveis: Uma que recebe a quantidade, outra o preço e uma terceira que irá acumular o faturamento; 
Faça um loop no cursor e vá somando o faturamento de cada nota; Exiba o valor total do limite; 
Lembrando a consulta que obter o faturamento dentro de um mês e ano. 
SELECT INF.QUANTIDADE, INF.PRECO FROM ITENS_NOTAS_FISCAIS INF
INNER JOIN NOTAS_FISCAIS  NF ON NF.NUMERO = INF.NUMERO
WHERE MONTH(NF.DATA_VENDA) = 1 AND YEAR(NF.DATA_VENDA) = 2017 */
call Mais_Um_Campo;