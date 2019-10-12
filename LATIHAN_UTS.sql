USE Petcare

SELECT * FROM Dokter
SELECT * FROM Hewan
SELECT * FROM MakananHewan
SELECT * FROM Obat
SELECT * FROM Pelanggan
SELECT * FROM Pemeriksaan
SELECT * FROM StrukPembayaran
SELECT * FROM Transaksi
SELECT * FROM Vitamin


--pengambilan data yang tanpa null
SELECT * FROM Dokter
WHERE email IS NOT NULL; 

select * from Hewan
--pengambilan umur tanggal lahir lebih dari bulan
select nama_hewan, (YEAR(GETDATE())-YEAR(tanggal_lahir)) Umur 
From Hewan
WHERE (YEAR(GETDATE())-YEAR(tanggal_lahir)) > 0;

--pengambilan umur bulan saja
select nama_hewan, DATEDIFF(MONTH, tanggal_lahir, GETDATE()) bulan 
From Hewan;

--inner join table dasar(pengambilan obat yang pernah dibeli)
SELECT tr.tanggal_transaksi , ob.nama_obat FROM Transaksi as tr
inner join Obat as ob on tr.id_obat = ob.id_obat;

--full join table dasar
SELECT tr.tanggal_transaksi , ob.nama_obat FROM Transaksi as tr
full join Obat as ob on tr.id_obat = ob.id_obat;

select * from Transaksi

--tampilkan obat yang tidak pernah dibeli
SELECT id_transaksi,id_obat,harga_item
from Transaksi
WHERE id_obat is null;

--left join table
SELECT tr.tanggal_transaksi , ob.nama_obat FROM Transaksi as tr
left join Obat as ob on tr.id_obat = ob.id_obat;

--combining firstname lastname multiple inner join 
SELECT tr.tanggal_transaksi ,h.nama_hewan as Nama_Hewan , pr.nama_pemeriksaan as Tipe_Pemeriksaan , 
isnull (dk.nama_depan,' ')+' '+isnull (dk.nama_belakang,' ') as Nama_Dokter
FROM Transaksi as tr
inner join Pemeriksaan as pr on tr.id_pemeriksaan = pr.id_pemeriksaan
inner join Dokter as dk on dk.id_dokter = pr.id_dokter
inner join Hewan as h on h.id_hewan = pr.id_hewan;

--crossjoin
SELECT id_obat,nama_obat,id_makanan,nama_makanan
FROM Obat
CROSS JOIN MakananHewan

--select species of cats
SELECT * FROM Hewan
WHERE jenis_hewan LIKE 'A%'

--sum hargaitem and harga servis and create new table.
SELECT id_transaksi,harga_item,harga_servis,(harga_item+harga_servis) as Total_Harga
FROM Transaksi
WHERE id_transaksi = 12398241;

select * from Transaksi