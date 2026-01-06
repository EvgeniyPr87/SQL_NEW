--SQLQuery ALL in ONE.sql

USE master;

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'SPU_411_ALL')
BEGIN
	ALTER DATABASE SPU_411_ALL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE SPU_411_ALL;
END

PRINT 'Создаем базу данных SPU_411_ALL';

CREATE DATABASE SPU_411_ALL
ON PRIMARY
(
NAME		=	'SPU_411_ALL',
FILENAME	=	'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\SPU_411_ALL.mdf',
SIZE		=	8 MB,
MAXSIZE		=	500 MB,
FILEGROWTH	=	8 MB
)
LOG ON
(
NAME		=	'SPU_411_ALL_LOG',
FILENAME	=	'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\SPU_411_ALL.ldf',
SIZE		=	8 MB,
MAXSIZE		=	500 MB,
FILEGROWTH	=	5 MB
);

PRINT 'База данных SPU_411_ALL успешно созданна';

USE SPU_411_ALL;

PRINT 'Создание таблиц:';

CREATE TABLE Directions
(
direction_id		TINYINT				PRIMARY KEY,
direction_name		NVARCHAR(150)		NOT NULL
);
PRINT '					таблица "Directions" создана';

CREATE TABLE Disciplines
(
discipline_id		SMALLINT			PRIMARY KEY,
discipline_name		NVARCHAR(256)		NOT NULL,
number_of_lessons	TINYINT				NOT NULL
);
PRINT '					таблица "Disciplines" создана';

CREATE TABLE Groups
(
group_id			INT					PRIMARY KEY,
group_name			NVARCHAR(24)		NOT NULL,
direction			TINYINT				NOT NULL
CONSTRAINT FK_Groups_Direction FOREIGN KEY		REFERENCES Directions(direction_id)
);
PRINT '					таблица "Groups" создана';

CREATE TABLE Students
(
student_id			INT					PRIMARY KEY,
last_name			NVARCHAR(50)		NOT NULL,
first_name			NVARCHAR(50)		NOT NULL,
middle_name			NVARCHAR(50)		NULL,
birth_date			DATE				NOT NULL,
[group]				INT					NOT NULL
CONSTRAINT FK_Students_Group	FOREIGN KEY		REFERENCES Groups(group_id)
);
PRINT '					таблица "Students" создана';

CREATE TABLE Teachers
(
teacher_id			INT					PRIMARY KEY,
last_name			NVARCHAR(50)		NOT NULL,
first_name			NVARCHAR(50)		NOT NULL,
middle_name			NVARCHAR(50)		NULL,
birth_date			DATE				NOT NULL,
rate				MONEY				NOT NULL
);
PRINT '					таблица "Teachers" создана';

CREATE TABLE Schedule
(
lesson_id			BIGINT				PRIMARY KEY,
[date]				DATE				NOT NULL,
[time]				TIME				NOT NULL,
[group]				INT					NOT NULL
CONSTRAINT FK_Schedule_Group			FOREIGN KEY		REFERENCES Groups(group_id),
discipline			SMALLINT			NOT NULL
CONSTRAINT FK_Schedule_Discipline		FOREIGN KEY		REFERENCES Disciplines(discipline_id),
teacher				INT					NOT NULL
CONSTRAINT FK_Schedule_Teacher			FOREIGN KEY		REFERENCES Teachers(teacher_id),
spent				BIT					NOT NULL,
[subject]			NVARCHAR(256)		NOT NULL
);
PRINT '					таблица "Schedule" создана';

CREATE TABLE AttendanceAndGrades
(
student				INT
CONSTRAINT FK_Grades_Students	FOREIGN KEY(student)	REFERENCES Students(student_id),
lesson				BIGINT
CONSTRAINT FK_Grades_Schedule	FOREIGN KEY(lesson)		REFERENCES Schedule(lesson_id),
present				BIT					NOT NULL,
grade_1				TINYINT				NULL
CONSTRAINT CK_Grade_1 CHECK		(grade_1>0 AND grade_1<=12),
grade_2				TINYINT				NULL
CONSTRAINT CK_Grade_2 CHECK		(grade_2 BETWEEN 1 AND 12), -- сравнение при помощи BETWEEN
--CONSTRAINT CK_Grade_2 CHECK (grade_2 IN (2, 3, 4, 5)) если нужно использовать конкретные значения
PRIMARY KEY(student, lesson)
);
PRINT '					таблица "AttendanceAndGrades" создана';

CREATE TABLE Exams
(
student				INT					NOT NULL
CONSTRAINT FK_Exams_Students	FOREIGN KEY(student)	REFERENCES Students(student_id),
discipline			SMALLINT			NOT NULL
CONSTRAINT FK_Exams_Disciplines	FOREIGN KEY(discipline)	REFERENCES Disciplines(discipline_id),
grade				TINYINT				NOT NULL
PRIMARY KEY(student, discipline)
);
PRINT '					таблица "Exams" создана';

PRINT 'Создание вспомогательных таблиц:';
