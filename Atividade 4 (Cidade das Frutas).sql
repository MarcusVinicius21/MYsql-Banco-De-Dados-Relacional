create database db_cidade_das_frutas;
use db_cidade_das_frutas;

create table tb_categoria(
id bigint auto_increment,
Setor varchar (255),
Origem varchar (255),
CustoPor varchar (255),
primary key (id)
);

insert into tb_categoria (Setor, Origem, CustoPor) Values ("Legumes", "Horta do seu Zé", "KG");
insert into tb_categoria (Setor, Origem, CustoPor) Values ("Frutas", "João Legumes", "UN");
insert into tb_categoria (Setor, Origem, CustoPor) Values ("Frutas", "Rei das Frutas", "KG");
insert into tb_categoria (Setor, Origem, CustoPor) Values ("Verduras", "Verde Master", "UN");
insert into tb_categoria (Setor, Origem, CustoPor) Values ("Verduras", "Cantinho do verde", "UN");


select * from tb_categoria;

create table tb_produto(
id bigint auto_increment,
Nome varchar (255),
Empacotagem varchar (255),
EmEstoque bigint,
Preco decimal (6, 2),
CodigoDeBarra bigint,
categoria_id bigint,
primary key (id),
foreign key (categoria_id) REFERENCES tb_categoria (id)
);

insert into tb_produto (Nome, Empacotagem, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Abobrinha", "A vácuo", 35, "3.99", 23456789101, 1);
insert into tb_produto (Nome, Empacotagem, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Batata", "Pelo Cliente", 47, 5.99, 14649464949, 1);
insert into tb_produto (Nome, Empacotagem, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Melão Yubari", "A vácuo", 10, 132.00, 67494134675, 4);
insert into tb_produto (Nome, Empacotagem, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Couve", "Pelo Cliente", 40, 5.00, 67431258794, 5);
insert into tb_produto (Nome, Empacotagem, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Alface", "A vácuo", 25, 5.00, 67431258794, 4);
insert into tb_produto (Nome, Empacotagem, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Banana", "Pelo Cliente", 100, 6.00, 67431258794, 2);
insert into tb_produto (Nome, Empacotagem, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Aipim", "Pelo Cliente", 17, 4.00, 67431258794, 5);
insert into tb_produto (Nome, Empacotagem, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Uva", "Pelo Cliente", 200, 8.00, 67431258794, 3);

select * from tb_produto;

select * from tb_produto where Preco > 50;

select * from tb_produto where Preco between 3 and 60;

select * from tb_produto where Nome like "C%";

select tb_produto.Nome, tb_produto.Empacotagem, tb_produto.EmEstoque, tb_produto.Preco, tb_produto.CodigoDeBarra, tb_categoria.Setor, tb_categoria.Origem, tb_categoria.CustoPor
from tb_produto inner join tb_categoria
on tb_categoria.id = tb_produto.categoria_id;

select tb_produto.Nome, tb_produto.Empacotagem, tb_produto.EmEstoque, tb_produto.Preco, tb_produto.CodigoDeBarra, tb_categoria.Setor, tb_categoria.Origem, tb_categoria.CustoPor
from tb_produto inner join
tb_categoria on tb_categoria.id = tb_produto.categoria_id where Setor like "%Verduras%";