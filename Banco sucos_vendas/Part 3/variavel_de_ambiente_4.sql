-- O número de tabela temporárias criadas em disco
SHOW GLOBAL STATUS LIKE 'Created_tmp_disk_tables';

-- O número de tabelas temporárias criadas em memória
SHOW GLOBAL STATUS LIKE 'Created_tmp_tables';

-- Valor limite da variável de memória, em bits
SHOW GLOBAL VARIABLES LIKE 'tmp_table_size';

-- Aumentar o parâmetro da variável tmp_table_size
SET GLOBAL tmp_table_size = 208003328;