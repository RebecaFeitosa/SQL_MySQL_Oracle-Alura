-- Adicionando chave primária (primary key/pk) em uma tabela existente

USE sucos;

ALTER TABLE tbproduto ADD PRIMARY KEY (PRODUTO);

SELECT * FROM tbproduto;

ALTER TABLE tbcliente ADD PRIMARY KEY (CPF);