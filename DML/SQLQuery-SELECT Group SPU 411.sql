--SQLQuery-SELECT Group SPU 411.sql

USE SPU_411_Import;

SELECT
		group_name														AS N'Группа',
		FORMATMESSAGE(N'%s %s %s',last_name, first_name, middle_name)	AS N'Преподаватель',
		discipline_name													AS N'Наименование дисциплины',
		[date]															AS N'Дата',
		[time]															AS N'Время'


FROM		Teachers, Disciplines, Schedule, Groups,Directions
WHERE		teacher				=			teacher_id
AND			discipline			=			discipline_id
AND			[group]				=			group_id
AND			group_id			LIKE			11
ORDER BY	[date]
;