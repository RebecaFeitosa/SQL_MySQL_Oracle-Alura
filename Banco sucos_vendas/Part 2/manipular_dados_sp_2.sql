-- Manipulando tabela de produtos SEM Stored Procedures
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
    ('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
    ('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
    ('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
    ('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
    ('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
    ('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
    ('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
    ('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
    ('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
    ('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
    ('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);
    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
    UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
    DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
    SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
    
    
-- Manipulando tabela de produtos COM Stored Procedures
     /*Criei a SP 'manipulacao_dados' e coloquei todos esses comandos acima, 
    ao chamar a sp ele irá executar todos aqueles comandos de uma vez, e a sp irá mostrar só os selects */
USE `sucos_vendas`;
DROP procedure IF EXISTS `manipulacao_dados`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `manipulacao_dados` ()
BEGIN
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
     VALUES ('2001001','Sabor da Serra 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
         ('2001000','Sabor da Serra  700 ml - Melão','Melão','700 ml','Garrafa',7.50),
         ('2001002','Sabor da Serra  700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
         ('2001003','Sabor da Serra  700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
         ('2001004','Sabor da Serra  700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
         ('2001005','Sabor da Serra  700 ml - Açai','Açai','700 ml','Garrafa',7.50),
         ('2001006','Sabor da Serra  1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
         ('2001007','Sabor da Serra  1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
         ('2001008','Sabor da Serra  1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
         ('2001009','Sabor da Serra  1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
         ('2001010','Sabor da Serra  1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
         ('2001011','Sabor da Serra  1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);
         SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
         UPDATE tabela_de_produtos SET PRECO_DE_LISTA = 8 WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
         SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
         DELETE FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
         SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor da Serra%';
END$$
DELIMITER ;
call manipulacao_dados;


-- Nesse exemplo, dentro da sp declarei as variáveis e chamo as variáveis no value, ao invés dos próprios valores
USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto` ()
BEGIN
DECLARE vCodigo varchar(50) DEFAULT '3000001';
DECLARE vNome varchar(50) DEFAULT 'Sabor do Mar 700 ml - Manga';
DECLARE vSabor varchar(50) DEFAULT 'Manga';
DECLARE vTamanho varchar(50) DEFAULT '700 ml';
DECLARE vEmbalagem varchar(50) DEFAULT 'Garrafa';
DECLARE vPreco DECIMAL(10,2) DEFAULT 9.25;
INSERT INTO tabela_de_produtos
(CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
     VALUES (vCodigo,
     vNome,
     vSabor,
     vTamanho,
     vEmbalagem,
     vPreco);
END$$
DELIMITER ;
call inclui_novo_produto;

SELECT * FROM tabela_de_produtos WHERE NOME_DO_PRODUTO LIKE 'Sabor do Mar%';