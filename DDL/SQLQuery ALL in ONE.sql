--SQLQuery ALL in ONE.sql

USE master;
GO
PRINT '1. СОЗДАНИЕ БАЗЫ ДАННЫХ';

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
NAME		=	'SPU_411_ALL',
FILENAME	=	'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\SPU_411_ALL.ldf',
SIZE		=	8 MB,
MAXSIZE		=	500 MB,
FILEGROWTH	=	5 MB
);

PRINT 'База данных успешно созданна';
GO

USE SPU_411_ALL;

PRINT 'СОЗДАНИЕ ТАБЛИЦ';

CREATE TABLE Directions
(
direction_id		TINYINT				PRIMARY KEY,
direction_name		NVARCHAR(150)		NOT NULL
);

CREATE TABLE Groups
(
group_id			INT					PRIMARY KEY,
group_name			NVARCHAR(24)		NOT NULL
);

CREATE TABLE Students
(
student_id			INT					PRIMARY KEY,
last_name			NVARCHAR(50)		NOT NULL,
first_name			NVARCHAR(50)		NOT NULL,
middle_name			NVARCHAR(50)		NULL,
birth_date			DATE				NOT NULL,
[group]				INT					NOT NULL,
);

CREATE TABLE Teachers
(
teacher_id			INT					NOT NULL,
last_name			NVARCHAR(50)		NOT NULL,
first_name			NVARCHAR(50)		NOT NULL,
middle_name			NVARCHAR(50)		NULL,
birth_date			DATE				NOT NULL,
rate				MONEY				NOT NULL
);

