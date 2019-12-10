USE [master]
GO
/****** Object:  Database [perpustakaan]    Script Date: 10/12/2019 14:44:26 ******/
CREATE DATABASE [perpustakaan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'perpustakaan', FILENAME = N'F:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\perpustakaan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'perpustakaan_log', FILENAME = N'F:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\perpustakaan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [perpustakaan] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [perpustakaan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [perpustakaan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [perpustakaan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [perpustakaan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [perpustakaan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [perpustakaan] SET ARITHABORT OFF 
GO
ALTER DATABASE [perpustakaan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [perpustakaan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [perpustakaan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [perpustakaan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [perpustakaan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [perpustakaan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [perpustakaan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [perpustakaan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [perpustakaan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [perpustakaan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [perpustakaan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [perpustakaan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [perpustakaan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [perpustakaan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [perpustakaan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [perpustakaan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [perpustakaan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [perpustakaan] SET RECOVERY FULL 
GO
ALTER DATABASE [perpustakaan] SET  MULTI_USER 
GO
ALTER DATABASE [perpustakaan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [perpustakaan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [perpustakaan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [perpustakaan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [perpustakaan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'perpustakaan', N'ON'
GO
ALTER DATABASE [perpustakaan] SET QUERY_STORE = OFF
GO
USE [perpustakaan]
GO
/****** Object:  Table [dbo].[anggota]    Script Date: 10/12/2019 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anggota](
	[nomor] [smallint] NOT NULL,
	[nama] [varchar](25) NULL,
	[alamat] [varchar](35) NULL,
	[tgl_lahir] [date] NULL,
	[tempat_lahir] [varchar](25) NULL,
	[nomor_telp] [varchar](15) NULL,
 CONSTRAINT [anggota_pk] PRIMARY KEY CLUSTERED 
(
	[nomor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[buku]    Script Date: 10/12/2019 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buku](
	[kode] [smallint] NOT NULL,
	[judul] [varchar](50) NULL,
	[jumlah_hal] [smallint] NULL,
	[pengarang] [varchar](30) NULL,
	[penerbit] [varchar](30) NULL,
	[tahun_terbit] [smallint] NULL,
 CONSTRAINT [buku_pk] PRIMARY KEY CLUSTERED 
(
	[kode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail_peminjaman]    Script Date: 10/12/2019 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail_peminjaman](
	[kode_pinjam] [smallint] NOT NULL,
	[kode_buku] [smallint] NOT NULL,
 CONSTRAINT [detail_peminjaman_pk] PRIMARY KEY CLUSTERED 
(
	[kode_pinjam] ASC,
	[kode_buku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peminjaman]    Script Date: 10/12/2019 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peminjaman](
	[kode] [smallint] NOT NULL,
	[tgl_pinjam] [date] NULL,
	[tgl_harus_kembali] [date] NULL,
	[tgl_kembali] [date] NULL,
	[no_anggota] [smallint] NULL,
	[id_petugas] [smallint] NULL,
 CONSTRAINT [peminjaman_pk] PRIMARY KEY CLUSTERED 
(
	[kode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[petugas]    Script Date: 10/12/2019 14:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[petugas](
	[id] [smallint] NOT NULL,
	[nomor_ktp] [varchar](15) NULL,
	[nama] [varchar](25) NULL,
	[alamat] [varchar](35) NULL,
	[nomor_telp] [varchar](15) NULL,
 CONSTRAINT [petugas_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (1, N'Salsabila', N'Jl. Jeruk No 13 Malang', CAST(N'2000-05-07' AS Date), N'Malang', N'081333444555')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (2, N'Firmansyah', N'Jl. Mangga No 103 Malang', CAST(N'2001-10-06' AS Date), N'Malang', N'081323664511')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (3, N'Maya Hirata', N'Jl. Srikaya No 56 Malang', CAST(N'2000-09-25' AS Date), N'Malang', N'081993334225')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (4, N'Gita Yasa', N'Jl. Semangka No 7 Malang', CAST(N'2005-09-01' AS Date), N'Malang', N'08188344599')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (5, N'Siska Silvia', N'Jl. Jambu No 36 Malang', CAST(N'2003-12-10' AS Date), N'Malang', N'081322344222')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (6, N'Deffa Trianta', N'Jl. Durian No 45 Malang', CAST(N'2000-08-07' AS Date), N'Malang', N'081355544577')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (7, N'Bimbi Bahtiar', N'Jl. Kelengkeng No 99 Malang', CAST(N'2003-10-15' AS Date), N'Malang', N'081322346622')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (8, N'Tata Tiara', N'Jl. Salak No 84 Malang', CAST(N'2000-07-25' AS Date), N'Malang', N'081355589007')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (9, N'Ardan Anjung', N'Jl. Mawar No 12', CAST(N'2000-09-29' AS Date), N'Bojonegoro', N'085258967800')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (10, N'Sugeng Prastiyo', N'Jl. Kuncup No.50', CAST(N'1999-04-10' AS Date), N'Blitar', N'081234516212')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (11, N'Osa Mahanani', N'Jl. Kenanga No.12', CAST(N'2000-09-22' AS Date), N'Blitar', N'085258961234')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (12, N'Riza Zoel', N'Jl. Apel No.05', CAST(N'2000-05-02' AS Date), N'Bojonegoro', N'081234519812')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (13, N'Dina Risky', N'Jl. Salak No.16', CAST(N'2000-09-10' AS Date), N'Malang', N'085212348751')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (14, N'Martin Amanu', N'Jl. Durian No.55', CAST(N'1998-11-20' AS Date), N'Magetan', N'085242159812')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (15, N'Unero Bhagaskara', N'Jl. Semangka No.12', CAST(N'2000-11-11' AS Date), N'Medan', N'085123987124')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (16, N'Hunayn Risatayn', N'Jl. Asam Manis No.7', CAST(N'1998-12-24' AS Date), N'Sidoarjo', N'089252145812')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (17, N'Oktaviano Andy Suryadi', N'Jl. Kuncup No.71', CAST(N'1999-04-05' AS Date), N'Lumajang', N'081245897124')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (18, N'Agit Ari Irawan', N'Jl. Lili No.19', CAST(N'2000-10-23' AS Date), N'Surabaya', N'085123458172')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (19, N'Silvi Indah Novitasari', N'Jl. Kenanga 20', CAST(N'2000-01-12' AS Date), N'Malang', N'0851689723425')
GO
INSERT [dbo].[anggota] ([nomor], [nama], [alamat], [tgl_lahir], [tempat_lahir], [nomor_telp]) VALUES (20, N'Sultan Achmad', N'Jl. Singosari No.12', CAST(N'2000-05-19' AS Date), N'Malang', N'0852153287955')
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (1, N'Dasar pemrograman', 150, N'Didi Riyadi', N'Polinema Pers', 2014)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (2, N'Basis data', 100, N'Mila Karmila', N'Polinema Pers', 2014)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (3, N'Rekayasa perangkat lunak', 130, N'Dana Diana', N'Polinema Pers', 2015)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (4, N'Ilmu komunikasi dan organisasi', 120, N'Rini Triani', N'Polinema Pers', 2016)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (5, N'Interaksi manusia dan komputer', 160, N'Dedi Permana', N'Polinema Pers', 2016)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (6, N'Jaringan komputer', 100, N'Tora Suwarno', N'Polinema Pers', 2017)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (7, N'Pengantar teknologi informasi', 150, N'Purnama Sari ', N'Polinema Pers', 2017)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (8, N'Kecerdasan buatan', 100, N'Sarah Dewi', N'Polinema Pers', 2017)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (9, N'Pengolahan citra digital', 100, N'Suwarno', N'Polinema Pers', 2018)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (10, N'Sistem operasi', 120, N'Bisma Lingga', N'Polinema Pers', 2018)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (11, N'Maliun Hawa', 150, N'Ahmad Faisal', N'Gramedia', 2019)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (12, N'Hilang', 100, N'Nawang Nidlo Titisari', N'Gramedia', 2018)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (13, N'Pemrograman Lanjut', 180, N'Didi Riyadi', N'Polinema Pers', 2015)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (14, N'Basis data Lanjut', 120, N'Mila Karmila', N'Polinema Pers', 2017)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (15, N'Artificial Intellegence', 160, N'Dana Diana', N'Polinema Pers', 2016)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (16, N'Ilmu komunikasi dalam Melobby Perusahaan', 110, N'Rini Triani', N'Grafindo', 2018)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (17, N'Interaksi manusia dan komputer Lanjutan ', 210, N'Dedi Permana', N'Polinema Pers', 2018)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (18, N'Jaringan Komputer Lanjutan', 180, N'Tora Suwarno', N'Polinema Pers', 2018)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (19, N'Teknologi Informasi Lanjut ', 180, N'Purnama Sari ', N'Polinema Pers', 2018)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (20, N'Machine Learning', 150, N'Sarah Dewi', N'Polinema Pers', 2018)
GO
INSERT [dbo].[buku] ([kode], [judul], [jumlah_hal], [pengarang], [penerbit], [tahun_terbit]) VALUES (21, N'Olahraga Renang', 76, N'Sugeng', N'LPM Kompen', 2019)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (1, 1)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (1, 2)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (1, 3)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (2, 4)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (2, 5)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (3, 10)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (4, 7)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (4, 8)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (5, 9)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (6, 8)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (7, 9)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (8, 12)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (9, 10)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (10, 11)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (11, 4)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (12, 7)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (13, 3)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (14, 7)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (15, 9)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (16, 14)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (17, 5)
GO
INSERT [dbo].[detail_peminjaman] ([kode_pinjam], [kode_buku]) VALUES (17, 18)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (1, CAST(N'2019-09-23' AS Date), CAST(N'2019-09-26' AS Date), CAST(N'2019-09-26' AS Date), 1, 2)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (2, CAST(N'2019-09-23' AS Date), CAST(N'2019-09-25' AS Date), CAST(N'2019-09-25' AS Date), 5, 2)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (3, CAST(N'2019-09-24' AS Date), CAST(N'2019-09-25' AS Date), CAST(N'2019-09-26' AS Date), 6, 3)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (4, CAST(N'2019-09-24' AS Date), CAST(N'2019-09-26' AS Date), CAST(N'2019-09-26' AS Date), 4, 3)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (5, CAST(N'2019-09-24' AS Date), CAST(N'2019-09-25' AS Date), CAST(N'2019-09-26' AS Date), 3, 3)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (6, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-28' AS Date), CAST(N'2019-11-28' AS Date), 8, 10)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (7, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-28' AS Date), CAST(N'2019-11-28' AS Date), 7, 11)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (8, CAST(N'2019-11-27' AS Date), CAST(N'2019-11-29' AS Date), CAST(N'2019-11-29' AS Date), 2, 13)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (9, CAST(N'2019-11-27' AS Date), CAST(N'2019-11-29' AS Date), CAST(N'2019-11-29' AS Date), 9, 12)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (10, CAST(N'2019-11-28' AS Date), CAST(N'2019-11-30' AS Date), CAST(N'2019-11-30' AS Date), 11, 15)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (11, CAST(N'2019-11-29' AS Date), CAST(N'2019-12-01' AS Date), CAST(N'2019-12-01' AS Date), 17, 14)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (12, CAST(N'2019-12-01' AS Date), CAST(N'2019-12-03' AS Date), CAST(N'2019-12-04' AS Date), 14, 19)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (13, CAST(N'2019-12-01' AS Date), CAST(N'2019-12-03' AS Date), CAST(N'2019-12-03' AS Date), 12, 17)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (14, CAST(N'2019-12-02' AS Date), CAST(N'2019-12-04' AS Date), CAST(N'2019-12-04' AS Date), 10, 18)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (15, CAST(N'2019-12-03' AS Date), CAST(N'2019-12-06' AS Date), CAST(N'2019-12-07' AS Date), 19, 1)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (16, CAST(N'2019-12-03' AS Date), CAST(N'2019-12-06' AS Date), CAST(N'2019-12-06' AS Date), 5, 20)
GO
INSERT [dbo].[peminjaman] ([kode], [tgl_pinjam], [tgl_harus_kembali], [tgl_kembali], [no_anggota], [id_petugas]) VALUES (17, CAST(N'2019-12-04' AS Date), CAST(N'2019-12-08' AS Date), CAST(N'2019-12-09' AS Date), 20, 13)
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (1, N'199904021234123', N'Ali Adi', N'Jl. Mawar 37 Malang', N'0812355667723')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (2, N'199807236778993', N'Soraya ', N'Jl. Raflesia 83 Malang', N'0812323298999')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (3, N'199808121234524', N'Mira Diana', N'Jl. Kasturi 29 Malang', N'0814532232323')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (4, N'198711091234155', N'Herawati', N'Jl. Tabebuya 23 Malang', N'0812327776523')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (5, N'199510259765865', N'Maman tria', N'Jl. Sakura 29 Malang', N'0812323656546')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (6, N'199808121231234', N'Siswoko', N'Jl. Sedap malam 13 Malang', N'0819875345678')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (7, N'199702231245657', N'Sendy lesmaana', N'Jl. Anggrek 28 Malang', N'0819878976587')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (8, N'199603094671234', N'Mahendra', N'Jl. Melati 03 Malang', N'0812876689887')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (9, N'199561237578234', N'Joko', N'Jl. Ihiy 05', N'085124985328')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (10, N'199834827972346', N'Apoy', N'Jl. Cempaka 12', N'0851238973287')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (11, N'199885896812468', N'Mawarr Asri', N'Jl. Sudirman 124', N'0857123857474')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (12, N'199712478345688', N'Nanda', N'Jl. Jasuke 10', N'0857123675328')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (13, N'199649593745893', N'Budi Kusumo', N'Jl. Pipit 19', N'0852148537456')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (14, N'199747895394857', N'Novita Sari', N'Jl. Gajah Mada 59', N'0812584395864')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (15, N'199858435908345', N'Kasnawi', N'Jl. Serma Maun 15', N'0812485973424')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (16, N'199512398573875', N'Subhan Indra', N'Jl. Piplup 29', N'0851284632723')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (17, N'199852349871245', N'Ernold Maja', N'Jl. Melati 19', N'0857124765182')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (18, N'199947895981274', N'Adristi Iftitah', N'Jl. Greentea 19', N'0851273985712')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (19, N'198578673857124', N'Facko Ellanda', N'Jl. Hirata 59', N'0852897423875')
GO
INSERT [dbo].[petugas] ([id], [nomor_ktp], [nama], [alamat], [nomor_telp]) VALUES (20, N'199812489752385', N'Risky Putri', N'Jl. Cendet 155', N'0851247895326')
GO
ALTER TABLE [dbo].[detail_peminjaman]  WITH CHECK ADD  CONSTRAINT [detail_peminjaman_fk1] FOREIGN KEY([kode_pinjam])
REFERENCES [dbo].[peminjaman] ([kode])
GO
ALTER TABLE [dbo].[detail_peminjaman] CHECK CONSTRAINT [detail_peminjaman_fk1]
GO
ALTER TABLE [dbo].[detail_peminjaman]  WITH CHECK ADD  CONSTRAINT [detail_peminjaman_fk2] FOREIGN KEY([kode_buku])
REFERENCES [dbo].[buku] ([kode])
GO
ALTER TABLE [dbo].[detail_peminjaman] CHECK CONSTRAINT [detail_peminjaman_fk2]
GO
ALTER TABLE [dbo].[peminjaman]  WITH CHECK ADD  CONSTRAINT [peminjaman_fk1] FOREIGN KEY([no_anggota])
REFERENCES [dbo].[anggota] ([nomor])
GO
ALTER TABLE [dbo].[peminjaman] CHECK CONSTRAINT [peminjaman_fk1]
GO
ALTER TABLE [dbo].[peminjaman]  WITH CHECK ADD  CONSTRAINT [peminjaman_fk2] FOREIGN KEY([id_petugas])
REFERENCES [dbo].[petugas] ([id])
GO
ALTER TABLE [dbo].[peminjaman] CHECK CONSTRAINT [peminjaman_fk2]
GO
USE [master]
GO
ALTER DATABASE [perpustakaan] SET  READ_WRITE 
GO
