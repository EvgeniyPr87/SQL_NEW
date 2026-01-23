USE SPU_411_Import;


DECLARE	@group				AS	INT			=	(SELECT group_id			FROM Groups			WHERE group_name=N'SPU 411');

--C++

DECLARE	@discipline			AS	SMALLINT	=	(SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE	(N'Процедурное%C++'));
DECLARE	@number_of_lessons	AS	TINYINT		=	(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id = @discipline)/2;
DECLARE	@lesson_number		AS	INT			=	0;
DECLARE	@teacher			AS	INT			=	(SELECT	teacher_id			FROM Teachers		WHERE first_name LIKE(N'Олег'));
DECLARE	@start_date			AS	DATE		=	N'2024-10-26';
DECLARE	@date				AS	DATE		=	@start_date;
DECLARE	@start_time			AS	TIME		=	N'10:00';
DECLARE	@time				AS	TIME		=	@start_time

--PRINT('C++')
--PRINT (' ')
--PRINT(@group)
--PRINT(@discipline)
--PRINT(@number_of_lessons)
--PRINT(@teacher)
--PRINT(@date)
--PRINT(@start_time)

-------------------------------------------------------------------------
--HardWare-ps

DECLARE @discipline1		AS	SMALLINT	=	(SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'Hard%'));
DECLARE	@teacher_HWare		AS	INT			=	(SELECT teacher_id			FROM Teachers		WHERE first_name LIKE (N'Алексей'));
DECLARE @number_of_lessons1	AS	TINYINT		=	(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id = @discipline1)/4;
DECLARE	@lesson_number1		AS	INT			=	0;
DECLARE	@start_date1		AS	DATE		=	N'2024-10-19';
DECLARE @date1				AS	DATE		=	@start_date1;

--PRINT ('----------------------------')
--PRINT('HardWare-ps')
--PRINT(' ')
--PRINT (@discipline1)
--PRINT(@number_of_lessons1)
--PRINT(@teacher_HWare)
--PRINT (@start_date1)

--------------------------------------------------------------------------
--Administration Windows

DECLARE	@discipline2		AS	SMALLINT	=	(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (N'Администрирование%Windows'));
DECLARE @teacher2			AS	INT			=	(SELECT teacher_id FROM Teachers WHERE first_name LIKE (N'Алексей'));
DECLARE @number_of_lessons2	AS	TINYINT		=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline2)/4;
DECLARE	@lesson_number2		AS	INT			=	0;
DECLARE	@start_date2		AS	DATE		=	N'2024-12-14';
DECLARE	@date2				AS	DATE		=	@start_date2;

--PRINT ('----------------------------')
--PRINT('Administration Windows')
--PRINT(' ')
--PRINT(@discipline2)
--PRINT(@number_of_lessons2)
--PRINT(@teacher2)
--PRINT(@start_time)

-------------------------------------------------------------------------------
--OOP_C++

DECLARE	@discipline3		AS	SMALLINT	=	(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (N'Объектно%'));
DECLARE @teacher3			AS	INT			=	(SELECT teacher_id FROM Teachers WHERE first_name LIKE (N'Олег'));
DECLARE @number_of_lessons3	AS	TINYINT		=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline3)/2;
DECLARE	@lesson_number3		AS	INT			=	0;
DECLARE	@start_date3		AS	DATE		=	N'2025-04-05';
DECLARE	@date3				AS	DATE		=	@start_date3;

--PRINT ('----------------------------')
--PRINT('OOP_C++')
--PRINT (' ')
--PRINT(@group)
--PRINT(@discipline3)
--PRINT(@number_of_lessons3)
--PRINT(@teacher3)
--PRINT(@date3)
--PRINT(@start_time)

----------------------------------------------------------------------------------
--UML and design patterns

