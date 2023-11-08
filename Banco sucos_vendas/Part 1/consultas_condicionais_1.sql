USE sucos_vendas;

SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';

SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' AND TAMANHO = '470 ml';

SELECT * FROM tabela_de_produtos WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470 ml');

SELECT * FROM tabela_de_produtos WHERE NOT (SABOR = 'Manga' OR TAMANHO = '470 ml');

SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' AND NOT (TAMANHO = '470 ml');

SELECT * FROM tabela_de_produtos WHERE SABOR IN ('Laranja', 'Manga');

SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('São Paulo', 'Rio de Janeiro') AND IDADE >= 20;

SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('São Paulo', 'Rio de Janeiro') AND (IDADE >= 20 AND IDADE <=25);
