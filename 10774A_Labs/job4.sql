USE TSQL;
GO

--no1
select CURRENT_TIMESTAMP as currentdatetime, CONVERT (TIME,CURRENT_TIMESTAMP) as currentdate,YEAR(GETDATE()) as currentyear,
MONTH(GETDATE()) as currentmonth,DAY(GETDATE()) as currentday,DATEPART (dw,GETDATE()) as currentweek,
DATENAME(m,GETDATE()) as currentmonthname;

--no2
select CURRENT_TIMESTAMP as currentdate, CONVERT (TIME,CURRENT_TIMESTAMP) as currentdatetime,YEAR(GETDATE()) as currentyear,
MONTH(GETDATE()) as currentmonth,DAY(GETDATE()) as currentday,DATEPART (dw,GETDATE()) as currentweek,
DATENAME(m,GETDATE()) as currentmonthname;

--no3
DECLARE @date date;
SET @date = '2019-09-29'
SELECT CAST('2019-09-29' AS date) as birthdate;
SELECT CONVERT(DATE, '09/29/2019') as birthdate;
SELECT FORMAT(@date,'yyyy-MM-dd') as birthdate;

--no4
SELECT DATEADD(MONTH,3,GETDATE()) as threemonth,DATEDIFF(day,GETDATE(),
DATEADD(MONTH,3,GETDATE())) as diffdays,
DATEDIFF(week,CONVERT(DATE, '09/29/2000'),'2019/09/15') as diffweeks,
DATEDIFF(day,CONVERT(DATE, '09/01/2019'),CURRENT_TIMESTAMP) as firstday;

CREATE TABLE Sales.Somedates (
isitdate varchar(9)
);
INSERT INTO Sales.Somedates (isitdate) VALUES
('20110101'),
('20110102'),
('20110103X'),
('20110104'),
('20110105'),
('20110106'),
('20110107Y'),
('20110108');

--no5
SELECT isitdate, IIF(ISDATE(isitdate) = 1,
CONVERT([date], isitdate), NULL) AS converteddate
FROM Sales.Somedates;

--no6
SELECT SYSDATETIME()  as SYS,CURRENT_TIMESTAMP as cur;

--no8
SELECT custid, orderdate FROM Sales.Orders 
where YEAR(orderdate)=2008 and MONTH(orderdate)=2;

--no9
SELECT CURRENT_TIMESTAMP as currentdate,
FORMAT (getdate(), '01-09-2019 00:00:00.0000') as firstofmonth,
FORMAT (getdate(), '30-09-2019 00:00:00.0000') as endofmonth;

--no10
SELECT o.orderid,o.custid,o.orderdate FROM Sales.Orders as o;