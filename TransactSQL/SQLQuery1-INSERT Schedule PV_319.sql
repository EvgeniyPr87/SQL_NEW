--SQLQuery1-INSERT Schedule PV_319.sql

USE SPU_411_Import;



DECLARE		@disciplines TABLE 
(
num_id			INT IDENTITY(1,1),
discipline_id	SMALLINT
);

INSERT  @disciplines (discipline_id)
VALUES

((SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'UML%'))),

((SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'Язык%C#'))),

((SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'Разработка%C++'))),

((SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'Разработка%C#'))),

((SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'%MS SQL Server'))),

((SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'Технология%ADO.NET'))),

((SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'Системное%'))),

((SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE (N'Сетевое%')));



DECLARE		@group				AS	INT				=	(SELECT group_id			FROM Groups			WHERE group_name=N'PV_319');
DECLARE		@teacher			AS	INT				=	(SELECT teacher_id	FROM Teachers	WHERE first_name LIKE(N'Олег'));
DECLARE		@start_date			AS	DATE			=	N'2024-01-09';
DECLARE		@date				AS	DATE			=	@start_date;
DECLARE		@start_time			AS	TIME			=	N'18:30';
DECLARE		@time				AS	TIME			=	@start_time;
DECLARE		@lesson_number		AS	INT				=	0;
DECLARE		@count				AS	INT				=	1;
DECLARE		@total_disciplines	AS	INT				=	(SELECT COUNT(*) FROM @disciplines);

DECLARE		@number_of_lessons	AS	TINYINT;
DECLARE		@current_discipline	AS	SMALLINT;
DECLARE		@discipline_name	AS	NVARCHAR(150);
DECLARE		@interval			AS	INT;



PRINT(@group);
PRINT(@teacher);
PRINT(@date);
PRINT(@start_time);


-- Удаляю предыдущее расписание
---------------------------------------------------------------
IF EXISTS(SELECT 1 FROM  Schedule WHERE [group] =@group) 
BEGIN
	DELETE FROM Schedule
	WHERE [group] = @group;
END;
-------------------------------------------------------------------


WHILE (@count<=@total_disciplines)
BEGIN
	SELECT 
			@current_discipline	=	discipline_id
			
	FROM	@disciplines
	WHERE	num_id=@count;

	SELECT
			@number_of_lessons	=	number_of_lessons,
			@discipline_name	=	discipline_name

	FROM	Disciplines
	WHERE	discipline_id = @current_discipline;

	PRINT (@discipline_name);


	SET	@lesson_number=0;
	SET @date=@start_date;


	WHILE	(@lesson_number < @number_of_lessons)
	BEGIN
		
		PRINT('--------------------------------------');
		PRINT (@date);
		----------------------------------------------
		SET @time=@start_time;
		INSERT Schedule
		([group], discipline, teacher, [date], [time], spent)
VALUES	(@group, @current_discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0 ));
		PRINT (@time);
		SET @lesson_number=@lesson_number+1;
		-----------------------------------------------
		SET @time = DATEADD(MINUTE, 100, @time);
		PRINT (@time);
		INSERT Schedule
		([group], discipline, teacher, [date], [time], spent)
VALUES	(@group, @current_discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
		SET @lesson_number=@lesson_number+1;
		------------------------------------------------	
	IF(@lesson_number%3=0)
		SET @interval=3;
	ELSE
		SET @interval =2;

		SET @date = DATEADD(DAY, @interval, @date);
	END
		SET @count=@count+1;
		SET	@start_date=@date;
		
END








