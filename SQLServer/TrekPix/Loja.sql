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

CREATE TABLE Produto(
	codProduto INT IDENTITY (1,1),
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

CREATE TABLE Compra(
codCompra int CONSTRAINT PK_COMPRA PRIMARY KEY,
codLoja int,
qntTotalItens int,
valorTotalCompras MONEY,
CONSTRAINT FK_LOJA_COMPRA FOREIGN KEY (codLoja) REFERENCES Loja (codLoja),
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

ALTER TABLE CLIENTE 
ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (codCliente)

ALTER TABLE PRODUTO 
ADD CONSTRAINT PK_PRODUTO PRIMARY KEY (codProduto)

ALTER TABLE LOJA 
ADD CONSTRAINT PK_LOJA PRIMARY KEY (codLoja)

ALTER TABLE VENDASPRODUTO 
ADD CONSTRAINT FK_VENDASPRODUTO_PRODUTO FOREIGN KEY (codProduto) REFERENCES PRODUTO(codProduto)

ALTER TABLE VENDASPRODUTO 
ADD CONSTRAINT FK_VENDASPRODUTO_VENDA FOREIGN KEY (codVenda) REFERENCES VENDA(codVenda)

ALTER TABLE VENDASPRODUTO 
ADD CONSTRAINT PK_VENDASPRODUTO PRIMARY KEY (codProduto, codVenda) 
