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
DECLARE @empname AS nvarchar(30);
SELECT @empname = e.firstname + ' ' + e.lastname
FROM HR.Employees e
WHERE e.empid = 1;
SELECT @empname AS employee;
GO

--4
DECLARE @empname AS nvarchar(30);
SELECT @empname = e.firstname + ' ' + e.lastname
FROM HR.Employees e;
SELECT @empname AS employee;
GO

SELECT e.firstname+' '+e.lastname AS [Employee Name]
FROM HR.Employees e;

--5
DECLARE @empname AS nvarchar(30), @empid AS INT = 5;
SELECT @empname = e.firstname + ' ' + e.lastname
FROM HR.Employees e
WHERE e.empid = @empid;
SELECT @empname AS employee;
GO

--6
DECLARE @empname AS nvarchar(30), @empid AS INT = 5;
SELECT @empname = e.firstname+' '+e.lastname
FROM HR.Employees e
WHERE e.empid = @empid;
GO
SELECT @empname AS employee;

--7
DECLARE @result nvarchar(20), @i INT = 8;
IF @i < 5
    SET @result = 'Kurang dari 5';
ELSE IF @i >= 5 AND @i < 10
    SET @result = 'Antara 5 dan 10';
ELSE IF @i > 10
    SET @result = 'Lebih dari 10';
ELSE
    SET @result = 'Unknown';
SELECT @result result;
GO

--8
DECLARE @result nvarchar(20), @i INT = 8;
SELECT @result =
    CASE
        WHEN @i < 5 THEN 'Kurang dari 5'
        WHEN @i >=5 AND @i < 10 THEN 'Antara 5 dan 10'
        WHEN @i > 10 THEN 'Lebih dari 10'
        ELSE 'Unknown'
    END
SELECT @result AS result;
GO

--9
DECLARE @birthdate DATE, @cmpdate DATE;
SELECT @birthdate = e.birthdate
FROM HR.Employees e
WHERE e.empid=5;
SET @cmpdate = '1970-01-01';
IF @birthdate < @cmpdate
    PRINT 'Karyawan dilahirkan sebelum Januari 1, 1970';
ELSE
    PRINT 'Karyawan dilahirkan sesudah Januari 1, 1970';
GO

--10
CREATE PROCEDURE Sales.CheckPersonBirthDate
    @empid INT,
    @cmpdate DATE
AS
DECLARE @birthdate DATE;
SET @birthdate=(SELECT birthdate
FROM HR.Employees
WHERE empid = @empid);
IF @birthdate < @cmpdate
    PRINT 'Karyawan dilahirkan sebelum ' + FORMAT(@cmpdate, 'MMMM d, yyyy','en-US');
ELSE
    PRINT 'Karyawan dilahirkan pada atau setelah '+ FORMAT(@cmpdate, 'MMMM d, yyyy','en-US');
GO

EXEC Sales.CheckPersonBirthDate 3,'January 1, 1990';

--11
DECLARE @i INT = 1;
WHILE @i <= 10
BEGIN
    PRINT @i;
    SET @i += 1;
END;

--12
DECLARE @SQLstr nvarchar(200);
SET @SQLstr = N'SELECT empid, firstname, lastname FROM HR.Employees';
EXEC sys.sp_executesql @SQLstr;
GO

--13
DECLARE @SQLstr nvarchar(200), @SQLParam nvarchar(100);
SET @SQLParam = '@empid INT';
SET @SQLstr = N'SELECT empid, firstname, lastname FROM HR.Employees WHERE empid = @empid';
EXEC sys.sp_executesql @SQLstr, @SQLParam, @empid = 5;
GO

--14
CREATE SYNONYM dbo.Pelanggan
FOR Sales.Customers;
GO
SELECT contacttitle, contactname
FROM Pelanggan p;
GO

DROP SYNONYM dbo.Pelanggan;

--15
BEGIN TRY
    SELECT CAST(N'Sekarang Tanggal' AS date);
END TRY
BEGIN CATCH
    Print 'Error';
END CATCH
GO

--16
DECLARE @num varchar(20) = '0';
BEGIN TRY
    PRINT 5. / CAST (@num AS numeric(10,4));
END TRY
BEGIN CATCH
    PRINT 'Error Division by zero';
END CATCH
GO

--17
DECLARE @num varchar(20) = '0';
BEGIN TRY
    PRINT 5. / CAST (@num AS numeric(10,4));
END TRY
BEGIN CATCH
    PRINT 'Error Number: '+ CAST(ERROR_NUMBER() AS varchar);
    PRINT 'Error Message: '+ CAST(ERROR_MESSAGE() AS varchar);
END CATCH
GO