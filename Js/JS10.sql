--1
SELECT *
FROM Sales.CustGroups;

--2
SELECT country, [A], [B], [C]
FROM
    (
SELECT custgroup, custid, country
    FROM
        Sales.CustGroups) AS D
PIVOT
(
COUNT(custid) FOR custgroup IN ([A], [B], [C])
) AS pvt
ORDER BY country;

--3
SELECT country, city, contactname, [A], [B], [C]
FROM
    (
SELECT custgroup, custid, country , city, contactname
    FROM
        Sales.CustGroups) AS D
PIVOT
(
COUNT(custid) FOR custgroup IN ([A], [B], [C])
) AS pvt
ORDER BY country;

--4
WITH
    PivotCustGroups
    AS
    (
        SELECT custid, country, custgroup
        FROM
            Sales.CustGroups
    )
SELECT country, [A], [B], [C]
FROM
    (
SELECT custid, country, custgroup
    FROM
        PivotCustGroups) AS D
PIVOT
(
COUNT(custid) FOR custgroup IN ([A], [B], [C])
) AS pvt
ORDER BY country;

--5
--6
--7
--8
WITH
    SalesByCategory
    AS
    (
        SELECT s.custid, od.qty * od.unitprice AS salesvalue, c.categoryname
        FROM
            Sales.Orders AS s
            INNER JOIN Sales.OrderDetails AS od ON s.orderid = od.orderid
            INNER JOIN Production.Products AS p ON p.productid =
od.productid
            INNER JOIN Production.Categories AS c ON c.categoryid =
p.categoryid
        WHERE YEAR(s.orderdate) = 2008
    )
SELECT custid, p.Beverages, p.Condiments,
    p.Confections, p.[Diary Products] , p.[Grains/Cereals],
    p.[Meat/Poultry], Produce, Seafood
FROM
    SalesByCategory
PIVOT
(
SUM(salesvalue) FOR categoryname IN
(
Beverages, Condiments, Confections, [Diary Products]
, [Grains/Cereals], [Meat/Poultry], Produce, Seafood
)
) AS p;

--9
CREATE VIEW Sales.PivotCustGroups
AS
    WITH
        PivotCustGroups
        AS
        (
            SELECT custid, country, custgroup
            FROM Sales.CustGroups
        )
    SELECT country, p.A, p.B, p.C
    FROM PivotCustGroups
PIVOT
(
COUNT(custid) FOR custgroup IN (A, B, C)
) AS p;

SELECT country, A, B, C
FROM Sales.PivotCustGroups

--10
SELECT custgroup, country, numberofcustomers
FROM
    Sales.PivotCustGroups
UNPIVOT
(
numberofcustomers FOR custgroup IN (A, B, C)
) AS p;

--11
SELECT country, city,
    COUNT(custid) AS noofcustomers
FROM Sales.Customers
GROUP BY GROUPING SETS
(
(country, city), (country), (city), ()
);

--12
SELECT YEAR(orderdate) AS orderyear,
    MONTH(orderdate) AS ordermonth,
    DAY(orderdate) AS orderday,
    SUM(val) AS salesvalue
FROM Sales.OrderValues
GROUP BY CUBE(YEAR(orderdate), MONTH(orderdate), DAY(orderdate));

--13
SELECT YEAR(orderdate) AS orderyear,
    MONTH(orderdate) AS ordermonth,
    DAY(orderdate) AS orderday,
    SUM(val) AS salesvalue
FROM Sales.OrderValues
GROUP BY ROLLUP (YEAR(orderdate), MONTH(orderdate), DAY(orderdate));


--14

--15
SELECT GROUPING_ID (YEAR(orderdate), MONTH(orderdate)) AS groupid,
		YEAR(orderdate) AS orderyear,
		MONTH(orderdate) AS ordermonth,
		SUM(val) AS salesvalue
FROM Sales.OrderValues
GROUP BY ROLLUP (YEAR(orderdate), MONTH(orderdate))
ORDER BY groupid, orderyear, ordermonth;