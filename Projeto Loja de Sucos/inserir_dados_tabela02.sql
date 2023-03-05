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
