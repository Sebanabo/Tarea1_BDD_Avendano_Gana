drop table if exists RESULTADOS
drop table if exists CATEGORIA
drop table if exists DEPORTE
drop table if exists DEPORTISTA
drop table if exists PAISES
drop table if exists JUEGOS_OLIMPICOS


create table JUEGOS_OLIMPICOS (
    id_juego_olimpico integer primary key identity(1,1),
	edicion varchar(20) unique
);

create table PAISES (
    id_pais integer primary key identity(1,1),
	nombre varchar(50),
	codigo_pais varchar(3) 
);

create table DEPORTISTA (
    id_deportista integer primary key identity(1,1),
	nombre varchar(150),
	sexo varchar(1),
	edad integer,
	altura integer,
	peso float,
	id_pais integer foreign key references PAISES(id_pais)
);

create table DEPORTE (
    id_deporte integer primary key identity(1,1),
	nombre varchar(50) unique
);

create table CATEGORIA (
    id_categoria integer primary key identity(1,1),
	nombre varchar(100) unique,
	id_deporte integer foreign key references DEPORTE (id_deporte)
);

create table RESULTADOS (
    id_juego_olimpico integer foreign key references JUEGOS_OLIMPICOS (id_juego_olimpico),
	id_categoria integer foreign key references CATEGORIA (id_categoria),
	id_deportista integer foreign key references DEPORTISTA (id_deportista),
	medalla varchar(10)
	primary key(id_juego_olimpico, id_categoria, id_deportista)
);


use athlete_events

select top 250 * from athlete_events


insert into 
    JUEGOS_OLIMPICOS (edicion)
select distinct Games
from athlete_events;

insert into 
    PAISES (nombre, codigo_pais)
select distinct Team, NOC
from athlete_events;

insert into 
    DEPORTISTA (nombre, sexo, edad, altura, peso)
select distinct Name, Sex, Age, Height, Weight
from athlete_events;

insert into 
    DEPORTE (nombre)
select distinct Sport
from athlete_events;

insert into 
    CATEGORIA (nombre)
select distinct Event
from athlete_events;


select * from DEPORTISTA


--To Do List

--1
select 
    nombre
from
    DEPORTISTA
where
    sexo = 'F';


--2
select
    nombre, codigo_pais
from
    PAISES
where
    nombre like 'C%'
order by
    codigo_pais DESC;


--3
select
    sexo, count(*)
from 
    DEPORTISTA
group by
    sexo;


--4
select
    id_pais, count(*)
from 
    DEPORTISTA
group by
    id_pais;    


--5
select
    nombre
from
    CATEGORIA
where
    id_deporte in (select id_deporte from DEPORTE where nombre like '%atlet%');


--6



--7
select distinct
    nombre
from
    DEPORTISTA
where
    id_deportista in (select id_deportista from RESULTADOS where medalla IS NOT NULL)


8--



13--
update
    DEPORTISTA
set
    peso = peso+10
where
    sexo = 'M';