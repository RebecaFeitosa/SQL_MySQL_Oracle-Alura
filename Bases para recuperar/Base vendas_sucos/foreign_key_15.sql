/* DESAFIO :) Crie, por linha de comando, a chave estrangeira ligando 
a tabela de PRODUTOS com a tabela de ITENS_NOTAS através do campo CODIGO 
e outra ligação entre a tabela NOTAS e ITENS_NOTAS através do campo NUMERO. */

alter table itens_notas add constraint FK_PRODUTOS
foreign key (CODIGO) references PRODUTOS(CODIGO);

alter table itens_notas add constraint FK_NOTAS
foreign key (NUMERO) references NOTAS(NUMERO);