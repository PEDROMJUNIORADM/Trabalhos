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

