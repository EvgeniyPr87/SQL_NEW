--SQLQuery0-CHECK PROCEDURES.sql

USE SPU_411_Import;

--EXEC sp_SelectscheduleFull;
--EXEC sp_SelectSchedule N'SPU 411', N'Процедурное%';

DECLARE @messageUser	AS	NVARCHAR(255);
EXEC sp_InsertSchedulу
			@group_name='SPU 411'
			,@discipline_name = 'Процедурное%'
			,@teacher_name='Ковтун'
			,@start_date='2026-01-10'
			,@start_time='18:00'
			,@interval=7
			,@number_of_pairs=3
			,@message=@messageUser
			;
