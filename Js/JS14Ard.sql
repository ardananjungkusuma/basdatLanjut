-- Jobsheet 14
USE TSQL1
GO


--1
BEGIN TRANSACTION
		INSERT INTO HR.Employees
			(lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address,
			city, region, postalcode, country, phone, mgrid)
		VALUES (N'Johnson', N'Test 1', N'Sales Manager', N'Mr.', '19700101', '20110101', N'Some
				Address 18', N'Ljubljana', NULL, N'1000', N'Slovenia', N'(386) 113322', 2);

		INSERT INTO HR.Employees 
			(lastname, firstname, title, titleofcourtesy, birthdate,
			hiredate, address, city, region, postalcode, country, phone, mgrid)
		VALUES (N'Robertson', N'Test 2', N'Sales Representative', N'Mr.', '19850101', '20110601',
		N'Some Address 22', N'Ljubljana', NULL, N'1000', N'Slovenia', N'(386) 553344', 10);
COMMIT TRANSACTION
GO

--2
SELECT
	empid, lastname, firstname
FROM
	HR.Employees
ORDER BY empid DESC;
GO

DELETE HR.Employees
WHERE empid IN (10,11);
DBCC CHECKIDENT ('HR.Employees', RESEED, 9);

--3
BEGIN TRANSACTION
		INSERT INTO HR.Employees
			(lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address,
			city, region, postalcode, country, phone, mgrid)
		VALUES (N'Johnson', N'Test 1', N'Sales Manager', N'Mr.', '19700101', '20110101', N'Some
				Address 18', N'Ljubljana', NULL, N'1000', N'Slovenia', N'(386) 113322', 2);

		INSERT INTO HR.Employees 
			(lastname, firstname, title, titleofcourtesy, birthdate,
			hiredate, address, city, region, postalcode, country, phone, mgrid)
		VALUES (N'Robertson', N'Test 2', N'Sales Representative', N'Mr.', '19850101', '20110601',
		N'Some Address 22', N'Ljubljana', NULL, N'1000', N'Slovenia', N'(386) 553344', 10);
GO

--4
SELECT
	empid, lastname, firstname
FROM
	HR.Employees
ORDER BY empid DESC;
GO

--5
ROLLBACK TRANSACTION;
GO

--6


DBCC CHECKIDENT ('HR.Employees', RESEED, 9);


SELECT empid, lastname, firstname
FROM HR.Employees
ORDER BY empid DESC;


BEGIN TRAN;
	INSERT INTO HR.Employees (lastname, firstname, title, titleofcourtesy, birthdate,
							hiredate, address, city, region, postalcode, country, phone, mgrid)
	VALUES (N'Johnson', N'Test 1', N'Sales Manager', N'Mr.', '19700101', '20110101', N'Some
			Address 18', N'Ljubljana', NULL, N'1000', N'Slovenia', N'(386) 113322', 2);

	INSERT INTO HR.Employees (lastname, firstname, title, titleofcourtesy, birthdate,
							hiredate, address, city, region, postalcode, country, phone, mgrid)
	VALUES (N'Robertson', N'Test 2', N'Sales Representative', N'Mr.', '19850101', '10110601',
			N'Some Address 22', N'Ljubljana', NULL, N'1000', N'Slovenia', N'(386) 553344', 10);
COMMIT TRAN;
GO

--7

--8
SELECT empid, lastname, firstname
FROM HR.Employees
ORDER BY empid DESC;

DELETE HR.Employees
WHERE empid IN (10, 11);
DBCC CHECKIDENT ('HR.Employees', RESEED, 9);

--9
BEGIN TRY
BEGIN TRAN;
	INSERT INTO HR.Employees (lastname, firstname, title, titleofcourtesy, birthdate,
								hiredate, address, city, region, postalcode, country, phone, mgrid)
	VALUES (N'Johnson', N'Test 1', N'Sales Manager', N'Mr.', '19700101', '20110101', N'Some
				Address 18', N'Ljubljana', NULL, N'1000', N'Slovenia', N'(386) 113322', 2);
	
	INSERT INTO HR.Employees (lastname, firstname, title, titleofcourtesy, birthdate,
								hiredate, address, city, region, postalcode, country, phone, mgrid)
	VALUES (N'Robertson', N'Test 2', N'Sales Representative', N'Mr.', '19850101', '10110601',
				N'Some Address 22', N'Ljubljana', NULL, N'1000', N'Slovenia', N'(386) 553344', 10);
PRINT ('Commited')
COMMIT TRAN
END TRY
BEGIN CATCH
	PRINT ('Error Detected: Rollback!')
	ROLLBACK TRAN
END CATCH
GO


SELECT empid, lastname, firstname
FROM HR.Employees
ORDER BY empid DESC;

DBCC CHECKIDENT ('HR.Employees', RESEED, 9);