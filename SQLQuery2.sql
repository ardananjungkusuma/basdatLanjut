select nama_depan from Dokter
order by nama_depan desc

select convert(varchar,t.tanggal_transaksi) as Tanggal,
datename(month,t.tanggal_transaksi) as bulan
from Transaksi as t

select t.id_transaksi,p.id_pelanggan, isnull(p.nama_depan,' ')+' '+ISNULL(p.nama_belakang,' ') as nama
from Pelanggan as p
inner join StrukPembayaran as sp on sp.id_pelanggan = p.id_pelanggan
inner join Transaksi as t on sp.id_transaksi = t.id_transaksi

select t.id_transaksi,t.total_harga
from Transaksi as t
group by t.id_transaksi, t.total_harga
having t.total_harga > 150000

select t.id_transaksi,t.total_harga
from Transaksi as t
where t.total_harga > 150000

select top(5) t.total_harga,t.id_transaksi
from Transaksi as t

select top(3) t.tanggal_transaksi
from Transaksi as t
order by t.tanggal_transaksi asc

select * from Transaksi

select p.id_pelanggan
from Pelanggan as p
except 
select sp.id_pelanggan
from StrukPembayaran as sp

select isnull(p.nama_depan,' ')+' ' +ISNULL(p.nama_belakang,' ')
from Pelanggan as p

select * from Pelanggan