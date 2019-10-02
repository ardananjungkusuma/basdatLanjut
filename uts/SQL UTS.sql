USE Petcare_TSQL;
GO

SELECT * FROM dbo.Pelanggan;

SELECT id_pelanggan,nama_depan,nama_belakang,alamat,no_telp 
FROM dbo.Pelanggan
WHERE nama_belakang IS NOT NULL;

DELETE FROM dbo.Pelanggan
WHERE nama_depan = 'Laras';

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
VALUES ('P1434','Wahyu','Devi','Jl.Bahagia 54','0852183459213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1438','Silvi','Indah','Jl.Lupus 84','0852186859213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1234','Budi','Kusumo','Jl.Anggrek 21','0852151213');
INSERT INTO dbo.Pelanggan(id_pelanggan,nama_depan,nama_belakang,alamat,no_telp)
VALUES ('P1246','Aliza',NULL,'Jl.Kenanga 72','085268151213');