DECLARE	@discipline4		AS	SMALLINT	=	(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (N'UML%'));
DECLARE @teacher4			AS	INT			=	(SELECT teacher_id FROM Teachers WHERE first_name LIKE (N'Олег'));
DECLARE @number_of_lessons4	AS	TINYINT		=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline4)/2;
DECLARE	@lesson_number4		AS	INT			=	0;
DECLARE	@start_date4		AS	DATE		=	N'2025-06-14';
DECLARE	@date4				AS	DATE		=	@start_date4;

--PRINT ('----------------------------')
--PRINT('UML and design patterns')
--PRINT(' ')
--PRINT(@discipline4)
--PRINT(@number_of_lessons4)
--PRINT(@teacher4)
--PRINT(@start_time)

-------------------------------------------------------------------------------------
--C#

DECLARE	@discipline5		AS	SMALLINT	=	(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (N'Язык%C#'));
DECLARE @teacher5			AS	INT			=	(SELECT teacher_id FROM Teachers WHERE first_name LIKE (N'Олег'));
DECLARE @number_of_lessons5	AS	TINYINT		=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline5)/2;
DECLARE	@lesson_number5		AS	INT			=	0;
DECLARE	@start_date5		AS	DATE		=	N'2025-07-05';
DECLARE	@date5				AS	DATE		=	@start_date5;

--PRINT ('----------------------------')
--PRINT('C#')
--PRINT(' ')
--PRINT(@discipline5)
--PRINT(@number_of_lessons5)
--PRINT(@teacher5)
--PRINT(@start_date5)

---------------------------------------------------------------------------------------
--Development Windows App on C++

DECLARE	@discipline6		AS	SMALLINT	=	(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (N'Разработка%C++'));
DECLARE @teacher6			AS	INT			=	(SELECT teacher_id FROM Teachers WHERE first_name LIKE (N'Олег'));
DECLARE @number_of_lessons6	AS	TINYINT		=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline6)/2;
DECLARE	@lesson_number6		AS	INT			=	0;
DECLARE	@start_date6		AS	DATE		=	N'2025-09-06';
DECLARE	@date6				AS	DATE		=	@start_date6;


--PRINT ('----------------------------')
--PRINT('Development Windows App on C++')
--PRINT(' ')
--PRINT(@discipline6)
--PRINT(@number_of_lessons6)
--PRINT(@teacher6)
--PRINT(@start_date6)

----------------------------------------------------------------------------------------
--Development Windows App on C#

DECLARE	@discipline7		AS	SMALLINT	=	(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (N'Разработка%C#'));
DECLARE @teacher7			AS	INT			=	(SELECT teacher_id FROM Teachers WHERE first_name LIKE (N'Олег'));
DECLARE @number_of_lessons7	AS	TINYINT		=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline7)/2;
DECLARE	@lesson_number7		AS	INT			=	0;
DECLARE	@start_date7		AS	DATE		=	N'2025-09-27';
DECLARE	@date7				AS	DATE		=	@start_date7;

--PRINT ('----------------------------')
--PRINT('Development Windows App on C#')
--PRINT(' ')
--PRINT(@discipline7)
--PRINT(@number_of_lessons7)
--PRINT(@teacher7)
--PRINT(@start_date7)

------------------------------------------------------------------------------------------
--Database theory

DECLARE	@discipline8		AS	SMALLINT	=	(SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (N'%MS SQL Server'));
DECLARE @teacher8			AS	INT			=	(SELECT teacher_id FROM Teachers WHERE first_name LIKE (N'Олег'));
DECLARE @number_of_lessons8	AS	TINYINT		=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline8)/2;
DECLARE	@lesson_number8		AS	INT			=	0;
DECLARE	@start_date8		AS	DATE		=	N'2025-10-11';
DECLARE	@date8				AS	DATE		=	@start_date8;

--PRINT ('----------------------------')
--PRINT('Database theory')
--PRINT(' ')
--PRINT(@discipline8)
--PRINT(@number_of_lessons8)
--PRINT(@teacher8)
--PRINT(@start_date8)
--------------------------------------------------------------------------------------------


