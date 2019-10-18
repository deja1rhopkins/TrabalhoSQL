use master;
go
drop database mercado;
go
create database mercado ;
go
use mercado;
go
create table tb_clientes (
 id int IDENTITY(1,1) primary key,
 nome varchar(100),
 endereco varchar (100),
 fone varchar (100),
 email varchar (100)



)

create table tb_clientes_auditoria
(
id int identity (1,1) primary key,
nome varchar (50),
endereco varchar(50),
fone varchar (20),
email varchar(40),
acao_de_auditoria varchar(130),
data_de_auditoria varchar(30)
)

go

create trigger trgAfterIsertCliente on tb_clientes
for insert 
as 
declare @clinome varchar(100);
declare @cliend varchar (100);
declare @clifone varchar (100);
declare @cliemail varchar (100);

declare @audit_action varchar(100);

select @clinome=i.nome from inserted i;
select @cliend=i.endereco from inserted i;
select @clifone=i.fone from inserted i;
select @cliemail=i.email from inserted i;

set @audit_action=' ok';

insert into tb_clientes_auditoria (nome,endereco,fone,email,data_de_auditoria)
values(@clinome,@cliend,@clifone,@cliemail,getdate());
select* from tb_clientes;
select * from tb_clientes_auditoria

PRINT 'FIM DA EXECUCAO DA TRIGGER after insert cliente'
go


insert into tb_clientes (nome, endereco, fone,email) values ( 'aluno','rua imaginaria','132154646','aluno@email.com' );
