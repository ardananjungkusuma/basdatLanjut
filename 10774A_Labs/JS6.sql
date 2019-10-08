USE TSQL;
GO

SELECT * FROM Production.Products;

--1
SELECT p.productid,p.productname,p.supplierid,p.unitprice,p.discontinued
FROM Production.Products as p
INNER JOIN Production.Categories as c 
ON p.categoryid = c.categoryid
WHERE c.categoryname = ('Seafood');

--2
CREATE VIEW Production.ProductsSeafood AS
SELECT p.productid,p.productname,p.supplierid,p.unitprice,p.discontinued
FROM Production.Products as p
INNER JOIN Production.Categories as c ON p.categoryid = c.categoryid
WHERE c.categoryname = ('Seafood');

--3
SELECT productid,productname FROM Production.ProductsSeafood
WHERE supplierid = 17;

--4
ALTER VIEW Production.ProductsSeafood AS
SELECT TOP(100) PERCENT 
productid, productname, supplierid, unitprice, discontinued
FROM Production.Products
WHERE categoryid = 8
ORDER BY productname;

ALTER VIEW Production.ProductsSeafood AS
SELECT
productid, productname, supplierid, unitprice, discontinued,
CASE WHEN unitprice > 20. THEN N'high'
ELSE N'normal' END
FROM Production.Products
WHERE categoryid = 8;

ALTER VIEW Production.ProductsSeafood AS
SELECT
productid, productname, supplierid, unitprice, discontinued,
CASE WHEN unitprice > 20. THEN N'high'
ELSE N'normal' END
FROM Production.Products
WHERE categoryid = 8

--8
DROP VIEW Production.ProductsSeafood;

--10
SELECT a.custid,
SUM(a.total) AS totalsalesamount,
AVG(a.total) AS avgsalesamount
FROM (
SELECT
so.custid, so.orderid, SUM(sod.qty*sod.unitprice) AS total
FROM Sales.Orders AS so
JOIN Sales.OrderDetails AS sod
ON so.orderid = sod.orderid
GROUP BY so.custid, so.orderid) AS a
GROUP BY a.custid

--11
SELECT a.orderyear, a.totalsalesamount AS curtotalsales, b.totalsalesamount AS prevtotalsales
FROM (
SELECT YEAR(orderdate) AS orderyear,
SUM (val) AS totalsalesamount FROM Sales.OrderValues
GROUP BY YEAR(orderdate)) AS a
LEFT JOIN (
SELECT YEAR(orderdate) AS orderyear,
SUM (val) AS totalsalesamount FROM Sales.OrderValues
GROUP BY YEAR(orderdate)
) AS b
ON a.orderyear = b.orderyear + 1
ORDER BY a.orderyear

--12
select sc.custid, sc.contactname, c.salesamt2008
from Sa