USE TSQL;
GO


--no1
SELECT c.custid,c.contactname
FROM Sales.Customers as c
WHERE custid in(SELECT o.custid FROM Sales.Orders as o WHERE empid =5) 
GROUP BY c.custid,c.contactname

--no2
SELECT c.custid,c.contactname,c.city
FROM Sales.Customers as c
WHERE custid in(SELECT o.custid FROM Sales.Orders as o WHERE empid =5) 
GROUP BY c.custid,c.contactname

--no3
SELECT c.custid,c.contactname,c.city
FROM Sales.Customers as c
WHERE custid in(SELECT o.custid FROM Sales.Orders as o WHERE empid =5) 
GROUP BY c.custid,c.contactname,c.city


--no5
SELECT DISTINCT custid,YEAR(orderdate) as tahun
FROM Sales.Orders
WHERE empid=(
SELECT empid FROM HR.Employees where empid=5
);

--no6
SELECT pc.categoryid,pc.categoryname
FROM Production.Categories as pc
UNION
SELECT o.orderdate FROM Sales.Orders as o
WHERE o.orderdate=(SELECT o.orderdate from Sales.Orders as o WHERE YEAR(o.orderdate)=2008);

--7
SELECT o.orderid,o.orderdate
FROM Sales.Orders o
WHERE 