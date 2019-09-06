CREATE TABLE ClienteC (
	ID INT NOT NULL IDENTITY(1,1)
	, Nome VARCHAR(50) NOT NULL
	, Endereco VARCHAR(255) NULL
	, CONSTRAINT PK_Cliente PRIMARY KEY ( ID )
)
GO
CREATE TABLE TelefoneT (
	Id_cliente INT NOT NULL
	, Numero INT NOT NULL
	, CONSTRAINT PK_Telefone PRIMARY KEY ( Id_cliente, Numero )
	, CONSTRAINT FK_TelefoneCliente FOREIGN KEY ( ID_cliente ) REFERENCES Cliente ( ID )
)
GO
CREATE TABLE Produto (
ID INT NOT NULL IDENTITY(1,1)
	, Nome VARCHAR(50) NOT NULL
, CONSTRAINT PK_Produto PRIMARY KEY ( ID )
)
GO
CREATE TABLE PedidoP (
Numero INT NOT NULL IDENTITY(1,1)
, DataHora DATETIME NOT NULL
, Id_cliente INT NOT NULL
	, CONSTRAINT PK_Pedido PRIMARY KEY (Numero )
	, CONSTRAINT FK_PedidoCliente FOREIGN KEY ( ID_cliente ) REFERENCES Cliente ( ID )
)
GO
CREATE TABLE ItemPedidoP (
	NumeroPedido INT NOT NULL
	, ID_produto INT NOT NULL
	, Qtde INT NOT NULL
	, CONSTRAINT PK_PedidoP PRIMARY KEY (NumeroPedido, ID_produto)
	, CONSTRAINT FK_ItemPedidoPedidoP FOREIGN KEY ( NumeroPedido) REFERENCES PedidoP ( Numero )
	, CONSTRAINT FK_ItemPedidoProdutoP FOREIGN KEY ( ID_produto) REFERENCES Produto ( ID )
)

ALTER TABLE [SALAS\1901100].Produto 
ADD PRECOTABELADO DECIMAL(6,2) NULL

ALTER TABLE [SALAS\1901100].ItemPedidoP
ADD PRECOVENDA DECIMAL(6,2) NULL

SELECT * FROM [SALAS\1901100].Produto

SELECT SUSER_NAME()

ALTER TABLE ITEMPEDIDOP
ADD CONSTRAINT CKqtd CHECK (QTDE > 0)

ALTER TABLE PEDIDOP
ADD CONSTRAINT DF_DTPED DEFAULT (GETDATE()) FOR DataHora

ALTER TABLE PRODUTO
ADD CONSTRAINT UN_NOMPROD UNIQUE (NOME)


