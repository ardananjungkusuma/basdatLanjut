--1
SELECT productid,productname 
FROM Production.Products
WHERE categoryid = 4
UNION
SELECT P.productid,P.productname
FROM Production.Products P 
INNER JOIN Sales.OrderDetails OD
ON P.productid = OD.productid
GROUP BY P.productid, P.productname
HAVING SUM(OD.qty * OD.unitprice)>50000;

--2
SELECT productid,productname 
FROM Production.Products
WHERE categoryid = 4
UNION ALL
SELECT P.productid,P.productname
FROM Production.Products P 
INNER JOIN Sales.OrderDetails OD
ON P.productid = OD.productid
GROUP BY P.productid, P.productname
HAVING SUM(OD.qty * OD.unitprice)>50000;

--4
SELECT ov.custid, c.contactname,ov.orderdate, ov.val
FROM Sales.OrderValues as ov
INNER JOIN Sales.Customers as c
ON ov.custid = c.custid
WHERE MONTH(ov.orderdate)='01' and YEAR(ov.orderdate)='2008'
UNION ALL
SELECT ov.custid, c.contactname,ov.orderdate, ov.val
FROM Sales.OrderValues as ov
INNER JOIN Sales.Customers as c
ON ov.custid = c.custid
WHERE MONTH(ov.orderdate)='02' and YEAR(ov.orderdate)='2008'

IF OBJECT_ID('dbo.fnGetTop3ProductsForCustomer') IS NOT NULL
	DROP FUNCTION dbo.fnGetTop3ProductsForCustomer;
GO
CREATE FUNCTION dbo.fnGetTop3ProductsForCustomer (@custid as INT)
RETURNS TABLE
AS
	RETURN
	SELECT TOP(3)
	d.productid,
	p.productname,
	SUM(d.qty * d.unitprice) as totalsalesamount
	FROM Sales.Orders as o
	INNER JOIN Sales.OrderDetails as d on d.orderid = o.orderid
	INNER JOIN Production.Products as p on p.productid = d.productid
	WHERE custid = @custid
	GROUP BY d.productid, p.productname
ORDER BY totalsalesamount DESC;

SELECT c.custid, c.contactname, p.productid, p.productname, p.totalsalesamount
FROM Sales.Customers as c
OUTER APPLY 
dbo.fnGetTop3ProductsForCustomer (c.custid) as p
WHERE p.productid is null
ORDER BY c.custid

IF OBJECT_ID('dbo.fnGetTop3ProductsForCustomer') IS NOT NULL
DROP FUNCTION dbo.fnGetTop3ProductsForCustomer

SELECT custid
FROM Sales.Customers
WHERE country = 'USA'
EXCEPT
SELECT o.custid
FROM Sales.Orders as o
INNER JOIN Sales.OrderDetails as d
ON d.orderid = o.orderid
GROUP BY o.custid
HAVING COUNT(DISTINCT d.productid)>20;

SELECT c.custid
FROM Sales.Customers AS c
EXCEPT
SELECT o.custid
FROM Sales.Orders as o
INNER JOIN Sales.OrderDetails as d
ON d.orderid = o.orderid
GROUP BY o.custid
HAVING COUNT(DISTINCT d.productid)>20
INTERSECT
SELECT o.custid
FROM Sales.Orders as o
INNER JOIN Sales.OrderDetails as d on d.orderid = o.orderid
GROUP BY o.custid
HAVING SUM(d.qty * d.unitprice) > 10000;

(SELECT c.custid
FROM Sales.Customers AS c
EXCEPT
SELECT o.custid
FROM Sales.Orders AS o 
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING COUNT(DISTINCT d.productid) > 20)
INTERSECT
SELECT o.custid
FROM Sales.Orders AS o 
INNER JOIN Sales.OrderDetails AS d ON d.orderid = o.orderid
GROUP BY o.custid
HAVING SUM(d.qty * d.unitprice) > 10000;

IF OBJECT_ID('Sales.trgAutoAddOrderDetailsForOrder') IS NOT NULL
	DROP TRIGGER Sales.trgAutoAddOrderDetailsForOrder;
GO

CREATE TRIGGER trgAutoAddOrderDetailsForOrder ON Sales.Orders
AFTER INSERT
AS
	PRINT 'TRIGGER trgAutoAddOrderDetailsForOrder dipanggil';
	DECLARE @orderid INT=(SELECT orderid FROM inserted);
	DECLARE @productid int=1;
	DECLARE @unitprice MONEY=0;
	DECLARE @qty SMALLINT=1;
	DECLARE @discount NUMERIC(4,3)=0;

	INSERT INTO Sales.OrderDetails VALUES 
		(@orderid, @productid, @unitprice, @qty, @discount);
	PRINT 'Data kosong ditambahkan secara otomatis ke tabel Sales.OrderDetails';
