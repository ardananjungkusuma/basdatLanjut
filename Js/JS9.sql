--1
select sov.orderid, sov.orderdate, sov.val, ROW_NUMBER() over(order by sov.orderdate) as rowno
from Sales.OrderValues as sov

--2
select sov.orderid, sov.orderdate, sov.val, ROW_NUMBER() over(order by sov.orderdate) as rowno , RANK() over(order by sov.orderdate) as ranking
from Sales.OrderValues as sov

--3

--4
select sov.orderid, sov.orderdate, sov.custid, sov.val, RANK() over(partition by sov.custid order by sov.val) as ranking
from Sales.OrderValues as sov

--5
select sov.custid, sov.val, YEAR(sov.orderdate) as orderyear, RANK() over(partition by sov.custid, YEAR(sov.orderdate) order by sov.val desc) as orderRankNo
from Sales.OrderValues as sov

--6
with duateratas
as
( select sov.custid, YEAR(sov.orderdate) as orderyear, RANK() over(partition by sov.custid, YEAR(sov.orderdate) order by sov.val desc) as orderRankNo, sov.val
from Sales.OrderValues as sov )
select *
from duateratas
where orderRankNo <= 2

--7
with
    RowsOrderBY
    as
    
    (
        select sov.orderid, sov.orderdate, ROW_NUMBER() over(order by sov.orderdate, sov.orderid) as rowno, val
        from Sales.OrderValues as sov
    )
select ro.orderid, ro.orderdate, ro.val, ro.rowno
from RowsOrderBY as ro

--8
with RowsOrderBY
as
( select sov.orderid, sov.orderdate, ROW_NUMBER() over(order by sov.orderdate, sov.orderid) as rowno, val
from Sales.OrderValues as sov )
select ro.orderid, ro.orderdate, ro.val, ro.rowno
from RowsOrderBY as ro LEFT OUTER JOIN RowsOrderBY AS RoB ON RoB.rowno = RoB.rowno+1;

--9
SELECT ov.orderid, ov.orderdate, ov.val, LAG(ov.val, 1) OVER(ORDER BY orderdate, orderid) AS prevval, ov.val - LAG(ov.val, 1) OVER(ORDER BY orderdate, orderid) AS diffval
FROM Sales.OrderValues AS ov;

--10
WITH
    SalesMonth2007
    AS
    (
        SELECT MONTH(sov.orderdate) AS monthno, SUM(sov.val) AS val
        FROM Sales.OrderValues AS sov
        WHERE sov.orderdate >= '2007-01-01' AND sov.orderdate < '2008-01-01'
        GROUP BY MONTH(sov.orderdate)
    )
SELECT cte.monthno, cte.val
FROM SalesMonth2007 AS cte;

--11

WITH
    SalesMonth2007
    AS
    (
        SELECT MONTH(sov.orderdate) AS monthno, SUM(sov.val) AS val
        FROM Sales.OrderValues AS sov
        WHERE sov.orderdate >= '2007-01-01' AND sov.orderdate < '2008-01-01'
        GROUP BY MONTH(sov.orderdate)
    )
SELECT cte.monthno, cte.val, (LAG(cte.val, 1, 0) OVER (ORDER BY cte.monthno) +   LAG(cte.val, 2, 0) OVER (ORDER BY cte.monthno) +   LAG(cte.val, 3, 0) OVER (ORDER BY cte.monthno)) / 3   AS avglast3months, cte.val-FIRST_VALUE(cte.val) OVER (ORDER BY cte.monthno ROWS UNBOUNDED PRECEDING)   AS diffjanuary, LEAD(cte.val) OVER (ORDER BY cte.monthno)    AS nextval
FROM SalesMonth2007 AS cte;

--12
SELECT sov.custid, sov.orderid, sov.orderdate, sov.val, 100.*val/SUM(sov.val) OVER (PARTITION BY sov.custid) AS percoftotalcust
FROM Sales.OrderValues AS sov
ORDER BY sov.custid, percoftotalcust DESC;

--13
SELECT sov.custid, sov.orderid, sov.orderdate, sov.val, 100.*val/SUM(sov.val) OVER (PARTITION BY sov.custid) AS percoftotalcust, SUM(sov.val) OVER (PARTITION BY sov.custid ORDER BY sov.orderdate, sov.orderid ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS runval
FROM Sales.OrderValues AS sov;

--14
WITH
    SalesMonth2007
    AS
    (
        SELECT MONTH(sov.orderdate) AS monthno, SUM(sov.val) AS val
        FROM Sales.OrderValues AS sov
        WHERE sov.orderdate >= '2007-01-01' AND sov.orderdate < '2008-01-01'
        GROUP BY MONTH(sov.orderdate)
    )
SELECT cte.monthno, cte.val, AVG(cte.val) OVER(ORDER BY cte.monthno   ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS avglast3months, SUM(cte.val) OVER(ORDER BY cte.monthno   ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ytdval
FROM SalesMonth2007 AS cte;
