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



WITH TimeTable AS
(
SELECT	'10:00:00' AS lesson_time UNION ALL
SELECT	'11:30:00' UNION ALL
SELECT	'13:00:00'
),
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


--DateTableAdminWin AS
--(
--SELECT		'2024-12-14' AS lesson_date UNION ALL
--SELECT		'2024-12-28' UNION ALL
--SELECT		'2025-01-18' UNION ALL
--SELECT		'2025-02-01' UNION ALL
--SELECT		'2025-02-15'
--)
--INSERT Schedule
--			([group],	discipline,		teacher,		[date],				[time],			spent)
--SELECT			11,			32,				4,			d.lesson_date,		t.lesson_time,		1
--FROM	TimeTable t, DateTableAdminWin d


--DateTableC_PlusPlus AS
--(
--SELECT		'2024-10-26' AS lesson_date UNION ALL
--SELECT		'2024-11-09' UNION ALL
--SELECT		'2024-11-23' UNION ALL
--SELECT		'2024-12-07' UNION ALL
--SELECT		'2024-12-21' UNION ALL
--SELECT		'2025-01-11' UNION ALL
--SELECT		'2025-01-25' UNION ALL
--SELECT		'2025-02-08' UNION ALL
--SELECT		'2025-03-01' UNION ALL
--SELECT		'2025-03-15' UNION ALL
--SELECT		'2025-03-22' UNION ALL
--SELECT		'2025-03-29'
--)
--INSERT Schedule
--			([group],	discipline,		teacher,		[date],				[time],			spent )
--SELECT			11,			1,				1,			d.lesson_date,		t.lesson_time,		1
--FROM	TimeTable t, DateTableC_PlusPlus d


--DateTableC_PlusPlus_OOP AS
--(
--SELECT		'2025-04-05' AS lesson_date UNION ALL
--SELECT		'2025-04-12' UNION ALL
--SELECT		'2025-04-19' UNION ALL
--SELECT		'2025-04-26' UNION ALL
--SELECT		'2025-05-03' UNION ALL
--SELECT		'2025-05-10' UNION ALL
--SELECT		'2025-05-17' UNION ALL
--SELECT		'2025-05-24' UNION ALL
--SELECT		'2025-05-31' UNION ALL
--SELECT		'2025-06-07'
--)
--INSERT Schedule
--			([group],	discipline,		teacher,		[date],				[time],			spent )
--SELECT			11,			2,				1,			d.lesson_date,		t.lesson_time,		1
--FROM	TimeTable t, DateTableC_PlusPlus_OOP d


--DateTableUML AS
--(
--SELECT		'2025-06-14' AS lesson_date UNION ALL
--SELECT		'2025-06-21' UNION ALL
--SELECT		'2025-06-28'
--)
--INSERT Schedule
--			([group],	discipline,		teacher,		[date],				[time],			spent )
--SELECT			11,			3,				1,			d.lesson_date,		t.lesson_time,		1
--FROM	TimeTable t, DateTableUML d


--DateTableC_Sharp AS
--(
--SELECT		'2025-07-05' AS lesson_date UNION ALL
--SELECT		'2025-07-19' UNION ALL
--SELECT		'2025-07-26' UNION ALL
--SELECT		'2025-08-16' UNION ALL
--SELECT		'2025-08-23' UNION ALL
--SELECT		'2025-08-30'
--)
--INSERT Schedule
--			([group],	discipline,		teacher,		[date],				[time],			spent )
--SELECT			11,			4,				1,			d.lesson_date,		t.lesson_time,		1
--FROM TimeTable t, DateTableC_Sharp d


--DateTableAppC_PlusPlus AS
--(
--SELECT		'2025-09-06' AS lesson_date UNION ALL
--SELECT		'2025-09-13' UNION ALL
--SELECT		'2025-09-20'
--)
--INSERT Schedule
--			([group],	discipline,		teacher,		[date],				[time],			spent )
--SELECT			11,			5,				1,			d.lesson_date,		t.lesson_time,		1
--FROM TimeTable t, DateTableAppC_PlusPlus d


--DateTableAppC_Sharp AS
--(
--SELECT		'2025-09-27' AS lesson_date UNION ALL
--SELECT		'2025-10-04' 
--)
--INSERT Schedule
--			([group],	discipline,		teacher,		[date],				[time],			spent )
--SELECT			11,			6,				1,			d.lesson_date,		t.lesson_time,		1
--FROM TimeTable t, DateTableAppC_Sharp d


DateTableSQL AS
(
SELECT		'2025-10-11' AS lesson_date UNION ALL
SELECT		'2025-10-18' UNION ALL
SELECT		'2025-10-25'
)
INSERT Schedule
			([group],	discipline,		teacher,		[date],				[time],			spent )
SELECT			11,			7,				1,			d.lesson_date,		t.lesson_time,		1
FROM TimeTable t, DateTableSQL d