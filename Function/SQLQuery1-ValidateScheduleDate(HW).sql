--SQLQuery1-ValidateScheduleDate(HW).sql

USE SPU_411_Import;
GO
CREATE FUNCTION	ValidateScheduleDate
	(
	@group_name			AS	NVARCHAR(24),
	@discipline_name	AS	NVARCHAR(150),
	@teacher			AS	NVARCHAR(50)
	)
RETURNS BIT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Groups WHERE group_name LIKE @group_name)
		AND EXISTS (SELECT 1 FROM Disciplines WHERE discipline_name LIKE @discipline_name)
		AND EXISTS (SELECT 1 FROM Teachers WHERE last_name LIKE @teacher )
		RETURN 1;
	RETURN 0;
END


