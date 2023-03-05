USE sucos;

-- Os dados dos produtos: 544931 E 1078680 não estão corretos, está diferente na planilha, para editar:
UPDATE tbproduto SET EMBALAGEM = 'Lata', PRECO_LISTA = 2.46
WHERE PRODUTO = '544931';

UPDATE tbproduto SET EMBALAGEM = 'Garrafa'
WHERE PRODUTO = '1078680';

SELECT * FROM tbproduto;

/*DESAFIO: Cláudia Morais (00236) recebeu aumento e sua comissão passou a ser de 11%. 
José Geraldo da Fonseca (00233) reclamou que seu nome real é José Geraldo da Fonseca Junior.
Efetue estas correções na base de dados.
*/
UPDATE tbvendedores SET PERCENTUAL_COMISSAO = 0.11
WHERE MATRICULA = '00236';

UPDATE tbvendedores SET NOME = 'José Geraldo da Fonseca Junior'
WHERE MATRICULA = '00233';

SELECT * FROM tbvendedores;
