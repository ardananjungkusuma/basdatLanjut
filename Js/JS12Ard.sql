USE master

--1
CREATE PROCEDURE Sales.GetTopCustomers
AS
SELECT TOP(10)
    c.custid, c.contactname,
    SUM(o.val) AS salesvalue
FROM Sales.OrderValues	AS o
    INNER JOIN Sales.Customers	AS c
    ON c.custid	= o.custid
GROUP BY c.custid, c.contactname
ORDER BY salesvalue	DESC;

--2
EXEC Sales.GetTopCustomers;

--Alter Procedure
ALTER PROCEDURE Sales.GetTopCustomers
AS
SELECT c.custid, c.contactname,
    SUM(o.val) AS salesvalue
FROM Sales.OrderValues	AS o
    INNER JOIN Sales.Customers	AS c
    ON c.custid	= o.custid
GROUP BY c.custid, c.contactname
ORDER BY salesvalue	DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

--3
EXEC Sales.GetTopCustomers;

--4
ALTER PROCEDURE Sales.GetTopCustomers
    @orderyear int
AS
SELECT c.custid, c.contactname,
    SUM(o.val) AS salesvalue
FROM Sales.OrderValues AS o
    INNER JOIN Sales.Customers AS c
    ON c.custid = o.custid
WHERE YEAR(o.orderdate) = @orderyear
GROUP BY c.custid, c.contactname
ORDER BY salesvalue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

--7
EXEC Sales.GetTopCustomers '2007';

--9
EXEC Sales.GetTopCustomers '2008';

--10
EXEC Sales.GetTopCustomers;

--Alter agar bisa menerima tanpa parameter.
ALTER PROCEDURE Sales.GetTopCustomers
    @orderyear int = NULL
AS
SELECT c.custid, c.contactname, SUM(o.val)  AS  salesvalue
FROM Sales.OrderValues AS o INNER JOIN Sales.Customers AS c ON  c.custid  =  o.custid
WHERE  YEAR(o.orderdate)  =  @orderyear OR @orderyear IS NULL
GROUP BY c.custid, c.contactname
ORDER BY salesvalue DESC
OFFSET  0  ROWS  FETCH  NEXT  10  ROWS  ONLY;

--13
EXEC Sales.GetTopCustomers;

-- query stored procedure
ALTER PROCEDURE Sales.GetTopCustomers
    @orderyear	int = NULL,
    @n	int = 10
AS
SELECT c.custid, c.contactname,
    SUM(o.val) AS salesvalue
FROM Sales.OrderValues	AS o
    INNER JOIN Sales.Customers	AS c
    ON c.custid	= o.custid
WHERE YEAR(o.orderdate) = @orderyear
    OR
    @orderyear	IS NULL
GROUP BY c.custid, c.contactname
ORDER BY salesvalue	DESC
OFFSET	0	ROWS FETCH NEXT @n	ROWS ONLY;

--15 
EXEC Sales.GetTopCustomers;

--16
EXEC Sales.GetTopCustomers '2008','5';

--17
EXEC Sales.GetTopCustomers '2007';

--18
EXEC Sales.GetTopCustomers NULL ,'20';

-- query stored procedure
ALTER PROCEDURE Sales.GetTopCustomers
    @customerpos	int = 1,
    @customername	nvarchar(30) OUTPUT
AS
SET @customername	= (
SELECT c.contactname
FROM Sales.OrderValues	AS o
    INNER JOIN Sales.Customers	AS c
    ON c.custid	= o.custid
GROUP BY c.custid, c.contactname
ORDER BY SUM(o.val) DESC
OFFSET	@customerpos - 1 ROWS FETCH NEXT 1 ROW ONLY	
);

--20
DECLARE @outcustomername nvarchar(30)
EXEC Sales.GetTopCustomers '1', @outcustomername OUTPUT

--21
SELECT @outcustomername AS customername

--22
DECLARE @outcustomername nvarchar(30)
EXEC Sales.GetTopCustomers '1', @outcustomername OUTPUT
SELECT @outcustomername AS customername

--23
EXEC sys.sp_help;

--24
EXEC sys.sp_help 'Sales.Customers';

--25
EXEC sys.sp_helptext 'Sales.GetTopCustomers';

--26
EXEC sys.sp_columns 'Customers','Sales';