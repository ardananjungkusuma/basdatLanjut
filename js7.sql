--1
SELECT productid,productname 
FROM Production.Products
WHERE categoryid = 4
UNION
SELECT P.productid,P.productname
FROM Production.Products P 
INNER JOIN Sales.OrderDetails OD
ON P.productid = OD.productid
GROUP BY P.productid, P.productname
HAVING SUM(OD.qty * OD.unitprice)>50000;


