-- Todos que tem maça independente se tiver outro sabor junto serão executados
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';

-- Apenas quem tem maça será executado
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE 'Maça%';

SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%' AND EMBALAGEM = 'PET';

-- DESAFIO: Quantos clientes possuem o último sobrenome Mattos?
SELECT * FROM tabela_de_clientes WHERE NOME LIKE '%Mattos';