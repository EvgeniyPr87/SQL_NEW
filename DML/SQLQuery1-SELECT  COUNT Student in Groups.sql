--SQLQuery1-SELECT  COUNT Student in Groups.sql

USE SPU_411_Import;

SELECT
			group_name							AS N'Название группы',				 
			COUNT(DISTINCT stud_id)				AS N'Количество студентов в группе'
FROM		Students,Groups
WHERE		Students.[group]		=			Groups.group_id	
GROUP BY	group_name
ORDER BY	N'Количество студентов в группе'	ASC
;

SELECT
			direction_name						AS N'Направление обучения',
			COUNT(DISTINCT group_name)			AS N'Количество групп',
			COUNT(DISTINCT stud_id)				AS N'Количество студентов'

FROM		Students, Groups, Directions
WHERE		direction					=		direction_id
AND			[group]						=		group_id
GROUP BY	direction_name
;