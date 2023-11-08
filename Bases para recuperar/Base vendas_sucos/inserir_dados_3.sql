use vendas_sucos;

insert into produtos (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
values ('1040107', 'Light - 350ml - Melância', 'Melância', '350ml', 'Lata', 4.56);

select * from PRODUTOS;

insert into produtos (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
values ('1040108', 'Light - 350ml - Graviola', 'Graviola', '350ml', 'Lata', 4.00);

-- para omitir o nome dos campos, SÓ pode usar se a ordem dos values respeitar a ordem dos campos da tabela
insert into produtos 
values ('1040109', 'Light - 350ml - Açaí', 'Açaí', '350ml', 'Lata', 5.60);

-- inserindo duas linhas ao mesmo tempo, todos tem que estar organizados em padrão
insert into produtos 
values ('1040110', 'Light - 350ml - Jaca', 'Jaca', '350ml', 'Lata', 6.00),
	   ('1040111', 'Light - 350ml - Manga', 'Manga', '350ml', 'Lata', 3.50);
       
/* DESAFIO:) Inclua os seguintes registros na tabela de clientes:

CPF:1471156710 NOME:Érica Carvalho ENDEREÇO:R.Iriquitia BAIRRO:Jardins 
CIDADE:São Paulo ESTADO:SP CEP:80012212 DATA DE NASCIMENTO:01/09/1990 IDADE:27 
SEXO: F LIMITE DE CRÉDITO:170000 VOLUME DE COMPRA:24500 PRIMEIRA COMPRA: Não

CPF:19290992743  NOME:Fernando Cavalcante ENDEREÇO:R. Dois de Fevereiro BAIRRO:Água Santa 
CIDADE:Rio de Janeiro ESTADO:RJ CEP:22000000 DATA DE NASCIMENTO:12/02/2000 IDADE:18 
SEXO:M LIMITE DE CRÉDITO:100000 VOLUME DE COMPRA:20000 PRIMEIRA COMPRA:Sim

CPF: 2600586709 NOME: César Teixeira ENDEREÇO: Rua Conde de Bonfim BAIRRO: Tijuca 
CIDADE: Rio de Janeiro ESTADO: RJ CEP: 22020001 DATA DE NASCIMENTO: 12/03/2000 
IDADE: 18 SEXO: M LIMITE DE CREDITO: 120000 VOLUME DE COMPRA: 22000 PRIMEIRA COMPRA: Não    */
select * from CLIENTES;

INSERT INTO CLIENTES 
	(CPF, NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA)
VALUES 
('1471156710', 'Érica Carvalho', 'R. Iriquitia', 'Jardins', 'São Paulo', 'SP', '80012212', '1990-09-01' , 27, 'F', 170000, 24500, 0),
('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Água Santa', 'Rio de Janeiro', 'RJ', '22000000', '2000-02-12' , 18, 'M', 100000, 20000, 1),
('2600586709', 'César Teixeira', 'R. Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', '22020001', '1990-09-01' , 18, 'M', 120000, 22000, 0);

