\connect postgres


-- Exclui banco se existir

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'minha_caixa') THEN
    ALTER DATABASE minha_caixa CONNECTION LIMIT 0;
    PERFORM pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'minha_caixa' AND pid != pg_backend_pid();
  END IF;
END; $$;
DROP DATABASE IF EXISTS minha_caixa;


-- Cria banco de dados

CREATE DATABASE minha_caixa;

\connect minha_caixa


-- Cria tabela grupo

CREATE TABLE grupo (
  codigo serial NOT NULL CONSTRAINT pk_grupo PRIMARY KEY,
  nome varchar(50),
  razao_social varchar(50),
  cnpj varchar(20)
);


-- Cria tabela grupo

CREATE TABLE cliente (
  codigo serial NOT NULL CONSTRAINT pk_cliente PRIMARY KEY,
  nome varchar(50),
  rua varchar(50),
  cidade varchar(50),
  nascimento timestamp
);