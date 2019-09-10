USE TSQL;
GO
--1
Select p.productname, c.categoryname 
from Production.Products as p 
join Production.Categories as c on p.productid = c.categoryid;

--5
SELECT 
	sc.custid, contactname, orderid
FROM Sales.Customers as sc
INNER JOIN Sales.Orders ON sc.custid = Orders.custid;

--6
select sc.custid, sc.contactname, o.orderid
from Sales.Customers as sc
inner join Sales.Orders as o
on sc.custid = o.custid;

--8
select sc.custid, sc.contactname, o.orderid
from Sales.Customers as sc
inner join Sales.Orders as o
on sc.custid = o.custid;

--9
select sc.custid,sc.contactname,o.orderid,d.productid, d.qty, d.unitprice
from Sales.Customers as sc
inner join Sales.Orders as o on sc.custid = o.custid
inner join Sales.OrderDetails as d on d.orderid = o.orderid;

--11
select e.empid, e.lastname, e.firstname, e.title, e.mgrid
from HR.Employees as e;

--13
select e.empid, e.lastname, e.firstname, e.title, e.mgrid, m.lastname, as mgrlastname, m.firstname as mgrfirstname
from HR.Employees as e
inner join HR.Employees as m on e.mgrid = m.empid;

--16
select sc.custid, sc.contactname, o.orderid
from Sales.Customers as sc
left outer join Sales.Orders as o on sc.custid = o.custid;

--20
select e.empid, e.firstname, e.lastname, c.calendardate
from HR.Employees as e
cross join HR.Calender as c;

--24
select custid, companyname, contactname, address, city, country, phone
from Sales.Customers
where country in(N'Brazil',N'UK',N'USA');

--26
select custid, companyname, contactname, address, city,country,phone
from Sales.Customers
where contactname like N'A%';

--30
select c.custid, c.companyname
from Sales.Customers as c
left outer join Sales.Orders as o on c.custid = o.custid
where o.custid is null; 
