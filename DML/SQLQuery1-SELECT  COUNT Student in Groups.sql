--SQLQuery1-SELECT  COUNT Student in Groups.sql

USE SPU_411_Import;

--SELECT
--			group_name							AS N'Название группы',				 
--			COUNT(DISTINCT stud_id)				AS N'Количество студентов в группе'
--FROM		Students,Groups
--WHERE		Students.[group]		=			Groups.group_id	
--GROUP BY	group_name
--ORDER BY	N'Количество студентов в группе'	ASC
--;

--SELECT
--			direction_name						AS N'Направление обучения',
--			COUNT(DISTINCT group_name)			AS N'Количество групп',
--			COUNT(DISTINCT stud_id)				AS N'Количество студентов'

--FROM		Students, Groups, Directions
--WHERE		direction					=		direction_id
--AND			[group]						=		group_id
--GROUP BY	direction_name
--;

--SELECT
--			discipline_name						AS N'Наименование дисциплины',
--			COUNT(DISTINCT teacher_id)			AS N'Количество преподавателей'
--FROM		Disciplines, TeachersDisciplinesRelation, Teachers
--WHERE		discipline					=		discipline_id
--AND			teacher						=		teacher_id
--GROUP BY	discipline_name
--;

SELECT
			direction_name						AS N'Направление обучения',
			discipline_name						AS N'Наименование дисциплин'
			
FROM		Directions,DisciplinesDirectionsRelation, Disciplines
WHERE		discipline					=		discipline_id
AND			direction					=		direction_id
AND			direction_name		LIKE			N'Android%'	
;

SELECT
			discipline_name						AS N'Наименование дисциплины',
			direction_name						AS N'Направление обучения'
FROM		Directions, DisciplinesDirectionsRelation, Disciplines
WHERE		discipline					=		discipline_id
AND			direction					=		direction_id
AND			discipline_name		LIKE			N'Управление%'
;

