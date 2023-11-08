-- Desafios de todas as aulas


-- DESAFIO: Selecione nome e matrícula dos vendedores
SELECT NOME, MATRICULA FROM tbvendedores;

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



/* DESAFIO: Criar vendedores na tabela de vendedores. As informações são as seguintes:
Matrícula: 00233
Nome: João Geraldo da Fonseca
Comissão: 10%COPIAR CÓDIGO
	e
 Matrícula: 00235
Nome: Márcio Almeida Silva
Comissão: 8%
	e
Matrícula: 00236
Nome: Cláudia Morais 
Comissão: 8%
Digite o comando de inclusão.
*/
INSERT INTO tbvendedores 
(MATRICULA, NOME, PERCENTUAL_COMISSAO) 
VALUES 
('00233', 'João Geraldo da Fonseca', 0.10);

INSERT INTO tbvendedores 
(MATRICULA, NOME, PERCENTUAL_COMISSAO) 
VALUES 
('00235', 'Márcio Almeida Silva', 0.08);

INSERT INTO tbvendedores 
(MATRICULA, NOME, PERCENTUAL_COMISSAO) 
VALUES 
('00236', 'Claúdia Morais', 0.08);

SELECT * FROM tbvendedores;



-- DESAFIO: Veja quais são os vendedores que estão de férias e que foram admitidos antes de 2016.
SELECT * FROM tbvendedores WHERE YEAR(DATA_ADMISSAO) < 2016 AND DE_FERIAS = 1;



-- DESAFIO: Verifique os dados cadastrais da vendedora Claudia Morais
SELECT * FROM tbvendedores WHERE NOME = 'Claudia Morais';



-- DESAFIO: Veja quais são os vendedores que possuem comissão maior que 10%.
SELECT * FROM tbvendedores WHERE PERCENTUAL_COMISSAO > 0.1; 



-- DESAFIO: Veja quais são os vendedores que foram admitidos da empresa a partir de 2016.
SELECT * FROM tbvendedores WHERE YEAR(DATA_ADMISSAO) >= 2016;



-- DESAFIO: O vendedor João Geraldo Fonseca Junior matrícula (00233) foi demitido. Retire-o da tabela de vendedores.
DELETE FROM tbvendedores WHERE MATRICULA = '00233';

SELECT * FROM tbvendedores;



/*DESAFIO: Cláudia Morais (00236) recebeu aumento e sua comissão passou a ser de 11%. 
José Geraldo da Fonseca (00233) reclamou que seu nome real é José Geraldo da Fonseca Junior.
Efetue estas correções na base de dados.
*/
UPDATE tbvendedores SET PERCENTUAL_COMISSAO = 0.11
WHERE MATRICULA = '00236';

UPDATE tbvendedores SET NOME = 'José Geraldo da Fonseca Junior'
WHERE MATRICULA = '00233';

SELECT * FROM tbvendedores;



/* DESAFIO: Vamos incluir novos campos na tabela de vendedores. Eles serão a data de admissão:
(Nome do campo DATA_ADMISSÃO) e se o vendedor está ou não de férias (Nome do campo DE_FERIAS). 
Não esqueça de recriar a chave primária e depois inclua as informações abaixo:
Matrícula - 00235						
Nome: Márcio Almeida Silva
Comissão: 8%
Data de admissão: 15/08/2014
Está de férias? Não

Matrícula - 00236
Nome: Cláudia Morais 
Comissão: 8%
Data de admissão: 17/09/2013
Está de férias? Sim

Matrícula - 00237
Nome: Roberta Martins
Comissão: 11%
Data de admissão: 18/03/2017
Está de férias? Sim

Matrícula - 00238
Nome: Péricles Alves
Comissão: 11%
Data de admissão: 21/08/2016
Está de férias? Não
*/

USE sucos;

-- Adicionei uma chave primária no campo 'matricula'
ALTER TABLE tbvendedores ADD PRIMARY KEY (MATRICULA);

-- Adicionei os campos 'data de admissão' e 'de férias'
ALTER TABLE tbvendedores ADD COLUMN (DATA_ADMISSAO DATE);
ALTER TABLE tbvendedores ADD COLUMN (DE_FERIAS BIT);

/* SOZINHA: Não quis apagar a tabela inteira como sugerido no enunciado, quis colocar 
os conceitos em prática, portanto, dei um UPDATE nos vendedores '00235' e '00236' 
adicionando as informações que faltavam e depois fui inserir os outros vendedores.	*/
UPDATE tbvendedores SET DATA_ADMISSAO = '2014-08-15', DE_FERIAS = 0
WHERE MATRICULA = '00235';

UPDATE tbvendedores SET DATA_ADMISSAO = '2013-09-17', DE_FERIAS = 1
WHERE MATRICULA = '00236';

-- Criar os vendedores restantes
INSERT INTO tbvendedores 
(MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS)  
VALUES 
('00237', 'Roberta Martins', 0.11, '2017-03-18', 1);

INSERT INTO tbvendedores 
(MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS)  
VALUES 
('00238', 'Péricles Alves', 0.11, '2016-08-21', 0);

SELECT * FROM tbvendedores;