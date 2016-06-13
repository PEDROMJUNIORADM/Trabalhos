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

INSERT INTO grupo (nome, razao_social, cnpj) VALUES
  ('MyBank', 'MyBank International SA', '11.222.333/0001-44');


-- Cria tabela cliente

CREATE TABLE cliente (
  codigo serial NOT NULL CONSTRAINT pk_cliente PRIMARY KEY,
  nome varchar(50),
  rua varchar(50),
  cidade varchar(50),
  nascimento timestamp
);

INSERT INTO cliente (nome, rua, cidade, nascimento) VALUES
  ('Ana', 'XV de Novembro', 'Joinville', '1980-08-06'),
  ('Laura', '07 de Setembro', 'Blumenau', '1981-08-08'),
  ('Vânia', '01 de Maio', 'Blumenau', '1982-08-06'),
  ('Franco', 'Felipe Schmidt', 'Florianopolis', '1985-08-06'),
  ('Eduardo', 'Beria Mar Norte', 'Florianópolis', '1970-11-10'),
  ('Bruno', '24 de maio', 'Criciúma', '1982-07-05'),
  ('Rodrigo', '06 de agosto', 'Joinville', '1981-08-06'),
  ('Ricardo', 'João Colin', 'Joinville', '1980-02-15'),
  ('Alexandre', 'Margem esquerda', 'Blumenau', '1980-03-07'),
  ('Luciana', 'Estreito', 'Florianópolis', '1987-09-06'),
  ('Juliana', 'Iririu', 'Joinville', '1970-01-06'),
  ('Pedro', 'Aventureiro', 'Joinville', '1975-06-08'),
  ('Julia', 'Nova Brasília', 'Joinville', '1985-03-18');


-- Cria tabela agencia

CREATE TABLE agencia (
  codigo serial NOT NULL CONSTRAINT pk_agencia PRIMARY KEY,
  nome varchar(50),
  cidade varchar(50),
  fundos numeric(20,2),
  grupo_codigo integer CONSTRAINT fk_agencia_grupo REFERENCES grupo(codigo)
);

INSERT INTO agencia (nome, cidade, fundos, grupo_codigo) VALUES
  ('Verde Vale', 'Blumenau', 900000, 1),
  ('Cidade das Flores', 'Joinville', 800000, 1),
  ('Universitária', 'Florianópolis', 750000, 1),
  ('Joinville', 'Joinville', 950000, 1),
  ('Beira Mar', 'Florianópolis', 600000, 1),
  ('Criciúma', 'Criciúma', 500000, 1),
  ('Blumenau', 'Blumenau', 1100000, 1),
  ('Germânia', 'Blumenau', 400000, 1);
