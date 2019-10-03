USE [master]
GO
/****** Object:  Database [Petcare_TSQL]    Script Date: 02/10/2019 17:03:54 ******/
CREATE DATABASE [Petcare_TSQL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Petcare_TSQL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Petcare_TSQL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Petcare_TSQL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Petcare_TSQL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Petcare_TSQL] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Petcare_TSQL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Petcare_TSQL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET ARITHABORT OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Petcare_TSQL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Petcare_TSQL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Petcare_TSQL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Petcare_TSQL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET RECOVERY FULL 
GO
ALTER DATABASE [Petcare_TSQL] SET  MULTI_USER 
GO
ALTER DATABASE [Petcare_TSQL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Petcare_TSQL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Petcare_TSQL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Petcare_TSQL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Petcare_TSQL] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Petcare_TSQL', N'ON'
GO
ALTER DATABASE [Petcare_TSQL] SET QUERY_STORE = OFF
GO
USE [Petcare_TSQL]
GO
/****** Object:  Table [dbo].[Dokter]    Script Date: 02/10/2019 17:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dokter](
	[id_dokter] [int] NOT NULL,
	[nama_depan] [varchar](30) NOT NULL,
	[nama_belakang] [varchar](20) NULL,
	[alamat] [varchar](50) NULL,
	[no_telp] [varchar](15) NOT NULL,
	[email] [varchar](20) NULL,
 CONSTRAINT [PK_Dokter] PRIMARY KEY CLUSTERED 
(
	[id_dokter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hewan]    Script Date: 02/10/2019 17:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hewan](
	[id_hewan] [int] NOT NULL,
	[nama_hewan] [varchar](30) NOT NULL,
	[jenis_hewan] [varchar](20) NOT NULL,
	[jenis_kelamin] [varchar](10) NOT NULL,
	[umur] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Hewan] PRIMARY KEY CLUSTERED 
(
	[id_hewan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makanan.Hewan]    Script Date: 02/10/2019 17:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makanan.Hewan](
	[id_makanan] [int] NOT NULL,
	[nama_makanan] [varchar](30) NOT NULL,
	[penggunaan_makanan] [varchar](20) NOT NULL,
	[tanggal_kadaluwarsa] [date] NOT NULL,
	[kode_izin] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Makanan.Hewan] PRIMARY KEY CLUSTERED 
(
	[id_makanan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obat]    Script Date: 02/10/2019 17:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obat](
	[id_obat] [int] NOT NULL,
	[nama_obat] [varchar](30) NOT NULL,
	[jumlah] [int] NOT NULL,
	[penggunaan_obat] [varchar](10) NOT NULL,
	[harga] [int] NOT NULL,
	[stok] [int] NOT NULL,
	[satuan_obat] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Obat] PRIMARY KEY CLUSTERED 
(
	[id_obat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelanggan]    Script Date: 02/10/2019 17:03:54 ******/
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
/****** Object:  Table [dbo].[Pemeriksaan]    Script Date: 02/10/2019 17:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pemeriksaan](
	[id_pemeriksaan] [int] NOT NULL,
	[nama_pemeriksaan] [varchar](30) NOT NULL,
	[tanggal_pemeriksaan] [datetime] NOT NULL,
	[status_tindakan] [varchar](20) NULL,
 CONSTRAINT [PK_Pemeriksaan] PRIMARY KEY CLUSTERED 
(
	[id_pemeriksaan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaksi]    Script Date: 02/10/2019 17:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaksi](
	[id_transaksi] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Vitamin]    Script Date: 02/10/2019 17:03:54 ******/
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
USE [master]
GO
ALTER DATABASE [Petcare_TSQL] SET  READ_WRITE 
GO