GO

--insertdata
INSERT INTO Sales.Orders(
	custid, empid, orderdate, requireddate, shipperid, freight, shipname,
	shipaddress, shipcity, shipcountry)
VALUES (
	85, 5, GETDATE(), GETDATE(), 3, 100, 'KAPAL API',
	'Jl. Soekarno-Hatta', 'Malang', 'Indonesia');

--viewdata
SELECT 
orderid, productid, unitprice, qty, discount 
FROM Sales.OrderDetails
order by orderid desc;

IF OBJECT_ID('Production.trgAutoUpdateOrderDetailsUnitPrice') IS NOT NULL
	DROP TRIGGER Production.trgAutoUpdateOrderDetailsUnitPric;
GO

CREATE TRIGGER trgAutoUpdateOrderDetailsUnitPrice ON Production.Products
AFTER UPDATE
AS
	PRINT 'Trigger trgAutoUpdateOrderDetailsUnitPrice DIPANGGIL!';

	DECLARE @productid INT = (SELECT productid FROM inserted);
	DECLARE @unitprice MONEY=
		COALESCE((SELECT unitprice FROM inserted),0.0);

	UPDATE Sales.OrderDetails SET unitprice=@unitprice
	WHERE productid=@productid;

		PRINT 'Harga di tabel Sales.OrderDetails secara otomatis disesuaikan..';

UPDATE Production.Products SET unitprice=100 WHERE productid=11;
SELECT * FROM Production.Products WHERE productid=11;
SELECT * FROM Sales.OrderDetails WHERE productid=11;


--12
IF OBJECT_ID('Sales.trgAutoProductDiscontinue') IS NOT NULL
	DROP TRIGGER Sales.trgAutoProductDiscontinue;
GO

CREATE TRIGGER trgAutoProductDiscontinue ON Sales.OrderDetails
AFTER DELETE
AS
	PRINT 'Trigger trgAutoProductDiscontinue DIPANGGIL!';
	DECLARE @productid INT = (SELECT top(1) productid FROM deleted);

	UPDATE Production.Products SET discontinued=1
	WHERE productid=@productid;

	PRINT 'Men-discontinue product dengan id: '+CAST(@productid AS VARCHAR);

	--12
DELETE FROM Sales.OrderDetails WHERE productid=10;
SELECT * FROM Production.Products WHERE productid=10;

--pr
CREATE TABLE HR.EmployeesBackup
(
  empid           INT          NOT NULL IDENTITY,
  lastname        NVARCHAR(20) NOT NULL,
  firstname       NVARCHAR(10) NOT NULL,
  title           NVARCHAR(30) NOT NULL,
  titleofcourtesy NVARCHAR(25) NOT NULL,
  birthdate       DATETIME     NOT NULL,
  hiredate        DATETIME     NOT NULL,
  address         NVARCHAR(60) NOT NULL,
  city            NVARCHAR(15) NOT NULL,
  region          NVARCHAR(15) NULL,
  postalcode      NVARCHAR(10) NULL,
  country         NVARCHAR(15) NOT NULL,
  phone           NVARCHAR(24) NOT NULL,
  mgrid           INT          NULL,
);

INSERT INTO HR.EmployeesBackup(
	lastname, firstname, title, titleofcourtesy, birthdate, hiredate, [address], city,
	region, postalcode, country, phone, mgrid)
SELECT 
	lastname, firstname, title, titleofcourtesy, birthdate, hiredate, [address], city,
	region, postalcode, country, phone, mgrid
FROM HR.Employees;

IF OBJECT_ID('HR.trgDivertInsertEmployeeToBackup') IS NOT NULL
	DROP TABLE HR.trgDivertInsertEmployeeToBackup
Go

DROP TRIGGER HR.trgDivertUpdateEmployeeToBackup
CREATE TRIGGER trgDivertInsertEmployeeToBackup ON HR.Employees
INSTEAD OF INSERT
AS
	PRINT 'TRIGGER trgDivertInsertEmployeeToBackup DIPANGGIL!';

	INSERT INTO HR.EmployeesBackup(
		lastname, firstname, title, titleofcourtesy, birthdate, hiredate, [address], city,
		region, postalcode, country, phone, mgrid)
	SELECT
		lastname, firstname, title, titleofcourtesy, birthdate, hiredate, [address], city,
		region, postalcode, country, phone, mgrid
	FROM inserted;

	PRINT 'Employee baru disimpan di table HR.BEmployesBackup';
GO

INSERT INTO HR.Employees
VALUES
	('Santoso','Adi','Staff','Mr. ','19830101','20170101',
	'Jl Soekarno-Hatta','Malang','HJawa Timur','65150','Indonesia',
	'(085) 123-456',1)

SELECT * FROM HR.EmployeesBackup;
DELETE FROM HR.EmployeesBackup
WHERE empid=11;