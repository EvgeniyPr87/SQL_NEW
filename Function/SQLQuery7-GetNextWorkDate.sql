--SQLQuery7-GetNextWorkDate.sql
SET DATEFIRST 1;

USE SPU_411_Import;
GO

CREATE FUNCTION GetNextWorkDate (@group_name AS NVARCHAR(24))
RETURNS DATE
AS
BEGIN 
DECLARE @date				AS  DATE	= dbo.GetLastDate(@group_name)
DECLARE @next_date			AS	DATE	= DATEADD(DAY, 1, @date);
DECLARE @day_of_week		AS	INT;

WHILE 1=1
	BEGIN
		SET @day_of_week =DATEPART(WEEKDAY,@next_date);
	
		IF NOT EXISTS(SELECT 1 FROM DaysOFF WHERE [date]= @next_date) 
		RETURN @next_date;
	
		SET @next_date=DATEADD(DAY, 1, @next_date);
	
	END
END