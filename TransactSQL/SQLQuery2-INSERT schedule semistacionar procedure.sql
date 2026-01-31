--SQLQuery2-INSERT Schedule Semistacionar PROCEDURE.sql

USE SPU_411_Import;
GO

ALTER PROCEDURE sp_InsertSchedule
			 @group_name		AS		NVARCHAR(24)
			,@discipline_name	AS		NVARCHAR(150)
			,@teacher_name		AS		NVARCHAR(150)
			,@start_date		AS		DATE
			,@start_time		AS		TIME
			,@pair_time			AS		TINYINT			=	80
			,@break_time		AS		TINYINT			=	15
			,@day_of_week		AS		NVARCHAR(15)	=	NULL
			,@interval			AS		SMALLINT		=	7
			,@number_of_pairs	AS		TINYINT			=	1
			,@stacionar			AS		BIT				=	1
			,@message			AS		NVARCHAR(255)	=	' ' OUT
			
AS
BEGIN
			--создаем переменные и инициализируем их значениями из БД:
	DECLARE	@discipline			AS		SMALLINT		=	(SELECT discipline_id	FROM Disciplines	WHERE discipline_name LIKE @discipline_name);
	DECLARE @group				AS		INT				=	(SELECT group_id	FROM Groups	WHERE group_name =@group_name );
	DECLARE @teacher			AS		INT				=	(SELECT teacher_id	FROM Teachers	WHERE last_name LIKE @teacher_name );
	DECLARE @lesson_number		AS		INT				=	0;
	
			--объявляем дополнительные переменные:
	DECLARE @number_of_lessons	AS		TINYINT			=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline );
	DECLARE @date				AS		DATE			=	@start_date;
	DECLARE	@current_pairs		AS		TINYINT			=	0;
	DECLARE @time				AS		TIME;
	DECLARE	@days_of_week		TABLE	(number_day INT);

			--проверяем введенные данные:
	IF @group IS NULL
	BEGIN
		SET @message	=	'Данной группы не существует в БД';
		RETURN;
	END

	IF @discipline IS NULL
	BEGIN
		SET @message	=	'Данной дисциплины не найдено в БД';
		RETURN;
	END

	IF @teacher IS NULL
	BEGIN
		SET @message	=	'Указанный преподаватель не найден в БД';
		RETURN;
	END;

	IF(@stacionar=0)
	BEGIN
	PRINT N'Полустационар';
	SET @number_of_lessons=@number_of_lessons/2;
	END
	---------------------------------------------------
	IF @day_of_week IS NOT NULL
	BEGIN
		INSERT  @days_of_week(number_day)
		SELECT	CAST(value AS INT)
		FROM	STRING_SPLIT(@day_of_week,',');
		WHILE NOT EXISTS (SELECT 1 FROM @days_of_week WHERE number_day=DATEPART(WEEKDAY,@date))
		BEGIN
				SET @date=DATEADD(DAY, 1, @date);
		END
		SET @interval=7;
	END
	------------------------------------------------------




	WHILE (@lesson_number<@number_of_lessons)
	BEGIN
		
		IF @day_of_week IS NOT NULL
		BEGIN
			WHILE NOT EXISTS (SELECT 1 FROM @days_of_week WHERE number_day=DATEPART(WEEKDAY,@date))
			BEGIN
				SET @date=DATEADD(DAY, 1, @date);
			END
		END
		
		PRINT'--------------------------------';
		PRINT @discipline_name;
		PRINT @date;
		--PRINT @time;

		SET @time=@start_time;
		SET @current_pairs=0;

		WHILE(@current_pairs<@number_of_pairs AND @lesson_number<@number_of_lessons)
		BEGIN
			PRINT @time;

			IF NOT EXISTS(SELECT [group] FROM Schedule WHERE [group]=@group AND [date]=@date AND [time]=@time)
			BEGIN

				INSERT Schedule
						([group],discipline,teacher,[date],[time],spent)
				VALUES	(@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
				PRINT @time;
			END
				SET @lesson_number=@lesson_number+1;

				SET @current_pairs=@current_pairs+1;

				SET @time=DATEADD(MINUTE,(@pair_time+@break_time),@time);
		
		END

		IF @day_of_week IS NOT NULL
			DECLARE @found_day	BIT	=0;
			DECLARE @add_day	INT =1;
			
			WHILE @found_day=0
			BEGIN
				DECLARE @next_day	DATE = DATEADD(DAY,@add_day,@date)
				IF EXISTS (SELECT 1 FROM @days_of_week WHERE number_day=DATEPART(WEEKDAY,@next_day))
				BEGIN
					SET	@date=@next_day;
					SET @found_day=1;
				END
			ELSE
			BEGIN
				SET	@add_day=@add_day+1;
			END
		END
	END
	---------------------------------------------------------
	--для проверки
	PRINT @group;
	PRINT @discipline;
	PRINT @current_pairs;
	PRINT @number_of_lessons;
	---------------------------------------------------------

END

