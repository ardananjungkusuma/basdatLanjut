CREATE DATABASE [Petcare] /*Create First*/
USE [Petcare] /*Use SQL*/

GO
/****** Object:  Database [Petcare]    Script Date: 22/10/2019 02:26:19 ******/
CREATE DATABASE [Petcare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Petcare', FILENAME = N'G:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Petcare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Petcare_log', FILENAME = N'G:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Petcare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO


/*Execution From Here*/
ALTER DATABASE [Petcare] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Petcare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Petcare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Petcare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Petcare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Petcare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Petcare] SET ARITHABORT OFF 
GO
ALTER DATABASE [Petcare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Petcare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Petcare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Petcare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Petcare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Petcare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Petcare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Petcare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Petcare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Petcare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Petcare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Petcare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Petcare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Petcare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Petcare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Petcare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Petcare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Petcare] SET RECOVERY FULL 
GO
ALTER DATABASE [Petcare] SET  MULTI_USER 
GO
ALTER DATABASE [Petcare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Petcare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Petcare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Petcare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Petcare] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Petcare', N'ON'
GO
ALTER DATABASE [Petcare] SET QUERY_STORE = OFF
GO
USE [Petcare]
GO
/****** Object:  Table [dbo].[Dokter]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dokter](
	[id_dokter] [int] NOT NULL,
	[nama_depan] [varchar](30) NOT NULL,
	[nama_belakang] [varchar](20) NULL,
	[alamat] [varchar](50) NOT NULL,
	[no_telp] [varchar](15) NOT NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Dokter] PRIMARY KEY CLUSTERED 
(
	[id_dokter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hewan]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hewan](
	[id_hewan] [int] NOT NULL,
	[nama_hewan] [varchar](30) NOT NULL,
	[jenis_hewan] [varchar](20) NOT NULL,
	[jenis_kelamin] [varchar](10) NULL,
	[tanggal_lahir] [date] NOT NULL,
 CONSTRAINT [PK_Hewan] PRIMARY KEY CLUSTERED 
(
	[id_hewan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MakananHewan]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakananHewan](
	[id_makanan] [int] NOT NULL,
	[nama_makanan] [varchar](30) NOT NULL,
	[penggunaan_makanan] [varchar](20) NOT NULL,
	[tanggal_kadaluwarsa] [date] NOT NULL,
	[kode_izin] [varchar](10) NOT NULL,
 CONSTRAINT [PK_MakananHewan] PRIMARY KEY CLUSTERED 
(
	[id_makanan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obat]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obat](
	[id_obat] [int] NOT NULL,
	[nama_obat] [varchar](50) NOT NULL,
	[penggunaan_obat] [varchar](30) NOT NULL,
	[harga] [int] NOT NULL,
	[stok] [int] NOT NULL,
	[satuan_obat] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Obat] PRIMARY KEY CLUSTERED 
(
	[id_obat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelanggan]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelanggan](
	[id_pelanggan] [varchar](30) NOT NULL,
	[nama_depan] [varchar](30) NOT NULL,
	[nama_belakang] [varchar](20) NULL,
	[alamat] [varchar](50) NOT NULL,
	[no_telp] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Pelanggan] PRIMARY KEY CLUSTERED 
(
	[id_pelanggan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pemeriksaan]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pemeriksaan](
	[id_pemeriksaan] [int] NOT NULL,
	[id_dokter] [int] NOT NULL,
	[id_hewan] [int] NOT NULL,
	[nama_pemeriksaan] [varchar](30) NOT NULL,
	[tanggal_pemeriksaan] [datetime] NOT NULL,
	[status_tindakan] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Pemeriksaan] PRIMARY KEY CLUSTERED 
(
	[id_pemeriksaan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrukPembayaran]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrukPembayaran](
	[id_pelanggan] [varchar](30) NULL,
	[id_transaksi] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaksi]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaksi](
	[id_transaksi] [int] NOT NULL,
	[id_vitamin] [int] NULL,
	[id_makanan] [int] NULL,
	[id_obat] [int] NULL,
	[id_pemeriksaan] [int] NULL,
	[tanggal_transaksi] [datetime] NOT NULL,
	[diskon] [varchar](20) NULL,
	[harga_item] [int] NULL,
	[harga_servis] [int] NULL,
	[total_harga] [int] NOT NULL,
 CONSTRAINT [PK_Transaksi] PRIMARY KEY CLUSTERED 
(
	[id_transaksi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vitamin]    Script Date: 22/10/2019 02:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vitamin](
	[id_vitamin] [int] NOT NULL,
	[nama_vitamin] [varchar](20) NOT NULL,
	[jenis_vitamin] [varchar](10) NOT NULL,
	[dosis] [varchar](15) NOT NULL,
	[manfaat] [varchar](50) NOT NULL,
	[harga] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Vitamin] PRIMARY KEY CLUSTERED 
(
	[id_vitamin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1222197, N'Novia', N'Kusumawardani', N'Jl. Lampung 14', N'085278124512', N'novia@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1222767, N'Puput', N'Lestari', N'Jl. Nangka 11', N'085298124751', N'puput@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1227897, N'Ardan', N'Anjung', N'Jl. Indah 88', N'085258967800', N'ardanak@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1229697, N'Jasmine', N'Mufida', N'Jl. Lili 20', N'085251269812', N'jasmine@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1328957, N'Dina', N'Lisuardi', N'Jl. Sarimulyo 78', N'085298125091', N'dina@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1522617, N'Deny', N'Nur', N'Jl. Panjen 87', N'085289125419', NULL)
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1822197, N'Ferdian', N'Indra', N'Jl. Semangka 86', N'085289165012', N'ferdian@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1824751, N'Oktaviano', N'Andy', N'Jl Mantab 123', N'081235123245', N'andyyuhu@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1838646, N'Indra', N'Elina', N'Jl. Borobudur 12', N'085636362844', N'indra@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1841256, N'Unero', N'Bagaskara', N'Jl. Vim 12', N'085212352123', N'unero@yahoo.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1848950, N'Bagoes', N'Dwi', N'Jl Bareng 5', N'085957333573', N'bagoes@gmail.com')
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1852123, N'Riza', NULL, N'Jl.Mentari 12', N'084214852132', NULL)
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (1859467, N'Bagas', N'Kara', N'Jl Veteran 99', N'085339609265', NULL)
GO
INSERT [dbo].[Dokter] ([id_dokter], [nama_depan], [nama_belakang], [alamat], [no_telp], [email]) VALUES (2138542, N'Farid', N'Aziz', N'Jl Nin Aja 144', N'081237521312', N'farid123@yahoo.com')
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (111111, N'Boni', N'Kucing Persia', N'Betina', CAST(N'2019-01-21' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (112222, N'Max', N'Kucing Russian Blue', N'Jantan', CAST(N'2018-08-22' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (112323, N'Molly', N'Kucing Ragdoll', N'Betina', CAST(N'2018-11-10' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (112340, N'Chester', N'Anjing Buldog', N'Jantan', CAST(N'2019-02-03' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (112345, N'Oliver', N'Kucing Anggora', N'Betina', CAST(N'2019-10-11' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (112395, N'Nora', N'Anjing Maltese', N'Betina', CAST(N'2019-09-04' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (112567, N'Baxter', N'Anjing Pug', N'Jantan', CAST(N'2018-04-19' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (113838, N'Kitty', N'Kucing Siamese', N'Betina', CAST(N'2019-03-04' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (114568, N'Bily', N'Anjing Pudel', N'Jantan', CAST(N'2018-11-05' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (114571, N'Jasper', N'Anjing Pekines', N'Jantan', CAST(N'2018-12-11' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (123456, N'Arlo', N'Anjing Beagle', N'Jantan', CAST(N'2017-12-23' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (123984, N'Liyo', N'Kucing Domestik', N'Betina', CAST(N'2018-07-03' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (213948, N'Puput', N'Kucing Domestik', N'Jantan', CAST(N'2019-09-21' AS Date))
GO
INSERT [dbo].[Hewan] ([id_hewan], [nama_hewan], [jenis_hewan], [jenis_kelamin], [tanggal_lahir]) VALUES (984281, N'Bintik', N'Kucing Bandel', N'Jantan', CAST(N'2018-10-18' AS Date))
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (1233, N'Blackwood', N'Untuk Kucing', CAST(N'2022-01-08' AS Date), N'B982412')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (1234, N'Royal Canin', N'Untuk Kucing/Anjing', CAST(N'2019-04-13' AS Date), N'B209234')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (1284, N'Cat Food', N'Untuk Kucing', CAST(N'2021-05-30' AS Date), N'B746599')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (1568, N'Jerhigh', N'Untuk Anjing', CAST(N'2019-11-12' AS Date), N'B184942')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (2345, N'Whiskas', N'Untuk Kucing', CAST(N'2020-01-16' AS Date), N'B091234')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (3265, N'TunaSalmon', N'Untuk Kucing', CAST(N'2020-05-05' AS Date), N'B854267')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (4564, N'Pro Plan', N'Untuk Kucing/Anjing', CAST(N'2019-10-18' AS Date), N'B984923')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (4577, N'Cat Choize', N'Untuk Kucing', CAST(N'2022-10-10' AS Date), N'B874356')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (4628, N'Bolt', N'Untuk Anjing', CAST(N'2019-05-01' AS Date), N'B362825')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (4637, N'Royal Canin', N'Untuk Kucing', CAST(N'2021-04-06' AS Date), N'B647828')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (4678, N'Proplan', N'Untuk Kucong', CAST(N'2019-11-11' AS Date), N'B436291')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (5567, N'Maxi', N'Untuk Kucing', CAST(N'2021-06-04' AS Date), N'B892364')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (5678, N'Kibble', N'Untuk Anjing', CAST(N'2019-05-18' AS Date), N'B139823')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (6329, N'Daily Delight', N'Untuk Anjing', CAST(N'2019-09-20' AS Date), N'B045839')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (6372, N'Good Dog', N'Untuk Anjing', CAST(N'2019-10-20' AS Date), N'B480975')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (6472, N'Tuna Flavored', N'Untuk Kucing', CAST(N'2019-08-10' AS Date), N'B736471')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (6789, N'Alpo', N'Untuk Anjing', CAST(N'2020-08-19' AS Date), N'B893241')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (7342, N'Chicken Barley', N'Untuk Anjing', CAST(N'2019-04-01' AS Date), N'B325765')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (8952, N'Friskies', N'Untuk Kucing', CAST(N'2021-03-05' AS Date), N'B123985')
GO
INSERT [dbo].[MakananHewan] ([id_makanan], [nama_makanan], [penggunaan_makanan], [tanggal_kadaluwarsa], [kode_izin]) VALUES (9123, N'Pedigree', N'Untuk Anjing', CAST(N'2020-04-29' AS Date), N'B958912')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (222892, N'Bayticol', N'Untuk Anjing', 45000, 3, N'Tablet')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (223745, N'MontBe', N'Untuk Anjing', 55000, 5, N'Kapsul')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (232425, N'MIU-DROP', N'Untuk Kucing/Anjing', 26000, 6, N'Botol')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (232479, N'TRIXIN', N'Untuk Kucing', 18000, 5, N'Botol')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (232567, N'DIACAT', N'Untuk Kucing', 31000, 4, N'Kapsul')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (234211, N'Demodis', N'Untuk Kucing', 28000, 2, N'Botol')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (234560, N'Otitis', N'Untuk Anjing', 30000, 4, N'Botol')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (234574, N'Biodin', N'Untuk Kucing/Anjing', 28000, 3, N'Botol')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (234689, N'Super Cat', N'Untuk Kucing', 32000, 4, N'Kapsul')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (236782, N'Advocate', N'Untuk Kucing', 373000, 10, N'Tablet')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (256422, N'Diarril', N'Untuk Anjing', 12000, 3, N'Tablet')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (257485, N'Vomitis', N'Untuk Anjing', 35000, 4, N'Tablet')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (263290, N'Dermakomb', N'Untuk Anjing', 40000, 6, N'Tablet')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (264731, N'Frontline', N'Untuk Kucing', 145000, 4, N'Tablet')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (264892, N'Drontal', N'Untuk Kucing', 35000, 5, N'Tablet')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (265489, N'Unnstress', N'Untuk Kucing', 120000, 5, N'Botol')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (267811, N'Dermasep', N'Untuk Anjing', 60000, 2, N'Kapsul')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (276419, N'Spray Obat Kulit', N'Untuk Anjing', 190000, 7, N'Botol')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (278940, N'Dogsipen', N'Untuk Anjing', 50000, 7, N'Kapsul')
GO
INSERT [dbo].[Obat] ([id_obat], [nama_obat], [penggunaan_obat], [harga], [stok], [satuan_obat]) VALUES (279313, N'Albenworm', N'Untuk Kucing', 50000, 2, N'Botol')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1212', N'Dharma', N'Yudhistira', N'Jl.Luruh 15', N'085217438213')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1231', N'Alwy', N'Abdullah', N'Jl.Diponegoro 71', N'085347811213')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1234', N'Budi', N'Kusumo', N'Jl.Anggrek 21', N'085215121387')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1235', N'Tirta', N'Hayu', N'Jl.Melati 26', N'085216874413')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1236', N'Dina', N'Risky', N'Jl.Supriadi 12', N'085124151213')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1237', N'Aditya', N'Panji', N'Jl.Pattimura 81', N'085890151213')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1238', N'Yoyok', N'Hadi', N'Jl.Anggrek 21', N'085217651213')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1246', N'Aliza', NULL, N'Jl.Kenanga 72', N'085268151213')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1434', N'Wahyu', N'Devi', N'Jl.Bahagia 54', N'085218345921')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1438', N'Silvi', N'Indah', N'Jl.Lupus 84', N'085218685921')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1675', N'Irvan', N'Alvi', N'Jl. Kocak 12', N'085257162912')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1745', N'Mashabi', N'Arya', N'Jl. Kenanga 29', N'085258612452')
GO
INSERT [dbo].[Pelanggan] ([id_pelanggan], [nama_depan], [nama_belakang], [alamat], [no_telp]) VALUES (N'1984', N'Irpan', N'Rapip', N'Jl. Uwu 15', N'085122352895')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (1238429, 1222767, 114571, N'Check Anjing Muntah', CAST(N'2019-04-12T10:31:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (1239412, 1852123, 123456, N'Suntik Cacing', CAST(N'2019-01-12T13:21:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (1249834, 1522617, 123984, N'Steril', CAST(N'2019-05-13T12:14:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (1284212, 1222767, 112345, N'Check Virus Panleukopenia', CAST(N'2019-09-10T13:15:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (1298485, 1227897, 112340, N'Check Demam Anjing', CAST(N'2019-08-15T14:20:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2139854, 1859467, 112340, N'Check Rhinotracheitis', CAST(N'2019-03-11T10:20:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2149812, 1838646, 114571, N'Check Mata Anjing', CAST(N'2019-06-12T15:12:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2198512, 1328957, 111111, N'Check Mata', CAST(N'2019-08-17T11:12:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2309152, 1852123, 213948, N'Check Demam', CAST(N'2019-09-10T10:02:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2312855, 1229697, 114571, N'Check Distemper Virus', CAST(N'2019-03-15T12:23:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2349812, 1227897, 112395, N'Check Virus Parvo', CAST(N'2019-09-16T12:12:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2398591, 1838646, 114571, N'Suntik Cacing', CAST(N'2019-03-14T15:24:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2412985, 1227897, 112395, N'Check Up Bulanan', CAST(N'2019-01-12T10:23:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2489123, 1227897, 112395, N'Steril Rabies', CAST(N'2019-05-28T11:20:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2498123, 1229697, 112567, N'Check Demam ', CAST(N'2019-02-10T11:12:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2581234, 1229697, 112345, N'Check Leukimia', CAST(N'2019-05-01T15:20:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2874123, 1848950, 113838, N'Check Chlmydophilosis', CAST(N'2019-04-12T14:12:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2984192, 1222197, 112222, N'Check Virus Scabies', CAST(N'2019-08-13T12:40:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (2985192, 1838646, 112395, N'Steril Rabies', CAST(N'2019-10-12T13:05:00.000' AS DateTime), N'Rawat Inap')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (5912341, 1822197, 113838, N'Steril', CAST(N'2019-04-05T16:20:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[Pemeriksaan] ([id_pemeriksaan], [id_dokter], [id_hewan], [nama_pemeriksaan], [tanggal_pemeriksaan], [status_tindakan]) VALUES (9489123, 1222197, 111111, N'Check Mata', CAST(N'2019-09-12T10:30:00.000' AS DateTime), N'Rawat Jalan')
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1675', 12398241)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1235', 12398512)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1246', 12983285)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1235', 21398249)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1237', 21498128)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1238', 23849128)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1675', 23875823)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1238', 23985962)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1246', 24958123)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1246', 24982314)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1438', 24985129)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1212', 31209821)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1675', 31241234)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1231', 32982498)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1434', 32985812)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1237', 34289283)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1434', 37812345)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1434', 42981283)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1246', 48912852)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1238', 49813285)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1234', 76554422)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1984', 87123751)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1234', 97124751)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1237', 98123856)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1236', 98158293)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1434', 98329151)
GO
INSERT [dbo].[StrukPembayaran] ([id_pelanggan], [id_transaksi]) VALUES (N'1246', 98412384)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (12398241, 9212, 7342, 267811, 2581234, CAST(N'2019-05-01T15:20:00.000' AS DateTime), NULL, 150000, 200000, 350000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (12398512, NULL, NULL, NULL, 5912341, CAST(N'2019-04-05T16:20:00.000' AS DateTime), NULL, NULL, 78000, 78000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (12983285, NULL, NULL, NULL, 2398591, CAST(N'2019-03-14T15:24:00.000' AS DateTime), NULL, NULL, 158000, 158000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (21398249, 1290, 1568, NULL, NULL, CAST(N'2019-04-21T12:10:00.000' AS DateTime), NULL, 35000, NULL, 35000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (21498128, NULL, NULL, NULL, 1239412, CAST(N'2019-01-12T13:21:00.000' AS DateTime), NULL, NULL, 175000, 175000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (23849128, 2397, 6472, 276419, 2984192, CAST(N'2019-03-13T09:10:00.000' AS DateTime), NULL, 30000, 25000, 55000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (23875823, NULL, 4577, 279313, 9489123, CAST(N'2019-09-12T10:30:00.000' AS DateTime), NULL, 80000, 150000, 230000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (23985962, NULL, NULL, NULL, 2985192, CAST(N'2019-10-12T13:05:00.000' AS DateTime), NULL, NULL, 75000, 75000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (24958123, NULL, NULL, NULL, 2309152, CAST(N'2019-09-10T10:02:00.000' AS DateTime), NULL, NULL, 50000, 50000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (24982314, 2435, 2345, 236782, 2312855, CAST(N'2019-03-15T12:23:00.000' AS DateTime), NULL, 32000, 53000, 85000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (24985129, NULL, NULL, NULL, 2349812, CAST(N'2019-09-16T12:12:00.000' AS DateTime), NULL, NULL, 95000, 95000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (31209821, 1238, 1233, 222892, 1238429, CAST(N'2019-09-01T14:00:00.000' AS DateTime), NULL, 50000, 20000, 70000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (31241234, 8912, NULL, NULL, NULL, CAST(N'2019-08-29T12:40:00.000' AS DateTime), NULL, 48123, NULL, 48123)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (32982498, NULL, NULL, 223745, NULL, CAST(N'2019-01-20T12:00:00.000' AS DateTime), NULL, 20000, NULL, 20000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (32985812, 9237, 9123, NULL, 1298485, CAST(N'2019-05-03T14:30:00.000' AS DateTime), N'50 %', 75000, 100000, 87500)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (34289283, 2435, NULL, NULL, NULL, CAST(N'2019-04-21T16:20:00.000' AS DateTime), N'50 %', 50000, NULL, 25000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (37812345, 5912, NULL, NULL, 2498123, CAST(N'2019-02-10T11:12:00.000' AS DateTime), NULL, 60000, 98000, 158000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (42981283, 9212, 1568, 279313, 2874123, CAST(N'2019-04-12T14:12:00.000' AS DateTime), N'50 %', 75000, 100000, 175000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (48912852, 8719, 6472, NULL, NULL, CAST(N'2019-06-05T13:30:00.000' AS DateTime), NULL, 89000, NULL, 89000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (49813285, 9716, 6372, 267811, NULL, CAST(N'2019-09-07T12:45:00.000' AS DateTime), NULL, 250000, NULL, 250000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (76554422, NULL, NULL, NULL, 1239412, CAST(N'2019-01-12T13:21:00.000' AS DateTime), NULL, NULL, 23000, 23000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (87123751, NULL, NULL, 234574, 1249834, CAST(N'2019-05-13T12:14:00.000' AS DateTime), NULL, 75000, 100000, 175000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (97124751, NULL, 7342, NULL, 2489123, CAST(N'2019-05-28T11:20:00.000' AS DateTime), N'50 %', 25000, 125000, 150000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (98123856, 9237, 7342, NULL, 9489123, CAST(N'2019-09-12T10:30:00.000' AS DateTime), NULL, 45000, 125000, 170000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (98158293, NULL, NULL, NULL, 1284212, CAST(N'2019-09-10T13:15:00.000' AS DateTime), NULL, NULL, 85000, 85000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (98329151, 9212, NULL, NULL, 2139854, CAST(N'2019-03-11T10:20:00.000' AS DateTime), NULL, 67000, 120000, 187000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (98412384, 8759, 4678, NULL, NULL, CAST(N'2019-10-02T09:23:00.000' AS DateTime), NULL, 120000, NULL, 120000)
GO
INSERT [dbo].[Transaksi] ([id_transaksi], [id_vitamin], [id_makanan], [id_obat], [id_pemeriksaan], [tanggal_transaksi], [diskon], [harga_item], [harga_servis], [total_harga]) VALUES (98512983, 8581, NULL, NULL, NULL, CAST(N'2019-07-12T13:50:00.000' AS DateTime), NULL, 65000, NULL, 65000)
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (1238, N'Purina', N'Tablet', N'2x Sehari', N'Sebagai Pencernaan', N'45000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (1283, N'Probiotics', N'Tablet', N'2x Sehari', N'Mengatasi Infeksi pada Pencernaan', N'51000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (1290, N'Multivitamin', N'Tablet', N'2x Sehari', N'Vitamin Penambah Nafsu Makan Kucing', N'87000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (1836, N'Dermatrix', N'Shampoo', N'2x Sehari', N'Mengurangi kerontokan bulu', N'50000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (2397, N'FaVor', N'Box', N'3x Sehari', N'Memberikan Energi dan Proses Metabolisme', N'20000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (2435, N'Vetzyme', N'Tablet', N'1x Sehari', N'Mengurani tingkat stres pada Kucing', N'98000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (2765, N'Vitagram', N'Shampoo', N'1x Sehari', N'Vitamin untuk Penumbuh Bulu Anjing', N'64000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (3458, N'Nutri+gen', N'Tablet', N'1x Sehari', N'Penggemuk Kucing', N'30000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (5812, N'Dermagel', N'Salep', N'2x Sehari', N'Penumbuh Bulu', N'25000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (5819, N'Termolax', N'Box', N'3x Sehari', N'Mengurangi Rasa Lemas Anjing', N'46111')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (5912, N'Catydoll', N'Tablet', N'1x Sehari', N'Penambah Nafsu Makan', N'16000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (8581, N'PiloyNut', N'Tablet', N'1x Sehari', N'Mengurangi Tingkat Stress Anjing', N'59000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (8719, N'Dermacare', N'Shampoo', N'1x Sehari', N'Penumbuh Bulu', N'41000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (8759, N'Nupro', N'Tablet', N'3x Sehari', N'Memberikan sejumlah vitamin', N'65000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (8912, N'KenangaIndah', N'Tablet', N'1x Sehari', N'Mempercantik Bulu', N'48123')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (8919, N'StressLess', N'Shampoo', N'2x Sehari', N'Mengurangi Tingkat Stress', N'85000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (9212, N'Ilium', N'Tablet', N'2x Sehari', N'Mengurangi Kerontokan Bulu', N'49812')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (9237, N'Nutrigel Virbac', N'Tablet', N'2x Sehari', N'Menambah Nafsu Makan Anjing', N'56000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (9716, N'CleoEco', N'Shampoo', N'2x Sehari', N'Menghindari Kutu Kucing', N'15000')
GO
INSERT [dbo].[Vitamin] ([id_vitamin], [nama_vitamin], [jenis_vitamin], [dosis], [manfaat], [harga]) VALUES (9751, N'Paradox', N'Box', N'1x Sehari', N'Mencegah Kucing Demam', N'75000')
GO
ALTER TABLE [dbo].[Pemeriksaan]  WITH CHECK ADD  CONSTRAINT [FK_Pemeriksaan_Dokter] FOREIGN KEY([id_dokter])
REFERENCES [dbo].[Dokter] ([id_dokter])
GO
ALTER TABLE [dbo].[Pemeriksaan] CHECK CONSTRAINT [FK_Pemeriksaan_Dokter]
GO
ALTER TABLE [dbo].[Pemeriksaan]  WITH CHECK ADD  CONSTRAINT [FK_Pemeriksaan_Hewan] FOREIGN KEY([id_hewan])
REFERENCES [dbo].[Hewan] ([id_hewan])
GO
ALTER TABLE [dbo].[Pemeriksaan] CHECK CONSTRAINT [FK_Pemeriksaan_Hewan]
GO
ALTER TABLE [dbo].[StrukPembayaran]  WITH CHECK ADD  CONSTRAINT [FK_StrukPembayaran_Pelanggan] FOREIGN KEY([id_pelanggan])
REFERENCES [dbo].[Pelanggan] ([id_pelanggan])
GO
ALTER TABLE [dbo].[StrukPembayaran] CHECK CONSTRAINT [FK_StrukPembayaran_Pelanggan]
GO
ALTER TABLE [dbo].[StrukPembayaran]  WITH CHECK ADD  CONSTRAINT [FK_StrukPembayaran_Transaksi] FOREIGN KEY([id_transaksi])
REFERENCES [dbo].[Transaksi] ([id_transaksi])
GO
ALTER TABLE [dbo].[StrukPembayaran] CHECK CONSTRAINT [FK_StrukPembayaran_Transaksi]
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_Transaksi_MakananHewan] FOREIGN KEY([id_makanan])
REFERENCES [dbo].[MakananHewan] ([id_makanan])
GO
ALTER TABLE [dbo].[Transaksi] CHECK CONSTRAINT [FK_Transaksi_MakananHewan]
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_Transaksi_Obat] FOREIGN KEY([id_obat])
REFERENCES [dbo].[Obat] ([id_obat])
GO
ALTER TABLE [dbo].[Transaksi] CHECK CONSTRAINT [FK_Transaksi_Obat]
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_Transaksi_Pemeriksaan] FOREIGN KEY([id_pemeriksaan])
REFERENCES [dbo].[Pemeriksaan] ([id_pemeriksaan])
GO
ALTER TABLE [dbo].[Transaksi] CHECK CONSTRAINT [FK_Transaksi_Pemeriksaan]
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_Transaksi_Transaksi] FOREIGN KEY([id_transaksi])
REFERENCES [dbo].[Transaksi] ([id_transaksi])
GO
ALTER TABLE [dbo].[Transaksi] CHECK CONSTRAINT [FK_Transaksi_Transaksi]
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD  CONSTRAINT [FK_Transaksi_Vitamin] FOREIGN KEY([id_vitamin])
REFERENCES [dbo].[Vitamin] ([id_vitamin])
GO
ALTER TABLE [dbo].[Transaksi] CHECK CONSTRAINT [FK_Transaksi_Vitamin]
GO
USE [master]
GO
ALTER DATABASE [Petcare] SET  READ_WRITE 
GO
