--SQLQuery2-SELECT mySchedule CREATE PROCEDURE.sql

USE SPU_411_Import;
GO

CREATE PROCEDURE sp_SelectSheduleAddDayWeek
		 @group_name					AS		NVARCHAR(24)
		,@discipline_name				AS		NVARCHAR(150)
		
AS
BEGIN
DECLARE	@group			AS		INT			=	(SELECT group_id FROM Groups WHERE group_name=@group_name );
DECLARE	@discipline		AS		SMALLINT	=	(SELECT discipline_id FROM Disciplines WHERE discipline_name=@discipline_name);
		SELECT
				--[Группа			]		=		group_name,
				[День недели	]		=		' ',
				[Дата			]		=		[date],
				[Время			]		=		[time],
				--[Дисциплина		]		=		discipline_name,
				[Преподаватель	]		=		FORMATMESSAGE(N'%s %s. %s.',last_name,LEFT(first_name,1),LEFT(middle_name,1)),
				[Статус			]		=		IIF(spent=1,N'Проведено',N'Запланировано')

		FROM	Schedule
		JOIN	Groups					ON		[group]=group_id
		JOIN	Disciplines				ON		discipline=discipline_id
		JOIN	Teachers				ON		teacher=teacher_id

END