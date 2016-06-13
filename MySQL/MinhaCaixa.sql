DROP DATABASE IF EXISTS MinhaCaixa;
/*Create Database*/
CREATE DATABASE IF NOT EXISTS MinhaCaixa;

USE MinhaCaixa;

/*CREATE TABLES*/
CREATE TABLE IF NOT EXISTS Grupo
(
    GrupoCodigo INT auto_increment,
    GrupoNome VARCHAR(50),
    GrupoRazaoSocial VARCHAR(50),
    GrupoCNPJ varchar(20),
    constraint PK_Grupo primary key (GrupoCodigo)
);

CREATE TABLE IF NOT EXISTS Clientes
(
	ClienteCodigo int auto_increment,
	ClienteNome varchar (50),
	ClienteRua varchar (50),
	ClienteCidade varchar (50),
	ClienteNascimento datetime,
    CONSTRAINT PK_CLIENTES PRIMARY KEY (ClienteCodigo)

);

CREATE TABLE IF NOT EXISTS Agencias
(
    AgenciaCodigo INT auto_increment,
    AgenciaNome VARCHAR (50),
    AgenciaCidade varchar (50),
    AgenciaFundos decimal(10,2),
    GrupoCodigo int,
    CONSTRAINT PK_Agencias PRIMARY KEY (AgenciaCodigo)
);


CREATE TABLE IF NOT EXISTS Contas
(
    AgenciaCodigo int,
    ContaNumero VARCHAR (10),
    ClienteCodigo int,
    ContaSaldo DECIMAL(8,2),
    ContaAbertura datetime,
    CONSTRAINT PK_CONTA PRIMARY KEY (ContaNumero)
);

create table IF NOT EXISTS Emprestimos
(
    AgenciaCodigo INT,
    ClienteCodigo int,
    EmprestimoCodigo varchar (10),
    EmprestimoTotal DECIMAL(8,2),
    CONSTRAINT PK_EMPRESTIMOS PRIMARY KEY (EmprestimoCodigo)
);

CREATE TABLE IF NOT EXISTS Depositantes
(
	DepositanteCodigo int auto_increment,
    AgenciaCodigo INT,
    ContaNumero varchar( 10 ) ,
    ClienteCodigo int,
    DepositoValor DECIMAL( 8, 2 ) ,
    DepositoData DATETIME,
    CONSTRAINT PK_DEPOSITANTES PRIMARY KEY (DepositanteCodigo)
);

create table IF NOT EXISTS Devedores
(
	DevedorCodigo int auto_increment,
    AgenciaCodigo INT,
    ClienteCodigo int,
    EmprestimoCodigo varchar (10),
    DevedorSaldo DECIMAL(8,2),
    CONSTRAINT PK_DEVEDORES PRIMARY KEY (DevedorCodigo)
);


create table IF NOT EXISTS CartaoCredito
(
    AgenciaCodigo INT,
    ClienteCodigo int,
    CartaoCodigo varchar (20),
    CartaoLimite DECIMAL(8,2),
    CONSTRAINT PK_CARTAOCREDITO PRIMARY KEY (CartaoCodigo)
);



INSERT INTO Grupo(GrupoNome, GrupoRazaoSocial, GrupoCNPJ)
VALUES ('MyBank',
        'MyBank International SA',
        '11.222.333/0001-44');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Ana',
        'XV de Novembro',
        'Joinville',
        '1980-08-06');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Laura',
        '07 de Setembro',
        'Blumenau',
        '1981-08-08');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Vânia',
        '01 de Maio',
        'Blumenau',
        '1982-08-06');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Franco',
        'Felipe Schmidt',
        'Florianopolis',
        '1985-08-06');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Eduardo',
        'Beria Mar Norte',
        'Florianópolis',
        '1970-11-10');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Bruno',
        '24 de maio',
        'Criciúma',
        '1982-07-05');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Rodrigo',
        '06 de agosto',
        'Joinville',
        '1981-08-06');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Ricardo',
        'João Colin',
        'Joinville',
        '1980-02-15');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Alexandre',
        'Margem esquerda',
        'Blumenau',
        '1980-03-07');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Luciana',
        'Estreito',
        'Florianópolis',
        '1987-09-06');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Juliana',
        'Iririu',
        'Joinville',
        '1970-01-06');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Pedro',
        'Aventureiro',
        'Joinville',
        '1975-06-08');


INSERT INTO Clientes
VALUES (DEFAULT,
        'Julia',
        'Nova Brasília',
        'Joinville',
        '1985-03-18');

INSERT INTO Agencias 
VALUES (DEFAULT,
		'Verde Vale',
		'Blumenau', 
		 900000,
		 1);

INSERT INTO Agencias 
VALUES (DEFAULT,
		'Cidade das Flores',
		'Joinville', 
		 800000,
		 1);

INSERT INTO Agencias 
VALUES (DEFAULT,
		'Universitária', 
		'Florianópolis', 
	 	 750000,
		 1);

INSERT INTO Agencias 
VALUES (DEFAULT,
		'Joinville', 
		'Joinville', 
		 950000,
		 1);

INSERT INTO Agencias 
VALUES (DEFAULT,
		'Beira Mar', 
		'Florianópolis',
		 600000,
		 1);

INSERT INTO Agencias 
VALUES (DEFAULT,
		'Criciúma', 
		'Criciúma', 
		 500000,
		 1);

INSERT INTO Agencias 
VALUES (DEFAULT,
		'Blumenau', 
		'Blumenau', 
		 1100000,
	     1);

INSERT INTO Agencias 
VALUES (DEFAULT,
		'Germânia', 
		'Blumenau', 
		 400000,
		 1);
         