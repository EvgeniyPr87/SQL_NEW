--SQLQuery0--CHECK PROCEDURES Schedule PV 319 .sql
SET DATEFIRST 1;
USE SPU_411_Import;

SET LANGUAGE N'Russian';

--EXEC sp_InsertSchedule
--			 @group_name		=	N'PV_319'
--			,@discipline_name	=	N'Процедурное%'
--			,@teacher_name		=	N'Ковтун'	
--			,@start_date		=	'2024-10-26'
--			,@start_time		=	'18:30'
--			--,@pair_time		=	80
--			--,@break_time		=	15
--			,@day_of_week		=	N'2,4,6'
--			--,@interval		=	7
--			,@number_of_pairs	=	2
--			,@stacionar			=	1;


--EXEC sp_InsertScheduleSemistacionar N'SPU 411',N'Процедурное%C++%',N'%Ковтун%';


--EXEC sp_InsertScheduleSemistacionar N'SPU 411',N'Процедурное%C++',N'%Ковтун%'
--EXEC sp_SelectScheduleFull 
--PRINT(dbo.GetNewYear(2025));
--PRINT(dbo.GetSammertimeSadness(2024));
--PRINT(dbo.GetEasterDate(2026));
EXEC sp_AddAllHolidayFor	2026
SELECT
[date],holiday_name
FROM	DaysOFF JOIN Holidays ON (holiday=holiday_id)
WHERE	[date]	BETWEEN N'2026-01-01' AND N'2026-12-31';

		