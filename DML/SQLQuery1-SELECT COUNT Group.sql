--SQLQuery1-SELECT COUNT Group.sql

-- По каждому направлению нужно вывести общее количество групп, количество пустых групп и количество заполненных групп;

USE SPU_411_Import;
GO

CREATE PROCEDURE sp_SelectCountGroup
				@direction_name			AS		NVARCHAR(50)			
AS
BEGIN

DECLARE			@direction				AS		TINYINT			=		(SELECT direction_id FROM Directions WHERE direction_name LIKE @direction_name);	

SELECT
				[Направление обучения			]		=		direction_name,
				[Общее число групп				]		=		COUNT(DISTINCT[group_id]),
				[Количество заполненных групп	]		=		COUNT(DISTINCT CASE WHEN s.stud_id IS NOT NULL THEN g.group_id END),
				[Количество пустых групп		]		=		COUNT(DISTINCT CASE WHEN s.stud_id IS NULL THEN g.group_id END)

FROM			Directions d
LEFT JOIN		Groups	g				ON		d.direction_id=g.direction
LEFT JOIN		Students s				ON		g.group_id=s.stud_id

WHERE			direction_id=@direction

GROUP BY		direction_id, direction_name;

END