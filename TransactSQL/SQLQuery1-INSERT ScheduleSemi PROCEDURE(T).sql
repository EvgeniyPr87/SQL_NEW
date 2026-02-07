--SQLQuery1-INSERT ScheduleSemi PROCEDURE(T).sql

USE SPU_411_Import;
GO

ALTER PROCEDURE sp_InsertScheduleSemistacionar
		 @group_name			AS			NVARCHAR(24)
		,@discipline_name		AS			NVARCHAR(150)
		,@teacher				AS			NVARCHAR(50)

AS
BEGIN
	
	IF dbo.ValidateScheduleDate(@group_name, @discipline_name,@teacher)=0
	BEGIN
		PRINT '¬ведены некорректные данные';
		RETURN;
	END


	DECLARE @group_id			AS			INT			=		(SELECT group_id FROM Groups WHERE group_name=@group_name);
	DECLARE	@discipline_id		AS			SMALLINT	=		(SELECT discipline_id  FROM Disciplines  WHERE discipline_name LIKE @discipline_name);
	DECLARE	@teacher_id			AS			SMALLINT	=		(SELECT teacher_id FROM Teachers WHERE last_name LIKE @teacher)
	DECLARE	@start_date			AS			DATE		=		(dbo.GetStartDate(@group_name));
	DECLARE	@date				AS			DATE		=		@start_date;
	DECLARE	@start_time			AS			TIME		=		(SELECT start_time FROM Groups WHERE group_id=@group_id);
	DECLARE @number_of_lessons	AS			TINYINT		=		(SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline_id);
	DECLARE @lesson_number		AS			TINYINT		=		0;
	--DECLARE @next_day			AS			TINYINT		=		(dbo.GetNextDay(@group_name));
	DECLARE	@number_pair		AS			TINYINT		=		3;
	DECLARE @pair				AS			TINYINT;
	WHILE (@lesson_number< @number_of_lessons)
	BEGIN
		SET @pair=1;
	WHILE (@pair<=@number_pair)
	BEGIN
		DECLARE @lesson_time TIME=dbo.GetLessonTime(@pair,@start_time);
		IF NOT EXISTS(SELECT [group] FROM Schedule WHERE [group]=@group_id AND [date]=@date AND [time]=@lesson_time)
			BEGIN

				INSERT Schedule
						([group],discipline,teacher,[date],[time],spent)
				VALUES	(@group_id, @discipline_id, @teacher_id, @date, @lesson_time, IIF(@date<GETDATE(),1,0));
				
			END
		
		SET @pair=@pair+1;
		SET @lesson_number=@lesson_number+1;
	END
		SET @date=DATEADD(WEEK,1,@date);
	END
END
