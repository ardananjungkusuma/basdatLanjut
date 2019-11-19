select isnull(nama_depan,' ')+' '+isnull(nama_belakang,' ') as Nama_Dokter 
from Dokter
where nama_belakang is null

select t.id_transaksi,o.nama_obat,mh.nama_makanan,v.nama_vitamin,isnull(p.nama_depan,' ')+' '+isnull(p.nama_belakang,' ') as nama_pelanggan,
pem.nama_pemeriksaan,t.tanggal_transaksi
from Pelanggan as p
left join StrukPembayaran as st on st.id_pelanggan=p.id_pelanggan
left join Transaksi as t on t.id_transaksi = st.id_transaksi
left join Pemeriksaan as pem on pem.id_pemeriksaan = t.id_pemeriksaan
left join Obat as o on o.id_obat = t.id_obat
left join MakananHewan as mh on mh.id_makanan = t.id_makanan
left join Vitamin as v on v.id_vitamin = t.id_vitamin
ORDER BY t.tanggal_transaksi desc;


select isnull(p.nama_depan,' ')+' '+isnull(p.nama_belakang,' ') as nama_pelanggan,sp.id_transaksi
from Pelanggan as p
left join StrukPembayaran as sp on sp.id_pelanggan = p.id_pelanggan
where sp.id_transaksi is null
--StrukPembayaran as sp on sp.id_pelanggan= sp.id_pelanggan

select * from Transaksi