USE TSQL;
GO

SELECT c.custid,c.contactname
FROM Sales.Customers as c
WHERE custid in(SELECT o.custid FROM Sales.Orders as o WHERE empid =5) 
GROUP BY c.custid,c.contactname


SELECT c.custid,c.contactname,c.city
FROM Sales.Customers as c
WHERE custid in(SELECT o.custid FROM Sales.Orders as o WHERE empid =5) 
GROUP BY c.custid,c.contactname,c.city


