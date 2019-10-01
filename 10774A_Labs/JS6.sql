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

SELECT * FROM Production.ProductsSeafood;