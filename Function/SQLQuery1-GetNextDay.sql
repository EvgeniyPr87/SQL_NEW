--SQLQuery1-GetNextDate.sql

SET DATEFIRST 1; 
USE SPU_411_Import;
GO

ALTER FUNCTION GetNextDay(@group_name AS	NVARCHAR(24))
RETURNS TINYINT
AS
BEGIN
	DECLARE @group_id		AS	INT		=	(SELECT group_id FROM Groups WHERE group_name=@group_name);
	DECLARE @learning_days	AS	TINYINT	=	(SELECT weekdays FROM Groups WHERE group_id=@group_id);
	DECLARE @last_date		AS	DATE	=	dbo.GetLastDate(@group_name);
	DECLARE @weekday		AS	TINYINT	=	DATEPART(WEEKDAY, @last_date);
	DECLARE @day			AS	TINYINT =	@weekday;
	DECLARE @next_day		AS	TINYINT =	1;
	WHILE @day <= 7
	BEGIN
		SET @day = @day + 1;
		IF (POWER(2, @day-1) & @learning_days > 0 )
		BEGIN
			SET @next_day = @day;
			BREAK;
		END
	END

	IF @next_day = 1
	BEGIN
		SET @day = 1;
		WHILE @day <= @weekday
		BEGIN
			IF(POWER(2, @day-1) & @learning_days > 0)
			BEGIN
				SET @next_day = @day;
				BREAK;
			END
			SET @day = @day+1;
		END
	END

	RETURN @next_day;
END




--SET DATEFIRST 1; --1 ПН, 2 Вт...

--USE SPU_411_Import;
--GO
--ALTER FUNCTION GetNextDay(@group_name AS NVARCHAR(24))
--RETURNS	TINYINT
--AS
--BEGIN
--	DECLARE @group_id		AS	INT			=	(SELECT group_id FROM Groups WHERE group_name= @group_name);
--	DECLARE @learning_days	AS	TINYINT		=	(SELECT weekdays FROM Groups WHERE group_id=@group_id);
--	DECLARE	@last_date		AS	DATE		=	dbo.GetLastDate(@group_name);
--	DECLARE	@weekday		AS	TINYINT		=	DATEPART(WEEKDAY, @last_date);
--	DECLARE	@day			AS	TINYINT		=	@weekday+1;
--	DECLARE	@next_day		AS	TINYINT		=	NULL;
	
--	--Если уже были занятия
--	IF @last_date IS NOT NULL
--	BEGIN
--		SET @weekday = DATEPART(WEEKDAY, @last_date);
--	--Ищем следующий день на этой недели
--	WHILE @day <=7 
--	BEGIN
--		IF (POWER(2, @day -1) & @learning_days >0)
--		BEGIN
--			SET @next_day = @day;
--			BREAK;
--		END
--		SET @day = @day +1;
--	END
	
--	--если не нашли на этой неделе, ищем на следующей неделе
--	IF @next_day IS NULL
--	BEGIN
--		SET @day = 1;
--		WHILE @day <= @weekday
--		BEGIN
--			IF (POWER(2, @day-1) & @learning_days > 0)
--			BEGIN
--				SET @next_day=@day;
--				BREAK;
--			END
--			SET @day=@day+1;
--		END
--	END
--END
----если еще небыло занятий (первое занятие)
--ELSE
--BEGIN
--	SET @day = 1;
--	WHILE @day <=7
--	BEGIN
--		IF (POWER(2, @day-1) & @learning_days > 0)
--		BEGIN
--			SET @next_day = @day;
--			BREAK;
--			END
--		SET @day=@day+1;
--		END
--		END

--	RETURN @next_day;
--END	

-------------------------------------------------------------------------------------------------
--SQLQuery1-GetNextDate.sql(HW)
--SET DATEFIRST 1;

--USE SPU_411_Import;
--GO

--ALTER FUNCTION GetNextDay (@group_name AS NVARCHAR(24))
--RETURNS TINYINT
--AS
--BEGIN
--DECLARE	@group_id		AS		INT			=	(SELECT group_id FROM Groups WHERE group_name=@group_name);
--DECLARE @lerning_days	AS		TINYINT		=	(SELECT weekdays FROM Groups WHERE group_id=@group_id );
--DECLARE	@last_data		AS		DATE		=	dbo.GetLastDate(@group_name);
--DECLARE @weekday		AS		TINYINT		=	DATEPART(WEEKDAY,@last_data);
--DECLARE	@day			AS		TINYINT		=	@weekday;
--DECLARE	@next_day		AS		TINYINT		=	1;

--WHILE @day<=7
--BEGIN
--	SET @day=@day+1;
--	IF(POWER(2, @day-1) & @lerning_days >0)
--	BEGIN
--		SET @next_day=@day;
--		BREAK;
--	END
--END
--IF @next_day=1
--BEGIN
--	SET @day=1;
--	WHILE @day<=@weekday
--	BEGIN
--		IF(POWER(2, @day-1) & @lerning_days >0)
--		BEGIN
--			SET @next_day=@day;
--			BREAK;
--		END
--	SET @day=@day+1;
--	END
--END
--RETURN @next_day;
--END