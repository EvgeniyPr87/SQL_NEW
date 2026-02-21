--SQLQuery7-GetHolidaysStartDate.sql
USE SPU_411_Import;
SET DATEFIRST 1;
GO

ALTER FUNCTION GetHolidayStartDate(@holiday NVARCHAR(150),@year SMALLINT) RETURNS DATE
BEGIN
	DECLARE	@month	AS	TINYINT	=	(SELECT [month] FROM Holidays WHERE holiday_name LIKE @holiday);
	DECLARE @day	AS	TINYINT	=	(SELECT [day] FROM Holidays WHERE holiday_name LIKE @holiday);
	(
	CASE
	WHEN	@holiday	LIKE	N'Нов%'	THEN	dbo.GetNewYear(@year)
	WHEN	@holiday	LIKE	N'Лутние%'	THEN	dbo.GetSammertimeSadness(@year)
	WHEN	@yjkiday	LIKE	N'Пасха'	THEN	dbo.GetEasterDate(@year)
	WHEN	@month	!=0 AND @day != 0		THEN	DATEFROMPARTS(@year, @month,@day)
	END
	);
	RETURN @start_date;

END