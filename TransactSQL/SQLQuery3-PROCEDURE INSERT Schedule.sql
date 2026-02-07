--SQLQuery3-PROCEDURE INSERT Schedule.sql;

--SQLQuery1-INSERT ScheduleSemi PROCEDURE(T).sql

USE SPU_411_Import;
GO

ALTER PROCEDURE sp_InsertScheduleSemistacionar
		 @group_name			AS			NVARCHAR(24)
		,@discipline_name		AS			NVARCHAR(150)
		,@teacher				AS			NVARCHAR(50)

AS
BEGIN
	DECLARE @group_id			AS			INT			=		(SELECT group_id FROM Groups WHERE group_name=@group_name);
	DECLARE	@discipline_id		AS			SMALLINT	=		(SELECT discipline_id  FROM Disciplines  WHERE discipline_name LIKE @discipline_name);
	DECLARE	@teacher_id			AS			SMALLINT	=		(SELECT teacher_id FROM Teachers WHERE last_name LIKE @teacher)
	--DECLARE	@start_date			AS			DATE		=		(dbo.GetNextDate(@group_name));
	DECLARE	@date				AS			DATE		=		dbo.GetLastName(@group_name);
	DECLARE	@start_time			AS			TIME		=		(SELECT start_time FROM Groups WHERE group_id=@group_id);
	DECLARE @time				AS			TIME		=		@start_time;
	DECLARE @number_of_lessons	AS			TINYINT		=		(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@group_id);
	DECLARE	@lesson_number		AS			TINYINT		=		1;
	IF @date IS NULL SET @date = (SELECT start_date FROM Groups WHERE group_id=@group_id);
	WHILE @lesson_number<=@number_of_lessons
	BEGIN
		IF dbo.GetLastDate(@group_name) IS NOT NULL SET @date =dbo.GetNextDate(@group_name);
		SET @date = dbo.GetNextDate(@group_name);
		EXEC sp_InsertLesson @group_id, @discipline_id, @teacher_id,@date,@time OUTPUT,@lesson_number OUTPUT;
		--SET @time= DATEADD(MINUTE, 95, @time);							    
		EXEC sp_InsertLesson @group_id, @discipline_id, @teacher_id,@date,@time OUTPUT, @lesson_number OUTPUT;
		--SET @time=DATEADD(MINUTE, 95, @time);								    
		EXEC sp_InsertLesson @group_id, @discipline_id, @teacher_id,@date,@time OUTPUT,@lesson_number OUTPUT;
	END
END	