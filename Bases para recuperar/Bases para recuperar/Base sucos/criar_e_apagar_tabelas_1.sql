-- Criando e apagando tabelas

-- TABELA DE CLIENTES
CREATE TABLE tbCliente (
	CPF VARCHAR(11), 
	NOME VARCHAR(100),
	ENDERECO1 VARCHAR(150),
	ENDERECO2 VARCHAR(150),
	BAIRRO VARCHAR(50),
	CIDADE VARCHAR(50),
	ESTADO VARCHAR(50),
	CEP VARCHAR(8),
	IDADE SMALLINT,
	SEXO VARCHAR(1),
	LIMITE_CREDITO FLOAT,
	VOLUME_COMPRA FLOAT,
	PRIMEIRA_COMPRA BIT(1)
);


/* Desafio: Nosso sistema de vendas tem mais uma tabela a ser criada: vendedores.
Algumas informações: Nome da tabela deve ser TABELA_DE_VENDEDORES Vendedor tem o número interno da matrícula, 
onde será armazenado no campo MATRICULA, que deve ser um string de 5 posições. O nome do vendedor deverá ser 
armazenado no campo NOME, e deve ser um string de 100 posições. Criar o campo PERCENTUAL_COMISSAO que 
representa quantos % de comissão o vendedor ganha sobre cada venda.
Crie esta tabela no banco de dados SUCOS.
*/
CREATE TABLE tbvendedores (
	MATRICULA VARCHAR(5), 
	NOME VARCHAR(100), 
	PERCENTUAL_COMISSAO FLOAT
);

-- DESAFIO: CRIE A TABELA DE VENDEDORES2 PARA APAGAR
CREATE TABLE TABELA_DE_VENDEDORES2 (
        MATRICULA varchar(5),
        NOME varchar(100),
        PERCENTUAL_COMISSAO float
);
-- DESAFIO: APAGAR TABELA VENDEDORES2 COM SCRIPT SQL
DROP TABLE TABELA_DE_VENDEDORES2;