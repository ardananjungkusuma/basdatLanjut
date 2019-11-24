USE master

--1
DECLARE @num INT = 5;
SELECT @num as mynumber;
GO

--2
DECLARE @num1 INT = 4,@num2 INT = 6;
SELECT @num1 + @num2  as totalnum;
GO

--3
DECLARE @empname NVARCHAR(30);
SET @empname = N'SELECT firstname, lastname as employee from HR.Employees';
EXEC sys.sp_executesql @statement = @empname;
GO