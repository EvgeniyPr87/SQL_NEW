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


EXEC sp_InsertScheduleSemistacionar N'SPU 411',N'Процедурное%C++',N'%Ковтун%'
EXEC sp_SelectSheduleAddDayWeek N'SPU 411';
		