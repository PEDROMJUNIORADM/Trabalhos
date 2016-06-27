-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE vendas (
codVenda int,
FKcodFuncionario int,
FKcodLoja int,
FKcodCliente int,
qtdTotalVendas int,
valorTotalVendas int,
PRIMARY KEY(codVenda,FKcodFuncionario,FKcodLoja,FKcodCliente)
)

CREATE TABLE Produtos(
	codProduto INT IDENTITY (1,1) CONSTRAINT PK_PRODUTO PRIMARY KEY,
	ProdutoNome VARCHAR (45),
	ProdutoUnidadeMedida VARCHAR(5),
	ProdutoValor DECIMAL
)

