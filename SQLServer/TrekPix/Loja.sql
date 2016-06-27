/**
* 
*/

/*SET DATEFORMAT YMD
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
GO*/

CREATE TABLE Vendas (
codVenda INT IDENTITY(1,1) CONSTRAINT PK_Vendas PRIMARY KEY,
codFuncionario INT,
codLoja INT,
codCliente INT,
qtdTotalVendas INT,
valorTotalVendas INT,
/*PRIMARY KEY(codVenda,codFuncionario,codLoja,codCliente)*/
)


CREATE TABLE Funcionario (
codFuncionario int IDENTITY(1,1) CONSTRAINT PK_Funcionario PRIMARY KEY,
nome VARCHAR(45),
cargo VARCHAR(45),
sexo CHAR(1),
email VARCHAR(45),
dataNascimento DATETIME
)

CREATE TABLE Loja(
codLoja int,
nomeLoja varchar (255),
enderecoLoja varchar (255),
cnpj int,
)

CREATE TABLE VendasProduto(
codProduto int,
codVenda int, 
quantidade int,
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

