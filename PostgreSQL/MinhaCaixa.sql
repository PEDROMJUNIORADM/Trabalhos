\connect postgres


-- Exclui banco se existir

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'minha_caixa') THEN
    ALTER DATABASE minha_caixa CONNECTION LIMIT 0;
    PERFORM pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'minha_caixa' AND pid != pg_backend_pid();
  END IF;
END; $$;
DROP DATABASE IF EXISTS minha_caixa;


-- Cria banco de bados

CREATE DATABASE minha_caixa;

\connect minha_caixa


-- Cria tabelas

CREATE TABLE cliente (
  codigo serial NOT NULL CONSTRAINT pk_cliente PRIMARY KEY,
  nome varchar(50),
  rua varchar(50),
  cidade varchar(50),
  nascimento timestamp
);
