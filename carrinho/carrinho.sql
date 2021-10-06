/**
	Agenda de contatos
    @author Osvaldo Sandoli
*/
-- exibir banco de dados do servidor
show databases;
-- criar um novo banco de dados
create database dbcarros;
-- selecionar o banco de dados
use  dbcarros;

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
-- decimal -> inteiro 10,2 dez digito com 2 casas decimais

-- ---------------------------------------------------

-- CONTROLE DE VENDAS
create table carrinho(
codigo int primary key auto_increment,
produto varchar(250) not null,
quantidade int not null,
valor decimal(10,2) not null
);

describe carrinho;

drop table carrinhodecompras;


insert into carrinho(produto,quantidade,valor)
values ('Caneta bic CX 30',10,17.50);

insert into carrinho(produto,quantidade,valor)
values ('Lapis FaberCastel CX10',1,22);

insert into carrinho(produto,quantidade,valor)
values ('Fardo De Coca-Cola CX1',8,17.90);

insert into carrinho(produto,quantidade,valor)
values ('Fardo De Pepsi CX1',8,19.90);

insert into carrinho(produto,quantidade,valor)
values ('Bala Fini CX1',5,11.90);
-- CRUD Read
select * from carrinho;

-- Operações matemáticas no banco de dados
select sum(valor * quantidade) as total from carrinho;

--  ------------------------------------------------------
-- CONTROLE DE ESTOQUE
create database dbestoque;
use dbestoque;
drop database dbestoque;

-- timestamp default current_timestamp (data e hora automatico)
-- Date (tipo de dados relacionado a data) YYYYMMDD
create table estoque(
	codigo int primary key auto_increment,
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    quantidade int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    loc varchar(100)
);

describe estoque;
insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('caneta BIC azul','BIC',20221005,150,1,'CX',28.75,'setor A p2');
insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Guarana','Guarana',20221108,50,2,'CX',21,'setor C p4');
insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Coca-Cola','Coca-Cola',20211006,50,2,'CX',15,'setor C p7');
insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Lasanha','Sadia',20210404,20,2,'CX',13,'setor A p2');
insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Tody','Tody',20211010,1,3,'Uni',7,'setor C p15');

-- Inventario de estoque(total)
select sum(valor * quantidade) as total from estoque;

select * from estoque;

-- Relatorio de reposição de estoque 1
select * from estoque where quantidade < estoquemin;

-- Relatorio de reposição de estoque 2
-- Função:
-- date_format('%d/%m/%y') -> formatar a exibição da data
-- %d (dia) %m (mês) %y (ano 2 digitos) %Y (ano 4 digitos)

select codigo as código, produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
quantidade,  estoquemin as estoque_mínimo
from estoque where quantidade < estoquemin;

-- Relatorio de validade dos produtos 1
select codigo as código,produto,date_format(dataval,'%d/%m/%Y')
 as data_validade from estoque;
 
 -- Relatorio de validade dos produtos 2
 -- datediff() retorna a diferença em dias de duas datas
 -- curdate() data atual
 select codigo as código, produto, date_format(dataval,'%d/%m/%Y')
 as data_validade, datediff(dataval,curdate()) as dias_restantes
  from estoque;
  
  
  -- CRUD update 
-- Atenção não esqueça do whre e usar sempre o id para evitar problemas
update estoque set produto='Caneta BIC preta' where codigo = 1;
update estoque set produto='Nescau',fabricante='Nescau',dataval='20211231',quantidade='40',estoquemin='10',medida='Uni',valor='8',loc='setor C p13'  where codigo = 11;
  
  select * from estoque;
  
  -- CRUD Delete
-- Atenção não esqueça do whre e usar sempre o id para evitar problemas
delete from estoque where codigo = 5;
 
-- -----------------
drop table carrinho;
drop table estoque;
-- -------------------



--  -----------------------------------------------------------------------

create table loja(
barras int primary key auto_increment,
produto varchar(250) not null,
quantidade int not null,
valor decimal(10,2) not null
);

describe loja;

insert into loja(produto,quantidade,valor)
values ('Rodo',1,7.80);

insert into loja(produto,quantidade,valor)
values ('Nokia Tijolo',1,100);

insert into loja(produto,quantidade,valor)
values ('Pré Pago',1,10);

insert into loja(produto,quantidade,valor)
values ('Lã',4,9.90);

insert into loja(produto,quantidade,valor)
values ('Lantejola',4,9.90);

-- CRUD Read
select * from loja;

-- Operações matemáticas no banco de dados
select sum(valor * quantidade) as total from loja;




-- CRUD Read 
-- selecionar todos os registros(dados) da tabela 
select * from loja;
-- selecionar colunas especificas da tabela
select produto, valor from loja;

-- selecionar colunas em orgem crescente e decrescente(asc desc)
select * from loja;

select barras, produto from valor order by barras desc;

-- uso de filtros
select * from loja where quantidade = 4;
select * from loja where produto = 'Lã';
select * from loja where produto like 'L%';


-- CRUD update 
-- Atenção não esqueça do whre e usar sempre o id para evitar problemas
update loja set produto='rodo' where barras = 1;
update loja set valor=4 where barras = 1;
update loja set produto='Pá',quantidade=3,valor=3.50 where barras=5;

-- CRUD Delete
-- Atenção não esqueça do whre e usar sempre o id para evitar problemas
delete from loja where barras = 5;



