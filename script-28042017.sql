USE [master]
GO
/****** Object:  Database [Jinskin]    Script Date: 4/28/2017 5:32:49 PM ******/
CREATE DATABASE [Jinskin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Jinskin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Jinskin.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Jinskin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Jinskin_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Jinskin] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Jinskin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Jinskin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jinskin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jinskin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jinskin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jinskin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jinskin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jinskin] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Jinskin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jinskin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jinskin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jinskin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jinskin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jinskin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jinskin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jinskin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jinskin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jinskin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jinskin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jinskin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jinskin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jinskin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jinskin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jinskin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jinskin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Jinskin] SET  MULTI_USER 
GO
ALTER DATABASE [Jinskin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jinskin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Jinskin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Jinskin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Jinskin]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Account_Login]    Script Date: 4/28/2017 5:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[Sp_Account_Login] 
	@Username varchar(20),
	@Password varchar(50)
as
begin
	declare @count int
	declare @res bit
	select @count = count(*) from Account where Username = @Username and Password = @Password
	if @count > 0
		set @res = 1
	else
		set @res = 0
	select @res
end


GO
/****** Object:  StoredProcedure [dbo].[Sp_Category_Insert1]    Script Date: 4/28/2017 5:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[Sp_Category_Insert1]
	-- Add the parameters for the stored procedure here
	@Name nvarchar (50)=null,
	@Alias varchar (50)=null,
	@ParentID int=null,
	@Order int=null,
	@Status bit=null

AS
BEGIN
	insert into Category(Name, Alias, ParentID, CreatedDate, [Order], [Status])
	values(@Name, @Alias, @ParentID, getdate(), @Order, @Status)
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_Category_ListAll]    Script Date: 4/28/2017 5:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Category_ListAll]
as
select * from Category where Status = 1
order by [Order] asc
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/28/2017 5:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](50) NULL,
	[Roles] [nchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/28/2017 5:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[ParentID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Order] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/28/2017 5:32:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
	[Images] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Price] [decimal](18, 0) NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [Jinskin] SET  READ_WRITE 
GO
