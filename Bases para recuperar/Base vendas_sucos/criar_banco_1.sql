-- Criando banco de dados

-- Create schema/create database criam o banco
CREATE SCHEMA vendas_sucos;

-- Exemplo para criar com o charset
CREATE DATABASE vendas_sucos2 DEFAULT CHARACTER SET UTF8;

-- Retorna um aviso porque o banco já existe
CREATE DATABASE IF NOT EXISTS vendas_sucos2;

-- Apagar o banco
DROP DATABASE IF EXISTS vendas_sucos2;