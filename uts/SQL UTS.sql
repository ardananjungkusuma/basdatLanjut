USE Petcare_TSQL;
GO

SELECT * FROM dbo.Pelanggan;
SELECT * FROM dbo.Dokter;
SELECT * FROM dbo.Hewan;
SELECT * FROM dbo.[Makanan.Hewan];
SELECT * FROM dbo.Obat;
SELECT * FROM dbo.Pemeriksaan;
SELECT * FROM dbo.TransaksiPelanggan;
SELECT * FROM dbo.Vitamin;

SELECT id_pelanggan,nama_depan,nama_belakang,alamat,no_telp 
FROM dbo.Pelanggan
WHERE nama_belakang IS NOT NULL;

DELETE FROM dbo.Pelanggan
WHERE nama_depan = 'Laras';

DELETE FROM dbo.Obat
WHERE nama_obat = 'MIU-DROP';


INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1235','Tirta','Hayu','Jl.Melati 26','085216874413');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1236','Dina','Risky','Jl.Supriadi 12','085124151213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1238','Yoyok','Hadi','Jl.Anggrek 21','085217651213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1239','Laras','','Jl.Imam Bonjol 97','08528993213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1237','Aditya','Panji','Jl.Pattimura 81','085890151213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1231','Alwy','Abdullah','Jl.Diponegoro 71','085347811213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1212','Dharma','Yudhistira','Jl.Luruh 15','085217438213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1434','Wahyu','Devi','Jl.Bahagia 54','085218345921');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1438','Silvi','Indah','Jl.Lupus 84','085218685921');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1234','Budi','Kusumo','Jl.Anggrek 21','085215121310');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1246','Aliza',NULL,'Jl.Kenanga 72','085268151213');

INSERT INTO dbo.Dokter(id_dokter,nama_depan,nama_belakang,alamat,no_telp,email)
VALUES (1227897,'Ardan','Anjung','Jl. Indah 88','085258967800','ardanak@gmail.com');
INSERT INTO dbo.Dokter(id_dokter,nama_depan,nama_belakang,alamat,no_telp,email)
VALUES (1222197,'Novia','Kusuma','Jl. Lampung 14','085278124512','novia@gmail.com');
INSERT INTO dbo.Dokter(id_dokter,nama_depan,nama_belakang,alamat,no_telp,email)
VALUES (1222767,'Puput','Lestari','Jl. Nangka 11','085298124751','puput@gmail.com');
INSERT INTO dbo.Dokter(id_dokter,nama_depan,nama_belakang,alamat,no_telp,email)
VALUES (1229697,'Jasmine','Mufida','Jl. Lili 20','085251269812','jasmine@gmail.com');
INSERT INTO dbo.Dokter(id_dokter,nama_depan,nama_belakang,alamat,no_telp,email)
VALUES (1328957,'Dina','Lisuardi','Jl. Sarimulyo 78','085298125091','dina@gmail.com');
INSERT INTO dbo.Dokter(id_dokter,nama_depan,nama_belakang,alamat,no_telp,email)
VALUES (1522617,'Deny','Nur','Jl. Panjen 87','085289125419',NULL);
INSERT INTO dbo.Dokter(id_dokter,nama_depan,nama_belakang,alamat,no_telp,email)
VALUES (1822197,'Ferdian','Indra','Jl. Semangka 86','085289165012','ferdian@gmail.com');

SELECT * FROM dbo.Hewan;

INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (111111, 'Boni', 'Kucing Persia', 'Betina', '5 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (112222, 'Max', 'Kucing Russian Blue', 'Jantan', '4 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (113838, 'Kitty', 'Kucing Siamese', 'Betina', '6 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (112323, 'Molly', 'Kucing Ragdoll', 'Betina', '8 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (123456, 'Arlo', 'Anjing Beagle', 'Jantan', '3 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (112345, 'Oliver', 'Kucing Anggora', 'Betina', '5 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (112567, 'Baxter', 'Anjing Pug', 'Jantan', '6 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (112340, 'Chester', 'Anjing Buldog', 'Jantan', '7 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (112395, 'Nora', 'Anjing Maltese', 'Betina', '3 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (114568, 'Bily', 'Anjing Pudel', 'Jantan', '6 bulan');
INSERT INTO dbo.Hewan(id_hewan, nama_hewan, jenis_hewan, jenis_kelamin, umur)
VALUES (114571, 'Jasper', 'Anjing Pekines', 'Jantan', ' 9 bulan');

SELECT * FROM dbo.[Makanan.Hewan];
DELETE FROM dbo.[Makanan.Hewan]
WHERE nama_makanan = 'Maxi';

INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (1234, 'Royal Canin', 'Untuk Kucing/Anjing', '2019-04-13', 'B209234');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (5678, 'Kibble', 'Untuk Anjing', '2019-05-18', 'B139823');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (9123, 'Pedigree', 'Untuk Anjing', '2020-04-29', 'B958912');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (4564, 'Pro Plan', 'Untuk Kucing/Anjing', '2019-10-18', 'B984923');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (6789, 'Alpo', 'Untuk Anjing', '2020-08-19', 'B893241');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (2345, 'Whiskas', 'Untuk Kucing', '2020-01-16', 'B091234');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (5567, 'Maxi', 'Untuk Kucing', '2021-06-04', 'B892364');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (8952, 'Friskies', 'Untuk Kucing', '2021-03-05', 'B123985');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (1233, 'Blackwood', 'Untuk Kucing', '2022-01-08', 'B982412');
INSERT INTO dbo.[Makanan.Hewan](id_makanan, nama_makanan, penggunaan_makanan, tanggal_kadaluwarsa, kode_izin)
VALUES (1568, 'Jerhigh', 'Untuk Anjing', '2019-11-12', 'B184942');

SELECT * FROM dbo.Obat;
/*bnenrin obat*/

INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (232425, 'MIU-DROP', 'Untuk Kucing/Anjing', 26000, 6, 'Botol');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (232567, 'DIACAT', 'Untuk Kucing', 31000, 4, 'Kapsul');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (223745, 'MontBe', 'Untuk Anjing', 55000, 5, 'Kapsul');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (232479, 'TRIXIN', 'Untuk Kucing', 18000, 5, 'Botol');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (236782, 'Advocate', 'Untuk Kucing', 373000, 10, 'Tablet');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (264731, 'Frontline', 'Untuk Kucing', 145000, 4, 'Tablet');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (257485, 'Vomitis', 'Untuk Anjing', 35000, 4, 'Tablet');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (279313, 'Albenworm', 'Untuk Kucing', 50000, 2, 'Botol');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (263290, 'Dermakomb', 'Untuk Anjing', 40000, 6, 'Tablet');
INSERT INTO dbo.Obat(id_obat, nama_obat, penggunaan_obat, harga, stok, satuan_obat)
VALUES (276419, 'Spray Obat Kulit', 'Untuk Anjing', 190000, 7, 'Botol');



SELECT * FROM dbo.Pemeriksaan;

INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (111555, 'Steril Kucing', '2019-09-27 15:10:00','Rawat Jalan');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (555111, 'Steril Anjing', '2019-08-15 13:15:00','Rawat Jalan');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (121234, 'Suntik Rabies Anjing', '2019-08-28 10:25:00','Rawat Inap');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (341212, 'Check Penyakit Jamur Kucing', '2019-09-16 11:45:00','Rawat Jalan');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (567893, 'Check Scabies', '2019-10-02 13:05:00','Rawat Inap');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (398765, '', '','');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (678764, '', '','');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (467876, '', '','');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (625146, '', '','');
INSERT INTO dbo.Pemeriksaan(id_pemeriksaan, nama_pemeriksaan, tanggal_pemeriksaan, status_tindakan)
VALUES (641526, '', '','');


SELECT * FROM dbo.TransaksiPelanggan;


