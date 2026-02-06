--SQLQuery1-GetNextDate(HW).sql

USE SPU_411_Import;
GO
CREATE FUNCTION GetNextDate(@group_name AS NVARCHAR(24))
RETURNS DATE
AS
BEGIN
DECLARE @group_id	AS	INT		=	(SELECT group_id FROM Groups WHERE group_name = @group_name);
DECLARE	@next_day	AS	TINYINT	=	dbo.GetNextDay(@group_name);
DECLARE	@last_date	AS	DATE	=	dbo.GetLastDate(@group_name);
DECLARE	@next_date	AS	DATE;

DECLARE @interval	AS	TINYINT;
DECLARE	@today		AS	DATE	=	GETDATE();
DECLARE	@today_day	AS	TINYINT	=	DATEPART(WEEKDAY,@today);

IF @last_date IS NULL
BEGIN
	IF (@next_day>=@today_day)
		SET @interval= @next_day-@today_day;
	ELSE
		SET @interval=7-@today_day+@next_day;
SET @next_date=DATEADD(DAY,@interval,@today);
END
ELSE
BEGIN
DECLARE @last_day	AS	TINYINT	=	DATEPART(WEEKDAY,@last_date);
	IF (@next_day>@last_day)
		SET @interval=@next_day-@last_day;
	ELSE
		SET @interval=7-@last_day+@next_day;
		SET @next_date= DATEADD(DAY,@interval,@last_date);
END
	IF (@next_date < @today)
		SET @next_date=DATEADD(WEEK,1,@next_date)
RETURN @next_date;
END