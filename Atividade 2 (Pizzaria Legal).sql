create database db_pizzaria_legal;

use db_pizzaria_legal;

create table Categoria(
id bigint auto_increment,
Sabor varchar (255),
Borda varchar (255),
Brinde varchar (255),
primary key (id)
);

insert into Categoria (Sabor, Borda, Brinde) Values ("Carne", "Cheddar", "Dolly Limão");
insert into Categoria (Sabor, Borda, Brinde) Values ("Frango", "Catupiry", "Dolly Laranja");
insert into Categoria (Sabor, Borda, Brinde) Values ("Peixes", "Cream Cheese", "Guaraná Antártica");
insert into Categoria (Sabor, Borda, Brinde) Values ("Vegana", "Cheddar", "Coca Cola");
insert into Categoria (Sabor, Borda, Brinde) Values ("Queijos", "Cheddar", "Fanta Uva");

select * from Categoria;

create table tb_pizza(
id bigint auto_increment,
NomePizza varchar (255),
Tamanho varchar (255),
Preço decimal (6, 2),
Ingredientes varchar (255),
Categoria_id bigint,
primary key (id),
foreign key (Categoria_id) REFERENCES Categoria (id)
);

insert into tb_pizza (NomePizza, Tamanho, Preço, Ingredientes, Categoria_id) Values ("Carne seca", "Pequeno", 29.00, "Carne Seca, cream cheese e azeitona", 1);
insert into tb_pizza (NomePizza, Tamanho, Preço, Ingredientes, Categoria_id) Values ("Frango à moda", "Grande", 45.00, "Frango desfiado, catupiry e milho", 2);
insert into tb_pizza (NomePizza, Tamanho, Preço, Ingredientes, Categoria_id) Values ("Atum", "Médio", 39.00, "Atum, mussarela e azeitona", 3);
insert into tb_pizza (NomePizza, Tamanho, Preço, Ingredientes, Categoria_id) Values ("Calabra Veggie", "Grande", 55.00, "Calabresa vegana e cebola", 4);
insert into tb_pizza (NomePizza, Tamanho, Preço, Ingredientes, Categoria_id) Values ("2 Queijos", "Médio", 35.00, "Queijo mussarela e parmesão", 5);
insert into tb_pizza (NomePizza, Tamanho, Preço, Ingredientes, Categoria_id) Values ("Salmão a moda", "Pequeno", 50.00, "Salmão, bacon e mussarela", 3);
insert into tb_pizza (NomePizza, Tamanho, Preço, Ingredientes, Categoria_id) Values ("Caipira", "Grande", 40.00, "Frango desfiado, milho e requeijão", 2);
insert into tb_pizza (NomePizza, Tamanho, Preço, Ingredientes, Categoria_id) Values ("Mussarela", "Pequeno", 25.00, "Queijo mussarela e tomate", 5);
 
select * from tb_pizza;
 
select * from tb_pizza where Preço > 45;
 
select * from tb_pizza where Preço between 29 and 60;
 
select * from tb_pizza where NomePizza like "C%";
 
select tb_pizza.NomePizza, tb_pizza.Tamanho, tb_pizza.Preço, tb_pizza.Ingredientes, Categoria.Sabor, Categoria.Borda, Categoria.Brinde
from tb_pizza inner join Categoria
on Categoria.id = tb_pizza.Categoria_id;

select tb_pizza.NomePizza, tb_pizza.Tamanho, tb_pizza.Preço, tb_pizza.Ingredientes, Categoria.Sabor, Categoria.Borda, Categoria.Brinde
from tb_pizza inner join
Categoria on Categoria.id = tb_pizza.Categoria_id where Sabor like "%Peixes%";
