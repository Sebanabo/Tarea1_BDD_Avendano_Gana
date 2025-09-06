--AUX 6
SELECT 
	* 
FROM
	Error
WHERE 
    Fecha < '2022-09-03'
ORDER BY
	Fecha ASC;
--AUX 10
SELECT
	Titulo, Fecha
FROM
	Error
ORDER BY
	Fecha ASC;

--AUX CANTIDAD DE SOLICITUDES POR DÍA
SELECT
	Autor, Fecha
FROM
	Error
GROUP BY
	Autor, Fecha
