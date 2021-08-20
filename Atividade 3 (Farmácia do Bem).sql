create database db_farmacia_do_bem;
use db_farmacia_do_bem;

create table tb_categoria(
id bigint auto_increment,
Segmento varchar (255),
NecessitaDeReceita varchar (255),
Setor varchar (255),
primary key (id)
);

insert into tb_categoria (Segmento, NecessitaDeReceita, Setor) Values ("Medicamento", "Sim", "Adulto");
insert into tb_categoria (Segmento, NecessitaDeReceita, Setor) Values ("Medicameto", "Não", "Adulto");
insert into tb_categoria (Segmento, NecessitaDeReceita, Setor) Values ("Medicamento", "Sim", "Infantil");
insert into tb_categoria (Segmento, NecessitaDeReceita, Setor) Values ("Cosmético", "Não", "Adulto");
insert into tb_categoria (Segmento, NecessitaDeReceita, Setor) Values ("Medicamento", "Não", "Infantil");

select * from tb_categoria;

create table tb_produto(
id bigint auto_increment,
NomeDoMedicamento varchar (255),
RecomendadoPara varchar (255),
Qtde bigint,
Preco decimal (6, 2),
CodigoDeBarra bigint,
categoria_id bigint,
primary key (id),
foreign key (categoria_id) REFERENCES tb_categoria (id)
);

insert into tb_produto (NomeDoMedicamento, RecomendadoPara, Qtde, Preco, CodigoDeBarra, categoria_id) Values ("Dipirona Sódica", "Dor de cabeça", 38, 3.99, 23456789101, 2);
insert into tb_produto (NomeDoMedicamento, RecomendadoPara, Qtde, Preco, CodigoDeBarra, categoria_id) Values ("Xarelto", "Anticoagulante", 47, 3.99, 14649464949, 1);
insert into tb_produto (NomeDoMedicamento, RecomendadoPara, Qtde, Preco, CodigoDeBarra, categoria_id) Values ("Saxenda", "Obesidade", 25, 119.90, 67494134675, 1);
insert into tb_produto (NomeDoMedicamento, RecomendadoPara, Qtde, Preco, CodigoDeBarra, categoria_id) Values ("Neosaldina", "Tensões musculares", 78, 5.99, 67431258794, 2);
insert into tb_produto (NomeDoMedicamento, RecomendadoPara, Qtde, Preco, CodigoDeBarra, categoria_id) Values ("BronzeSkin", "Proteção solar", 24, 24.00, 45478645139, 2);
insert into tb_produto (NomeDoMedicamento, RecomendadoPara, Qtde, Preco, CodigoDeBarra, categoria_id) Values ("Puran", "Hipotireoidismo", 10, 56.60, 35467913465, 3);
insert into tb_produto (NomeDoMedicamento, RecomendadoPara, Qtde, Preco, CodigoDeBarra, categoria_id) Values ("Pedialyte", "Diarréia infantil", 20, 13.00, 74561308794, 5);
insert into tb_produto (NomeDoMedicamento, RecomendadoPara, Qtde, Preco, CodigoDeBarra, categoria_id) Values ("Rexona Kids", "Mal odor nas axilas", 50, 13.49, 47563985231, 4);

select * from tb_produto;

select * from tb_produto where Preco > 50;

select * from tb_produto where Preco between 3 and 60;

select * from tb_produto where NomeDoMedicamento like "B%";

select tb_produto.NomeDoMedicamento, tb_produto.RecomendadoPara, tb_produto.Qtde, tb_produto.Preco, tb_produto.CodigoDeBarra, tb_categoria.Segmento, tb_categoria.NecessitaDeReceita, tb_categoria.Setor
from tb_produto inner join tb_categoria
on tb_categoria.id = tb_produto.categoria_id;

select tb_produto.NomeDoMedicamento, tb_produto.RecomendadoPara, tb_produto.Qtde, tb_produto.Preco, tb_produto.CodigoDeBarra, tb_categoria.Segmento, tb_categoria.NecessitaDeReceita, tb_categoria.Setor
from tb_produto inner join
tb_categoria on tb_categoria.id = tb_produto.categoria_id where Segmento like "%Cosmético%";