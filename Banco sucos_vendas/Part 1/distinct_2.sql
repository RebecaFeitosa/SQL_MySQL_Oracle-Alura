-- Retorna vários valores repetidos
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

-- Retorna valores sem repetição
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos WHERE SABOR = 'Laranja';

SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM tabela_de_produtos;

-- DESAFIO (tive dificuldade): Quais são os bairros da cidade do Rio de Janeiro que possuem clientes?
SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';