--IF EXISTS(SELECT 1 FROM  Schedule WHERE [group] =@group) 
--BEGIN
--	DELETE FROM Schedule
--	WHERE [group] = @group;
--END;

--------------------------------------------------------------------------------------------------
--HardWare-ps

--PRINT 'HardWare-ps'
--WHILE (@lesson_number1 <= @number_of_lessons1)
--BEGIN
--		PRINT('----------------------------------------');
--		PRINT @date1;
--		SET @time = @start_time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline1,	@teacher_HWare, @date1, @time, IIF(@date1<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number1=@lesson_number1+1;

--		SET	@time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline1,	@teacher_HWare, @date1, @time, IIF(@date1<GETDATE(),1,0));
--		SET @lesson_number1=@lesson_number1+1;

--		SET @time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline1,	@teacher_HWare, @date1, @time, IIF(@date1<GETDATE(),1,0));
--		SET @lesson_number1=@lesson_number1+1;

--		SET @date1=DATEADD(DAY,14,@date1);
--		IF (@lesson_number1>=@number_of_lessons1)
--		BREAK;
--END

--------------------------------------------------------------------------------------------
--Administration Windows

--PRINT 'Administration Windows'
--WHILE(@lesson_number2<=@number_of_lessons2)
--BEGIN
--		PRINT('----------------------------------------');
--		PRINT @date2;
--		SET @time=@start_time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline2,	@teacher2, @date2, @time, IIF(@date2<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number2=@lesson_number2+1;

--		SET @time=DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline2,	@teacher2, @date2, @time, IIF(@date2<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number2=@lesson_number2+1;

--		SET @time=DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline2,	@teacher2, @date2, @time, IIF(@date2<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number2=@lesson_number2+1;

--		SET @date2= DATEADD(DAY,14,@date2);
--		IF ( @lesson_number2>=@number_of_lessons2)
--		BREAK;
--END

--DECLARE	@interval	INT;

--PRINT 'C++'
--WHILE	(@lesson_number <= @number_of_lessons)
--BEGIN
--		PRINT('--------------------------------------');
--		PRINT (@date);
--		----------------------------------------------
--		SET @time=@start_time;
--		INSERT Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0 ));
--		PRINT (@time);
--		SET @lesson_number=@lesson_number+1;
--		-----------------------------------------------
--		SET @time = DATEADD(MINUTE, 95, @time);
--		PRINT (@time);
--		INSERT Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
--		SET @lesson_number=@lesson_number+1;
--		------------------------------------------------
--		SET @time = DATEADD(MINUTE, 95, @time);
--		PRINT (@time);
--		INSERT Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0 ));
--		SET @lesson_number=@lesson_number+1;
--		--------------------------------------------------
		
--		IF (@date=@date1  OR @date= @date2)
--			SET @interval=14;
--		ELSE
--			SET @interval=7;

--	SET @date = DATEADD(DAY, @interval, @date);

--END

-----------------------------------------------------------
--OOP_C++

--PRINT 'OOP_C++'
--WHILE (@lesson_number3 <= @number_of_lessons3)
--BEGIN
--		PRINT('----------------------------------------');
--		PRINT @date3;
--		SET @time = @start_time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline3,	@teacher3, @date3, @time, IIF(@date3<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number3=@lesson_number3+1;

--		SET	@time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline3,	@teacher3, @date3, @time, IIF(@date3<GETDATE(),1,0));
--		SET @lesson_number3=@lesson_number3+1;

--		SET @time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline3,	@teacher3, @date3, @time, IIF(@date3<GETDATE(),1,0));
--		SET @lesson_number3=@lesson_number3+1;

--		SET @date3=DATEADD(DAY,7,@date3);
--		IF (@lesson_number3>=@number_of_lessons3)
--		BREAK;
--END


---------------------------------------------------------------------------
--UML and design patterns

