--SQLQuery2-SELECT mySchedule CREATE PROCEDURE.sql

USE SPU_411_Import;
GO

ALTER PROCEDURE sp_SelectSheduleAddDayWeek
		 @group_name						AS		NVARCHAR(24)
		,@discipline_name					AS		NVARCHAR(150)
		
AS
BEGIN

DECLARE	@group			AS		INT				=		(SELECT group_id FROM Groups WHERE group_name LIKE @group_name );
DECLARE	@discipline		AS		SMALLINT		=		(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE @discipline_name);

IF @group IS NULL
BEGIN
		PRINT 'Группа не найдена'
		RETURN
END
IF @discipline IS NULL
BEGIN
		PRINT 'Дисциплина не найдена'
		RETURN
END

		SELECT

					[Группа			]			=		group_name,
					[День недели	]			=		DATENAME(WEEKDAY,[date]),
					[Дата			]			=		[date],
					[Время			]			=		[time],
					[Дисциплина		]			=		discipline_name,
					[Преподаватель	]			=		FORMATMESSAGE(N'%s %s. %s.',last_name,LEFT(first_name,1),LEFT(middle_name,1)),
					[Статус			]			=		IIF(spent=1,N'Проведено',N'Запланировано')

		FROM		Schedule
		JOIN		Groups						ON		[group]=group_id
		JOIN		Disciplines					ON		discipline=discipline_id
		JOIN		Teachers					ON		teacher=teacher_id
		WHERE		[group]	=@group
		AND			discipline=@discipline	
		ORDER BY	[date], [time];

END