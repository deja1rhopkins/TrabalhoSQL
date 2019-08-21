use master

go
Create database lojainfo
Go
use lojainfo
Go

create table tb_Cliente(
Id_cliente int not null primary key identity,
DataNasc datetime not null,
Nome_client  varchar(50)  not null,
Enderc varchar(100) not null,
Telephone int not null
)
go

Create table tb_Vendas(
id_produto int  not null  PRIMARY key  identity,
id_cliente int not null  foreign key references Cliente,
nome_prod  varchar(50) not null,
Data datetime not null, 
Nome_client  varchar(50)  not null,
idVenda int not null

)
go

Create table tb_Vendas_Canceladas  (
id_produto int  not null ,
nome_prod  varchar(50) not null,
Data datetime not null, 
Id_cliente int not null,
idVenda int not null primary key identity
)
go
Create table tb_Item_Vendido(
id_produto int  not null foreign key references Produtos,
nome_prod  varchar(50) not null,
Data datetime not null, 
Id_cliente int not null,
idVenda int not null foreign key references tb_Vendas, 
idVendasCanceladas int not null foreign key references VendasCanceladas,

)
go
Create table tb_Produtos(
id_produto int  not null primary key identity,
nome_prod  varchar(50) not null,
qtde_prod int not null,
preco decimal (10,2) not null

)
go
Insert  into tb_Vendas values (1, 300, 'Fanta', 22/09/2019, 'Jose', 1231),
			(2, 340, 'Coca', '12/10/2019', 'Marcos', 1882);
go
Insert  into tb_Cliente values (1, '22/09/1998',  'Jose', 'Av Paulista, 234', 11276383903),
			(2, '02/08/1989',  'Marcos', 'Av Paulista, 234', 11324256645);
go
Insert  into tb_Vendas_Canceladas  values (123, 'Molho', '10/05/2019',  2  , 300),
			(143, 'Cerveja', '30/06/2019',  6  , 360);
go
Insert  into tb_Item_Vendido values (4, 'Alho', '30/08/2019', 700, 345),
			(6, 'Arroz', '20/12/2019', 750, 399);
go
Insert  into tb_Produtos values	(30, 'Laranja', 9,  2.3);
go

