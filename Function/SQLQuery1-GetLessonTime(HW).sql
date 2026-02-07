--SQLQuery1-GetLessonTime(HW).sql

USE SPU_411_Import;
GO
CREATE FUNCTION GetLessonTime (@number_pair AS TINYINT,@start_time AS TIME)
RETURNS TIME
AS
BEGIN
DECLARE @time				AS		TIME			= @start_time;
DECLARE @pair_time			AS		TINYINT			=	80;
DECLARE @break_time			AS		TINYINT			=	15;	
DECLARE @pair				AS		TINYINT			=	1;

IF @number_pair=1
	RETURN @time;

WHILE(@pair<@number_pair)
BEGIN
	SET @time=DATEADD(MINUTE,(@pair_time+@break_time),@time);
	SET @pair=@pair+1;
END
RETURN @time;
END
