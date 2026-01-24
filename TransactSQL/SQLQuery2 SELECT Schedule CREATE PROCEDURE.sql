--SQLQuery2 SELECT Schedule CREATE PROCEDURE.sql

USE SPU_411_Import;
GO
 
-- если создать новую процедуру CREATE
--ALTER  если нужно изменить процедуру

ALTER PROCEDURE sp_SelectscheduleFull
AS
BEGIN
		SELECT
				[Группа]			=		group_name,
				[Дата]				=		[date],
				[Время]				=		[time],
				[Дисциплина]		=		discipline_id,
				[Преподаватель]		=		FORMATMESSAGE(N'%s %s %s', last_name,first_name,middle_name),
				[Статус]			=		IIF(spent=1, N'Проведено', N'Заплан[dbo].[sp_GetMaxLearningDayFor]ировано')
		FROM	Schedule
		JOIN	Groups				ON		[group]=group_id
		JOIN	Disciplines			ON		discipline=discipline_id
		JOIN	Teachers			ON		teacher=teacher_id
END
		