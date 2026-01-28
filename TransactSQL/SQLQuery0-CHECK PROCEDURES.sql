--SQLQuery0-CHECK PROCEDURES.sql

USE SPU_411_Import;

--EXEC sp_SelectscheduleFull;


--DECLARE @messageUser				AS	NVARCHAR(255);
--EXEC	sp_InsertSchedule
--			@group_name				=	N'SPU 411'
--			,@discipline_name		=	N'Процедурное%'
--			,@teacher_name			=	N'Ковтун'
--			,@start_date			=	'2025-01-04'
--			,@start_time			=	'18:00'
--		--параметры поумолчанию
--			--,@pair_time									--продолжительность пары (мин)		ПОУМОЛЧАНИЮ=80
--			--,@break_time									--продолжительность перемены (мин)	ПОУМОЛЧАНИЮ=15
--			,@interval				=	14					--интервал							ПОУМОЛЧАНИЮ =7
--			,@number_of_pairs		=	2					--числ пар в день					ПОУМОЛЧАНИЮ =1
--			,@stacionar				=	1					--flag 1-стационар					ПОУМОЛЧАНИЮ =1,		0- полустационар

--			,@message				=	@messageUser	OUT
--			;

--EXEC sp_SelectSchedule N'SPU 411', N'Процедурное%';

--EXEC sp_SelectSheduleAddDayWeek
--			 @group_name			=	N'%411%'
--			,@discipline_name		=	N'Процедурное%'
--			;
		
EXEC sp_SelectCountGroup 
			@direction_name			=	N'%Разработка%';


