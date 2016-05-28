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
    AgenciaFundos decimal(8,2),
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
    EmprestimoTotal DECIMAL(8,2)
);

ALTER TABLE Emprestimos
ADD CONSTRAINT FK_EMPRESTIMOS_AGENGIA
FOREIGN KEY (AgenciaCodigo)
REFERENCES Agencias(AgenciaCodigo);

CREATE TABLE IF NOT EXISTS Depositantes(
    AgenciaCodigo INT,
    ContaNumero varchar( 10 ) ,
    ClienteCodigo int,
    DepositoValor DECIMAL( 8, 2 ) ,
    DepositoData DATETIME
);

create table IF NOT EXISTS Devedores
(
    AgenciaCodigo INT,
    ClienteCodigo int,
    EmprestimoCodigo varchar (10),
    DevedorSaldo DECIMAL(8,2)
);


create table IF NOT EXISTS CartaoCredito
(
    AgenciaCodigo INT,
    ClienteCodigo int,
    CartaoCodigo varchar (20),
    CartaoLimite DECIMAL(8,2)
);

ALTER TABLE Agencias ADD CONSTRAINT FK_GRUPOS_AGENCIAS 
FOREIGN KEY (GrupoCodigo) REFERENCES Grupo (GrupoCodigo);

ALTER TABLE CartaoCredito ADD CONSTRAINT FK_CARTAOCREDITO_AGENGIA 
FOREIGN KEY ( AgenciaCodigo ) REFERENCES Agencias( AgenciaCodigo );

ALTER TABLE CartaoCredito ADD CONSTRAINT FK_CARTAOCREDITO_CLIENTES 
FOREIGN KEY (ClienteCodigo) REFERENCES Clientes (ClienteCodigo);

ALTER TABLE Contas ADD CONSTRAINT FK_CLIENTES_CONTAS 
FOREIGN KEY  (ClienteCodigo) REFERENCES Clientes (ClienteCodigo);

ALTER TABLE Contas ADD CONSTRAINT FK_AGENCIA_CONTAS 
FOREIGN KEY  (AgenciaCodigo) REFERENCES Agencias (AgenciaCodigo);

ALTER TABLE Emprestimos ADD CONSTRAINT FK_EMPRESTIMOS_CLIENTES 
FOREIGN KEY  (ClienteCodigo) REFERENCES Clientes (ClienteCodigo);

ALTER TABLE Depositantes ADD CONSTRAINT FK_CONTA_AGENGIA 
FOREIGN KEY  (AgenciaCodigo) REFERENCES Agencias (AgenciaCodigo);

ALTER TABLE Depositantes ADD CONSTRAINT FK_DEPOSITANTES_CONTAS 
FOREIGN KEY  (ContaNumero) REFERENCES Contas (ContaNumero);

ALTER TABLE Depositantes ADD CONSTRAINT FK_DEPOSITANTES_CLIENTES 
FOREIGN KEY  (ClienteCodigo) REFERENCES Clientes (ClienteCodigo);

ALTER TABLE Devedores ADD CONSTRAINT FK_DEVEDORES_AGENGIA 
FOREIGN KEY  (AgenciaCodigo) REFERENCES Agencias (AgenciaCodigo);

ALTER TABLE Devedores ADD CONSTRAINT FK_DEVEDORES_CONTAS 
FOREIGN KEY  (ClienteCodigo) REFERENCES Clientes (ClienteCodigo);

/*ALTER TABLE Emprestimos ADD CONSTRAINT FK_EMPRESTIMOS_AGENGIA FOREIGN KEY ( AgenciaCodigo ) REFERENCES Agencias( AgenciaCodigo );*/

