USE [APPAnimesDB]
GO
/****** Object:  StoredProcedure [dbo].[QueryAllTablesProc]    Script Date: 28/05/2021 12:36:58 ******/
DROP PROCEDURE [dbo].[QueryAllTablesProc]
GO
ALTER TABLE [dbo].[Temporadas] DROP CONSTRAINT [FK_Temporadas_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada]
GO
ALTER TABLE [dbo].[Temporadas] DROP CONSTRAINT [FK_Temporadas_Animes]
GO
ALTER TABLE [dbo].[Historial] DROP CONSTRAINT [FK_Historial_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada]
GO
ALTER TABLE [dbo].[Historial] DROP CONSTRAINT [FK_Historial_Animes]
GO
/****** Object:  Index [IX_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada]    Script Date: 28/05/2021 12:36:58 ******/
DROP INDEX [IX_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] ON [dbo].[Temporadas]
GO
/****** Object:  Index [IX_Historial_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada]    Script Date: 28/05/2021 12:36:58 ******/
DROP INDEX [IX_Historial_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] ON [dbo].[Historial]
GO
/****** Object:  Table [dbo].[Temporadas]    Script Date: 28/05/2021 12:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temporadas]') AND type in (N'U'))
DROP TABLE [dbo].[Temporadas]
GO
/****** Object:  Table [dbo].[Historial]    Script Date: 28/05/2021 12:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Historial]') AND type in (N'U'))
DROP TABLE [dbo].[Historial]
GO
/****** Object:  Table [dbo].[Animes]    Script Date: 28/05/2021 12:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Animes]') AND type in (N'U'))
DROP TABLE [dbo].[Animes]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28/05/2021 12:36:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
USE [master]
GO
/****** Object:  Database [APPAnimesDB]    Script Date: 28/05/2021 12:36:58 ******/
DROP DATABASE [APPAnimesDB]
GO
/****** Object:  Database [APPAnimesDB]    Script Date: 28/05/2021 12:36:58 ******/
CREATE DATABASE [APPAnimesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'APPAnimesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\APPAnimesDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'APPAnimesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\APPAnimesDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [APPAnimesDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [APPAnimesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [APPAnimesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [APPAnimesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [APPAnimesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [APPAnimesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [APPAnimesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [APPAnimesDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [APPAnimesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [APPAnimesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [APPAnimesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [APPAnimesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [APPAnimesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [APPAnimesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [APPAnimesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [APPAnimesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [APPAnimesDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [APPAnimesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [APPAnimesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [APPAnimesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [APPAnimesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [APPAnimesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [APPAnimesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [APPAnimesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [APPAnimesDB] SET RECOVERY FULL 
GO
ALTER DATABASE [APPAnimesDB] SET  MULTI_USER 
GO
ALTER DATABASE [APPAnimesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [APPAnimesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [APPAnimesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [APPAnimesDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [APPAnimesDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [APPAnimesDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'APPAnimesDB', N'ON'
GO
ALTER DATABASE [APPAnimesDB] SET QUERY_STORE = OFF
GO
USE [APPAnimesDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28/05/2021 12:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animes]    Script Date: 28/05/2021 12:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animes](
	[id_anime] [int] IDENTITY(4,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[genero] [varchar](100) NULL,
	[nombre_en_ingles] [varchar](255) NULL,
 CONSTRAINT [PK_Animes] PRIMARY KEY CLUSTERED 
(
	[id_anime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial]    Script Date: 28/05/2021 12:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial](
	[id_historial] [int] IDENTITY(1,1) NOT NULL,
	[id_anime] [int] NOT NULL,
	[id_temp] [int] NOT NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[fecha_pausa] [datetime] NULL,
	[visto_en] [varchar](200) NULL,
	[IdTemporadaNavigationIdAnime] [int] NULL,
	[IdTemporadaNavigationIdTemporada] [int] NULL,
 CONSTRAINT [PK_Historial] PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temporadas]    Script Date: 28/05/2021 12:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temporadas](
	[id_anime] [int] NOT NULL,
	[id_temporada] [int] NOT NULL,
	[nombre_temporada] [varchar](500) NULL,
	[estado] [varchar](500) NULL,
	[tipo] [varchar](50) NULL,
	[temporada_estreno] [varchar](400) NULL,
	[IdTemporadaNavigationIdAnime] [int] NULL,
	[IdTemporadaNavigationIdTemporada] [int] NULL,
 CONSTRAINT [PK_Temporadas] PRIMARY KEY CLUSTERED 
(
	[id_anime] ASC,
	[id_temporada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210412120009_MigracionAnimesDBInicial', N'5.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210422175625_UnionHistorialTemporadas', N'5.0.4')
GO
SET IDENTITY_INSERT [dbo].[Animes] ON 

INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (1, N'Another', N'Gore', NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (2, N'Araburu Kisetsu no Otome-domo yo', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (3, N'BNA', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (4, N'Boku no Hero Academia', N'Shounen', NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (5, N'Charlotte', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (6, N'Devilman: Crybaby', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (7, N'Domestic na Kanojo', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (8, N'Dr. Stone', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (9, N'Dumbbell Nan Kilo Moteru', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (10, N'Eizouken ni wa Te wo Dasu na!', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (11, N'Eromanga-sensei', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (12, N'Gleipnir', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (13, N'Himouto! Umaru-chan', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (14, N'Hitoribocchi no Marumaru Seikatsu', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (15, N'Jashin-chan Dropkick', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (16, N'Kaguya-sama wa Kokurasetai: Tensai-tachi no Renai Zunousen', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (17, N'Kakushigoto', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (18, N'Kami no Tou', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (19, N'Karigurashi no Arrietty', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (20, N'Kimetsu no Yaiba', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (21, N'Kimi no Na wa', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (22, N'Kiseijuu: Sei no Kakuritsu', N'Gore', NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (23, N'Kobayashi-san Chi no Maid Dragon', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (24, N'Koe no Katachi', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (25, N'Kono Subarashii Sekai ni Shukufuku wo!', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (26, N'Little Witch Academia', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (27, N'Mahou Shoujo Madoka Magica', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (28, N'Mahou Shoujo Nante Mou Ii Desukara', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (29, N'Mirai Nikki', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (30, N'Murenase! Seton Gakuen', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (31, N'Nanatsu no Taizai', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (32, N'Naruto', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (33, N'Nisekoi', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (34, N'No Game No Life', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (35, N'Ookami Kodomo no Ame to Yuki', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (36, N'Ore wo Suki nano wa Omae dake ka yo', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (37, N'Sen to Chihiro no Kamikakushi', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (38, N'Shigatsu wa Kimi no Uso', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (39, N'Shinchou Yuusha: Kono Yuusha ga Ore Tueee Kuse ni Shinchou Sugiru', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (40, N'Shingeki no Kyojin', N'Shounen', N'Attack on Titan')
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (41, N'Somali to Mori no Kamisama', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (42, N'Sunohara-sou no Kanrinin-san', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (43, N'Sword Art Online', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (44, N'The God of High School', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (45, N'Toki wo Kakeru Shoujo', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (46, N'Tokyo Ghoul', N'Gore', NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (47, N'Umineko no Naku Koro ni', N'Gore', NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (48, N'Uzaki-chan wa Asobitai', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (49, N'Val x Love', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (50, N'Yakusoku no Neverland', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (51, N'Death Note', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (52, N'Elfen Lied', N'Gore', NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (53, N'Higurashi No Naku Koro Ni', N'Gore', NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (54, N'Inazuma Eleven', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (56, N'Angel Beats', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (1056, N'Mushoku Tensei: Isekai Ittara Honki Dasu', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (2056, N'Wonder Egg Priority', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (2057, N'Black Clover', NULL, NULL)
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (2058, N'Ijiranaide Nagatoro-San', N'Comedia', N'Dont Toy With Me, Miss Nagatoro')
INSERT [dbo].[Animes] ([id_anime], [nombre], [genero], [nombre_en_ingles]) VALUES (2059, N'Sakura Card Captor', N'Magia', NULL)
SET IDENTITY_INSERT [dbo].[Animes] OFF
GO
SET IDENTITY_INSERT [dbo].[Historial] ON 

INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (1, 53, 1, CAST(N'2018-07-01T00:00:00.000' AS DateTime), CAST(N'2018-07-30T00:00:00.000' AS DateTime), NULL, N'AnimeFLV', 53, 1)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (2, 53, 1, CAST(N'2021-02-10T22:00:00.000' AS DateTime), CAST(N'2021-02-15T12:53:12.150' AS DateTime), NULL, N'Netflix', 53, 1)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4, 53, 2, CAST(N'2020-02-14T00:00:00.000' AS DateTime), CAST(N'2020-02-16T00:00:00.000' AS DateTime), NULL, NULL, 53, 2)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (1002, 56, 1, CAST(N'2021-03-07T23:17:02.667' AS DateTime), CAST(N'2021-04-17T23:18:00.000' AS DateTime), NULL, N'Netflix', 56, 1)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (2002, 1056, 1, CAST(N'2021-01-24T01:02:00.730' AS DateTime), CAST(N'2021-03-22T02:28:42.620' AS DateTime), NULL, NULL, 1056, 1)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (3002, 4, 5, CAST(N'2021-03-27T16:40:58.913' AS DateTime), NULL, NULL, NULL, 4, 5)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (3005, 53, 3, CAST(N'2021-02-14T00:48:00.000' AS DateTime), CAST(N'2021-02-16T03:07:00.000' AS DateTime), NULL, NULL, 53, 3)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (3006, 53, 4, CAST(N'2020-10-01T19:58:00.000' AS DateTime), CAST(N'2021-03-18T20:40:00.000' AS DateTime), NULL, NULL, 53, 4)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (3007, 40, 4, CAST(N'2020-12-07T01:43:00.000' AS DateTime), CAST(N'2021-03-28T23:24:40.737' AS DateTime), NULL, NULL, 40, 4)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4007, 2056, 1, CAST(N'2021-01-23T18:01:00.000' AS DateTime), CAST(N'2021-03-31T13:04:39.177' AS DateTime), NULL, NULL, 2056, 1)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4008, 2057, 1, CAST(N'2020-01-28T21:51:00.000' AS DateTime), CAST(N'2021-04-01T00:43:58.103' AS DateTime), NULL, NULL, 2057, 1)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4009, 40, 1, CAST(N'2020-07-10T14:06:56.920' AS DateTime), CAST(N'2020-07-10T14:07:01.930' AS DateTime), NULL, NULL, 40, 1)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4010, 40, 2, CAST(N'2020-07-14T14:07:16.060' AS DateTime), CAST(N'2020-07-14T14:07:20.600' AS DateTime), NULL, NULL, 40, 2)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4011, 40, 3, CAST(N'2020-07-15T01:46:00.000' AS DateTime), CAST(N'2020-07-17T02:45:00.000' AS DateTime), NULL, NULL, 40, 3)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (5009, 2058, 1, CAST(N'2021-04-11T19:24:38.890' AS DateTime), NULL, NULL, NULL, 2058, 1)
INSERT [dbo].[Historial] ([id_historial], [id_anime], [id_temp], [fecha_inicio], [fecha_fin], [fecha_pausa], [visto_en], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (6010, 2059, 1, CAST(N'2021-04-30T22:30:00.000' AS DateTime), NULL, NULL, N'Netflix', 2059, 1)
SET IDENTITY_INSERT [dbo].[Historial] OFF
GO
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (1, 1, NULL, N'Visto', N'SERIE', N'Invierno 2012', NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (2, 1, NULL, N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (3, 1, NULL, N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4, 1, N'Temporada 1', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4, 2, N'Temporada 2', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4, 3, N'Temporada 3', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4, 4, N'Temporada 4', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (4, 5, N'Temporada 5', N'Viendo', N'SERIE', N'Primavera 2021', NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (5, 1, NULL, N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (6, 1, NULL, N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (7, 1, NULL, N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (8, 1, N'Temporada 1', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (9, 1, N'Temporada 1', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (10, 1, N'Temporada 1', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (11, 1, N'Temporada 1', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (12, 1, N'Temporada 1', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (13, 1, NULL, N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (40, 1, N'Temporada 1', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (40, 2, N'Temporada 2', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (40, 3, N'Temporada 3', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (40, 4, N'Temporada 4 The Final Season', N'Visto', N'SERIE', N'Invierno 2020', NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (53, 1, NULL, N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (53, 2, N'Kai', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (53, 3, N'Rei', N'Visto', N'OVA', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (53, 4, N'Gou', N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (56, 1, NULL, N'Visto', N'SERIE', NULL, NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (1056, 1, N'Temporada 1', N'Visto', N'SERIE', N'Invierno 2020', NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (2056, 1, N'Temporada 1', N'Visto', N'SERIE', N'Invierno 2021', NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (2057, 1, NULL, N'Visto', N'SERIE', N'Otoño 2017', NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (2058, 1, N'Temporada 1', N'Viendo', N'Serie', N'Primavera 2021', NULL, NULL)
INSERT [dbo].[Temporadas] ([id_anime], [id_temporada], [nombre_temporada], [estado], [tipo], [temporada_estreno], [IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada]) VALUES (2059, 1, N'Temporada 1', N'Viendo', N'Serie', NULL, NULL, NULL)
GO
/****** Object:  Index [IX_Historial_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada]    Script Date: 28/05/2021 12:36:59 ******/
CREATE NONCLUSTERED INDEX [IX_Historial_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] ON [dbo].[Historial]
(
	[IdTemporadaNavigationIdAnime] ASC,
	[IdTemporadaNavigationIdTemporada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada]    Script Date: 28/05/2021 12:36:59 ******/
CREATE NONCLUSTERED INDEX [IX_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] ON [dbo].[Temporadas]
(
	[IdTemporadaNavigationIdAnime] ASC,
	[IdTemporadaNavigationIdTemporada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Historial]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Animes] FOREIGN KEY([id_anime])
REFERENCES [dbo].[Animes] ([id_anime])
GO
ALTER TABLE [dbo].[Historial] CHECK CONSTRAINT [FK_Historial_Animes]
GO
ALTER TABLE [dbo].[Historial]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] FOREIGN KEY([IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada])
REFERENCES [dbo].[Temporadas] ([id_anime], [id_temporada])
GO
ALTER TABLE [dbo].[Historial] CHECK CONSTRAINT [FK_Historial_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada]
GO
ALTER TABLE [dbo].[Temporadas]  WITH CHECK ADD  CONSTRAINT [FK_Temporadas_Animes] FOREIGN KEY([id_anime])
REFERENCES [dbo].[Animes] ([id_anime])
GO
ALTER TABLE [dbo].[Temporadas] CHECK CONSTRAINT [FK_Temporadas_Animes]
GO
ALTER TABLE [dbo].[Temporadas]  WITH CHECK ADD  CONSTRAINT [FK_Temporadas_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada] FOREIGN KEY([IdTemporadaNavigationIdAnime], [IdTemporadaNavigationIdTemporada])
REFERENCES [dbo].[Temporadas] ([id_anime], [id_temporada])
GO
ALTER TABLE [dbo].[Temporadas] CHECK CONSTRAINT [FK_Temporadas_Temporadas_IdTemporadaNavigationIdAnime_IdTemporadaNavigationIdTemporada]
GO
/****** Object:  StoredProcedure [dbo].[QueryAllTablesProc]    Script Date: 28/05/2021 12:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[QueryAllTablesProc] AS
    SELECT * FROM dbo.Animes ORDER BY id_anime asc;
    SELECT * FROM dbo.Temporadas ORDER BY id_anime asc;
    SELECT * FROM dbo.Historial ORDER BY id_anime asc;
GO
USE [master]
GO
ALTER DATABASE [APPAnimesDB] SET  READ_WRITE 
GO
