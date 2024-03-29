USE [master]
GO
/****** Object:  Database [ITDeviceManagementSystem]    Script Date: 8/4/2022 10:20:37 PM ******/
CREATE DATABASE [ITDeviceManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITDeviceManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVERMS\MSSQL\DATA\ITDeviceManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ITDeviceManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVERMS\MSSQL\DATA\ITDeviceManagementSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ITDeviceManagementSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITDeviceManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITDeviceManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITDeviceManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ITDeviceManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ITDeviceManagementSystem]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[userID] [nvarchar](20) NOT NULL,
	[userName] [nvarchar](30) NOT NULL,
	[mail] [nvarchar](35) NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[position] [nchar](20) NOT NULL,
	[roleID] [nvarchar](10) NOT NULL,
	[deposit] [int] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brand]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brandID] [int] IDENTITY(1,1) NOT NULL,
	[cateID] [nvarchar](10) NOT NULL,
	[brandName] [nvarchar](50) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cateID] [nvarchar](10) NOT NULL,
	[cateName] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[description]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[description](
	[descriptionID] [int] IDENTITY(1,1) NOT NULL,
	[descriptionName] [nvarchar](50) NOT NULL,
	[cateID] [nvarchar](10) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_description] PRIMARY KEY CLUSTERED 
