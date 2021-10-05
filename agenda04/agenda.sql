/**
	Agenda de contatos
    @author Osvaldo Sandoli
*/
-- exibir banco de dados do servidor
show databases;
-- criar um novo banco de dados
create database dbagenda;
-- excluir um banco de dados
drop database dbtest;
drop database sdtest;
-- selecionar o banco de dados
use  dbagenda;

-- CRUD (Create Read Update Delete)
-- operações básicas do banco de dados

-- CRUD Create
insert into contatos(nome,fone,email)
values ('Osvaldo Sandoli','99999-11111','osv@email.com');

insert into contatos(nome,fone,email)
values ('Ruan Carlos','99229-11891','rua@email.com');

insert into contatos(nome,fone,email)
values ('José Carlos','99666-1331','jos@email.com');

insert into contatos(nome,fone,email)
values ('Leticia Almeida','99333-1122','asd@email.com');

insert into contatos(nome,fone)
values ('Gabriel','9887-0011');



-- CRUD Read 
-- selecionar todos os registros(dados) da tabela 
select * from contatos;

-- verificar tabelas existentes
show tables;

-- Criando uma tabela
-- Toda tabela precisa ter uma chave primaria (PK)
-- int (tipo de dados -> números inteiros
-- primary key -> transforma este campo em chave primaria
-- auto_increment -> numeração automatica
-- varchar -> (tipo de dados equivalente a String (50) numero maximo de caracteres)
-- not null -> não permite preenchimento obrigatório
-- unique -> não permite valores duplicados na tabela

create table contatos(
	id int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar(50) unique
);

-- descrição da tabela 
describe contatos;

-- alterar o nome de um campo na tabela
alter table contatos change nome contato varchar(50) not null;

-- adicionar um novo campo na tabela
alter table contatos add column obs varchar(250);

-- adicionar um novo campo(coluna) especifico tabela
alter table contatos add column fone2 varchar(15) after fone;

-- modificar tipo de dados e/ou validação na coluna
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;

-- excluir uma coluna da tabela
alter table contatos drop column obs;

-- excluir a tabela
drop table contatos;

