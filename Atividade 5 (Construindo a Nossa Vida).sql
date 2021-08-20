create database db_construindo_a_nossa_vida;
use db_construindo_a_nossa_vida;

create table tb_categoria(
id bigint auto_increment,
Departamento varchar (255),
PreMontado varchar (255),
Aplicacao varchar (255),
primary key (id)
);

insert into tb_categoria (Departamento, PreMontado, Aplicacao) Values ("Banheiro", "Não", "Acabamento");
insert into tb_categoria (Departamento, PreMontado, Aplicacao) Values ("Cozinha", "Sim", "Acabamento");
insert into tb_categoria (Departamento, PreMontado, Aplicacao) Values ("Sala", "Não", "Acabamento");
insert into tb_categoria (Departamento, PreMontado, Aplicacao) Values ("Paredes", "Não", "Construção");
insert into tb_categoria (Departamento, PreMontado, Aplicacao) Values ("Piso", "Não", "Acabamento");

select * from tb_categoria;

create table tb_produto(
id bigint auto_increment,
Nome varchar (255),
Marca varchar (255),
EmEstoque bigint,
Preco decimal (6, 2),
CodigoDeBarra bigint,
categoria_id bigint,
primary key (id),
foreign key (categoria_id) REFERENCES tb_categoria (id)
);

insert into tb_produto (Nome, Marca, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Chuveiro a gás", "Hidra", 35, 90.00, 23456789101, 1);
insert into tb_produto (Nome, Marca, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Lavatório", "Deca", 25, 45.00, 14649464949, 1);
insert into tb_produto (Nome, Marca, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Gesso p/ Sanka", "Super Gesso", 80, 30.00, 67494134675, 3);
insert into tb_produto (Nome, Marca, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Cimento 50KG", "Votoran", 20, 55.00, 67431258794, 4);
insert into tb_produto (Nome, Marca, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Ceramica M²", "Duratex", 100, 43.50, 67431258794, 5);
insert into tb_produto (Nome, Marca, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Azulejo M²", "Duratex", 50, 25.30, 2367431258794, 2);
insert into tb_produto (Nome, Marca, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Sofá", "MDR móveis", 15, 1200.00, 67431258794, 3);
insert into tb_produto (Nome, Marca, EmEstoque, Preco, CodigoDeBarra, categoria_id) Values ("Pia", "Deca", 20, 700.00, 67431258794, 2);

select * from tb_produto;

select * from tb_produto where Preco > 50;

select * from tb_produto where Preco between 3 and 60;

select * from tb_produto where Nome like "C%";

select tb_produto.Nome, tb_produto.Marca, tb_produto.EmEstoque, tb_produto.Preco, tb_produto.CodigoDeBarra, tb_categoria.Departamento, tb_categoria.PreMontado, tb_categoria.Aplicacao
from tb_produto inner join tb_categoria
on tb_categoria.id = tb_produto.categoria_id;

select tb_produto.Nome, tb_produto.Marca, tb_produto.EmEstoque, tb_produto.Preco, tb_produto.CodigoDeBarra, tb_categoria.Departamento, tb_categoria.PreMontado, tb_categoria.Aplicacao
from tb_produto inner join
tb_categoria on tb_categoria.id = tb_produto.categoria_id where Departamento like "%Cozinha%";