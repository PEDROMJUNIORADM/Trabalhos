/*Reiniciar banco*/
/*
	SET DATEFORMAT YMD
	GO
	USE master
	GO
	IF EXISTS( SELECT * FROM Sys.databases WHERE NAME = 'Loja')
		BEGIN
			ALTER DATABASE Loja SET SINGLE_USER WITH ROLLBACK IMMEDIATE
			DROP  DATABASE Loja
		END

	CREATE DATABASE Loja
	GO
	USE Loja
	GO
*/

/*create table*/
CREATE TABLE Funcionario (
	codFuncionario int IDENTITY(1,1),
	nome VARCHAR(45),
	cargo VARCHAR(45),
	sexo CHAR(1),
	email VARCHAR(45),
	dataNascimento DATETIME
)

CREATE TABLE Cliente(
	codCliente int,
	nascimento date,
	nome varchar (255),
	sexo varchar (10),
	email varchar (255),
	cpf int,
	endereco varchar(255)
)

CREATE TABLE Produtos(
	codProduto INT IDENTITY (1,1) CONSTRAINT PK_PRODUTO PRIMARY KEY,
	ProdutoNome VARCHAR (45),
	ProdutoUnidadeMedida VARCHAR(5),
	ProdutoValor DECIMAL
)

CREATE TABLE Loja(
	codLoja int,
	nomeLoja varchar (255),
	enderecoLoja varchar (255),
	cnpj int
)

CREATE TABLE Venda (
	codVenda INT IDENTITY(1,1),
	codFuncionario INT,
	codLoja INT,
	codCliente INT,
	qtdTotalItens INT,
	valorTotalVenda INT
)

CREATE TABLE VendasProduto(
	codProduto int,
	codVenda int, 
	quantidade int
)

/*Constrains*/

ALTER TABLE FUNCIONARIO 
ADD CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (codFuncionario)

--ALTER TABLE COMPRA
--ADD CONSTRAINT PK_COMPRA PRIMARY KEY (codFuncionario)

ALTER TABLE VENDA 
ADD CONSTRAINT FK_VENDA_FUNCIONARIO FOREIGN KEY (codFuncionario) REFERENCES FUNCIONARIO(codFuncionario)

ALTER TABLE VENDA 
ADD CONSTRAINT FK_VENDA_LOJA FOREIGN KEY (codLoja) REFERENCES LOJA(codLoja)

ALTER TABLE VENDA 
ADD CONSTRAINT FK_VENDA_CLIENTE FOREIGN KEY (codCliente) REFERENCES CLIENTE(codCliente)

ALTER TABLE VENDA 
ADD CONSTRAINT PK_VENDA PRIMARY KEY (codVenda,codFuncionario,codLoja,codCliente)


