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

-- alterar o nome d eum campo na tabela
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

