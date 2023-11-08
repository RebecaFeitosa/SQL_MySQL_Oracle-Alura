-- PARA APAGAR REGISTROS, DADOS DENTRO DA TABELA

USE sucos;

DELETE FROM tbproduto WHERE PRODUTO = '1078680';
DELETE FROM tbproduto WHERE PRODUTO = '544931';

SELECT * FROM tbproduto;

-- DESAFIO: O vendedor João Geraldo Fonseca Junior matrícula (00233) foi demitido. Retire-o da tabela de vendedores.
DELETE FROM tbvendedores WHERE MATRICULA = '00233';

SELECT * FROM tbvendedores;