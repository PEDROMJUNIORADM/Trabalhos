-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Vendas (
codVenda int,
FKcodFuncionario int,
FKcodLoja int,
FKcodCliente int,
qtdTotalVendas int,
valorTotalVendas int,
PRIMARY KEY(codVenda,FKcodFuncionario,FKcodLoja,FKcodCliente)
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

/*Loja (codLoja, nome, endereço, cnpj)
VendasProduto (FK_codProduto, FK_codVenda, qnt)
Cliente (codCliente, nascimento, nome, sexo, email, cpf, endereço)
*/