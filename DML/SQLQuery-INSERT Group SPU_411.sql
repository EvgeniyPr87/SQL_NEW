--SQLQuery-INSERT Group SPU_411.sql

USE SPU_411_Import;

--INSERT Groups
--				(group_id,		group_name,		direction	)
--VALUES			(	11,			N'SPU 411',			1		);

--INSERT Schedule
--			(	[group],	discipline, teacher,	[date],			[time],			spent	)
--VALUES		(		11,			31,			4,	'2024-10-19',	'10:00:00',			1		);


--INSERT Schedule
--				([group],	discipline,		teacher,		[date],			[time],		spent)
--VALUES			(11,			31,				4,		'2024-10-19',		'11:20:00',		1);


--INSERT Schedule
--				([group],	discipline,		teacher,		[date],			[time],		spent)
--VALUES			(11,			31,				4,		'2024-10-19',		'13:00:00',		1);



--INSERT Schedule
--				([group],	discipline,		teacher,		[date],			[time],		spent)
--VALUES			(11,			1,				1,		'2024-10-26',		'10:00:00',		1),
--				(11,			1,				1,		'2024-10-26',		'11:30:00',		1),
--				(11,			1,				1,		'2024-10-26',		'13:00:00',		1);



--WITH TimeTable AS
--(
--SELECT	'10:00:00' AS lesson_time UNION ALL
--SELECT	'11:30:00' UNION ALL
--SELECT	'13:00:00'
--),
--DateTable AS
--(
--SELECT	'2024-11-02' AS lesson_date UNION ALL
--SELECT	'2024-11-16' UNION ALL
--SELECT	'2024-11-30'
--)
--INSERT Schedule
--				([group],	discipline,		teacher,		[date],			[time],		spent)
--SELECT				11,			31,				4,			d.lesson_date,	t.lesson_time,		1
--FROM TimeTable t, DateTable d


