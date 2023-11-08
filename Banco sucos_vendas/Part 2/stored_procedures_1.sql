-- Stored procedures

-- Criar SP por comando
USE `sucos_vendas`;
DROP procedure IF EXISTS `alo_mundo`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `alo_mundo` ()
BEGIN
select 'Alô Mundo !!!!';
END$$
DELIMITER ;
-- Chamar sp
call alo_mundo;


-- SP mostrar número
USE `sucos_vendas`;
DROP procedure IF EXISTS `mostra_numero`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `mostra_numero` ()
BEGIN
select (1 + 9) - 5;
END$$
DELIMITER ;
call mostra_numero;


-- SP mostrar número com alias
USE `sucos_vendas`;
DROP procedure IF EXISTS `mostra_numero_alias`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `mostra_numero_alias` ()
BEGIN
select (1 + 9) - 5 as RESULTADO;
END$$
DELIMITER ;
call mostra_numero_alias;


-- SP com funções
USE `sucos_vendas`;
DROP procedure IF EXISTS `sp_com_funcoes`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `sp_com_funcoes` ()
BEGIN
SELECT CONCAT('Alô Mundo !!!!', '.....', (1 + 9) - 5) as ITENS_COMBINADOS;
END$$
DELIMITER ;
call sp_com_funcoes;


-- SP com comentários
USE `sucos_vendas`;
DROP procedure IF EXISTS `sp_com_comentarios`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `sp_com_comentarios` ()
BEGIN
/* Vamos exibir itens combinados
entre textos e números */
-- Usando a função CONCAT
SELECT CONCAT('Alô Mundo !!!!', '.....', (1 + 9) - 5) as ITENS_COMBINADOS;
END$$
DELIMITER ;
call sp_com_comentarios;


-- Criar SP para apagar
USE `sucos_vendas`;
DROP procedure IF EXISTS `alo_mundo_2`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `alo_mundo_2` ()
BEGIN
SELECT 'Alô Mundo !!!!, tudo bem?' as RESULTADO;
END$$
DELIMITER ;
call alo_mundo_2;
-- APAGAR SP
USE `sucos_vendas`;
DROP procedure IF EXISTS `alo_mundo_2`;


-- SP declarando uma variável
USE `sucos_vendas`;
DROP procedure IF EXISTS `exibe_variavel`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `exibe_variavel` ()
BEGIN
declare texto char(20) default 'Alô Mundo !!!!';
SELECT texto;
END$$
DELIMITER ;
call exibe_variavel;


/* DESAFIO: Crie 4 variáveis com as características abaixo:
Nome: Cliente. 
Tipo: Caracteres com 10 posições. 
Valor: João
******************
Nome: Idade. 
Tipo: Inteiro. 
Valor: 10
******************
Nome: DataNascimento. 
Tipo: Data. 
Valor: 10/01/2007
******************
Nome: Custo. 
Tipo: Número com casas decimais. 
Valor: 10,23
******************
Construa um script declarando estas variáveis, atribuindo valores a elas e exibindo na saída do MYSQL.(Dê o nome da procedure de sp_Exerc01). */
USE `sucos_vendas`;
DROP procedure IF EXISTS `Exerc01`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Exerc01`()
BEGIN
DECLARE Cliente VARCHAR(10);
DECLARE Idade INT;
DECLARE DataNascimento DATE;
DECLARE Custo FLOAT;
SET Cliente = 'João';
SET Idade = 10;
SET DataNascimento = '20170110';
SET Custo = 10.23;
SELECT Cliente;
SELECT Idade;
SELECT DataNascimento;
SELECT Custo;
END$$
DELIMITER ;

call Exerc01;


