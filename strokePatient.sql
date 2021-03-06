USE [master]
GO
/****** Object:  Database [StrokeRecovery]    Script Date: 07/17/2016 12:57:41 ******/
CREATE DATABASE [StrokeRecovery] ON  PRIMARY 
( NAME = N'StrokeRecovery', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\StrokeRecovery.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StrokeRecovery_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\StrokeRecovery_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StrokeRecovery] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StrokeRecovery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StrokeRecovery] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StrokeRecovery] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StrokeRecovery] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StrokeRecovery] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StrokeRecovery] SET ARITHABORT OFF
GO
ALTER DATABASE [StrokeRecovery] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StrokeRecovery] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StrokeRecovery] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StrokeRecovery] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StrokeRecovery] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StrokeRecovery] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StrokeRecovery] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StrokeRecovery] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StrokeRecovery] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StrokeRecovery] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StrokeRecovery] SET  DISABLE_BROKER
GO
ALTER DATABASE [StrokeRecovery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StrokeRecovery] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StrokeRecovery] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StrokeRecovery] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StrokeRecovery] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StrokeRecovery] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StrokeRecovery] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StrokeRecovery] SET  READ_WRITE
GO
ALTER DATABASE [StrokeRecovery] SET RECOVERY SIMPLE
GO
ALTER DATABASE [StrokeRecovery] SET  MULTI_USER
GO
ALTER DATABASE [StrokeRecovery] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StrokeRecovery] SET DB_CHAINING OFF
GO
USE [StrokeRecovery]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 07/17/2016 12:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[PersonName] [nvarchar](50) NULL,
	[PersonAge] [int] NULL,
	[PersonGender] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[PersonPassword] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SPRegisterUser]    Script Date: 07/17/2016 12:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SPRegisterUser](
@Per_Name nvarchar(50),
@User_Name nvarchar(50) ,
@Per_Password nvarchar(50),
@Per_Gender nvarchar(50),
@Per_Age int
)
As
Begin
insert into dbo.Person (PersonName,UserName,PersonPassword,PersonAge,PersonGender)values(@Per_Name,@User_Name,@Per_Password,@Per_Age,@Per_Gender)
end
GO
/****** Object:  StoredProcedure [dbo].[SPPatientLogin]    Script Date: 07/17/2016 12:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SPPatientLogin](
@User_Name nvarchar(50) ,
@Per_Password nvarchar(50)
)
As
Begin
select PersonName from Person where UserName= @User_Name and PersonPassword = @Per_Password
end
GO
