-- função

-- tive que rodar esse comando nessa sessão para executar a função, o ideal seria rodar esse comando na inicialização
SET GLOBAL log_bin_trust_function_creators = 1;

-- CHAMAR FUNÇÃO SIMPPLES
SELECT f_acha_tipo_sabor("Laranja");

-- CHAMAR FUNÇÃO MELHOR
SELECT NOME_DO_PRODUTO, SABOR, f_acha_tipo_sabor(SABOR) as TIPO FROM tabela_de_produtos;

SELECT NOME_DO_PRODUTO, SABOR FROM tabela_de_produtos WHERE f_acha_tipo_sabor(SABOR) = 'Neutro';

SELECT CONCAT(NOME_DO_PRODUTO, ' ', SABOR) FROM tabela_de_produtos;



/* DESAFIO (: Veja a Stored Procedure abaixo:
CREATE PROCEDURE `sp_numero_notas` ()
BEGIN
DECLARE NUMNOTAS INT;
SELECT COUNT(*) INTO NUMNOTAS FROM notas_fiscais WHERE DATA_VENDA = '20170101';
SELECT NUMNOTAS;
END
Transforme esta SP em uma função onde passamos como parâmetro da data e retornamos o número de notas. 
Chame esta função de NumeroNotas. Após a criação da função teste seu uso com um SELECT. */
SELECT NumeroNotas('20170101');
