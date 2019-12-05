--1
IF OBJECT_ID('Sales.TempOrders') IS NOT NULL 
DROP TABLE Sales.TempOrders;
SELECT
	orderid, custid, empid,
	orderdate, requireddate, shippeddate,
	shipperid, freight, shipname,
	shipaddress, shipcity, shipregion,
	shippostalcode, shipcountry
INTO 
	Sales.TempOrders
FROM Sales.Orders as o 
	CROSS JOIN dbo.Nums as n
WHERE n.n <= 120;

--2
SELECT orderid, custid, orderdate
FROM Sales.TempOrders;

--6
SELECT TOP(1)
	orderid, custid, orderdate
FROM Sales.TempOrders;

--8
SELECT orderid, custid, orderdate
FROM Sales.TempOrders;

SELECT TOP(1)
	orderid, custid, orderdate
FROM Sales.TempOrders;

CREATE CLUSTERED INDEX CX_Sales_TempOrders_orderdate ON Sales.TempOrders(orderdate ASC);

--9
SELECT orderid, 
       custid, 
       orderdate 
FROM   sales.temporders 
WHERE  Year(orderdate) = 2007 
       AND Month(orderdate) = 6;

--10
SET STATISTICS IO ON
GO
SELECT orderid, custid, orderdate
FROM Sales.TempOrders
WHERE YEAR(orderdate) = 2017 AND MONTH(orderdate) = 6;

SET STATISTICS TIME ON

--11
SELECT orderid, custid, orderdate
FROM Sales.TempOrders
WHERE orderdate >= '20170601' AND orderdate < '20170701';

--12
SELECT orderid, custid, orderdate
FROM Sales.TempOrders
WHERE YEAR(orderdate) = 2017 AND MONTH(orderdate) = 6;

SELECT orderid, custid, orderdate
FROM Sales.TempOrders
WHERE orderdate >= '20170601' AND orderdate < '20170701';

--14
DROP INDEX CX_Sales_TempOrders_orderdate ON Sales.TempOrders; set statistics io off