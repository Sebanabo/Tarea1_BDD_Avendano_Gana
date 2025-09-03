drop table if exists Usuario
drop table if exists Ingeniero
drop table if exists Funcionalidad
drop table if exists Error



create table Usuario (
    RUT varchar(10) primary key, 
	Nombre varchar(50),
	Email varchar(50)
);

create table Ingeniero (
    RUT varchar(10) primary key, 
	Nombre varchar(50),
	Email varchar(50),
	Especialidad varchar(35)
);

create table Funcionalidad (
    Titulo varchar(100) primary key,
	Ambiente varchar(5),
	Resumen varchar(150) NOT NULL,
	Topico varchar(15) NOT NULL,
	Criterios varchar(100) NOT NULL,
	Solicitante varchar(50) NOT NULL,
	Estado varchar(12)
);

create table Error (
    Titulo varchar(100) primary key,
	Descripcion varchar(200) NOT NULL,
	Fecha date NOT NULL,
	Topico varchar(15) NOT NULL,
	Autor varchar(50) NOT NULL,
	Estado varchar(12)
);

create table Asignacion (
    Topico_E varchar(15) foreign key references Error (Topico),
	Topico_F varchar(15) foreign key references Funcionalidad (Topico),
	Especialidad varchar(35) foreign key references Ingeniero (Especialidad)
);



--CONSULTAS SQL
--1
SELECT
    Nombre 
FROM
    Ingeniero
--WHERE
    --Tiene mas de 5 solicitudes

--2
SELECT 
	Titulo, Fecha, Autor FROM Error
ORDER BY 
	DateColumn ASC; 

--3
SELECT
	Titulo, Topico, Solicitante
FROM
	Funcionalidad
WHERE
	Ambiente like 'movil';

--4
SELECT COUNT(Titulo), Topico 
FROM 
	Error
WHERE 
	Topico in ('backend', 'seguridad', 'UX/UI')
GROUP BY 
	Topico
ORDER BY COUNT(Titulo) desc;

--5
SELECT 
	Funcionalidad.Solicitante, Funcionalidad.Topico, Error.Autor, Error.Topico
FROM
	Funcionalidad INNER JOIN Error
ON
	Funcionalidad.Topico = Error.Topico