--SQLQuery2-INSERT Schedule Semistacionar PROCEDURE.sql

USE SPU_411_Import;
GO

ALTER PROCEDURE sp_InsertSchedule
			 @group_name		AS		NVARCHAR(24)
			,@discipline_name	AS		NVARCHAR(150)
			,@teacher_name		AS		NVARCHAR(150)
			,@start_date		AS		DATE
			,@start_time		AS		TIME
			--,@day_of_week		AS		NVARCHAR(70)
			,@pair_time			AS		TINYINT			=	80
			,@break_time		AS		TINYINT			=	15
			,@interval			AS		SMALLINT		=	7
			,@number_of_pairs	AS		TINYINT			=	2
			,@stacionar			AS		BIT				=	0
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



	--DECLARE	@day TABLE(namber_day TINYINT, @day_of_week NVARCHAR(70) );
	--INSERT  @day	(namber_day,@day_of_week)
	--VALUES			(1, N'понедельник' ),(2,N'вторник' ),(3,N'среда' ),(4,N'четверг'),(5,N'пятница'),(6,N'суббота'),(7,N'воскресенье');

					

			--проверяем введенные данные:
	--IF NOT EXISTS(SELECT TOP 1 * FROM Groups WHERE group_id=@group)
	IF @group IS NULL
	BEGIN
		SET @message	=	'Данной группы не существует в БД';
		RETURN;
	END

	--IF NOT EXISTS(SELECT TOP 1 * FROM Disciplines WHERE discipline_id=@discipline)
	IF @discipline IS NULL
	BEGIN
		SET @message	=	'Данной дисциплины не найдено в БД';
		RETURN;
	END

	--IF NOT EXISTS(SELECT TOP 1 * FROM Teachers WHERE teacher_id=@teacher)
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

	WHILE (@lesson_number<@number_of_lessons)
	BEGIN

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

			--IF (@current_pairs!=@number_of_pairs AND @lesson_number<@number_of_lessons)
			SET @time=DATEADD(MINUTE,(@pair_time+@break_time),@time);
		
		END
			-- нужно привязать интервал к дням недели
			SET @date=DATEADD(DAY,@interval,@date);
	END

	PRINT @group;
	PRINT @discipline;
	PRINT @current_pairs;
	PRINT @number_of_lessons;


END

