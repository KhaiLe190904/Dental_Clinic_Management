USE [master]
GO
/****** Object:  Database [dental_clinic]    Script Date: 18/12/2024 10:18:30 AM ******/
CREATE DATABASE [dental_clinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dental_clinic', FILENAME = N'/var/opt/mssql/data/dental_clinic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dental_clinic_log', FILENAME = N'/var/opt/mssql/data/dental_clinic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dental_clinic] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dental_clinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dental_clinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dental_clinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dental_clinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dental_clinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dental_clinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [dental_clinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dental_clinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dental_clinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dental_clinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dental_clinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dental_clinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dental_clinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dental_clinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dental_clinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dental_clinic] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dental_clinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dental_clinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dental_clinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dental_clinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dental_clinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dental_clinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dental_clinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dental_clinic] SET RECOVERY FULL 
GO
ALTER DATABASE [dental_clinic] SET  MULTI_USER 
GO
ALTER DATABASE [dental_clinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dental_clinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dental_clinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dental_clinic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dental_clinic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dental_clinic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dental_clinic', N'ON'
GO
ALTER DATABASE [dental_clinic] SET QUERY_STORE = OFF
GO
USE [dental_clinic]
GO
/****** Object:  Table [dbo].[appointments]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[appointment_time] [time](7) NULL,
	[notes] [varchar](255) NULL,
	[cancelled] [bit] NOT NULL,
	[is_completed] [bit] NOT NULL,
	[appointment_date] [datetime2](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bills]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[treatment_id] [int] NULL,
	[total_amount] [float] NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dentist_role]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dentist_role](
	[dentist_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dentists]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dentists](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](255) NULL,
	[position] [nvarchar](50) NULL,
	[phone] [nvarchar](15) NULL,
	[email] [varchar](255) NULL,
	[status] [int] NULL,
	[is_working] [int] NULL,
	[fees] [varchar](255) NULL,
	[img_url] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[speciality] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicines]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](100) NULL,
	[medicine_name] [varchar](255) NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patients]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](255) NULL,
	[dob] [datetime2](6) NULL,
	[phone] [varchar](255) NULL,
	[sex] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[cccd] [nvarchar](30) NOT NULL,
	[address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prescription_medicine]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescription_medicine](
	[prescription_id] [int] NOT NULL,
	[medicine_id] [int] NOT NULL,
	[dosage] [nvarchar](50) NULL,
	[days] [int] NULL,
	[price] [decimal](18, 2) NOT NULL,
	[total_price]  AS ([days]*[price]),
PRIMARY KEY CLUSTERED 
(
	[prescription_id] ASC,
	[medicine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prescriptions]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescriptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[treatment_id] [int] NULL,
	[medicine_name] [nvarchar](100) NULL,
	[price] [decimal](18, 2) NOT NULL,
	[total_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [varchar](255) NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[treatment_service]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatment_service](
	[treatment_id] [int] NOT NULL,
	[service_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[treatments]    Script Date: 18/12/2024 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[dentist_id] [int] NULL,
	[fees] [float] NULL,
	[notes] [varchar](255) NULL,
	[service_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[appointments] ON 

INSERT [dbo].[appointments] ([id], [patient_id], [appointment_time], [notes], [cancelled], [is_completed], [appointment_date]) VALUES (12, 2, CAST(N'12:00:00' AS Time), N'12', 1, 1, CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[appointments] OFF
GO
INSERT [dbo].[dentist_role] ([dentist_id], [role_id]) VALUES (5015, 2)
GO
SET IDENTITY_INSERT [dbo].[dentists] ON 

INSERT [dbo].[dentists] ([id], [password], [position], [phone], [email], [status], [is_working], [fees], [img_url], [name], [speciality], [username]) VALUES (5015, N'admin', N'admin', N'0123', N'admin@gmail.com', 1, 1, N'1', N'https://dcmoop.s3.us-east-1.amazonaws.com/1734485830916_Khai123.jpg', N'admin', N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[dentists] OFF
GO
SET IDENTITY_INSERT [dbo].[patients] ON 

INSERT [dbo].[patients] ([id], [full_name], [dob], [phone], [sex], [email], [cccd], [address]) VALUES (2, N'hieu', CAST(N'2024-12-18T00:00:00.0000000' AS DateTime2), N'012345678', N'Nu', N'hieu@gmail.com', N'1234', N'36')
SET IDENTITY_INSERT [dbo].[patients] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [role_name]) VALUES (1, N'ROLE_DENTIST')
INSERT [dbo].[roles] ([id], [role_name]) VALUES (2, N'ROLE_ADMIN')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[treatments] ON 

INSERT [dbo].[treatments] ([id], [patient_id], [dentist_id], [fees], [notes], [service_name]) VALUES (10, 2, 5015, 100, N'1', N'kham rang')
SET IDENTITY_INSERT [dbo].[treatments] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_cccd]    Script Date: 18/12/2024 10:18:30 AM ******/
ALTER TABLE [dbo].[patients] ADD  CONSTRAINT [UQ_cccd] UNIQUE NONCLUSTERED 
(
	[cccd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[appointments] ADD  DEFAULT ((0)) FOR [cancelled]
GO
ALTER TABLE [dbo].[appointments] ADD  DEFAULT ((0)) FOR [is_completed]
GO
ALTER TABLE [dbo].[bills] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[appointments]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([id])
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([id])
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD FOREIGN KEY([treatment_id])
REFERENCES [dbo].[treatments] ([id])
GO
ALTER TABLE [dbo].[dentist_role]  WITH CHECK ADD FOREIGN KEY([dentist_id])
REFERENCES [dbo].[dentists] ([id])
GO
ALTER TABLE [dbo].[dentist_role]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[prescription_medicine]  WITH CHECK ADD FOREIGN KEY([medicine_id])
REFERENCES [dbo].[medicines] ([id])
GO
ALTER TABLE [dbo].[prescription_medicine]  WITH CHECK ADD FOREIGN KEY([prescription_id])
REFERENCES [dbo].[prescriptions] ([id])
GO
ALTER TABLE [dbo].[prescriptions]  WITH CHECK ADD FOREIGN KEY([treatment_id])
REFERENCES [dbo].[treatments] ([id])
GO
ALTER TABLE [dbo].[treatment_service]  WITH CHECK ADD  CONSTRAINT [FK1m59hl3719osecqnwligj2sha] FOREIGN KEY([treatment_id])
REFERENCES [dbo].[treatments] ([id])
GO
ALTER TABLE [dbo].[treatment_service] CHECK CONSTRAINT [FK1m59hl3719osecqnwligj2sha]
GO
ALTER TABLE [dbo].[treatment_service]  WITH CHECK ADD  CONSTRAINT [FKlwj5i52g4prjqqu11ej09ydvv] FOREIGN KEY([service_id])
REFERENCES [dbo].[services] ([id])
GO
ALTER TABLE [dbo].[treatment_service] CHECK CONSTRAINT [FKlwj5i52g4prjqqu11ej09ydvv]
GO
ALTER TABLE [dbo].[treatments]  WITH CHECK ADD FOREIGN KEY([dentist_id])
REFERENCES [dbo].[dentists] ([id])
GO
ALTER TABLE [dbo].[treatments]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patients] ([id])
GO
USE [master]
GO
ALTER DATABASE [dental_clinic] SET  READ_WRITE 
GO
