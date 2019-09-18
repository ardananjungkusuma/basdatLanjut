USE TSQL;
GO

--no1
select CURRENT_TIMESTAMP as currentdatetime, CONVERT (TIME,CURRENT_TIMESTAMP) as currentdate,YEAR(GETDATE()) as currentyear,
MONTH(GETDATE()) as currentmonth,DAY(GETDATE()) as currentday,DATEPART (dw,GETDATE()) as currentweek,
DATENAME(m,GETDATE()) as currentmonthname;

--no2
select CURRENT_TIMESTAMP as currentdate, CONVERT (TIME,CURRENT_TIMESTAMP) as currentdatetime,YEAR(GETDATE()) as currentyear,
MONTH(GETDATE()) as currentmonth,DAY(GETDATE()) as currentday,DATEPART (dw,GETDATE()) as currentweek,
DATENAME(m,GETDATE()) as currentmonthname;

--no3
DECLARE @date date;
SET @date = '2019-09-29'
SELECT CAST('2019-09-29' AS date) as birthdate;
SELECT CONVERT(DATE, '09/29/2019') as birthdate;
SELECT FORMAT(@date,'yyyy-MM-dd') as birthdate;

--no4
SELECT DATEADD(MONTH,3,GETDATE()) as threemonth,DATEDIFF(day,GETDATE(),
DATEADD(MONTH,3,GETDATE())) as diffdays,
DATEDIFF(week,CONVERT(DATE, '09/29/2000'),'2019/09/15') as diffweeks,
DATEDIFF(day,CONVERT(DATE, '09/01/2019'),CURRENT_TIMESTAMP) as firstday;

CREATE TABLE Sales.Somedates (
isitdate varchar(9)
);
INSERT INTO Sales.Somedates (isitdate) VALUES
('20110101'),
('20110102'),
('20110103X'),
('20110104'),
('20110105'),
('20110106'),
('20110107Y'),
('20110108');

--no5
SELECT isitdate, IIF(ISDATE(isitdate) = 1,
CONVERT([date], isitdate), NULL) AS converteddate
FROM Sales.Somedates;

--no6
SELECT SYSDATETIME()  as SYS,CURRENT_TIMESTAMP as cur;

--no8
SELECT DISTINCT custid FROM Sales.Orders 
where YEAR(orderdate)=2008 and MONTH(orderdate)=2;

--no9
SELECT CURRENT_TIMESTAMP as currentdate,
FORMAT (getdate(), '01-09-2019 00:00:00.0000') as firstofmonth,--tambahkan dilaporan ini
EOMONTH(getdate()) as endofmonth;

--no10
SELECT o.orderid, o.custid, o.orderdate FROM Sales.Orders AS o 
WHERE DATEDIFF(DAY, o.orderdate, EOMONTH(o.orderdate)) < 5;

--no11
SELECT DISTINCT odt.productid
FROM Sales.Orders AS o 
INNER JOIN Sales.OrderDetails AS odt 
ON o.orderid = odt.orderid
WHERE DATEPART(WEEK, o.orderdate) <= 10 AND YEAR(o.orderdate) = 2007;

--no12
SELECT contactname + (' (City: ') + city + (')') AS contactwithcity
FROM Sales.Customers;

--no13
SELECT c.contactname + (' (City: ') + c.city + (', region: ') + 
COALESCE(c.region, '') + (')') AS contactwithcity
FROM Sales.Customers AS c

--no14
SELECT c.contactname, c.contacttitle
FROM Sales.Customers AS c
WHERE contactname LIKE '[A-G]%'

--no15
SELECT REPLACE(c.contactname, ',', ''), 
SUBSTRING(c.contactname, 0, 
CHARINDEX(',', c.contactname)) AS lastname
FROM Sales.Customers AS c

--no16
SELECT REPLACE(c.contactname, ',', ''), 
SUBSTRING(c.contactname, CHARINDEX(',', c.contactname) + 2, 
LEN(c.contactname))
FROM Sales.Customers AS c

--no17
SELECT c.custid, 'C' + RIGHT(REPLICATE('0', 5) + 
CAST(custid AS varchar(5)), 5)
FROM Sales.Customers AS c

--no18
SELECT c.contactname, LEN(c.contactname) - 
LEN(REPLACE(c.contactname, 'A', '')) AS numberofa
FROM Sales.Customers AS c