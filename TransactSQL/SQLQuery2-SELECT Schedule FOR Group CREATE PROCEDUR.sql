--SQLQuery2-SELECT Schedule FOR Group CREATE PROCEDUR.sql

USE SPU_411_Import;
GO

ALTER PROCEDURE sp_SelectSchedule
	@group_name					AS		NVARCHAR(24),
	@discipline_name			AS		NVARCHAR(150)
AS
BEGIN
	SELECT
				[Группа]		=		group_name,
				[Дата]			=		[date],
				[Время]			=		[time],
				[Дисциплина]	=		discipline_name,	
				[Преподавтель]	=		FORMATMESSAGE(N'%s %s %s',last_name, first_name, middle_name),
				[Статус]		=		IIF(spent=1, N'Проведено',N'Запланированно')
	FROM		Schedule
	JOIN		Groups			ON		group]=group_id
	JOIN		Disciplines		ON		iscipline=	discipline_id
	JOIN		Teachers		ON		eacher=teacher_id
	WHERE		group_name		=		group_name
	AND			discipline_name	LIKE	@discipline_name
END