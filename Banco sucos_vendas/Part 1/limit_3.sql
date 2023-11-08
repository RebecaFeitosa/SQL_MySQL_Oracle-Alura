-- TRAZ OS 5 PRIMEIROS
SELECT * FROM tabela_de_produtos LIMIT 5;

-- QUERO PEGAR A PARTIR DO 0º OS TRES PROXIMOS, INCLUINDO O 0
SELECT * FROM tabela_de_produtos LIMIT 0,3;

-- DESAFIO: Queremos obter as 10 primeiras vendas do dia 01/01/2017. Qual seria o comando SQL para obter este resultado?
SELECT * FROM notas_fiscais WHERE DATA_VENDA = '2017-01-01' LIMIT 10;