--PRINT 'UML and design patterns'
--WHILE (@lesson_number4 <= @number_of_lessons4)
--BEGIN
--		PRINT('----------------------------------------');
--		PRINT @date4;
--		SET @time = @start_time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline4,	@teacher4, @date4, @time, IIF(@date4<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number4=@lesson_number4+1;

--		SET	@time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline4,	@teacher4, @date4, @time, IIF(@date4<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number4=@lesson_number4+1;

--		SET @time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline4,	@teacher4, @date4, @time, IIF(@date4<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number4=@lesson_number4+1;

--		SET @date4=DATEADD(DAY,7,@date4);
--		IF (@lesson_number4>=@number_of_lessons4)
--		BREAK;
--END


---------------------------------------------------------------------------
--C#
--PRINT 'C#'
--WHILE (@lesson_number5 <= @number_of_lessons5)
--BEGIN
--		PRINT('----------------------------------------');
--		PRINT @date5;
--		SET @time = @start_time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline5,	@teacher5, @date5, @time, IIF(@date5<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number5=@lesson_number5+1;

--		SET	@time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline5,	@teacher5, @date5, @time, IIF(@date5<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number5=@lesson_number5+1;

--		SET @time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline5,	@teacher5, @date5, @time, IIF(@date5<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number5=@lesson_number5+1;

--		SET @date5=DATEADD(DAY,7,@date5);
--		IF (@lesson_number5>=@number_of_lessons5)
--		BREAK;
--END


-----------------------------------------------------------
----Development Windows App on C++

--PRINT 'Development Windows App on C++'
--WHILE (@lesson_number6 <= @number_of_lessons6)
--BEGIN
--		PRINT('----------------------------------------');
--		PRINT @date6;
--		SET @time = @start_time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline6,	@teacher6, @date6, @time, IIF(@date6<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number6=@lesson_number6+1;

--		SET	@time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline6,	@teacher6, @date6, @time, IIF(@date6<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number6=@lesson_number6+1;

--		SET @time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline6,	@teacher6, @date6, @time, IIF(@date6<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number6=@lesson_number6+1;

--		SET @date6=DATEADD(DAY,7,@date6);
--		IF (@lesson_number6>=@number_of_lessons6)
--		BREAK;
--END

---------------------------------------------------------------------
--Development Windows App on C#

--PRINT 'Development Windows App on C#'
--WHILE (@lesson_number7 <= @number_of_lessons7)
--BEGIN
--		PRINT('----------------------------------------');
--		PRINT @date7;
--		SET @time = @start_time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline7,	@teacher7, @date7, @time, IIF(@date7<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number7=@lesson_number7+1;

--		SET	@time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline7,	@teacher7, @date7, @time, IIF(@date7<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number7=@lesson_number7+1;

--		SET @time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline7,	@teacher7, @date7, @time, IIF(@date7<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number7=@lesson_number7+1;

--		SET @date7=DATEADD(DAY,7,@date7);
--		IF (@lesson_number7>=@number_of_lessons7)
--		BREAK;
--END

-------------------------------------------------------------------------------
--Database theory

--PRINT 'Database theory'
--WHILE (@lesson_number8 <= @number_of_lessons8)
--BEGIN
--		PRINT('----------------------------------------');
--		PRINT @date8;
--		SET @time = @start_time;
--		INSERT	Schedule
--		([group],discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline8,	@teacher8, @date8, @time, IIF(@date8<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number8=@lesson_number8+1;

--		SET	@time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline8,	@teacher8, @date8, @time, IIF(@date8<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number8=@lesson_number8+1;

--		SET @time = DATEADD(MINUTE,95,@time);
--		PRINT @time;
--		INSERT	Schedule
--		([group], discipline, teacher, [date], [time], spent)
--VALUES	(@group,	@discipline8,	@teacher8, @date8, @time, IIF(@date8<GETDATE(),1,0));
--		PRINT @time;
--		SET @lesson_number8=@lesson_number8+1;

--		SET @date8=DATEADD(DAY,7,@date8);
--		IF (@lesson_number8>=@number_of_lessons8)
--		BREAK;
--END