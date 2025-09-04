--CONSULTAS SQL

--1
SELECT  
    COUNT(Asignacion.id_asignacion) AS TotalAsignaciones,
    Ingeniero.Nombre
FROM  
    Asignacion INNER JOIN Ingeniero ON Asignacion.rut_ingeniero = Ingeniero.RUT
GROUP BY  
    Ingeniero.Nombre,
    Ingeniero.RUT,
    Asignacion.rut_ingeniero
HAVING  
    COUNT(Asignacion.id_asignacion) > 5;

--2
SELECT TOP 10
	Titulo, Fecha, Autor 
FROM 
	Error
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

--6
--Esperando respuesta de los ayudantes     POR LO QUE ESTA SUJETO A CAMBIO
select * -- Muestra de como eran antes
from Error
WHERE 
    Fecha < '2022-09-03';
UPDATE 
    Error -- RECORDAR QUE DEBE SER DE FUNCIONALIDAD, ahora usamos Error como prueba, porque Funcionalidad no tiene atributo Fecha, aunque se lo podemos añadir luego
SET 
    Estado = 'Archivado'
WHERE 
    Fecha < '2022-09-03'; -- tambien podria ser WHERE YEAR(Fecha) < 2022; aunque esta opcion no tiene en cuenta mes ni dia

select * -- Muestra de que fueron archivados
from Error
WHERE 
    Fecha < '2022-09-03';

--7
SELECT
	Nombre
FROM
	Ingeniero
WHERE 
	Especialidad LIKE '%Seguridad%';

--8
SELECT
	COUNT(Usuario.Nombre), Funcionalidad.Solicitante, Error.Autor 
FROM
	Usuario
    INNER JOIN Funcionalidad ON Usuario.Nombre = Funcionalidad.Solicitante
    INNER JOIN Error ON Funcionalidad.Solicitante = Error.Autor
GROUP BY Funcionalidad.Solicitante, Error.Autor

--9

--10