-- Mecanismos de armazenamento

CREATE TABLE DEFAULT_TABLE (ID INTEGER, NOME VARCHAR(100));

-- A tabela era InnoDB, mudei para MyISAM
ALTER TABLE DEFAULT_TABLE ENGINE = MyISAM;

-- Criando tabela e já especificando que o armazenamento da tabela será Memory
CREATE TABLE DEFAULT_TABLE2 (ID INTEGER, NOME VARCHAR(100)) ENGINE = MEMORY;