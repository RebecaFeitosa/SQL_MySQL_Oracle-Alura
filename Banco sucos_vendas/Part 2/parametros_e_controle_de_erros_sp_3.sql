-- Parametros e controle de erros

-- Incluindo dados na tabela de produtos pela sp
-- Dentro da sp ficam as regras e comandos, e por aqui só passamos os parametros (informações) a serem incluidas

SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '4000001';

-- sp inclui novo produto(sem tratar erro)
USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto_parametro`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto_parametro`(vCodigo varchar(50),
vNome varchar(50), vSabor varchar(50), vTamanho varchar(50),
vEmbalagem varchar(50), vPreco DECIMAL(10,2))
BEGIN
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
-- Executar duas vezes(erro sem tratar)
call inclui_novo_produto_parametro('4000001', 'Sabor do Pantanal Litro - Melancia', 'Melancia', '1 Litro', 'PET', 4.67);

-- sp inclui produto com erro tratado
USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto_parametro_2`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto_parametro_2`(vCodigo varchar(50),
vNome varchar(50), vSabor varchar(50), vTamanho varchar(50),
vEmbalagem varchar(50), vPreco DECIMAL(10,2))
BEGIN
DECLARE mensagem VARCHAR(40);
DECLARE EXIT HANDLER FOR 1062
BEGIN
   SET mensagem = 'Problema de Chave Primária !!!';
   SELECT mensagem;
END;
INSERT INTO tabela_de_produtos
(CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
     VALUES (vCodigo,
     vNome,
     vSabor,
     vTamanho,
     vEmbalagem,
     vPreco);
SET mensagem = 'Produto incluido com sucesso !!!';
SELECT mensagem;
END$$
DELIMITER ;
-- executar duas vezes(erro tratado)
call inclui_novo_produto_parametro_2('4000004', 'Sabor do Pantanal 1 Litro - Melancia', 'Melancia', '1 Litro', 'PET', 4.76);

-- DECLARE EXIT - usar quando da erro
/* Ao tentar incluir o produto acima de novo, retorna erro por causa da PK,
se ao invés de retornar erro, retornar uma mensagem mais amigável */
call inclui_novo_produto_parametro_2('4000002', 'Sabor do Pantanal Litro - Melancia', 'Melancia', '1 Litro', 'PET', 4.67);
call inclui_novo_produto_parametro_2('4000003', 'Sabor do Pantanal Litro - Melancia', 'Melancia', '1 Litro', 'PET', 4.67);
call inclui_novo_produto_parametro_2('4000003', 'Sabor do Pantanal Litro - Melancia', 'Melancia', '1 Litro', 'PET', 4.67);


/* DESAFIO: Crie uma Stored procedure para reajustar o % de comissão dos vendedores. 
Inclua como parâmetro da SP o %, expresso em valor (Ex: 0,90).
Nome da Stored Procedure: Reajuste_Comissao. */
call Reajuste_Comissao(0.1);
SELECT * FROM tabela_de_vendedores;

/* Crie uma Stored procedure que atualize a idade dos clientes. Lembrando que o 
comando para calcular a idade, na tabela Tabela_de_Clientes é:
TIMESTAMPDIFF(YEAR, c.data_de_nascimento, CURDATE()) as idade */
USE `sucos_vendas`;
DROP procedure IF EXISTS `Calcula_Idade`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Calcula_Idade`()
BEGIN
UPDATE tabela_de_clientes set idade =  TIMESTAMPDIFF(YEAR, data_de_nascimento, CURDATE());
END$$
DELIMITER ;
call Calcula_Idade;

/* DESAFIO: Crie uma Stored procedure para reajustar o % de comissão dos vendedores. 
Inclua como parâmetro da SP o %, expresso em valor (Ex: 0,90).
Nome da Stored Procedure: Reajuste_Comissao. */
USE `sucos_vendas`;
DROP procedure IF EXISTS `Reajuste_Comissao`;
DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Reajuste_Comissao` (vPercent FLOAT)
BEGIN
UPDATE tabela_de_vendedores SET percentual_comissao = percentual_comissao * (1 + vPercent);
END$$
DELIMITER ;
call Reajuste_Comissao(0.1);
SELECT * FROM tabela_de_vendedores;


-- DESAFIO: Qual é o comando para tratar erros?
-- DECLARE EXIT HANDLER FOR (CÓDIGO DO ERRO)