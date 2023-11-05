USE [master]
GO
/****** Object:  Database [LibraryManagementDb]    Script Date: 11/4/2023 8:15:24 PM ******/
CREATE DATABASE [LibraryManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LOCALHOST\MSSQL\DATA\LibraryManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LOCALHOST\MSSQL\DATA\LibraryManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LibraryManagementDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagementDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LibraryManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagementDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryManagementDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [LibraryManagementDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LibraryManagementDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/4/2023 8:15:24 PM ******/
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
/****** Object:  Table [dbo].[Author]    Script Date: 11/4/2023 8:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/4/2023 8:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231104015917_InitialMigration', N'7.0.13')
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([Id], [Name]) VALUES (1, N'Gabriel Gracia Marquez')
INSERT [dbo].[Author] ([Id], [Name]) VALUES (2, N'Rafael Pombo')
INSERT [dbo].[Author] ([Id], [Name]) VALUES (3, N'Alvaro Mutis')
INSERT [dbo].[Author] ([Id], [Name]) VALUES (4, N'Jorge Isaacs')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Title], [AuthorId]) VALUES (1, N'La nieve del almirante', 3)
INSERT [dbo].[Book] ([Id], [Title], [AuthorId]) VALUES (2, N'Del amor y otros demonios', 1)
INSERT [dbo].[Book] ([Id], [Title], [AuthorId]) VALUES (3, N'María', 4)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
/****** Object:  Index [IX_Book_AuthorId]    Script Date: 11/4/2023 8:15:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_Book_AuthorId] ON [dbo].[Book]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author_AuthorId]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagementDb] SET  READ_WRITE 
GO
