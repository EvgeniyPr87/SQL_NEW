--SQLQuery0-CHECK PROCEDURES.sql

USE SPU_411_Import;

--EXEC sp_SelectscheduleFull;

DECLARE @messageUser				AS	NVARCHAR(255);
EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'Процедурное%'
			,@teacher_name			=	N'Ковтун'
			,@start_date			=	'2025-01-04'
			,@start_time			=	'18:00'
			,@interval				=	14	
			,@number_of_pairs		=	2
			,@stacionar				=	0
			,@message				=	@messageUser	OUT
			;
--EXEC sp_SelectSchedule N'SPU 411', N'Процедурное%';
EXEC sp_SelectSheduleAddDayWeek
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'Процедурное%'
		


