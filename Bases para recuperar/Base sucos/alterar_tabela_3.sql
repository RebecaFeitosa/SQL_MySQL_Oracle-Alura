-- Inserindo dados e alterando tabela

USE sucos;

-- Inserindo coluna 'data' e informações nessas colunas
ALTER TABLE tbcliente ADD COLUMN (DATA_NASCIMENTO DATE);

INSERT INTO tbcliente (
	CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP,
    IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA, DATA_NASCIMENTO)
VALUES ('00388934505', 'João da Silva', 'Rua projetada A número 10', ' ', 'Vila Roman',
		'Caratinga', 'Amazonas', '22222222', 30, 'M', 10000.00, 2000, 0, '1989-10-05');
        
SELECT * FROM tbcliente;


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