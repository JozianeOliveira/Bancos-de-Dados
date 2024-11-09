create table if not exists teste(
id int,
nome varchar(10),
idade int
);

insert into teste value
('1','André','47'),
('2','José','44'),
('3','Mané','55');

select * from cursos;

drop table if exists testecursos;

desc cursos;

alter table gafanhotos change column prof profissao varchar(20);


insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritimos', 'Lógica de programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução a linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Banco de dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças rítimicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer Kibe', '40', '30', '2108'),
('10', 'Youtuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

update cursos set nome = 'HTML5' where idcurso = '1';

update cursos set nome = 'PHP', ano = '2015' where idcurso = '4';

update cursos set ano = '2018', carga = '0' where ano = '2050' limit 1; 

select * from cursos;

delete from cursos where carga = '0' limit 1;

truncate table cursos;

describe cursos;

select * from cursos order by nome;

select * from cursos order by nome desc;

select ano, carga from cursos order by carga;

select nome, sexo from gafanhotos order by sexo asc;

select * from cursos where ano = 2016 order by nome;

select nome, descricao from cursos where ano <= 2015 order by nome;

select nome, ano from cursos where ano between 2014 and 2016;

select nome, ano from cursos where ano in (2014, 2016);

select nome, carga, totaulas from cursos where carga > 35 and totaulas < 30;

select * from cursos where nome like '___a%';

select distinct carga from cursos order by carga; 

select count(*) from cursos where carga > 40;

select max(carga) from cursos;

select min(totaulas), nome from cursos where ano = 2016; 

select sum(totaulas) from cursos;

select sum(totaulas) from cursos where ano = 2016;

select avg(totaulas) from cursos where ano = 2016;

SELECT 
    carga, COUNT(nome)
FROM
    cursos
GROUP BY carga
having count(nome) > 3;

select * from cursos where carga = 30;

select ano, count(*) from cursos group by ano;

#================================= AULA 15 ==================================
use cadastro;

describe gafanhotos;

alter table gafanhotos add column cursopreferido int; # pode colocar aqui no final 'first' ou 'after'

/*
Adicionando chave estrangeira para fazer um relacionamento baseado em:
|============| N     |=========|     1 |===========|            
| GAFANHOTOS |-------| PREFERE |-------|   CURSO   |
|============|       |=========|       |===========|
*/
alter table gafanhotos add foreign key (cursopreferido) references cursos(idcurso);

select * from gafanhotos;
select * from cursos;

update gafanhotos set cursopreferido = '6' where id = '1';



delete from cursos where idcurso = '6'; /* isso gera erro pq "idcurso = 6" é o curso preferido do
Daniel Moraes na table gafanhotos, portanto estão relacionados e não pode ser apagado pois causa
inconsistencia. */

delete from cursos where idcurso = '28'; /* Aqui o 'idcurso = 28' foi apagado sem erro, pq não há 
nenhum usuario em 'gafanhoto' que prefere esse curso, ou seja, que esteja relacioanado a ele.*/

select nome, cursopreferido from gafanhotos;

select nome, ano from cursos;

SELECT 
    gafanhotos.nome,
    gafanhotos.cursopreferido,
    cursos.nome,
    cursos.ano
FROM
    gafanhotos
        INNER JOIN
    cursos; /*  Aqui foi feito um join entre as tables, mas a listagem foi mostrada de forma não
    muito inteligente. OBS: o 'INNER' pode ser omitido*/
    
    SELECT 
    gafanhotos.nome,
    gafanhotos.cursopreferido,
    cursos.nome,
    cursos.ano
FROM
    gafanhotos
        JOIN
    cursos ON cursos.idcurso = gafanhotos.cursopreferido order by gafanhotos.nome; /* Com o uso de ON
    é indicada as relações usando a chave primária de 'cursos' com a chave estrangeira de 'gafanhoto'*/
    
    
SELECT 
    g.nome, c.nome, c.ano
FROM
    gafanhotos AS g
        INNER JOIN
    cursos AS c ON c.idcurso = g.cursopreferido
ORDER BY g.nome; /*Aqui foi usado o recurso de apelido usando 'AS' para assim poder escrever
somente a primeira letra da tabela para facilitar. 'Inner join' == 'join' */


SELECT 
    g.nome, c.nome, c.ano
FROM
    gafanhotos AS g LEFT OUTER JOIN cursos AS c ON c.idcurso = g.cursopreferido; /* 'left outer join'
é para dar preferencia na listagem para a table da esquerda que é 'ganhanhoto'.
OBS: pode-se omitir o 'outer'*/

SELECT 
    g.nome, c.nome, c.ano
FROM
    gafanhotos AS g RIGHT OUTER JOIN cursos AS c ON c.idcurso = g.cursopreferido; /* 'right outer
join' é para dar preferencia na listagem para a table da direita que é 'cursos'.
OBS: pode-se omitir o 'outer'*/


# ============================= AULA 16 ===================================

/*
Cardinalidade de "MUITOS" para "MUITOS":

|============| N      |=========|      N |===========|            
| GAFANHOTOS |--------| ASSISTI |--------|   CURSO   |
|============|        |=========|        |===========|  


A técnica utilizada neste caso é transformar "ASSISTI" em uma entidade,
ficando 2 relacionamentos de 1 para muitos:

|============| 1    ==    N |=========| N    ==   1 |===========|            
| GAFANHOTOS |-----|  |-----| ASSISTI |-----|  |----|   CURSO   |
|============|      ==      |=========|      ==     |===========|

Assim, "assisti" será uma table que terá a chave estrangeira de "gafanhotos" e "cursos" que 
consequentemente terão também a chave estrangeira de "assisti".
*/

# Criando a table "assisti" com seus campos e as chaves estrangeiras:
use cadastro;
CREATE TABLE assisti (
    id INT NOT NULL AUTO_INCREMENT,
    data DATE,
    idgafanhoto INT,
    idcurso INT,
    PRIMARY KEY (id),
    FOREIGN KEY (idgafanhoto)
        REFERENCES gafanhotos (id),
    FOREIGN KEY (idcurso)
        REFERENCES cursos (idcurso)
)  DEFAULT CHARSET=UTF8;

# Inserindo registros em "assisti";
insert into assisti values (default, '2014-03-01', '1', '2');
SELECT * FROM assisti;

# Selecionado gafanhoto e assiti
SELECT 
    g.nome, a.idcurso
FROM
    gafanhotos g
        JOIN
    assisti a ON g.id = a.idgafanhoto
ORDER BY g.nome;
/* Nesta listagem não aparece o nome do curso, para isso precisa fazer mais um "JOIN" com
a tabela "cursos": */
SELECT 
    g.nome, c.nome
FROM
    gafanhotos g
        JOIN
    assisti a ON g.id = a.idgafanhoto
        JOIN
    cursos c ON c.idcurso = a.idcurso
ORDER BY g.nome;

