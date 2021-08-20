create database db_curso_da_minha_vida;

use db_curso_da_minha_vida;

create table tb_categoria(
id bigint auto_increment not null,
TipoFormacao varchar(255),
PossibilidadeDeIntercambio varchar(255),
primary key(id)
);

insert into tb_categoria(TipoFormacao, PossibilidadeDeIntercambio)values("Profissionalizante", "Sim");
insert into tb_categoria(TipoFormacao, PossibilidadeDeIntercambio)values("Graduação", "Sim");
insert into tb_categoria(TipoFormacao, PossibilidadeDeIntercambio)values("Pós-Graduação", "Sim");
insert into tb_categoria(TipoFormacao, PossibilidadeDeIntercambio)values("Mestrado", "Não");
insert into tb_categoria(TipoFormacao, PossibilidadeDeIntercambio)values("Técnologo", "Não");

create table tb_produtos(
id bigint auto_increment not null,
Curso varchar(255),
Preco decimal(6,2),
Duracao varchar(255),
Desconto varchar(255),
id_categoria bigint,
primary key(id),
foreign key(id_categoria) references tb_categoria (id)
);

insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("Medicina", 2800.00, "4 semestres", "30%" ,1);
insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("Turismo", 650.00, "6 semestres", "20%", 2);
insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("Jornalismo", 770.00, "6 meses", "15%", 5);
insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("Enfermagem", 1500.00, "12 semestres", "22%", 2);
insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("Marketing", 550.00, "2 semestres", "32%", 1);
insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("Analise e Desenvolvimento de Sistemas", 1100.00, "2 anos", "45%", 4);
insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("TI", 999.99, "6 meses", "10%", 3);
insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("Direito", 1200.00, "10 semestres","10%", 5);
insert into tb_produtos (Curso, Preco, Duracao, Desconto, id_categoria) values("Administração", 455.50, "8 semestres" ,"10%", 1);


select curso, CONCAT('R$', FORMAT(Preco, 2, 'pt_br')) as preco, duracao, desconto from tb_produtos where preco > 50;
select curso, CONCAT('R$', FORMAT(preco, 2, 'pt_br')) as preco, duracao, desconto from tb_produtos where preco > 3 and preco < 60 ;
select curso, CONCAT('R$', FORMAT(preco, 2, 'pt_br')) as preco, duracao, desconto from tb_produtos where nome like 'J%';

select tb_produtos.Curso, tb_produtos.Preco, tb_produtos.Duracao, tb_produtos.Desconto, tb_categoria.TipoFormacao, tb_categoria.PossibilidadeDeIntercambio
from tb_produtos inner join tb_categoria
on tb_categoria.id = tb_produtos.id_categoria;

select tb_produtos.Curso, tb_produtos.Preco, tb_produtos.Duracao, tb_produtos.Desconto, tb_categoria.TipoFormacao, tb_categoria.PossibilidadeDeIntercambio
from tb_produtos inner join tb_categoria 
on tb_categoria.id = tb_produtos.id_categoria where TipoFormacao like "%Pós-Graduação%";