(
	[descriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[descriptionDetail]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[descriptionDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[descriptionID] [int] NOT NULL,
	[detailName] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_descriptionDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[device]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[device](
	[deviceID] [int] IDENTITY(1,1) NOT NULL,
	[deviceName] [nvarchar](50) NOT NULL,
	[warehouseID] [int] NOT NULL,
	[brandID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[cateID] [nvarchar](10) NOT NULL,
	[url] [nvarchar](300) NULL,
	[deposit] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_device] PRIMARY KEY CLUSTERED 
(
	[deviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[device_description]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[device_description](
	[device_descriptionID] [int] IDENTITY(1,1) NOT NULL,
	[deviceID] [int] NOT NULL,
	[detailID] [int] NOT NULL,
 CONSTRAINT [PK_device_description] PRIMARY KEY CLUSTERED 
(
	[device_descriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[message]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[messageID] [int] NOT NULL,
	[requestID] [int] NOT NULL,
	[message] [nvarchar](200) NOT NULL,
	[extendDate] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[request]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](20) NOT NULL,
	[requestDate] [date] NOT NULL,
	[requestStatus] [nvarchar](15) NOT NULL,
	[substance] [nvarchar](30) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_requestList] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[requestDetail]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[requestID] [int] NOT NULL,
	[deviceID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[borrowDate] [date] NULL,
	[expiredDate] [date] NULL,
	[detailStatus] [nvarchar](15) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_detailRentalList] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[returned]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[returned](
	[returnID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](20) NOT NULL,
	[requestID] [int] NOT NULL,
	[deviceID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[returnDate] [date] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_returnList] PRIMARY KEY CLUSTERED 
(
	[returnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleID] [nvarchar](10) NOT NULL,
	[roleName] [nvarchar](20) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[warehouse]    Script Date: 8/4/2022 10:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warehouse](
	[warehouseID] [int] IDENTITY(1,1) NOT NULL,
	[warehouseName] [nvarchar](30) NOT NULL,
	[location] [nvarchar](30) NOT NULL,
	[limitAmount] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_warehouse] PRIMARY KEY CLUSTERED 
(
	[warehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Accounts] ([userID], [userName], [mail], [phone], [position], [roleID], [deposit], [status]) VALUES (N'SE150080', N'Huynh Trung Duong', N'duonghtse150080@fpt.edu.vn', N'0838251655', N'Student             ', N'US', 0, 1)
INSERT [dbo].[Accounts] ([userID], [userName], [mail], [phone], [position], [roleID], [deposit], [status]) VALUES (N'SE150123', N'Duong Quang Hung', N'hungdqse150123@fpt.edu.vn', N'0842525128', N'ManageDevice        ', N'MD', NULL, 1)
INSERT [dbo].[Accounts] ([userID], [userName], [mail], [phone], [position], [roleID], [deposit], [status]) VALUES (N'SE150137', N'Pham Ngoc Thien', N'thienpnse150137@fpt.edu.vn', N'0952425125', N'Student             ', N'AD', NULL, 1)
INSERT [dbo].[Accounts] ([userID], [userName], [mail], [phone], [position], [roleID], [deposit], [status]) VALUES (N'SE150425', N'Pham Huu Anh Tai', N'taiphase151032@fpt.edu.vn ', N'0838452631', N'Student             ', N'AD', NULL, 1)
INSERT [dbo].[Accounts] ([userID], [userName], [mail], [phone], [position], [roleID], [deposit], [status]) VALUES (N'SE151402', N'Vu Manh Cuong', N'cuongvmse151402@fpt.edu.vn', N'0888358309', N'ManageRequest       ', N'MR', NULL, 1)
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (1, N'LT', N'Asus', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (2, N'LT', N'Dell', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (3, N'CM', N'Canon', 0)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (10, N'CM', N'Sony', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (11, N'CM', N'Nikon', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (15, N'LT', N'HP', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (16, N'LT', N'MSI', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (17, N'LT ', N'Lenovo', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (18, N'LT', N'Acer', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (20, N'CM', N'Kodak', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (21, N'CM', N'Olymbuss', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (22, N'CM', N'Fujifilm', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (23, N'TL', N'Lenovo', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (24, N'TL', N'Masstel', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (25, N'TL', N'Xiaomi', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (26, N'TL', N'Nokia', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (27, N'TL', N'Alcatel', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (28, N'TL', N'Huawei', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (29, N'GT', N'Wacom', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (30, N'GT', N'Huion', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (31, N'GT', N'XP-Pen', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (32, N'GT', N'Gaomon', 1)
INSERT [dbo].[Brand] ([brandID], [cateID], [brandName], [status]) VALUES (33, N'CM', N'Olymbus', 1)
SET IDENTITY_INSERT [dbo].[Brand] OFF
INSERT [dbo].[category] ([cateID], [cateName], [status]) VALUES (N'CM', N'Camera', 1)
INSERT [dbo].[category] ([cateID], [cateName], [status]) VALUES (N'GT', N'Graphic Tablet', 1)
INSERT [dbo].[category] ([cateID], [cateName], [status]) VALUES (N'LT', N'Laptop', 1)
INSERT [dbo].[category] ([cateID], [cateName], [status]) VALUES (N'TL', N'Tablet', 1)
SET IDENTITY_INSERT [dbo].[description] ON 

INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (1, N'Ram', N'LT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (2, N'CPU', N'LT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (3, N'Hard Disk', N'LT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (5, N'VGA', N'LT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (6, N'Monitor', N'LT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (7, N'RAM ', N'TL', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (8, N'Monitor', N'TL', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (9, N'Chip', N'TL', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (10, N'ROM', N'TL', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (11, N'Operating System', N'TL', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (13, N'Dual sensor', N'CM', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (14, N'Image Processor', N'CM', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (15, N'Focus', N'CM', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (16, N'Screen', N'CM', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (17, N'Shutter speed', N'CM', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (18, N'Shooting speed', N'CM', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (21, N'Working Area', N'GT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (22, N'Graphics Resolution', N'GT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (24, N'Touch Pen', N'GT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (25, N'Pressure Sensitivity', N'GT', 1)
INSERT [dbo].[description] ([descriptionID], [descriptionName], [cateID], [status]) VALUES (26, N'Tilt Sensor', N'GT', 1)
SET IDENTITY_INSERT [dbo].[description] OFF
SET IDENTITY_INSERT [dbo].[descriptionDetail] ON 

INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (20, 1, N'8GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (21, 1, N'16GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (22, 1, N'32GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (23, 1, N'64GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (24, 2, N'Intel Core i5-12600', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (25, 2, N'Intel Core i7-10700', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (26, 2, N'Intel Core i5-10300H', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (27, 2, N'Intel Core i7-12700K', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (28, 5, N'VGA MANLI GeForce RTXâ¢ 3050', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (29, 5, N'VGA Galax RTX RTX 3050 EX ', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (30, 5, N'VGA INNO3D GEFORCE RTX 3070 ICHILL ', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (31, 5, N'VGA ASUS KO GeForce RTX 3070', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (32, 5, N'VGA ASUS ROG Strix GeForce RTX 3090 OC', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (33, 3, N'SSD TeamGroup CX2 512GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (34, 3, N'Seagate Barracuda 1TB 64MB cache', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (35, 3, N'WD Caviar Blue 1TB 64MB Cache', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (36, 3, N'Western Digital Caviar Black 1TB 64MB Cache', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (37, 3, N'SSD Western Digital Green 240GB 2.5 inch SATA 3', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (38, 3, N'SSD Kingston NV1 2TB NVMe PCIe Gen 3.0 x 4', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (39, 6, N'SR650 Series 27 inch IPS 1080p 75Hz', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (40, 6, N'32 Inch M80B UHD HDR Smart Computer Monitor ', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (41, 6, N'Sceptre 20 Inch 1600x900 75Hz Ultra Thin LED ', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (42, 6, N'SB220Q bi 21.5 Inches Full HD (1920 x 1080) IPS', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (43, 6, N'Sceptre 24 Inch Professional Thin 75Hz 1080p LED ', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (44, 7, N'8GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (45, 7, N'32GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (46, 7, N'16GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (47, 7, N'128GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (48, 9, N'Snapdragon 8 Gen 1', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (49, 9, N'MediaTek MT8766', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (50, 9, N'MediaTek MT8768T', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (51, 9, N' Apple M1', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (52, 9, N' Snapdragon 8 Gen 2', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (53, 10, N'32GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (54, 10, N'512GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (55, 10, N'128GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (56, 10, N'64GB', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (57, 11, N'Android 10', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (58, 11, N'Android 11', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (59, 11, N'Apple M1', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (60, 11, N' Android 12', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (61, 8, N'11 Inch, LTPS', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (62, 8, N'8 Inch, IPS LCD', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (63, 8, N'8.7 Inch, TFT LCD', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (64, 8, N'11 Inch, Liquid Retina', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (65, 8, N'14.6 Inch, Super AMOLED', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (66, 15, N'Dual Pixel CMOS AF, Eye Detect AF', 0)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (67, 18, N'	10 photos/sec', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (68, 18, N'	8 photos/sec', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (69, 13, N'APS-C CMOS 24.1 megapixels', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (70, 13, N'	Exmor APS-C CMOS 24.2 Megapixels', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (71, 13, N'Exmor RS CMOS 1.0inch 20.1 Megapixel', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (72, 13, N'	CMOS 24.1 megapixels', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (73, 14, N'	DIGIC 8', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (74, 14, N'	DIGIC 6', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (75, 14, N'	DIGIC 9', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (76, 15, N'	Dual Pixel CMOS AF with Eye Detect AF', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (77, 15, N'	Dual Pixel CMOS AF', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (78, 15, N' Eye Detect AF', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (79, 16, N'	LCD 3.0 inch touch', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (80, 16, N'	LCD 3.2 inch touch', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (81, 17, N'	30 - 1/4000 sec', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (82, 17, N'	30 1/8000 sec', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (83, 17, N'	30 - 1/6000 sec', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (84, 18, N'	12 photos/sec', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (85, 18, N'	14 photos/sec', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (86, 21, N'	10 Inch x 6 Inch', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (87, 21, N'	9 Icnh x 5 Inch', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (88, 21, N'11 Inch x 6 Inch', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (89, 21, N'10 Inch x 6.27 Inch', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (90, 22, N'	5080 LPI', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (91, 24, N'	Stylus does not use rechargeable batteries', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (92, 24, N'Electromagnetic resonance without battery', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (93, 25, N'	8,192 levels', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (94, 26, N'	60Â°', 1)
INSERT [dbo].[descriptionDetail] ([detailID], [descriptionID], [detailName], [status]) VALUES (95, 26, N'60o', 1)
SET IDENTITY_INSERT [dbo].[descriptionDetail] OFF
SET IDENTITY_INSERT [dbo].[device] ON 

INSERT [dbo].[device] ([deviceID], [deviceName], [warehouseID], [brandID], [quantity], [cateID], [url], [deposit], [status]) VALUES (5, N'Laptop Asus TUF Gaming FX506LHB', 1, 1, 16, N'LT', N'images/asus-tuf-gaming-fx506lhb-i5-hn188w-1.jpg', 20000000, 1)
INSERT [dbo].[device] ([deviceID], [deviceName], [warehouseID], [brandID], [quantity], [cateID], [url], [deposit], [status]) VALUES (6, N'Laptop Lenovo Ideapad 1 11IGL05 ', 2, 17, 40, N'LT', N'images/lenovo-ideapad-3-15iml05-i3-81wb01dyvn-1.jpg', 2500000, 1)
INSERT [dbo].[device] ([deviceID], [deviceName], [warehouseID], [brandID], [quantity], [cateID], [url], [deposit], [status]) VALUES (7, N'Camera Canon EOS 250D', 1, 3, 27, N'CM', N'images/canon-eos-2000d-kit-efs-1855-f3556-is-ii.webp', 1500000, 1)
INSERT [dbo].[device] ([deviceID], [deviceName], [warehouseID], [brandID], [quantity], [cateID], [url], [deposit], [status]) VALUES (8, N'Camera Canon EOS 2000D ', 2, 3, 42, N'CM', N'images/may-anh-canon-eos-250d-kit-ef-s18-55mm-f4-5-6-is-stm(1).webp', 1000000, 1)
INSERT [dbo].[device] ([deviceID], [deviceName], [warehouseID], [brandID], [quantity], [cateID], [url], [deposit], [status]) VALUES (9, N'WACOM CINTIQ 16', 1, 29, 25, N'GT', N'images/00.jpg', 4000000, 1)
INSERT [dbo].[device] ([deviceID], [deviceName], [warehouseID], [brandID], [quantity], [cateID], [url], [deposit], [status]) VALUES (10, N'WACOM CINTIQ 13HD', 2, 29, 30, N'GT', N'images/bang-ve-may-tinh-wacom-cintiq-13hd-dtk-1301-k0-cx.jpg', 2500000, 1)
INSERT [dbo].[device] ([deviceID], [deviceName], [warehouseID], [brandID], [quantity], [cateID], [url], [deposit], [status]) VALUES (11, N'Masstel Tab 10.4 ', 1, 24, 56, N'TL', N'images/alcatel-3t8-den-1.jpg', 500000, 1)
INSERT [dbo].[device] ([deviceID], [deviceName], [warehouseID], [brandID], [quantity], [cateID], [url], [deposit], [status]) VALUES (12, N'Xiaomi Pad 5', 1, 25, 42, N'TL', N'images/samsung-galaxy-tab-s8-white-1.jpg', 500000, 1)
SET IDENTITY_INSERT [dbo].[device] OFF
SET IDENTITY_INSERT [dbo].[device_description] ON 

INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (24, 5, 20)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (25, 5, 24)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (26, 5, 33)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (27, 5, 29)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (28, 5, 39)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (29, 6, 20)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (30, 6, 26)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (31, 6, 37)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (32, 6, 31)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (33, 6, 42)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (34, 7, 70)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (35, 7, 73)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (36, 7, 77)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (37, 7, 79)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (38, 7, 82)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (39, 7, 84)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (40, 8, 72)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (41, 8, 75)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (42, 8, 76)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (43, 8, 79)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (44, 8, 83)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (45, 8, 85)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (46, 9, 87)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (47, 9, 90)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (48, 9, 92)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (49, 9, 93)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (50, 9, 95)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (51, 10, 88)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (52, 10, 90)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (53, 10, 91)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (54, 10, 93)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (55, 10, 95)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (56, 11, 44)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (57, 11, 61)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (58, 11, 49)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (59, 11, 54)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (60, 11, 58)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (61, 12, 46)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (62, 12, 64)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (63, 12, 50)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (64, 12, 55)
INSERT [dbo].[device_description] ([device_descriptionID], [deviceID], [detailID]) VALUES (65, 12, 58)
SET IDENTITY_INSERT [dbo].[device_description] OFF
SET IDENTITY_INSERT [dbo].[request] ON 

INSERT [dbo].[request] ([requestID], [userID], [requestDate], [requestStatus], [substance], [status]) VALUES (13, N'SE150080', CAST(N'2022-08-04' AS Date), N'approve', N'Borrow Request', 1)
INSERT [dbo].[request] ([requestID], [userID], [requestDate], [requestStatus], [substance], [status]) VALUES (14, N'SE150080', CAST(N'2022-08-04' AS Date), N'cancel', N'Borrow Request', 1)
SET IDENTITY_INSERT [dbo].[request] OFF
SET IDENTITY_INSERT [dbo].[requestDetail] ON 

INSERT [dbo].[requestDetail] ([detailID], [requestID], [deviceID], [quantity], [borrowDate], [expiredDate], [detailStatus], [status]) VALUES (9, 13, 5, 4, CAST(N'2022-08-04' AS Date), CAST(N'2022-09-03' AS Date), N'Received', 1)
INSERT [dbo].[requestDetail] ([detailID], [requestID], [deviceID], [quantity], [borrowDate], [expiredDate], [detailStatus], [status]) VALUES (10, 14, 10, 3, NULL, CAST(N'2022-08-19' AS Date), N'cancel', 1)
SET IDENTITY_INSERT [dbo].[requestDetail] OFF
INSERT [dbo].[role] ([roleID], [roleName], [status]) VALUES (N'AD', N'Admin', 1)
INSERT [dbo].[role] ([roleID], [roleName], [status]) VALUES (N'MD', N'Manager Devices', 1)
INSERT [dbo].[role] ([roleID], [roleName], [status]) VALUES (N'MR', N'Manager Request', 1)
INSERT [dbo].[role] ([roleID], [roleName], [status]) VALUES (N'US', N'User', 1)
SET IDENTITY_INSERT [dbo].[warehouse] ON 

INSERT [dbo].[warehouse] ([warehouseID], [warehouseName], [location], [limitAmount], [status]) VALUES (1, N'Ground Floor', N'004', 53, 1)
INSERT [dbo].[warehouse] ([warehouseID], [warehouseName], [location], [limitAmount], [status]) VALUES (2, N'First Floor', N'105', 60, 1)
INSERT [dbo].[warehouse] ([warehouseID], [warehouseName], [location], [limitAmount], [status]) VALUES (3, N'Secondary Floor', N'206', 150, 1)
INSERT [dbo].[warehouse] ([warehouseID], [warehouseName], [location], [limitAmount], [status]) VALUES (4, N'Third Floor', N'302', 150, 1)
INSERT [dbo].[warehouse] ([warehouseID], [warehouseName], [location], [limitAmount], [status]) VALUES (5, N'Fourth Floor', N'408', 150, 1)
SET IDENTITY_INSERT [dbo].[warehouse] OFF
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_user_role] FOREIGN KEY([roleID])
REFERENCES [dbo].[role] ([roleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_user_role]
GO
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_category] FOREIGN KEY([cateID])
REFERENCES [dbo].[category] ([cateID])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_category]
GO
ALTER TABLE [dbo].[descriptionDetail]  WITH CHECK ADD  CONSTRAINT [FK_descriptionDetail_description] FOREIGN KEY([descriptionID])
REFERENCES [dbo].[description] ([descriptionID])
GO
ALTER TABLE [dbo].[descriptionDetail] CHECK CONSTRAINT [FK_descriptionDetail_description]
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FK_device_category] FOREIGN KEY([cateID])
REFERENCES [dbo].[category] ([cateID])
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FK_device_category]
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FK_device_warehouse] FOREIGN KEY([warehouseID])
REFERENCES [dbo].[warehouse] ([warehouseID])
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FK_device_warehouse]
GO
ALTER TABLE [dbo].[device_description]  WITH CHECK ADD  CONSTRAINT [FK_device_description_descriptionDetail] FOREIGN KEY([detailID])
REFERENCES [dbo].[descriptionDetail] ([detailID])
GO
ALTER TABLE [dbo].[device_description] CHECK CONSTRAINT [FK_device_description_descriptionDetail]
GO
ALTER TABLE [dbo].[device_description]  WITH CHECK ADD  CONSTRAINT [FK_device_description_device] FOREIGN KEY([deviceID])
REFERENCES [dbo].[device] ([deviceID])
GO
ALTER TABLE [dbo].[device_description] CHECK CONSTRAINT [FK_device_description_device]
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD  CONSTRAINT [FK_message_request] FOREIGN KEY([messageID])
REFERENCES [dbo].[request] ([requestID])
GO
ALTER TABLE [dbo].[message] CHECK CONSTRAINT [FK_message_request]
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD  CONSTRAINT [FK_message_request1] FOREIGN KEY([requestID])
REFERENCES [dbo].[request] ([requestID])
GO
ALTER TABLE [dbo].[message] CHECK CONSTRAINT [FK_message_request1]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_requestList_user] FOREIGN KEY([userID])
REFERENCES [dbo].[Accounts] ([userID])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_requestList_user]
GO
ALTER TABLE [dbo].[requestDetail]  WITH CHECK ADD  CONSTRAINT [FK_requestDetail_device] FOREIGN KEY([deviceID])
REFERENCES [dbo].[device] ([deviceID])
GO
ALTER TABLE [dbo].[requestDetail] CHECK CONSTRAINT [FK_requestDetail_device]
GO
ALTER TABLE [dbo].[requestDetail]  WITH CHECK ADD  CONSTRAINT [FK_requestDetail_request] FOREIGN KEY([requestID])
REFERENCES [dbo].[request] ([requestID])
GO
ALTER TABLE [dbo].[requestDetail] CHECK CONSTRAINT [FK_requestDetail_request]
GO
ALTER TABLE [dbo].[returned]  WITH CHECK ADD  CONSTRAINT [FK_returned_request] FOREIGN KEY([requestID])
REFERENCES [dbo].[request] ([requestID])
GO
ALTER TABLE [dbo].[returned] CHECK CONSTRAINT [FK_returned_request]
GO
USE [master]
GO
ALTER DATABASE [ITDeviceManagementSystem] SET  READ_WRITE 
GO
