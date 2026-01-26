--SQLQuery2-INSERT Schedule Semistacionar PROCEDURE.sql

USE SPU_411_Import;
GO

CREATE PROCEDURE sp_InsertSchedulу
			 @group_name		AS		NVARCHAR(24)
			,@discipline_name	AS		NVARCHAR(150)
			,@teacher_name		AS		NVARCHAR(150)
			,@start_date		AS		DATE
			,@start_time		AS		TIME
			,@interval			AS		SMALLINT --нужно сделать параметром поумолчанию равным 1
			,@number_of_pairs	AS		TINYINT	--нужно сделать поумолчанию 1
			,@message			AS		NVARCHAR(255)	=	' ' OUT
AS
BEGIN
			--создаем переменные и инициализируем их значениями из БД:
	DECLARE	@discipline			AS		SMALLINT		=	(SELECT discipline_id	FROM Disciplines	WHERE discipline_name = discipline_id);
	DECLARE @group				AS		INT				=	(SELECT group_id	FROM Groups	WHERE group_name =group_id );
	DECLARE @teacher			AS		INT				=	(SELECT teacher_id	FROM Teachers	WHERE last_name LIKE @teacher_name );
	DECLARE @lesson_number		AS		INT				=	0;
	
			--объявляем дополнительные переменные:
	DECLARE @number_of_lesson	AS		TINYINT			=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline );
	DECLARE @date				AS		DATE			=	@start_date;
	DECLARE	@current_pairs		AS		TINYINT			=	0;
	DECLARE @time				AS		TIME;

			--проверяем введенные данные:
	IF NOT EXISTS(SELECT 1 FROM Groups WHERE group_id=@group)
	BEGIN
	SET @message='Данной группы не существует в БД';
	END

	IF NOT EXISTS(SELECT 1 FROM Disciplines WHERE discipline_id=@discipline)
	BEGIN
	SET @message='Данной дисциплины не найдено в БД';
	END

	IF NOT EXISTS(SELECT 1 FROM Teachers WHERE teacher_id=@teacher)
	BEGIN
	SET @message='Указанный преподаватель не найден в БД';
	END;

	WHILE (@lesson_number<=@number_of_lesson)
	BEGIN

		PRINT'--------------------------------';
		PRINT @discipline_name;
		PRINT @date;

		SET @time=@start_time;

		WHILE(@current_pairs<=@number_of_pairs)
		BEGIN

		IF NOT EXISTS(SELECT [group] FROM Schedule WHERE [group]=@group AND [date]=@date AND [time]=@time)
		BEGIN

		INSERT Schedule
				([group],discipline,teacher,[date],[time],spent)
		VALUES	(@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
		PRINT @time;

		END;
		--ввести расчет для минут в зависимости от размера перемены и продолжительности занятия
		SET @lesson_number=@lesson_number+1;
		SET	@time=DATEADD(MINUTE, 95, @time);

		END
	-- нужно привязать интервал к дням недели
	SET @date=DATEADD(DAY,@interval,@date);

	END
END

