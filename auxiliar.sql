--AUX 6
SELECT 
	* 
FROM
	Error
WHERE 
    Fecha < '2022-09-03';

--AUX 10
SELECT
	Titulo, Fecha
FROM
	Error
ORDER BY
	Fecha ASC;
