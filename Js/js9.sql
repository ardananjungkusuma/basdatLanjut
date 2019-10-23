--1
select sov.orderid,sov.orderdate,sov.val,ROW_NUMBER() over(order by sov.orderdate) as rowno from Sales.OrderValues as sov

--2
select sov.orderid,sov.orderdate,sov.val,ROW_NUMBER() over(order by sov.orderdate) as rowno ,RANK() over(order by sov.orderdate) as ranking from Sales.OrderValues as sov

--3
--jawabanbiasa

--4
select sov.orderid,sov.orderdate,sov.custid,sov.val,RANK() over(partition by sov.custid order by sov.val) as ranking from Sales.OrderValues as sov

--5

--6

--7

--8

--9

--10

--11

--12

--13

--14

