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
SELECT 
	COUNT(Titulo) AS CantidadErrores, Topico 
FROM 
	Error
GROUP BY 
	Topico
HAVING 
	COUNT(Titulo) > 10 
ORDER BY COUNT(Titulo) desc;

--5
SELECT DISTINCT
	Funcionalidad.Titulo, Funcionalidad.Solicitante
FROM
	Funcionalidad INNER JOIN Error
ON
	Funcionalidad.Solicitante = Error.Autor AND Funcionalidad.Topico = Error.Topico

--6

UPDATE 
    Funcionalidad 
SET 
    Estado = 'Archivado'
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
	Usuario.Nombre, (COUNT(Funcionalidad.Solicitante) + COUNT(Error.Autor)) AS Cantidad_solicitudes 
FROM
	Usuario 
	LEFT JOIN Funcionalidad ON Usuario.RUT = Funcionalidad.Solicitante
    LEFT JOIN  Error ON Funcionalidad.Solicitante = Error.Autor
GROUP BY Usuario.Nombre;

--9
SELECT 
	CONCAT_WS(', ',
		CONCAT_WS(' ', 'Backend: ', (SELECT COUNT(*) FROM Ingeniero WHERE Especialidad LIKE '%Backend%')),
		CONCAT_WS(' ', 'Seguridad: ', (SELECT COUNT(*) FROM Ingeniero WHERE Especialidad LIKE '%Seguridad%')),
		CONCAT_WS(' ', 'UX/UI: ', (SELECT COUNT(*) FROM Ingeniero WHERE Especialidad LIKE '%UX/UI%'))
	) AS Conteo_Especialidades;


--10
DELETE FROM 
	Asignacion
WHERE titulo_error IN (
  SELECT 
	Titulo
  FROM 
  	Error
  WHERE 
	Fecha < '2020-09-03'
);

DELETE FROM
	Error
WHERE
	Fecha < '2020-09-03';	






