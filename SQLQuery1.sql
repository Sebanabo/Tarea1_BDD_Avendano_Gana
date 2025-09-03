drop table if exists Usuario
drop table if exists Ingeniero
drop table if exists Funcionalidad
drop table if exists Error
drop table if exists Asignacion



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

--create table Asignacion (
--    Topico_E varchar(15) foreign key references Error (Topico),
--	Topico_F varchar(15) foreign key references Funcionalidad (Topico),
--	Especialidad varchar(35) foreign key references Ingeniero (Especialidad),
--	primary key(Topico_E, Topico_F, Especialidad)
--);

create table Asignacion (
    id_asignacion int identity primary key,
    rut_ingeniero varchar(10) not null,
    titulo_funcionalidad varchar(100) null,
    titulo_error varchar(100) null,
    foreign key (rut_ingeniero) references Ingeniero(RUT),
    foreign key (titulo_funcionalidad) references Funcionalidad(Titulo),
    foreign key (titulo_error) references Error(Titulo)
);




-- Algunos pocos inserts

INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555551-1','Álvaro Henríquez','alvaro.henriquez@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555552-2','Natalia Soto','natalia.soto@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555553-3','Gonzalo Ramírez','gonzalo.ramirez@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555554-4','Pablo Herrera','pablo.herrera@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555555-5','Ximena Fuenzalida','ximena.fuenzalida@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555556-6','Eduardo Palma','eduardo.palma@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555557-7','Lorena Duarte','lorena.duarte@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555558-8','Vicente Sandoval','vicente.sandoval@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555559-9','Patricio Aravena','patricio.aravena@mail.com');
INSERT INTO Usuario (RUT, Nombre, Email) VALUES ('55555560-0','Verónica Salinas','veronica.salinas@mail.com');

INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666661-1','Andrea Herrera','andrea.herrera@mail.com','Backend');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666662-2','Rodrigo Silva','rodrigo.silva@mail.com','Seguridad');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666663-3','Camila Reyes','camila.reyes@mail.com','UX/UI');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666664-4','Felipe Pizarro','felipe.pizarro@mail.com','Backend');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666665-5','Valeria Contreras','valeria.contreras@mail.com','Seguridad');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666666-6','Ignacio Morales','ignacio.morales@mail.com','UX/UI');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666667-7','Carolina Ríos','carolina.rios@mail.com','Backend');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666668-8','Nicolás Álvarez','nicolas.alvarez@mail.com','Seguridad');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666669-9','Fernanda Ortega','fernanda.ortega@mail.com','UX/UI');
INSERT INTO Ingeniero (RUT, Nombre, Email, Especialidad) VALUES ('66666670-0','Javier Castro','javier.castro@mail.com','Backend');



INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 001 - Incidencia detectada', 'Descripción breve del error número 1, afecta funcionamiento parcial del sistema.', '2024-09-28', 'UX/UI', '11111119-9', 'Resuelto');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 002 - Incidencia detectada', 'Descripción breve del error número 2, afecta funcionamiento parcial del sistema.', '2020-01-01', 'UX/UI', '55555555-5', 'Abierto');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 003 - Incidencia detectada', 'Descripción breve del error número 3, afecta funcionamiento parcial del sistema.', '2022-05-24', 'Seguridad', '44444449-9', 'En Progreso');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 004 - Incidencia detectada', 'Descripción breve del error número 4, afecta funcionamiento parcial del sistema.', '2022-06-09', 'Backend', '33333338-8', 'Resuelto');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 005 - Incidencia detectada', 'Descripción breve del error número 5, afecta funcionamiento parcial del sistema.', '2023-04-04', 'Seguridad', '22222222-2', 'Resuelto');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 006 - Incidencia detectada', 'Descripción breve del error número 6, afecta funcionamiento parcial del sistema.', '2024-11-23', 'Seguridad', '44444445-5', 'Resuelto');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 007 - Incidencia detectada', 'Descripción breve del error número 7, afecta funcionamiento parcial del sistema.', '2023-11-24', 'Backend', '44444449-9', 'Abierto');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 008 - Incidencia detectada', 'Descripción breve del error número 8, afecta funcionamiento parcial del sistema.', '2022-09-15', 'Backend', '11111120-0', 'Resuelto');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 009 - Incidencia detectada', 'Descripción breve del error número 9, afecta funcionamiento parcial del sistema.', '2022-01-26', 'Seguridad', '11111116-6', 'Abierto');
INSERT INTO Error (Titulo, Descripcion, Fecha, Topico, Autor, Estado) VALUES ('Error 010 - Incidencia detectada', 'Descripción breve del error número 10, afecta funcionamiento parcial del sistema.', '2025-04-14', 'Seguridad', '44444442-2', 'Cerrado');


INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 001 - Nueva característica solicitada', 'Web', 'Resumen de la funcionalidad número 1, busca mejorar la experiencia del usuario.', 'Seguridad', 'C1: Validación; C2: Seguridad; C3: Documentación 1', '33333335-5', 'Cerrado');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 002 - Nueva característica solicitada', 'Web', 'Resumen de la funcionalidad número 2, busca mejorar la experiencia del usuario.', 'Backend', 'C1: Validación; C2: Seguridad; C3: Documentación 2', '33333334-4', 'Resuelto');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 003 - Nueva característica solicitada', 'Web', 'Resumen de la funcionalidad número 3, busca mejorar la experiencia del usuario.', 'Seguridad', 'C1: Validación; C2: Seguridad; C3: Documentación 3', '33333337-7', 'Cerrado');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 004 - Nueva característica solicitada', 'Movil', 'Resumen de la funcionalidad número 4, busca mejorar la experiencia del usuario.', 'Backend', 'C1: Validación; C2: Seguridad; C3: Documentación 4', '11111118-8', 'Resuelto');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 005 - Nueva característica solicitada', 'Web', 'Resumen de la funcionalidad número 5, busca mejorar la experiencia del usuario.', 'Seguridad', 'C1: Validación; C2: Seguridad; C3: Documentación 5', '44444443-3', 'Cerrado');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 006 - Nueva característica solicitada', 'Web', 'Resumen de la funcionalidad número 6, busca mejorar la experiencia del usuario.', 'Seguridad', 'C1: Validación; C2: Seguridad; C3: Documentación 6', '11111118-8', 'Abierto');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 007 - Nueva característica solicitada', 'Web', 'Resumen de la funcionalidad número 7, busca mejorar la experiencia del usuario.', 'Seguridad', 'C1: Validación; C2: Seguridad; C3: Documentación 7', '55555560-0', 'Cerrado');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 008 - Nueva característica solicitada', 'Web', 'Resumen de la funcionalidad número 8, busca mejorar la experiencia del usuario.', 'Seguridad', 'C1: Validación; C2: Seguridad; C3: Documentación 8', '55555555-5', 'Resuelto');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 009 - Nueva característica solicitada', 'Movil', 'Resumen de la funcionalidad número 9, busca mejorar la experiencia del usuario.', 'UX/UI', 'C1: Validación; C2: Seguridad; C3: Documentación 9', '33333337-7', 'Abierto');
INSERT INTO Funcionalidad (Titulo, Ambiente, Resumen, Topico, Criterios, Solicitante, Estado) VALUES ('Funcionalidad 010 - Nueva característica solicitada', 'Web', 'Resumen de la funcionalidad número 10, busca mejorar la experiencia del usuario.', 'Seguridad', 'C1: Validación; C2: Seguridad; C3: Documentación 10', '11111113-3', 'Cerrado');



-- Ejemplos de prueba

select
    Email, RUT
from
    Usuario;

select
    *
from 
    Funcionalidad;


select 
    *
from 
    Error
where
    Topico = 'Seguridad';

select
    top 3 *
from
    Ingeniero;




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
	Fecha ASC; 

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

