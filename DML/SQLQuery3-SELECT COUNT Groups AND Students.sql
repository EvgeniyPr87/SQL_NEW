--SQLQuery3-SELECT COUNT Groups AND Students.sql

USE SPU_411_Import;

SELECT
			direction_name						AS N'Направление обучения',
			COUNT	(DISTINCT group_name)		AS N'Количество групп', --DISTINCT-убирает дубликаты и возращает уникальные значения
			COUNT	(DISTINCT stud_id)			AS N'Количество студентов' 
FROM		Students, Groups, Directions
WHERE		direction		=		direction_id
AND			[group]			=		group_id
GROUP BY	direction_name
--HAVING	COUNT(group_name) < 5
ORDER BY	N'Количество групп'					ASC
;

