--SQLQuery1-GetNextDate.sql
SET DATEFIRST 1; --1 ПН, 2 Вт...

USE SPU_411_Import;
GO
CREATE FUNCTION GetNextDate(@group_name AS NVARCHAR(24))
RETURNS	TINYINT
AS
BEGIN
	DECLARE @group_id	AS	INT	=	(SELECT group_id FROM Groups WHERE group_name= @group_name);
	DECLARE @learning_days	AS TINYINT	=	(SELECT weekdays FROM Groups WHERE group_id=@group_id);
	DECLARE	@last_date		AS	DATE	=	dbo.GetLastDate(@group_name);
	DECLARE	@weekday		AS	TINYINT	=	DATEPART(WEEKDAY, @last_date);
	DECLARE	@day			AS	TINYINT	=	@weekday;
	DECLARE	@next_day		AS	TINYINT	=	0;
	WHILE @day <=7 
	BEGIN
		IF (POWER(2, @day -1) & @learning_days >0) SET @next_day=@day
		SET @day = @day +1 ;
	END

	IF @next_day=@weekday
	BEGIN
		SET @day = 1;
		WHILE @day <= 7
		BEGIN
			IF (POWER(2, @day -1) & @learning_days >0) SET @next_day=@day;
			SET @day=@day+1;
			END
		END
END	
