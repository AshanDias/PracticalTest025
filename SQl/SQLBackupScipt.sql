USE [master]
GO
/****** Object:  Database [StudentManagementSystem]    Script Date: 5/29/2025 4:52:35 PM ******/
CREATE DATABASE [StudentManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StudentManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StudentManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StudentManagementSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [StudentManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentManagementSystem', N'ON'
GO
ALTER DATABASE [StudentManagementSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudentManagementSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudentManagementSystem]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/29/2025 4:52:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[NIC] [nvarchar](20) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[ProfileImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (2, N'Jane', N'Smith', N'0723456789', N'jane.smith@example.com', N'921234567V', CAST(N'1992-02-02' AS Date), N'456 Side Rd, Kandy', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (7, N'Test', N'User', N'0887667676', N'test@gmail.com', N'897655675v', CAST(N'1997-05-09' AS Date), N'kottawa', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (8, N'Test', N'User updated', N'0887667676', N'test@gmail.com', N'897655675v', CAST(N'1997-05-09' AS Date), N'kottawa', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (9, N'Michael', N'Johnson', N'0734567890', N'michael.johnson@example.com', N'931234567V', CAST(N'1988-03-03' AS Date), N'789 Hill St, Galle', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (10, N'Emily', N'Davis', N'0745678901', N'emily.davis@example.com', N'941234567V', CAST(N'1991-04-04' AS Date), N'321 Lake Rd, Jaffna', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (11, N'David', N'Brown', N'0756789012', N'david.brown@example.com', N'951234567V', CAST(N'1989-05-05' AS Date), N'654 Park Ave, Matara', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (12, N'Sarah', N'Wilson', N'0767890123', N'sarah.wilson@example.com', N'961234567V', CAST(N'1993-06-06' AS Date), N'987 River Rd, Negombo', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (13, N'Chris', N'Taylor', N'0778901234', N'chris.taylor@example.com', N'971234567V', CAST(N'1994-07-07' AS Date), N'123 Garden St, Anuradhapura', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (14, N'Jessica', N'Anderson', N'0789012345', N'jessica.anderson@example.com', N'981234567V', CAST(N'1990-08-08' AS Date), N'456 Ocean Rd, Trincomalee', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (15, N'Matthew', N'Thomas', N'0711122233', N'matthew.thomas@example.com', N'991234567V', CAST(N'1987-09-09' AS Date), N'789 Sunset Blvd, Ratnapura', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (16, N'Ashley', N'Jackson', N'0722233344', N'ashley.jackson@example.com', N'001234567V', CAST(N'1992-10-10' AS Date), N'321 Sunrise Rd, Badulla', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (17, N'Daniel', N'White', N'0733344455', N'daniel.white@example.com', N'011234567V', CAST(N'1991-11-11' AS Date), N'654 Maple St, Polonnaruwa', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (18, N'Megan', N'Harris', N'0744455566', N'megan.harris@example.com', N'021234567V', CAST(N'1993-12-12' AS Date), N'987 Birch Rd, Kurunegala', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (19, N'Andrew', N'Martin', N'0755566677', N'andrew.martin@example.com', N'031234567V', CAST(N'1986-01-13' AS Date), N'123 Pine St, Hambantota', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (20, N'Laura', N'Thompson', N'0766677788', N'laura.thompson@example.com', N'041234567V', CAST(N'1990-02-14' AS Date), N'456 Cedar Rd, Matale', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (21, N'James', N'Garcia', N'0777788899', N'james.garcia@example.com', N'051234567V', CAST(N'1988-03-15' AS Date), N'789 Elm St, Vavuniya', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (22, N'Olivia', N'Martinez', N'0788899900', N'olivia.martinez@example.com', N'061234567V', CAST(N'1991-04-16' AS Date), N'321 Spruce Rd, Jaffna', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (23, N'Joseph', N'Robinson', N'0719988776', N'joseph.robinson@example.com', N'071234567V', CAST(N'1989-05-17' AS Date), N'654 Willow St, Galle', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (24, N'Sophia', N'Clark', N'0728877665', N'sophia.clark@example.com', N'081234567V', CAST(N'1992-06-18' AS Date), N'987 Aspen Rd, Colombo', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (25, N'Gihan', N'Nirod', N'0776554534', N'gihan@gmail.com', N'978655567v', CAST(N'1998-08-09' AS Date), N'kottawa', NULL)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Mobile], [Email], [NIC], [DateOfBirth], [Address], [ProfileImage]) VALUES (26, N'Gihan', N'Nirod Update', N'0776554534', N'gihan@gmail.com', N'978655567v', CAST(N'1998-08-09' AS Date), N'kottawa', NULL)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
USE [master]
GO
ALTER DATABASE [StudentManagementSystem] SET  READ_WRITE 
GO
