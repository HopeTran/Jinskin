USE [Jinskin]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Account_Login]    Script Date: 4/20/2017 4:54:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Category_ListAll]    Script Date: 4/20/2017 4:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Sp_Category_ListAll]
as
select * from Category where Status = 1
order by [Order] asc
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/20/2017 4:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/20/2017 4:54:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[ParentID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Order] [int] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/20/2017 4:54:08 PM ******/
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
