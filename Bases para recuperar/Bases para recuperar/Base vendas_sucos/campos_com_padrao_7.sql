/* Criando uma nova tabela
O campo ID vai ser do tipo auto incremento (sequencia numérica), 
o descritor é um campo que vou ter que inserir um valor (não tem nem null, então não tem padrão default, obrigatório inserir o dado)
o endereco tem o padrão null (se não inserir dados, ele será nulo)
o cidade tem padrão RJ (se não inserir dados, ele será RJ)
data cricao o padrão sera a hora do computador */
CREATE TABLE TAB_PADRAO
(ID INT AUTO_INCREMENT,
DESCRITOR VARCHAR(20),
ENDERECO VARCHAR(100) NULL,
CIDADE VARCHAR(50) DEFAULT 'Rio de Janeiro',
DATA_CRIACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
PRIMARY KEY (ID));

INSERT INTO TAB_PADRAO (DESCRITOR, ENDERECO, CIDADE, DATA_CRIACAO)
VALUES ('CLIENTE X', 'RUA PROJETADA A', 'SÃO PAULO', '2019-01-01');

SELECT * FROM TAB_PADRAO;

INSERT INTO TAB_PADRAO (DESCRITOR) VALUES ('CLIENTE Y');

