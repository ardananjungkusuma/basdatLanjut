--1
select p.id_pelanggan,p.nama_depan,p.alamat 
from Pelanggan as p
order by p.nama_depan desc

--2
select d.id_dokter,d.nama_depan
from Dokter as d
order by d.nama_depan DESC
offset 5 rows
fetch next 5 rows only

--3
select p.id_pelanggan,p.nama_depan,sp.id_transaksi
from Pelanggan as p
right join StrukPembayaran as sp on sp.id_pelanggan = sp.id_pelanggan

--4
select convert(varchar,t.tanggal_transaksi) as date,
DATENAME(month,t.tanggal_transaksi) as month,
DATENAME(YEAR,t.tanggal_transaksi) as year
from Transaksi as t

--5
select UPPER (p.nama_depan+('-')+p.nama_belakang+('-')+p.alamat) as concatdata ,
LEN(REPLACE(p.nama_depan+('-')+p.nama_belakang+('-')+p.alamat,'A',' ')) as numberofa
from Pelanggan as p


--6
select top(4) t.id_pemeriksaan,t.tanggal_transaksi,t.harga_servis,t.total_harga
from Transaksi as t 
where t.id_pemeriksaan in(
select p.id_pemeriksaan from Pemeriksaan as p)
order by id_pemeriksaan DESC

--7 durung
select p.id_pemeriksaan,p.id_dokter,p.nama_pemeriksaan
from Pemeriksaan as p
group by p.id_pemeriksaan,p.id_dokter,p.nama_pemeriksaan
having p.id_dokter>1800000

--8
Create View PenjualanTransaksi
as
	select sum(t.total_harga) as sum_unitprice, avg(t.total_harga) as AVG_QTY, 
	COUNT(t.tanggal_transaksi) as COUNTQTY, MIN(t.tanggal_transaksi) as min_order_date,
	MAX(t.tanggal_transaksi) as max_order_date
	from Transaksi as t
	inner join StrukPembayaran as sp
	on t.id_transaksi = sp.id_transaksi

select * from PenjualanTransaksi

--9
with CTE_YEARS as
(
	Select year(t.tanggal_transaksi) as transaksiyear,t.id_transaksi
	from Transaksi as t
)
select transaksiyear,count(distinct id_transaksi) as transaksi_count 
From CTE_YEARS
group by transaksiyear

with CTE_MONTH as
(
	Select MONTH(t.tanggal_transaksi) as transaksimonth,t.id_transaksi
	from Transaksi as t
)
select transaksimonth,count(distinct id_transaksi) as transaksi_count 
From CTE_MONTH
group by transaksimonth

--10
SELECT id_pelanggan
FROM Pelanggan
EXCEPT
SELECT id_pelanggan
FROM StrukPembayaran

--10 Pembuktian
select p.id_pelanggan,isnull(p.nama_depan,' ')+' '+isnull(p.nama_belakang,' ') as nama_pelanggan,sp.id_transaksi
from Pelanggan as p
left join StrukPembayaran as sp on sp.id_pelanggan = p.id_pelanggan
where sp.id_transaksi is null

--11