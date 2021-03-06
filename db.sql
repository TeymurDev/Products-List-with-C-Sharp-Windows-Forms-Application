USE [master]
GO
/****** Object:  Database [Products310]    Script Date: 1/17/2020 2:46:30 AM ******/
CREATE DATABASE [Products310]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Products310', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Products310.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Products310_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Products310_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Products310] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Products310].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Products310] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Products310] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Products310] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Products310] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Products310] SET ARITHABORT OFF 
GO
ALTER DATABASE [Products310] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Products310] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Products310] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Products310] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Products310] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Products310] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Products310] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Products310] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Products310] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Products310] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Products310] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Products310] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Products310] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Products310] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Products310] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Products310] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Products310] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Products310] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Products310] SET  MULTI_USER 
GO
ALTER DATABASE [Products310] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Products310] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Products310] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Products310] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Products310] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Products310] SET QUERY_STORE = OFF
GO
USE [Products310]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/17/2020 2:46:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/17/2020 2:46:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (1, N'Notebooks')
GO
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (2, N'PC')
GO
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (3, N'Accessories')
GO
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (4, N'Other')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (1, N'ASUS ROG', 1)
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (2, N'DELL G7', 1)
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (3, N'AlienWare', 1)
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (4, N'DELL PC', 2)
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (5, N'MAC PC', 2)
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (6, N'MAC Pro PC', 2)
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (7, N'Keyboard', 3)
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (8, N'Mouse', 3)
GO
INSERT [dbo].[Products] ([Id], [ProductName], [CategoryId]) VALUES (9, N'Backpack', 3)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Products310] SET  READ_WRITE 
GO
