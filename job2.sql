USE [TSQL]
GO

/*SELECT [custid],[companyname],[contactname],[contacttitle],[address],[city],[region],[postalcode],[country],[phone],[fax] from [Sales].[Customers]
GO
select * from Sales.Customers

select custid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax
from Sales.Customers

select distinct country from Sales.Customers;

select c.contactname, c.contacttitle from Sales.Customers AS c;
select c.contactname AS Name, c.contacttitle AS Title, c.companyname AS [Company Name] from Sales.Customers AS c;

select p.categoryid, p.productname from Production.Products as p;

select p.categoryid, p.productname,
	CASE
		when p.categoryid=1 then 'Beverages'
		when p.categoryid=2 then 'Condiments'
		when p.categoryid=3 then 'Confections'
		when p.categoryid=4 then 'Dairy Products'
		when p.categoryid=5 then 'Grains/Cereals'
		when p.categoryid=6 then 'Meat/Poultry'
		when p.categoryid=7 then 'Produce'
		when p.categoryid=8 then 'Seafood'
		else 'Other'
	end as categoryname,
	CASE
		when p.categoryid in (1,7,8) then 'Campaign Products'
		else 'Non-Campaign Products'
	end as iscampaign
	from Production.Products AS p;*/

select p.categoryid as ID_KATEGORI , p.productname as NAMA_PRODUK,
	CASE
		when p.categoryid=1 then 'Beverages'
		when p.categoryid=2 then 'Condiments'
		when p.categoryid=3 then 'Confections'
		when p.categoryid=4 then 'Dairy Products'
		when p.categoryid=5 then 'Grains/Cereals'
		when p.categoryid=6 then 'Meat/Poultry'
		when p.categoryid=7 then 'Produce'
		when p.categoryid=8 then 'Seafood'
		else 'Other'
	end as NAMA_KATEGORI,
	CASE
		when p.categoryid in (1,7,8) then 'Campaign Products'
		else 'Non-Campaign Products'
	end as Status
	from Production.Products as p
	where p.categoryid=8;

/*select h.firstname as FIRST_NAME,h.lastname as LAST_NAME,h.city 
as CITY,h.country as COUNTRY from HR.Employees AS h where h.country = 'USA' and h.city = 'Seattle';*/


