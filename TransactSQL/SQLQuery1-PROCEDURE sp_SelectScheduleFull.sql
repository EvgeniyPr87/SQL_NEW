--SQLQuery2-SELECT Schedule PRODEDURE.sql
USE SPU_411_Import;
GO

ALTER PROCEDURE sp_SelectScheduleFull
AS
BEGIN
	SELECT
			[Группа]		=	group_name,
			[Время]			=	[time],
			[Дата]			=	[date],
			[День]			=	FORMAT([date], N'ddd', 'ru-RU'),
		
			[Дисциплина]	=	Disciplines.discipline_name,
			[Преподаватель] =	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
			[Статус]		=	IIF(spent=1, N'проведено', N'запланировано')
	FROM	Schedule
	JOIN	Groups			ON	[group]=group_id
	JOIN	Disciplines		ON	discipline=discipline_id
	JOIN	Teachers		ON	teacher=teacher_id
	ORDER BY [date]
END