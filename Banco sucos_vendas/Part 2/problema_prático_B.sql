-- CRIAR UMA VENDA ALEATÓRIA DE UM PRODUTO, CLIENTE E VENDEDOR ALEATÓRIOS

-- 1) Função pega número aleatório
USE `sucos_vendas`;
DROP function IF EXISTS `f_numero_aleatorio`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_numero_aleatorio`(min INT, max INT) RETURNS int(11)
BEGIN
   DECLARE vRetorno INT;
   SELECT  FLOOR((RAND() * (max-min+1)) + min) INTO vRetorno;
RETURN vRetorno;
END$$
DELIMITER ;
SELECT f_numero_aleatorio(15, 300);


-- 2) Função pega cliente aleatoriamente
USE `sucos_vendas`;
DROP function IF EXISTS `f_cliente_aleatorio`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE  FUNCTION `f_cliente_aleatorio`() RETURNS varchar(11) CHARSET utf8mb4
BEGIN
    DECLARE vRetorno VARCHAR(11);
    DECLARE num_max_tabela INT;
    DECLARE num_aleatorio INT;
    SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_clientes;
    SET num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
    SET num_aleatorio = num_aleatorio - 1;
    SELECT CPF INTO vRetorno FROM tabela_de_clientes
    LIMIT num_aleatorio, 1;
RETURN vRetorno;
END$$
DELIMITER ;
SELECT f_cliente_aleatorio();


-- 3) Função pega produto aleatoriamente
USE `sucos_vendas`;
DROP function IF EXISTS `f_produto_aleatorio`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_produto_aleatorio`() 
RETURNS varchar(10)
BEGIN
    DECLARE vRetorno VARCHAR(10);
    DECLARE num_max_tabela INT;
    DECLARE num_aleatorio INT;
    SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_produtos;
    SET num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
    SET num_aleatorio = num_aleatorio - 1;
    SELECT CODIGO_DO_PRODUTO INTO vRetorno FROM tabela_de_produtos
    LIMIT num_aleatorio, 1;
RETURN vRetorno;
END$$
DELIMITER ;
SELECT f_produto_aleatorio();


-- 4) Função pega vendedor aleatoriamente
USE `sucos_vendas`;
DROP function IF EXISTS `f_vendedor_aleatorio`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_vendedor_aleatorio`() 
RETURNS varchar(5) 
BEGIN
    DECLARE vRetorno VARCHAR(5);
    DECLARE num_max_tabela INT;
    DECLARE num_aleatorio INT;
    SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_vendedores;
    SET num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
    SET num_aleatorio = num_aleatorio - 1;
    SELECT MATRICULA INTO vRetorno FROM tabela_de_vendedores
    LIMIT num_aleatorio, 1;
RETURN vRetorno;
END$$
DELIMITER ;
SELECT f_vendedor_aleatorio();


-- 5) SP inserir venda
USE `sucos_vendas`;
DROP procedure IF EXISTS `p_inserir_venda`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE p_inserir_venda(vData DATE, max_itens INT,
max_quantidade INT)
BEGIN
	DECLARE vCliente VARCHAR(11);
	DECLARE vProduto VARCHAR(10);
	DECLARE vVendedor VARCHAR(5);
	DECLARE vQuantidade INT;
	DECLARE vPreco FLOAT;
	DECLARE vItens INT;
	DECLARE vNumeroNota INT;
	DECLARE vContador INT DEFAULT 1;
	DECLARE vNumItensNota INT;
	SELECT MAX(numero) + 1 INTO vNumeroNota from notas_fiscais;
	SET vCliente = f_cliente_aleatorio();
	SET vVendedor = f_vendedor_aleatorio();
	INSERT INTO notas_fiscais (CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO)
	VALUES (vCliente, vVendedor, vData, vNumeroNota, 0.18);
	SET vItens = f_numero_aleatorio(1, max_itens);
	WHILE vContador <= vItens
	DO
	   SET vProduto = f_produto_aleatorio();
	   SELECT COUNT(*) INTO vNumItensNota FROM itens_notas_fiscais
	   WHERE NUMERO = vNumeroNota AND CODIGO_DO_PRODUTO = vProduto;
	   IF vNumItensNota = 0 THEN
		  SET vQuantidade = f_numero_aleatorio(10, max_quantidade);
		  SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
		  WHERE CODIGO_DO_PRODUTO = vProduto;
		  INSERT INTO itens_notas_fiscais (NUMERO, CODIGO_DO_PRODUTO,
		  QUANTIDADE, PRECO) VALUES (vNumeroNota, vProduto, vQuantidade, vPreco);
	   END IF;
	   SET vContador = vContador + 1;
	END WHILE;
END$$
DELIMITER ;
call p_inserir_venda('20190517', 3, 100);


-- TRAZ UM NUMERO ALEATORIO
SELECT RAND();

-- Formula para pegar um numero aleatório
-- (RAND() * (MAX-MIN+1)) + MIN
-- EXEMPLO:  MIN = 15, MAX = 300
SELECT (RAND() * (300-15+1)) + 15;

-- PARA PEGAR APENAS A PARTE INTEIRA DE UM NUMERO DECIMAL: FLOOR
SELECT FLOOR(RAND() * (300-15+1)) + 15;


/* DESAFIO /:
No vídeo desta aula criamos uma função para obter o cliente através da função 
de número aleatório. Neste exercício crie outra função para obter o produto também 
usando a função aleatório. */
SELECT f_produto_aleatorio();


/* DESAFIO (:
No vídeo desta aula criamos uma função para obter o cliente através da função de número
aleatório. Neste exercício crie outra função para obter o vendedor também usando a função aleatório. */
SELECT f_vendedor_aleatorio();


/* DESAFIO ):
Crie uma tabela chamada TABELA_ALEATORIOS
Faça uma SP (Chame-a de Tabela_Numeros) que use um loop para gravar nesta tabela 100 números aleatórios entre 0 e 1000. Depois liste numa consulta esta tabela.
(Use a função f_numero_aleatorio criado no vídeo desta aula). */
CREATE TABLE TABELA_ALEATORIOS(NUMERO INT);
USE `sucos_vendas`;
DROP procedure IF EXISTS `Tabela_Numeros`;
USE `sucos_vendas`;
DELIMITER $$
CREATE PROCEDURE `Tabela_Numeros`()
BEGIN
DECLARE CONTADOR INT;
DECLARE CONTMAXIMO INT;
SET CONTADOR = 1;
SET CONTMAXIMO = 100;
DELETE FROM TABELA_ALEATORIOS;
WHILE CONTADOR <= CONTMAXIMO
DO
INSERT INTO TABELA_ALEATORIOS (NUMERO) VALUES (f_numero_aleatorio(0,1000));
SET CONTADOR = CONTADOR + 1;
END WHILE;
SELECT * FROM TABELA_ALEATORIOS;
END$$
DELIMITER ;
call Tabela_Numeros;


-- stored procedure para incluir dados de uma venda
-- resolvendo problema de PK

call p_inserir_venda('20190517', 20, 100);

SELECT A.NUMERO, COUNT(*), SUM(B.QUANTIDADE * B.PRECO) AS FATURADO
FROM notas_fiscais A INNER JOIN itens_notas_fiscais B
ON A.NUMERO = B.NUMERO WHERE A.DATA_VENDA = '20190517'
GROUP BY A.NUMERO;