CREATE TABLE Grupo
(
	GrupoCodigo int auto_increment,
	GrupoNome VARCHAR(50),
	GrupoRazaoSocial VARCHAR(50),
	GrupoCNPJ varchar(20),
    constraint PK_Grupo primary key (GrupoCodigo)
);

INSERT INTO Grupo(GrupoNome, GrupoRazaoSocial, GrupoCNPJ)
VALUES ('MyBank', 'MyBank International SA', '11.222.333/0001-44');

CREATE TABLE Clientes
(
	ClienteCodigo int auto_increment,
	ClienteNome varchar (50),
	ClienteRua varchar (50),
	ClienteCidade varchar (50),
	ClienteNascimento datetime,
    constraint PK_CLIENTES primary key (ClienteCodigo)

);

insert into Clientes values (default,'Ana', 'XV de Novembro','Joinville','1980-08-06');
insert into Clientes values (default,'Laura','07 de Setembro','Blumenau','1981-08-08');
insert into Clientes values (default,'Vânia','01 de Maio','Blumenau','1982-08-06');
insert into Clientes values (default,'Franco','Felipe Schmidt','Florianopolis','1985-08-06');
insert into Clientes values (default,'Eduardo', 'Beria Mar Norte', 'Florianópolis','1970-11-10');
insert into Clientes values (default,'Bruno', '24 de maio','Criciúma','1982-07-05');
insert into Clientes values (default,'Rodrigo','06 de agosto','Joinville','1981-08-06');
insert into Clientes values (default,'Ricardo','João Colin','Joinville','1980-02-15');
insert into Clientes values (default,'Alexandre','Margem esquerda','Blumenau','1980-03-07');
insert into Clientes values (default,'Luciana','Estreito','Florianópolis','1987-09-06');
insert into Clientes values (default,'Juliana','Iririu','Joinville','1970-01-06');
insert into Clientes values (default,'Pedro','Aventureiro','Joinville','1975-06-08');
insert into Clientes values (default,'Julia','Nova Brasília','Joinville','1985-03-18');

CREATE TABLE IF NOT EXISTS Agencias
(
AgenciaCodigo INT auto_increment PRIMARY KEY,
AgenciaNome VARCHAR (50),
AgenciaCidade varchar (50),
AgenciaFundos decimal(8,2),
GrupoCodigo int
);

CREATE TABLE IF NOT EXISTS Contas
(
AgenciaCodigo int,
ContaNumero VARCHAR (10) PRIMARY KEY,
ClienteCodigo int,
ContaSaldo DECIMAL(8,2),
ContaAbertura datetime
);

create table IF NOT EXISTS Emprestimos
(
AgenciaCodigo INT,
ClienteCodigo int,
EmprestimoCodigo varchar (10),
EmprestimoTotal DECIMAL(8,2)
);

create table Depositantes
(
AgenciaCodigo INT,
ContaNumero varchar(10),
ClienteCodigo int,
DepositoValor DECIMAL(8,2),
DepositoData DATETIME
);

create table Devedores
(
AgenciaCodigo INT,
ClienteCodigo int,
EmprestimoCodigo varchar (10),
DevedorSaldo DECIMAL(8,2)
);

create table CartaoCredito
(
AgenciaCodigo INT,
ClienteCodigo int,
CartaoCodigo varchar (20),
CartaoLimite DECIMAL(8,2)
)
