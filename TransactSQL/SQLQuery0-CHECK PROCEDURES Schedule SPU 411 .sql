--SQLQuery0-CHECK PROCEDURES Schedule SPU 411 .sql

USE SPU_411_Import;

EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'Hardware%'
			,@teacher_name			=	N'Свищев'
			,@start_date			=	'2024-10-19'
			,@start_time			=	'10:00'
		--параметры поумолчанию
			--,@pair_time									--продолжительность пары (мин)		ПОУМОЛЧАНИЮ=80
			--,@break_time									--продолжительность перемены (мин)	ПОУМОЛЧАНИЮ=15
			,@interval				=	14					--интервал							ПОУМОЛЧАНИЮ =7
			,@number_of_pairs		=	3					--числ пар в день					ПОУМОЛЧАНИЮ =1
			,@stacionar				=	0					--flag 1-стационар					ПОУМОЛЧАНИЮ =1,		0- полустационар
			;

EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'Процедурное%'
			,@teacher_name			=	N'Ковтун'
			,@start_date			=	'2024-10-26'
			,@start_time			=	'10:00'
		--параметры поумолчанию
			--,@pair_time									
			--,@break_time									
			,@interval				=	14					
			,@number_of_pairs		=	3					
			,@stacionar				=	0				
			;

EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'Администрирование Windows'
			,@teacher_name			=	N'Свищев'
			,@start_date			=	'2024-12-14'
			,@start_time			=	'10:00'
		--параметры поумолчанию
			--,@pair_time									
			--,@break_time									
			,@interval				=	14					
			,@number_of_pairs		=	3					
			,@stacionar				=	0				
			;

EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'Объектно%С++'
			,@teacher_name			=	N'Ковтун'
			,@start_date			=	'2025-04-05'
			,@start_time			=	'10:00'
		--параметры поумолчанию
			--,@pair_time									
			--,@break_time									
			,@interval				=	7					
			,@number_of_pairs		=	3					
			,@stacionar				=	0				
			;

EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'UML%'
			,@teacher_name			=	N'Ковтун'
			,@start_date			=	'2025-06-14'
			,@start_time			=	'10:00'
		--параметры поумолчанию
			--,@pair_time									
			--,@break_time									
			,@interval				=	7					
			,@number_of_pairs		=	3					
			,@stacionar				=	0				
			;

EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'Разработка%C++'
			,@teacher_name			=	N'Ковтун'
			,@start_date			=	'2025-09-06'
			,@start_time			=	'10:00'
		--параметры поумолчанию
			--,@pair_time									
			--,@break_time									
			,@interval				=	7					
			,@number_of_pairs		=	3					
			,@stacionar				=	0				
			;

EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'Разработка%C#'
			,@teacher_name			=	N'Ковтун'
			,@start_date			=	'2025-09-27'
			,@start_time			=	'10:00'
		--параметры поумолчанию
			--,@pair_time									
			--,@break_time									
			,@interval				=	7					
			,@number_of_pairs		=	3					
			,@stacionar				=	0				
			;
EXEC	sp_InsertSchedule
			@group_name				=	N'SPU 411'
			,@discipline_name		=	N'%MS SQL Server'
			,@teacher_name			=	N'Ковтун'
			,@start_date			=	'2025-10-11'
			,@start_time			=	'10:00'
		--параметры поумолчанию
			--,@pair_time									
			--,@break_time									
			,@interval				=	7					
			,@number_of_pairs		=	3					
			,@stacionar				=	0				
			;

EXEC sp_SelectSheduleAddDayWeek
			 @group_name			=	N'%411%'
			;
