USE [master]
GO
/****** Object:  Database [CDBAHM]    Script Date: 14-November-2018 11:14:04 ******/
CREATE DATABASE [CDBAHM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CDBAHM', FILENAME = N'E:\DATA\CDBAHM.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [DIMENSION] 
( NAME = N'CDBAHM_dim', FILENAME = N'E:\DATA\CDBAHM_dim.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FACT] 
( NAME = N'CDBAHM_fac', FILENAME = N'E:\DATA\CDBAHM_fac.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [MASTER] 
( NAME = N'CDBAHM_mst', FILENAME = N'E:\DATA\CDBAHM_mst.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CDBAHM_log', FILENAME = N'E:\DATA\CDBAHM_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CDBAHM] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CDBAHM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CDBAHM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CDBAHM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CDBAHM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CDBAHM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CDBAHM] SET ARITHABORT OFF 
GO
ALTER DATABASE [CDBAHM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CDBAHM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CDBAHM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CDBAHM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CDBAHM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CDBAHM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CDBAHM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CDBAHM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CDBAHM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CDBAHM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CDBAHM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CDBAHM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CDBAHM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CDBAHM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CDBAHM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CDBAHM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CDBAHM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CDBAHM] SET RECOVERY FULL 
GO
ALTER DATABASE [CDBAHM] SET  MULTI_USER 
GO
ALTER DATABASE [CDBAHM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CDBAHM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CDBAHM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CDBAHM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CDBAHM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CDBAHM', N'ON'
GO
ALTER DATABASE [CDBAHM] SET QUERY_STORE = OFF
GO
USE [CDBAHM]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CDBAHM]
GO
/****** Object:  Table [dbo].[dim_AgeRange]    Script Date: 14-November-2018 11:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_AgeRange](
	[AgeKey] [int] IDENTITY(1,1) NOT NULL,
	[AgeRange] [nvarchar](255) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_dim_AgeRange] PRIMARY KEY CLUSTERED 
(
	[AgeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DIMENSION]
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_CustomerCode]    Script Date: 14-November-2018 11:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_CustomerCode](
	[CustCodeKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_DataSourceType]    Script Date: 14-November-2018 11:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_DataSourceType](
	[DataSourceTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[DataSourceType] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_District]    Script Date: 14-November-2018 11:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_District](
	[DistrictKey] [int] NOT NULL,
	[DistrictCode] [nvarchar](10) NULL,
	[DistrictName] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_Gender]    Script Date: 14-November-2018 11:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Gender](
	[GenderKey] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_Profession]    Script Date: 14-November-2018 11:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Profession](
	[ProfessionKey] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NULL,
	[Description] [varchar](255) NULL,
	[CreatedDate]  AS (getdate()),
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_Religion]    Script Date: 14-November-2018 11:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Religion](
	[ReligionKey] [int] IDENTITY(1,1) NOT NULL,
	[Religion] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_RingType]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_RingType](
	[RingTypeKey] [int] NOT NULL,
	[RingTypeCode] [nvarchar](10) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_SellingType]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_SellingType](
	[SellingTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[SellingTypeName] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_ServiceType]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_ServiceType](
	[ServiceTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [nvarchar](10) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[dim_Unit]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Unit](
	[UnitKey] [int] NOT NULL,
	[FrameNo] [nvarchar](100) NULL,
	[KodeMesin] [nvarchar](100) NULL,
	[SequenceMesin] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimAgeGroup]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAgeGroup](
	[AgeGroupKey] [int] IDENTITY(1,1) NOT NULL,
	[AgeGroup] [varchar](100) NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimColor]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimColor](
	[ColorKey] [int] IDENTITY(1,1) NOT NULL,
	[ColorID] [varchar](2) NULL,
	[ColorName] [varchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustKey] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[NamaCustomer] [varchar](100) NULL,
	[KodeCustomer] [varchar](100) NOT NULL,
	[TanggalLahir] [date] NULL,
	[AlamatKTP] [varchar](100) NULL,
	[AlamatKTPRegionKey] [int] NULL,
	[AlamatSurat] [varchar](100) NULL,
	[AlamatSuratRegionKey] [int] NULL,
	[StatusRumah] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Agama] [varchar](100) NULL,
	[Pekerjaan] [varchar](100) NULL,
	[Pengeluaran] [varchar](100) NULL,
	[PengeluaranKey] [int] NULL,
	[Pendidikan] [varchar](100) NULL,
	[PendidikanKey] [int] NULL,
	[KecamatanSurat] [varchar](30) NULL,
	[NoHP] [varchar](30) NULL,
	[StatusNoHP] [varchar](100) NULL,
	[NoTelp] [varchar](15) NULL,
	[isBersediaDihubungi] [bit] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DTKey] [int] NOT NULL,
	[DateLabel] [nvarchar](20) NULL,
	[DayOfWeek] [tinyint] NULL,
	[DayName] [nvarchar](20) NULL,
	[DayOfMonth] [tinyint] NULL,
	[DayOfYear] [smallint] NULL,
	[WeekOfYear] [int] NULL,
	[WeekNumber] [tinyint] NULL,
	[WeekOfMonth] [int] NULL,
	[MonthName] [nvarchar](20) NULL,
	[ShortMonthName] [nvarchar](20) NULL,
	[MonthOfYear] [int] NULL,
	[MonthNumber] [tinyint] NULL,
	[WorkingDays] [decimal](5, 2) NULL,
	[Quarter] [char](2) NULL,
	[Semester] [char](2) NULL,
	[Year] [smallint] NULL,
	[CurrentMonth] [int] NULL,
	[CurrentYear] [smallint] NULL,
	[LastClosedMonth] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifieldDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimDealer]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDealer](
	[DealerKey] [int] IDENTITY(1,1) NOT NULL,
	[DealerCode] [varchar](10) NULL,
	[DealerName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[KotaKabupaten] [varchar](50) NULL,
	[KodeKotaKabupaten] [varchar](10) NULL,
	[Propinsi] [varchar](50) NULL,
	[KodePropinsi] [varchar](10) NULL,
	[Longitude] [decimal](10, 6) NULL,
	[Latitude] [decimal](10, 6) NULL,
	[Ring] [varchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimLeasing]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLeasing](
	[LeasingKey] [int] IDENTITY(1,1) NOT NULL,
	[LeasingCode] [varchar](10) NULL,
	[LeasingDesc] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimMainDealer]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimMainDealer](
	[MainDealerKey] [int] IDENTITY(1,1) NOT NULL,
	[MainDealerCode] [varchar](10) NULL,
	[MainDealerName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[KotaKabupaten] [varchar](50) NULL,
	[KodeKotaKabupaten] [varchar](10) NULL,
	[Propinsi] [varchar](50) NULL,
	[KodePropinsi] [varchar](10) NULL,
	[Longitude] [decimal](10, 6) NULL,
	[Latitude] [decimal](10, 6) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimMerkMotor]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimMerkMotor](
	[MerkMotorkey] [int] IDENTITY(1,1) NOT NULL,
	[MerkMotorCode] [varchar](3) NULL,
	[MerkMotorDesc] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimPendidikan]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPendidikan](
	[PendidikanKey] [int] IDENTITY(1,1) NOT NULL,
	[PendidikanCode] [varchar](3) NULL,
	[PendidikanDesc] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimPengeluaran]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPengeluaran](
	[PengeluaranKey] [int] IDENTITY(1,1) NOT NULL,
	[PengeluaranCode] [varchar](3) NULL,
	[RangePengeluaran] [varchar](100) NULL,
	[ExpenseMin] [int] NULL,
	[ExpenseMax] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimPengguna]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPengguna](
	[PenggunaKey] [int] IDENTITY(1,1) NOT NULL,
	[PenggunaCode] [varchar](3) NULL,
	[PenggunaDesc] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimRegion]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRegion](
	[RegionKey] [int] IDENTITY(1,1) NOT NULL,
	[KodeKecamatan] [varchar](50) NULL,
	[Kecamatan] [varchar](100) NULL,
	[KodeKotaKab] [varchar](50) NULL,
	[KotaKabupaten] [varchar](100) NULL,
	[KodePropinsi] [varchar](50) NULL,
	[Propinsi] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[DimVarian]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVarian](
	[VarianKey] [int] IDENTITY(1,1) NOT NULL,
	[VarianCode] [varchar](10) NULL,
	[VarianName] [varchar](100) NULL,
	[Type] [varchar](100) NULL,
	[Model] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [DIMENSION]
GO
/****** Object:  Table [dbo].[etl_AuditTrail]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etl_AuditTrail](
	[Id] [bigint] NOT NULL,
	[TimeProcess] [datetime] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [nvarchar](20) NULL,
	[ETLPart] [nvarchar](50) NULL,
 CONSTRAINT [PK_etl_AuditTrail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_ClaimServiceActual]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_ClaimServiceActual](
	[CustomerKey] [int] NULL,
	[UnitKey] [int] NULL,
	[VarianKey] [int] NULL,
	[DealerBeliKey] [int] NULL,
	[SalesDate] [date] NULL,
	[DealerServiceKey] [int] NULL,
	[ServiceTypeKey] [int] NULL,
	[ServiceDate] [date] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [FACT]
GO
/****** Object:  Table [dbo].[fact_DealerInf]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_DealerInf](
	[MainDealerKey] [int] NOT NULL,
	[DealerKey] [int] NOT NULL,
	[ServiceTypeKey] [int] NOT NULL,
	[DistrictKey] [int] NOT NULL,
	[RegionKey] [int] NOT NULL,
	[PeriodDateKey] [int] NOT NULL,
	[Quarter] [int] NULL,
	[H2Ring1] [int] NULL,
	[H2Ring2] [int] NULL,
	[TotH123Ring1] [int] NULL,
	[TotH123Ring2To3] [int] NULL,
	[TotH1byH12Ring1] [int] NULL,
	[TotH1byH12Ring2To3] [int] NULL,
	[TotH23Ring1] [int] NULL,
	[TotH23Ring2To3] [int] NULL,
	[TotSalesPeople] [int] NULL,
	[TotSalesFU] [int] NULL,
	[TotSalesCounter] [int] NULL,
	[TotSalesCounterFU] [int] NULL,
	[TotTelemarketer] [int] NULL,
	[PctSalesWI] [decimal](4, 2) NULL,
	[PctSalesCanv] [decimal](4, 2) NULL,
	[PctSalesExhb] [decimal](4, 2) NULL,
	[PctGrupCust] [decimal](4, 2) NULL,
	[PctNonGrupCust] [decimal](4, 2) NULL,
	[PctSalesRing1] [decimal](4, 2) NULL,
	[PctSalesRing2] [decimal](4, 2) NULL,
	[PctSalesRing3] [decimal](4, 2) NULL,
	[TotPitServ] [int] NULL,
	[TotArmadaVisit] [int] NULL,
	[TotSA] [int] NULL,
	[TotMekanik] [int] NULL,
	[TotPosServ] [int] NULL,
	[AvgPartSoldPerMonth] [int] NULL,
	[PctAvgUnitEntryRing1] [decimal](4, 2) NULL,
	[PctAvgUnitEntryRing2] [decimal](4, 2) NULL,
	[PctAvgUnitEntryRing3] [decimal](4, 2) NULL,
	[PctKPB1Ring1] [decimal](4, 2) NULL,
	[PctKPB1Ring2] [decimal](4, 2) NULL,
	[PctKPB1Ring3] [decimal](4, 2) NULL,
	[PctKPB2Ring1] [decimal](4, 2) NULL,
	[PctKPB2Ring2] [decimal](4, 2) NULL,
	[PctKPB2Ring3] [decimal](4, 2) NULL,
	[PctKPB3Ring1] [decimal](4, 2) NULL,
	[PctKPB3Ring2] [decimal](4, 2) NULL,
	[PctKPB3Ring3] [decimal](4, 2) NULL,
	[PctKPB4Ring1] [decimal](4, 2) NULL,
	[PctKPB4Ring2] [decimal](4, 2) NULL,
	[PctKPB4Ring3] [decimal](4, 2) NULL,
	[PctRegServRing1] [decimal](4, 2) NULL,
	[PctRegServRing2] [decimal](4, 2) NULL,
	[PctRegServRing3] [decimal](4, 2) NULL,
	[TotSales] [int] NULL,
	[TotROSales] [int] NULL,
	[KPB1Own] [int] NULL,
	[KPB2Own] [int] NULL,
	[KPB3Own] [int] NULL,
	[KPB4Own] [int] NULL,
	[UnitEntryKPB1] [int] NULL,
	[UnitEntryKPB2] [int] NULL,
	[UnitEntryKPB3] [int] NULL,
	[UnitEntryRegular] [int] NULL,
	[TotalUnitEntry] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [FACT]
GO
/****** Object:  Table [dbo].[fact_H1H2]    Script Date: 14-November-2018 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_H1H2](
	[MainDealerKey] [int] NOT NULL,
	[DealerKey] [int] NOT NULL,
	[ServiceTypeKey] [int] NOT NULL,
	[DistrictKey] [int] NOT NULL,
	[RegionKey] [int] NOT NULL,
	[PeriodDateKey] [int] NOT NULL,
	[TotalDataSource] [int] NULL,
	[PhoneNoAvailable] [int] NULL,
	[SMSSent] [int] NULL,
	[SMSSentPct] [decimal](4, 2) NULL,
	[SMSFail] [int] NULL,
	[SMSFailPct] [decimal](4, 2) NULL,
	[FstResServ] [int] NULL,
	[FstResNotYetServ] [int] NULL,
	[FstResServPct] [decimal](4, 2) NULL,
	[FstResNotYetServPct] [decimal](4, 2) NULL,
	[Contacted] [int] NULL,
	[NotContacted] [int] NULL,
	[Unreachable] [int] NULL,
	[Rejected] [int] NULL,
	[Workload] [int] NULL,
	[ContactedPct] [decimal](4, 2) NULL,
	[UnreachablePct] [decimal](4, 2) NULL,
	[RejectedPct] [decimal](4, 2) NULL,
	[WorkloadPct] [decimal](4, 2) NULL,
	[SndResServ] [int] NULL,
	[SndResNotServ] [int] NULL,
	[TooFar] [int] NULL,
	[NoTime] [int] NULL,
	[Forget] [int] NULL,
	[ServToOther] [int] NULL,
	[SndResServPct] [decimal](4, 2) NULL,
	[TooFarPct] [decimal](4, 2) NULL,
	[NoTimePct] [decimal](4, 2) NULL,
	[ForgetPct] [decimal](4, 2) NULL,
	[TotalVisitorKPB] [int] NULL,
	[TotalVisitorKPBPct] [decimal](4, 2) NULL,
	[RxOwnDealer] [int] NULL,
	[RxAll] [int] NULL,
	[RxUnitEntry] [int] NULL,
	[RxSales] [int] NULL,
	[RxPctOwnByAll] [decimal](4, 2) NULL,
	[RxPctOwnByUnitEntry] [decimal](4, 2) NULL,
	[RxPctOwnBySales] [decimal](4, 2) NULL,
	[CreatedDate] [date] NULL,
	[ModfiedDate] [date] NULL
) ON [FACT]
GO
/****** Object:  Table [dbo].[fact_H2H1]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_H2H1](
	[MainDealerKey] [int] NOT NULL,
	[DealerKey] [int] NOT NULL,
	[ServiceTypeKey] [int] NOT NULL,
	[DistrictKey] [int] NOT NULL,
	[RegionKey] [int] NOT NULL,
	[PeriodDateKey] [int] NOT NULL,
	[DataSourceTypeKey] [int] NOT NULL,
	[TotDataSource] [int] NULL,
	[TotDataBaseOnAnalysis] [int] NULL,
	[SMSSent] [int] NULL,
	[SMSSentPct] [decimal](4, 2) NULL,
	[SMSFail] [int] NULL,
	[SMSFailPct] [decimal](4, 2) NULL,
	[WorkloadM1] [int] NULL,
	[TotFUC] [int] NULL,
	[FUCContacted] [int] NULL,
	[FUCContactedPct] [decimal](4, 2) NULL,
	[FUCUnreach] [int] NULL,
	[FUCUnreachPct] [decimal](4, 2) NULL,
	[FUCReject] [int] NULL,
	[FUCRejectPct] [decimal](4, 2) NULL,
	[FUCWorklo] [int] NULL,
	[FUCWorkloPct] [decimal](4, 2) NULL,
	[ProspectM2] [int] NULL,
	[ProspectM1] [int] NULL,
	[ProspectM] [int] NULL,
	[NotProspect] [int] NULL,
	[TotProspect] [int] NULL,
	[TotProspectPct] [decimal](4, 2) NULL,
	[DTDeal] [int] NULL,
	[DTHotProsp] [int] NULL,
	[DTLowProsp] [int] NULL,
	[DTNotDeal] [int] NULL,
	[DTDealPct] [decimal](4, 2) NULL,
	[DTHotProspPct] [decimal](4, 2) NULL,
	[DTLowProspPct] [decimal](4, 2) NULL,
	[DTNotDealPct] [decimal](4, 2) NULL,
	[TUSDeal] [int] NULL,
	[TUSDealPct] [decimal](4, 2) NULL,
	[TDPM2] [int] NULL,
	[TDPM1] [int] NULL,
	[TDPM] [int] NULL,
	[CDT] [int] NULL,
	[CDTDeal] [int] NULL,
	[CDTHotProsp] [int] NULL,
	[CDTLowProsp] [int] NULL,
	[CDTNotDeal] [int] NULL,
	[RxH1H1BuyOnly] [int] NULL,
	[RxH2H1FromOwn] [int] NULL,
	[RxH2H1FromOther] [int] NULL,
	[RxNewCust] [int] NULL,
	[RxSales] [int] NULL,
	[RxPctH1H2BuyOnlyPerFUH1H2BuyOnly] [decimal](4, 2) NULL,
	[RxPctH2H1OwnPerFUH2H1Own] [decimal](4, 2) NULL,
	[RxPctH2H1OtherPerFUH2H1Other] [decimal](4, 2) NULL,
	[RxPctH1H1BuyOnlyPerSales] [decimal](4, 2) NULL,
	[RxPctH2H1OwnPerSales] [decimal](4, 2) NULL,
	[RxPctH2H1OtherPerSales] [decimal](4, 2) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [FACT]
GO
/****** Object:  Table [dbo].[fact_Populasi]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_Populasi](
	[CustomerKey] [int] NULL,
	[RegionKey] [int] NULL,
	[VarianKey] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [FACT]
GO
/****** Object:  Table [dbo].[fact_Target]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_Target](
	[SalesDate] [date] NULL,
	[UnitKey] [int] NULL,
	[VarianKey] [int] NULL,
	[RegionKey] [int] NULL,
	[SellingTypeKey] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [FACT]
GO
/****** Object:  Table [dbo].[FactPenjualan]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPenjualan](
	[TrxId] [int] NOT NULL,
	[SalesDateKey] [int] NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[VarianKey] [int] NOT NULL,
	[ColorKey] [int] NOT NULL,
	[DealerKey] [int] NOT NULL,
	[MainDealerKey] [int] NOT NULL,
	[isCredit] [smallint] NULL,
	[LeasingKey] [int] NOT NULL,
	[RegionKey] [int] NOT NULL,
	[MerkSebelumnyaKey] [int] NOT NULL,
	[TypeSebelumnyaKey] [int] NOT NULL,
	[KegunaanKey] [int] NOT NULL,
	[PenggunaKey] [int] NOT NULL,
	[PendidikanKey] [int] NOT NULL,
	[PengeluaranKey] [int] NOT NULL,
	[AgeGroupKey] [int] NOT NULL,
	[PrevSalesDateKey] [int] NOT NULL,
	[isNewCustomer] [smallint] NULL,
	[FrameNo] [varchar](17) NULL,
	[KodeMesin] [varchar](19) NULL,
	[SequenMesin] [varchar](7) NULL,
	[BesarDP] [int] NULL,
	[BesarCicilan] [int] NULL,
	[LamaCicilan] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModfiedDate] [datetime] NULL
) ON [FACT]
GO
/****** Object:  Table [dbo].[mst_Dealer]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Dealer](
	[DealerCode] [nvarchar](255) NOT NULL,
	[NamaDealer] [nvarchar](255) NULL,
	[KotaDealer] [nvarchar](255) NULL,
	[PropinsiDealer] [nvarchar](255) NULL,
	[KecamatanDealer] [nvarchar](255) NULL,
	[KelurahanDealer] [nvarchar](255) NULL,
	[Longitude] [nvarchar](255) NULL,
	[Latitude] [nvarchar](255) NULL,
	[MainDealerCode] [nvarchar](255) NULL,
	[Channel] [nvarchar](255) NULL,
 CONSTRAINT [PK_mst_Dealer] PRIMARY KEY CLUSTERED 
(
	[DealerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MASTER]
) ON [MASTER]
GO
/****** Object:  Table [dbo].[mst_JumlahPenduduk]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_JumlahPenduduk](
	[Propinsi] [nvarchar](100) NULL,
	[KotaKab] [nvarchar](100) NULL,
	[Kecamatan] [nvarchar](100) NULL,
	[JumPenduduk] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL
) ON [MASTER]
GO
/****** Object:  Table [dbo].[mst_kabkota]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_kabkota](
	[KodeKabKota] [nvarchar](255) NOT NULL,
	[KabKotaName] [nvarchar](255) NULL,
	[KodePropinsi] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL
) ON [MASTER]
GO
/****** Object:  Table [dbo].[mst_Kecamatan]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Kecamatan](
	[KodeKecamatan] [nvarchar](255) NOT NULL,
	[KecamatanName] [nvarchar](255) NULL,
	[KodeKabKota] [nvarchar](255) NULL,
 CONSTRAINT [PK_mst_Kecamatan] PRIMARY KEY CLUSTERED 
(
	[KodeKecamatan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MASTER]
) ON [MASTER]
GO
/****** Object:  Table [dbo].[mst_Kelurahan]    Script Date: 14-November-2018 11:14:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Kelurahan](
	[KodeKelurahan] [nvarchar](255) NOT NULL,
	[KelurahanName] [nvarchar](255) NULL,
	[KodeKecamatan] [nvarchar](255) NULL,
 CONSTRAINT [PK_mst_Kelurahan] PRIMARY KEY CLUSTERED 
(
	[KodeKelurahan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MASTER]
) ON [MASTER]
GO
/****** Object:  Table [dbo].[mst_MainDealer]    Script Date: 14-November-2018 11:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_MainDealer](
	[MainDealerCode] [nvarchar](255) NOT NULL,
	[NamaMainDealer] [nvarchar](255) NULL,
	[Channel] [nvarchar](255) NULL,
 CONSTRAINT [PK_mst_MainDealer] PRIMARY KEY CLUSTERED 
(
	[MainDealerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MASTER]
) ON [MASTER]
GO
/****** Object:  Table [dbo].[mst_MappingRing]    Script Date: 14-November-2018 11:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_MappingRing](
	[DealerCode] [nvarchar](255) NOT NULL,
	[NamaDealer] [nvarchar](255) NULL,
	[DealerCategory] [nvarchar](255) NULL,
	[Kota] [nvarchar](255) NULL,
	[Kecamatan] [nvarchar](255) NULL,
	[Ring] [nvarchar](255) NULL,
 CONSTRAINT [PK_mst_MappingRing] PRIMARY KEY CLUSTERED 
(
	[DealerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MASTER]
) ON [MASTER]
GO
/****** Object:  Table [dbo].[mst_Propinsi]    Script Date: 14-November-2018 11:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Propinsi](
	[KodePropinsi] [nvarchar](255) NOT NULL,
	[NamaPropinsi] [nvarchar](255) NULL,
 CONSTRAINT [PK_mst_Propinsi] PRIMARY KEY CLUSTERED 
(
	[KodePropinsi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [MASTER]
) ON [MASTER]
GO
/****** Object:  Table [dbo].[mst_Varian]    Script Date: 14-November-2018 11:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Varian](
	[NamaVarian] [nvarchar](255) NULL
) ON [MASTER]
GO
/****** Object:  Table [dbo].[stg_CDBUSTK]    Script Date: 14-November-2018 11:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_CDBUSTK](
	[FrameNo] [nvarchar](100) NULL,
	[CustId] [nvarchar](100) NULL,
	[SaledDate] [date] NULL,
	[MachineCode] [nvarchar](100) NULL,
	[MachineNo] [nvarchar](100) NULL,
	[MachineSeq] [nvarchar](100) NULL,
	[TypeMotor] [nvarchar](100) NULL,
	[Color] [nvarchar](100) NULL,
	[CustCode] [nvarchar](100) NULL,
	[OwnerName] [nvarchar](255) NULL,
	[Gender] [nvarchar](10) NULL,
	[BOD] [date] NULL,
	[AddressKTP] [nvarchar](1000) NULL,
	[KelurahanKTP] [nvarchar](255) NULL,
	[KecamatanKTP] [nvarchar](255) NULL,
	[KotaKTP] [nvarchar](255) NULL,
	[KodePosKTP] [char](5) NULL,
	[PropinsiKTP] [nvarchar](100) NULL,
	[AlamatSurat] [nvarchar](100) NULL,
	[KelurahanSurat] [nvarchar](255) NULL,
	[KecamatanSurat] [nvarchar](255) NULL,
	[KotaSurat] [nvarchar](255) NULL,
	[KodePos] [char](5) NULL,
	[Propinsi] [nvarchar](100) NULL,
	[StatusRumah] [nvarchar](100) NULL,
	[Email] [nvarchar](255) NULL,
	[JnsPenjualanSTNK] [nvarchar](100) NULL,
	[JnsPenjualanSSU] [nvarchar](100) NULL,
	[LeasingCo] [nvarchar](100) NULL,
	[BesarDP] [int] NULL,
	[BesarCicilan] [int] NULL,
	[LamaCicilan] [int] NULL,
	[Agama] [nvarchar](100) NULL,
	[Profesi] [nvarchar](255) NULL,
	[Pengeluaran] [nvarchar](255) NULL,
	[Pendidikan] [nvarchar](100) NULL,
	[PenanggungJawabGC] [nvarchar](255) NULL,
	[NoHP] [nvarchar](30) NULL,
	[StatusNoHP] [nvarchar](100) NULL,
	[NoTelp] [nvarchar](30) NULL,
	[KebersediaanDihub] [nvarchar](3) NULL,
	[MerekMotorSebelumnya] [nvarchar](100) NULL,
	[TypeMotorSebelumnya] [nvarchar](100) NULL,
	[PeruntukkanSMH] [nvarchar](255) NULL,
	[YangMenggunakanSMH] [nvarchar](255) NULL,
	[MDCode] [nvarchar](100) NULL,
	[DealerCode] [nvarchar](100) NULL,
	[SalesPersonCode] [nvarchar](100) NULL,
	[TglMasukData] [date] NULL,
	[TglModifData] [date] NULL,
	[StatusValidasi] [nvarchar](5) NULL,
	[Facebook] [nvarchar](255) NULL,
	[Twitter] [nvarchar](255) NULL,
	[Instagram] [nvarchar](255) NULL,
	[Youtube] [nvarchar](255) NULL,
	[Hobi] [nvarchar](255) NULL,
	[Keterangan] [nvarchar](255) NULL,
	[RefCustId] [nvarchar](100) NULL,
	[Kewarganegaraan] [nvarchar](100) NULL,
	[NoKK] [nvarchar](100) NULL,
	[RepeatOrderKK] [nvarchar](5) NULL,
	[ReffId] [nvarchar](100) NULL,
	[RO_BD_ID] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_Dealer]    Script Date: 14-November-2018 11:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Dealer](
	[vnd_code] [varchar](100) NULL,
	[vnd_telp1] [varchar](100) NULL,
	[vnd_telp2] [varchar](100) NULL,
	[vnd_addr1] [varchar](100) NULL,
	[vnd_addr2] [varchar](100) NULL,
	[vnd_addr3] [varchar](100) NULL,
	[vnd_post] [varchar](100) NULL,
	[vnd_name] [varchar](100) NULL,
	[vnd_city] [varchar](100) NULL,
	[vend_vnd_code] [varchar](100) NULL,
	[channel] [varchar](100) NULL,
	[vnd_propinsi] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_DealerInf]    Script Date: 14-November-2018 11:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_DealerInf](
	[MainDealerCode] [nvarchar](10) NULL,
	[DealerCode] [nvarchar](10) NULL,
	[MainDealerName] [nvarchar](255) NULL,
	[DealerName] [nvarchar](255) NULL,
	[Period] [date] NULL,
	[Month] [char](2) NULL,
	[Year] [char](4) NULL,
	[Quarter] [int] NULL,
	[H2Ring1] [int] NULL,
	[H2Ring2] [int] NULL,
	[TotH123Ring1] [int] NULL,
	[TotH123Ring2To3] [int] NULL,
	[TotH1byH12Ring1] [int] NULL,
	[TotH1byH12Ring2To3] [int] NULL,
	[TotH23Ring1] [int] NULL,
	[TotH23Ring2To3] [int] NULL,
	[TotSalesPeople] [int] NULL,
	[TotSalesFU] [int] NULL,
	[TotSalesCounter] [int] NULL,
	[TotSalesCounterFU] [int] NULL,
	[TotTelemarketer] [int] NULL,
	[PctSalesWI] [nvarchar](10) NULL,
	[PctSalesCanv] [nvarchar](10) NULL,
	[PctSalesExhb] [nvarchar](10) NULL,
	[PctGrupCust] [nvarchar](10) NULL,
	[PctNonGrupCust] [nvarchar](10) NULL,
	[PctSalesRing1] [nvarchar](10) NULL,
	[PctSalesRing2] [nvarchar](10) NULL,
	[PctSalesRing3] [nvarchar](10) NULL,
	[TotPitServ] [int] NULL,
	[TotArmadaVisit] [int] NULL,
	[TotSA] [int] NULL,
	[TotMekanik] [int] NULL,
	[TotPosServ] [int] NULL,
	[AvgPartSoldPerMonth] [int] NULL,
	[PctAvgUnitEntryRing1] [nvarchar](10) NULL,
	[PctAvgUnitEntryRing2] [nvarchar](10) NULL,
	[PctAvgUnitEntryRing3] [nvarchar](10) NULL,
	[PctKPB1Ring1] [nvarchar](10) NULL,
	[PctKPB1Ring2] [nvarchar](10) NULL,
	[PctKPB1Ring3] [nvarchar](10) NULL,
	[PctKPB2Ring1] [nvarchar](10) NULL,
	[PctKPB2Ring2] [nvarchar](10) NULL,
	[PctKPB2Ring3] [nvarchar](10) NULL,
	[PctKPB3Ring1] [nvarchar](10) NULL,
	[PctKPB3Ring2] [nvarchar](10) NULL,
	[PctKPB3Ring3] [nvarchar](10) NULL,
	[PctKPB4Ring1] [nvarchar](10) NULL,
	[PctKPB4Ring2] [nvarchar](10) NULL,
	[PctKPB4Ring3] [nvarchar](10) NULL,
	[PctRegServRing1] [nvarchar](10) NULL,
	[PctRegServRing2] [nvarchar](10) NULL,
	[PctRegServRing3] [nvarchar](10) NULL,
	[TotSales] [int] NULL,
	[TotROSales] [int] NULL,
	[KPB1Own] [int] NULL,
	[KPB2Own] [int] NULL,
	[KPB3Own] [int] NULL,
	[KPB4Own] [int] NULL,
	[UnitEntryKPB1] [int] NULL,
	[UnitEntryKPB2] [int] NULL,
	[UnitEntryKPB3] [int] NULL,
	[UnitEntryKPB4] [int] NULL,
	[UnitEntryRegular] [int] NULL,
	[TotUnitEntry] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_H1H2]    Script Date: 14-November-2018 11:14:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_H1H2](
	[Period] [date] NULL,
	[MainDealerCode] [nvarchar](10) NULL,
	[DealerCode] [nvarchar](10) NULL,
	[MainDealerName] [nvarchar](255) NULL,
	[DealerName] [nvarchar](255) NULL,
	[ServiceType] [nvarchar](10) NULL,
	[Month] [char](2) NULL,
	[Year] [char](4) NULL,
	[TotalDataSource] [int] NULL,
	[PhoneNoAvailable] [int] NULL,
	[SMSSent] [int] NULL,
	[SMSSentPct] [nvarchar](10) NULL,
	[SMSFail] [int] NULL,
	[SMSFailPct] [nvarchar](10) NULL,
	[FstResServ] [int] NULL,
	[FstResNotYetServ] [int] NULL,
	[FstResServPct] [nvarchar](10) NULL,
	[FstResNotYetServPct] [nvarchar](10) NULL,
	[Contacted] [int] NULL,
	[NotContacted] [int] NULL,
	[Unreachable] [int] NULL,
	[Rejected] [int] NULL,
	[Workload] [int] NULL,
	[ContactedPct] [nvarchar](10) NULL,
	[UnreachablePct] [nvarchar](10) NULL,
	[RejectedPct] [nvarchar](10) NULL,
	[WorkloadPct] [nvarchar](10) NULL,
	[SndResServ] [int] NULL,
	[SndResNotServ] [int] NULL,
	[TooFar] [int] NULL,
	[NoTime] [int] NULL,
	[Forget] [int] NULL,
	[ServToOther] [int] NULL,
	[SndResServPct] [nvarchar](10) NULL,
	[TooFarPct] [nvarchar](10) NULL,
	[NoTimePct] [nvarchar](10) NULL,
	[ForgetPct] [nvarchar](10) NULL,
	[TotalVisitorKPB] [int] NULL,
	[TotalVisitorKPBPct] [nvarchar](10) NULL,
	[RxOwnDealer] [int] NULL,
	[RxAll] [int] NULL,
	[RxUnitEntry] [int] NULL,
	[RxSales] [int] NULL,
	[RxPctOwnByAll] [nvarchar](10) NULL,
	[RxPctOwnByUnitEntry] [nvarchar](10) NULL,
	[RxPctOwnBySales] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_H2H1]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_H2H1](
	[MainDealerCode] [nvarchar](10) NULL,
	[DealerCode] [nvarchar](10) NULL,
	[MainDealerName] [nvarchar](255) NULL,
	[DealerName] [nvarchar](255) NULL,
	[Month] [char](2) NULL,
	[Year] [char](4) NULL,
	[DataSourceType] [nvarchar](255) NULL,
	[TotDataSource] [int] NULL,
	[TotDataBaseOnAnalysis] [int] NULL,
	[SMSSent] [int] NULL,
	[SMSSentPct] [nvarchar](10) NULL,
	[SMSFail] [int] NULL,
	[SMSFailPct] [nvarchar](10) NULL,
	[WorkloadM1] [int] NULL,
	[TotFUC] [int] NULL,
	[FUCContacted] [int] NULL,
	[FUCContactedPct] [nvarchar](10) NULL,
	[FUCUnreach] [int] NULL,
	[FUCUnreachPct] [nvarchar](10) NULL,
	[FUCReject] [int] NULL,
	[FUCRejectPct] [nvarchar](10) NULL,
	[FUCWorklo] [int] NULL,
	[FUCWorkloPct] [nvarchar](10) NULL,
	[ProspectM2] [int] NULL,
	[ProspectM1] [int] NULL,
	[ProspectM] [int] NULL,
	[NotProspect] [int] NULL,
	[TotProspect] [int] NULL,
	[TotProspectPct] [nvarchar](10) NULL,
	[DTDeal] [int] NULL,
	[DTHotProsp] [int] NULL,
	[DTLowProsp] [int] NULL,
	[DTNotDeal] [int] NULL,
	[DTDealPct] [nvarchar](10) NULL,
	[DTHotProspPct] [nvarchar](10) NULL,
	[DTLowProspPct] [nvarchar](10) NULL,
	[DTNotDealPct] [nvarchar](10) NULL,
	[TUSDeal] [int] NULL,
	[TUSDealPct] [nvarchar](10) NULL,
	[TDPM2] [int] NULL,
	[TDPM1] [int] NULL,
	[TDPM] [int] NULL,
	[CDT] [int] NULL,
	[CDTDeal] [int] NULL,
	[CDTHotProsp] [int] NULL,
	[CDTLowProsp] [int] NULL,
	[CDTNotDeal] [int] NULL,
	[RxH1H1BuyOnly] [int] NULL,
	[RxH2H1FromOwn] [int] NULL,
	[RxH2H1FromOther] [int] NULL,
	[RxNewCust] [int] NULL,
	[RxSales] [int] NULL,
	[RxPctH1H1BuyOnlyPerFUH1H1BuyOnly] [nvarchar](10) NULL,
	[RxPctH2H1OwnPerFUH2H1Own] [nvarchar](10) NULL,
	[RxPctH2H1OtherPerFUH2H1Other] [nvarchar](10) NULL,
	[RxPctH1H1BuyOnlyPerSales] [nvarchar](10) NULL,
	[RxPctH2H1OwnPerSales] [nvarchar](10) NULL,
	[RxPctH2H1OtherPerSales] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_MappingRing]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_MappingRing](
	[DealerCode] [varchar](10) NULL,
	[DealerName] [varchar](100) NULL,
	[DealerCategory] [varchar](15) NULL,
	[Kecamatan] [varchar](100) NULL,
	[Ring] [varchar](10) NULL,
	[Kota] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_Professions]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Professions](
	[Profession_Code] [varchar](10) NULL,
	[Profession_Description] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_Varian]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_Varian](
	[VarianName] [nvarchar](100) NULL,
	[Type] [nvarchar](100) NULL,
	[Model] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_excel]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_excel](
	[MainDealerName] [nvarchar](100) NULL,
	[DealerName] [nvarchar](100) NULL,
	[ActionId] [int] NULL,
	[Action] [nvarchar](100) NULL,
	[H1toH1BuyOnly] [int] NULL,
	[H2toH1OwnDealer] [int] NULL,
	[H2toH1OtherDealer] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_excelDealerInf]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_excelDealerInf](
	[Period] [date] NULL,
	[MainDealerCode] [varchar](10) NULL,
	[DealerCode] [varchar](10) NULL,
	[MainDealerName] [varchar](255) NULL,
	[DealerName] [varchar](255) NULL,
	[TotSalesPeople] [int] NULL,
	[TotSalesFU] [int] NULL,
	[TotSalesCounter] [int] NULL,
	[TotSalesCounterFU] [int] NULL,
	[TotTelemarketer] [int] NULL,
	[PctSalesWI] [varchar](10) NULL,
	[PctSalesCanv] [varchar](10) NULL,
	[PctSalesExhb] [varchar](10) NULL,
	[PctGrupCust] [varchar](10) NULL,
	[PctNonGrupCust] [varchar](10) NULL,
	[PctSalesRing1] [varchar](10) NULL,
	[PctSalesRing2] [varchar](10) NULL,
	[PctSalesRing3] [varchar](10) NULL,
	[TotPitServ] [int] NULL,
	[TotArmadaVisit] [int] NULL,
	[TotSA] [int] NULL,
	[TotMekanik] [int] NULL,
	[TotPosServ] [int] NULL,
	[AvgPartSoldPerMonth] [int] NULL,
	[PctAvgUnitEntryRing1] [varchar](10) NULL,
	[PctAvgUnitEntryRing2] [varchar](10) NULL,
	[PctAvgUnitEntryRing3] [varchar](10) NULL,
	[PctKPB1Ring1] [varchar](10) NULL,
	[PctKPB1Ring2] [varchar](10) NULL,
	[PctKPB1Ring3] [varchar](10) NULL,
	[PctKPB2Ring1] [varchar](10) NULL,
	[PctKPB2Ring2] [varchar](10) NULL,
	[PctKPB2Ring3] [varchar](10) NULL,
	[PctKPB3Ring1] [varchar](10) NULL,
	[PctKPB3Ring2] [varchar](10) NULL,
	[PctKPB3Ring3] [varchar](10) NULL,
	[PctKPB4Ring1] [varchar](10) NULL,
	[PctKPB4Ring2] [varchar](10) NULL,
	[PctKPB4Ring3] [varchar](10) NULL,
	[PctRegServRing1] [varchar](10) NULL,
	[PctRegServRing2] [varchar](10) NULL,
	[PctRegServRing3] [varchar](10) NULL,
	[TotSales] [int] NULL,
	[TotROSales] [int] NULL,
	[TotUnitEntry] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_excelH1H2]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_excelH1H2](
	[Period] [date] NULL,
	[MainDealerCode] [varchar](20) NULL,
	[MainDealerName] [varchar](100) NULL,
	[DealerCode] [varchar](20) NULL,
	[DealerName] [varchar](100) NULL,
	[ActionId] [int] NULL,
	[Action] [varchar](100) NULL,
	[KPB1] [int] NULL,
	[KPB2] [int] NULL,
	[KPB3] [int] NULL,
	[KPB4] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_excelH2H1]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_excelH2H1](
	[Period] [date] NULL,
	[MainDealerCode] [varchar](20) NULL,
	[MainDealerName] [varchar](100) NULL,
	[DealerCode] [varchar](20) NULL,
	[DealerName] [varchar](100) NULL,
	[ActionId] [int] NULL,
	[Action] [varchar](100) NULL,
	[H1toH1BuyOnly] [int] NULL,
	[H2toH1OwnDealer] [int] NULL,
	[H2toH1OtherDealer] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_RegionFiller]    Script Date: 14-November-2018 11:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================================
-- Author:		Didik Widiatmono
-- Create date: 05 September 2018
-- Description:	Stored Procedure to export from master tables to Region table
-- ===========================================================================
CREATE PROCEDURE [dbo].[usp_RegionFiller]
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO dbo.dim_Region (KotaKab, Kecamatan, Kelurahan, Propinsi, CreatedDate)
	SELECT 
		k.KabKotaName, c.KecamatanName, l.KelurahanName, p.NamaPropinsi, '2018/09/05'
	FROM 
		mst_kabkota k INNER JOIN mst_Propinsi p ON k.KodePropinsi = p.KodePropinsi
		INNER JOIN mst_Kecamatan c ON c.KodeKabKota = k.KodeKabKota
		INNER JOIN mst_Kelurahan l ON l.KodeKecamatan = c.KodeKecamatan
	WHERE c.KecamatanName <> 'Uncategorized' AND l.KelurahanName <> 'Uncategorized' AND k.KabKotaName <> 'Uncategorized'
END
GO
USE [master]
GO
ALTER DATABASE [CDBAHM] SET  READ_WRITE 
GO
