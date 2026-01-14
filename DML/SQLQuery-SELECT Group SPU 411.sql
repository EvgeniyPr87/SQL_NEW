--SQLQuery-SELECT Group SPU 411.sql

USE SPU_411_Import;

--SELECT
--		group_name														AS N'Группа',
--		FORMATMESSAGE(N'%s %s %s',last_name, first_name, middle_name)	AS N'Преподаватель',
--		discipline_name													AS N'Наименование дисциплины',
--		[date]															AS N'Дата',
--		[time]															AS N'Время'


--FROM		Teachers, Disciplines, Schedule, Groups,Directions
--WHERE		teacher				=			teacher_id
--AND			discipline			=			discipline_id
--AND			[group]				=			group_id
--AND			direction			=			direction_id
--AND			group_id			LIKE			11

--ORDER BY	[date]	ASC, [time]	ASC
--;

--SELECT
--			direction_name													AS N'Направление обучения',
--			group_name														AS N'Грппа',
--			last_name														AS N'Преподаватель',
--			discipline_name													AS N'Наименование дисциплины',
--			[date]															AS N'Дата',
--			STRING_AGG(CONVERT(VARCHAR(5),[time],108),',')
--			WITHIN GROUP(ORDER BY [time] ASC)									AS N'Время'
			
--FROM		Teachers,Disciplines,Schedule,Groups,Directions
--WHERE		teacher						=			teacher_id
--AND			discipline					=			discipline_id
--AND			[group]						=			[group_id]
--AND			direction					=			direction_id
--AND			group_id					LIKE		11
--GROUP BY
--			direction_name,
--			group_name,
--			last_name,
--			discipline_name,
--			[date]

--ORDER BY	[date]	ASC
--;

SELECT
			direction_name													AS N'Направление обучения',
			group_name														AS N'Грппа',
			FORMATMESSAGE
			(
			N'%s %s. %s.',
			last_name, 
			LEFT(first_name,1),
			LEFT(ISNULL(middle_name,''),1)
			)																AS N'Преподаватель',
			discipline_name													AS N'Наименование дисциплины',
			[date]															AS N'Дата',
			STRING_AGG(CONVERT(VARCHAR(5),[time],108),',')
			WITHIN GROUP(ORDER BY [time] ASC)								AS N'Время'
			
FROM		Teachers,Disciplines,Schedule,Groups,Directions
WHERE		teacher						=			teacher_id
AND			discipline					=			discipline_id
AND			[group]						=			[group_id]
AND			direction					=			direction_id
AND			group_id					LIKE		11
GROUP BY
			direction_name,
			group_name,
			last_name,
			first_name,
			middle_name,
			discipline_name,
			[date]

ORDER BY	[date]	ASC
;