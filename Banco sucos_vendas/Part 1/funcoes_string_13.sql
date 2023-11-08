-- FUNÇÕES PARA STRING

-- LTRIM: tira os espaços da esquerda do texto
SELECT LTRIM('    OLÁ') AS RESULTADO;

-- RTRIM: tira os espaços da direita do texto
SELECT LTRIM('OLÁ     ') AS RESULTADO;

-- TRIM: tira os espaços da esquerda e direita do texto
SELECT TRIM('     OLÁ     ') AS RESULTADO;

-- CONCAT: concatenar textos
SELECT CONCAT('OLÁ', ' ', 'TUDO BEM', '?') AS RESULTADO;

-- UPER: transforma letras minúsculas em maiúsculas
SELECT UPPER('olá, tudo bem?') AS RESULTADO;

-- LOWER: transforma letras maiúsculas em minúsculas 
SELECT LOWER('OLÁ, TUDO BEM?') AS RESULTADO;

-- SUBSTRING: subconsulta, vai imprimir a partir da posição escolhida
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6) AS RESULTADO;
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO;

-- Exemplo: Consultar o nome do cliente e seu cpf entre parenteses
SELECT CONCAT(NOME, ' (', CPF, ') ') AS RESULTADO FROM tabela_de_clientes;

-- DESAFIO(sz): Faça uma consulta listando o nome do cliente e o endereço completo (rua, bairro, cidade e estado).
SELECT CONCAT(NOME, ' ', ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO) AS 	'ENDEREÇO COMPLETO' FROM tabela_de_clientes;