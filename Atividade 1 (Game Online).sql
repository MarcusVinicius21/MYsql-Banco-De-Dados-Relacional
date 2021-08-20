create database db_generation_game_online;
use db_generation_game_online;

create table tb_classe(
id bigint auto_increment,
Raça varchar (255) not null,
Tipo varchar (255),
Fraqueza varchar (255),
primary key (id)
);

insert into tb_classe (Raça, Tipo, Fraqueza) values ("Elfo", "Arqueiro", "Berserker");
insert into tb_classe (Raça, Tipo, Fraqueza) values ("Elfo", "Mago", "Guerreiro");
insert into tb_classe (Raça, Tipo, Fraqueza) values ("Orc", "Berserker", "Mago");
insert into tb_classe (Raça, Tipo, Fraqueza) values ("Humano", "Guerreiro", "Arqueiro");
insert into tb_classe (Raça, Tipo, Fraqueza) values ("Humano", "Feiticeiro", "Guerreiro");

select * from tb_classe;

create table tb_personagem(
id bigint auto_increment,
Nome varchar (255) not null,
ArmaFavorita varchar (255) not null,
Ataque bigint not null,
Defesa bigint not null,
Dps decimal(5, 2) not null,
classe_id bigint,
primary key (id),
foreign key (classe_id) REFERENCES tb_classe (id)
);

insert into tb_personagem (Nome, ArmaFavorita, Ataque, Defesa, Dps, classe_id) values ("Legolas", "Arco Divino", 5500, 2000, 150.5, 1);
insert into tb_personagem (Nome, ArmaFavorita, Ataque, Defesa, Dps, classe_id) values ("Harry Potter", "Varinha Mágica",1800, 4000, 90.5, 5);
insert into tb_personagem (Nome, ArmaFavorita, Ataque, Defesa, Dps, classe_id) values ("Dante", "Espada Demoníaca", 8000, 4000, 200, 4);
insert into tb_personagem (Nome, ArmaFavorita, Ataque, Defesa, Dps, classe_id) values ("Caim", "Adaga de Ossos", 5000, 2500, 145.5, 4);
insert into tb_personagem (Nome, ArmaFavorita, Ataque, Defesa, Dps, classe_id) values ("Mulher Maravilha", "Manoplas Explosivas", 9000, 4000, 250, 3);
insert into tb_personagem (Nome, ArmaFavorita, Ataque, Defesa, Dps, classe_id) values ("Mestre dos Magos", "Jóias do infinito", 11000, 900, 150.5, 2);
insert into tb_personagem (Nome, ArmaFavorita, Ataque, Defesa, Dps, classe_id) values ("Prestus", "Cartola Mágica", 500, 8000, 35, 2);
insert into tb_personagem (Nome, ArmaFavorita, Ataque, Defesa, Dps, classe_id) values ("Shera", "Espada de Greyskull", 6000, 2000, 150.5, 3);

select * from tb_personagem;

select * from tb_personagem where Ataque > 2000;

select * from tb_personagem where Ataque Between 1000 and 2000;

select * from tb_personagem where Nome like "C%";

select tb_personagem.Nome, tb_personagem.ArmaFavorita, tb_personagem.Ataque, tb_personagem.Defesa, tb_personagem.Dps, tb_classe.Raça, tb_classe.Tipo, tb_classe.Fraqueza
from tb_personagem inner join tb_classe
on tb_classe.id = tb_personagem.classe_id;

select * from tb_personagem inner join
tb_classe on tb_classe.id = tb_personagem.classe_id where Tipo like "%arqueiro%";
