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


