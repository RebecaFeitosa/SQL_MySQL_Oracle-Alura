SELECT * FROM PRODUTOS;

-- Modificando valores
UPDATE PRODUTOS SET PRECO_LISTA = 5 WHERE CODIGO = '1000889';

-- Modificando outra propriedade e vários campos
UPDATE PRODUTOS SET EMBALAGEM = 'PET', TAMANHO = '1 Litro', DESCRITOR = 'Sabor da Montanha - 1 Litro - Uva' 
WHERE CODIGO = '1000889';

-- Modificar em lote, vários registros ao mesmo tempo, depende apenas do filtro do where
SELECT * FROM PRODUTOS WHERE SABOR = 'Maracujá';

-- Exemplo: Precisamos aumentar em 10% os preços de lista do sabor Maracujá
UPDATE PRODUTOS SET PRECO_LISTA = PRECO_LISTA * 1.10 WHERE SABOR = 'Maracujá';

/* DESAFIO:/ Atualize o endereço do cliente com cpf 19290992743 para R. Jorge Emílio 23 
o bairro para Santo Amaro, a cidade para São Paulo, o estado para SP e o CEP para 8833223.  */
UPDATE CLIENTES SET ENDERECO = 'R. Jorge Emílio 23', BAIRRO = 'Santo Amaro', CIDADE = 'São Paulo', ESTADO = 'SP', CEP = '8833223'
WHERE CPF = '19290992743'; 

SELECT * FROM CLIENTES WHERE CPF = '19290992743';


-- UPDATE COM FROM
SELECT * FROM VENDEDORES;

SELECT * FROM SUCOS_VENDAS.TABELA_DE_VENDEDORES;

-- Passo 01 Colocar os valores de ferias do banco sucos_vendas em ferias no banco atual
SELECT * FROM VENDEDORES A
INNER JOIN SUCOS_VENDAS.TABELA_DE_VENDEDORES B
ON A.MATRICULA = SUBSTRING(B.MATRICULA,3,3);
/* O campo matricula tem a diferença dos dois zeros a mais no banco vendas_sucos, para tirar esses 0, colocar:
SUBSTRING(B.MATRICULA,3,3); significa que vai pegar os valores apenas do elemento 3 inicial e os proximos 3 */

-- Passo 02
UPDATE VENDEDORES A INNER JOIN SUCOS_VENDAS.TABELA_DE_VENDEDORES B
ON A.MATRICULA = SUBSTRING(B.MATRICULA,3,3)
SET A.FERIAS = B.DE_FERIAS;

/* DESAFIO:/ Podemos observar que os vendedores possuem bairro associados a eles. Vamos aumentar em 30% o 
volume de compra dos clientes que possuem, em seus endereços bairros onde os vendedores possuam escritórios.
Dica: Vamos usar um UPDATE com FROM usando o seguinte INNER JOIN:
SELECT A.CPF FROM CLIENTES A
INNER JOIN VENDEDORES B
ON A.BAIRRO = B.BAIRRO */
UPDATE CLIENTES A INNER JOIN VENDEDORES B
ON A.BAIRRO = B.BAIRRO
SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.30;

SELECT * FROM CLIENTES;