use vendas_sucos;

create table PRODUTOS
(CODIGO varchar(10) not null,
DESCRITOR varchar(100) null,
TAMANHO varchar(50) null,
EMBALAGEM varchar(50) null,
PRECO_LISTA float null,
primary key (CODIGO));

-- Adicionando coluna em tabela existente e escolhendo sua posição
ALTER TABLE produtos ADD SABOR varchar(50) AFTER DESCRITOR;

create table VENDEDORES
(MATRICULA varchar(5) not null,
NOME varchar(100) null,
BAIRRO varchar(50) null,
COMISSAO float null,
DATA_ADMISSAOO date null,
FERIAS bit(1) null,
primary key (MATRICULA));

-- Para alterar o nome da coluna
alter table VENDEDORES rename column DATA_ADMISSAOO to DATA_ADMISSAO;

-- DESAFIO: Crie a tabela de vendas conforme a imagem (está no docs)
create table VENDAS
(NUMERO varchar(5) not null,
DATA_VENDA date null,
IMPOSTO float null,
MATRICULA varchar(5) not null,
CPF varchar(11) not null,
primary key (NUMERO),
foreign key (CPF) references CLIENTES(CPF),
foreign key (MATRICULA) references VENDEDORES(MATRICULA));

-- Tive duvida, primary key composta
create table itens_notas
(NUMERO varchar(5) not null,
CODIGO varchar(10) not null,
QUANTIDADE int,
PRECO float,
primary key (NUMERO, CODIGO));

ALTER TABLE VENDAS ADD CONSTRAINT FK_CLIENTES
FOREIGN KEY (CPF) REFERENCES CLIENTES (CPF);

ALTER TABLE VENDAS ADD CONSTRAINT FK_VENDEDORES
FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES (MATRICULA);
















