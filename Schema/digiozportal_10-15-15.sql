USE [digiozportal]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Title] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.Announcement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[PasswordQuestion] [nvarchar](max) NULL,
	[PasswordAnswer] [nvarchar](max) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[LastActivityDate] [datetime] NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttempt] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[DisableEmailNotifications] [bit] NULL,
	[DisablePosting] [bit] NULL,
	[DisablePrivateMessages] [bit] NULL,
	[DisableFileUploads] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Badge]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Badge](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Badge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BadgeTypeTimeLastChecked]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BadgeTypeTimeLastChecked](
	[Id] [uniqueidentifier] NOT NULL,
	[BadgeType] [nvarchar](max) NULL,
	[TimeLastChecked] [datetime] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.BadgeTypeTimeLastChecked] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BannedEmail]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannedEmail](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BannedEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BannedWord]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannedWord](
	[Id] [uniqueidentifier] NOT NULL,
	[Word] [nvarchar](max) NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BannedWord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsLocked] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Category_Id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryNotification]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryNotification](
	[Id] [uniqueidentifier] NOT NULL,
	[Category_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.CategoryNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryPermissionForRole]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryPermissionForRole](
	[Id] [uniqueidentifier] NOT NULL,
	[IsTicked] [bit] NOT NULL,
	[Category_Id] [uniqueidentifier] NOT NULL,
	[Permission_Id] [uniqueidentifier] NOT NULL,
	[MembershipRole_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.CategoryPermissionForRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chat]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Message] [nvarchar](max) NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Chat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigKey] [nvarchar](max) NOT NULL,
	[ConfigValue] [nvarchar](max) NOT NULL,
	[IsEncrypted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LanguageCulture] [nvarchar](max) NULL,
	[FlagImageFileName] [nvarchar](max) NULL,
	[RightToLeft] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Link]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[Visible] [bit] NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocaleResourceKey]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocaleResourceKey](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[DateAdded] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.LocaleResourceKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocaleStringResource]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocaleStringResource](
	[Id] [uniqueidentifier] NOT NULL,
	[ResourceValue] [nvarchar](max) NULL,
	[LocaleResourceKey_Id] [uniqueidentifier] NOT NULL,
	[Language_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LocaleStringResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogVisitor]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogVisitor](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](max) NULL,
	[BrowserType] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[IsBot] [bit] NULL,
	[Country] [nvarchar](max) NULL,
	[ReferringURL] [nvarchar](max) NULL,
	[SearchString] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.LogVisitor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipUser_Badge]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUser_Badge](
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
	[Badge_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MembershipUser_Badge] PRIMARY KEY CLUSTERED 
(
	[MembershipUser_Id] ASC,
	[Badge_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MembershipUserPoints]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipUserPoints](
	[Id] [uniqueidentifier] NOT NULL,
	[Points] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.MembershipUserPoints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Name] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Controller] [nvarchar](max) NULL,
	[Action] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Target] [nvarchar](max) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [nvarchar](128) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ShippingAddress] [nvarchar](70) NOT NULL,
	[ShippingAddress2] [nvarchar](70) NULL,
	[ShippingCity] [nvarchar](40) NOT NULL,
	[ShippingState] [nvarchar](40) NULL,
	[ShippingZip] [nvarchar](30) NOT NULL,
	[ShippingCountry] [nvarchar](50) NOT NULL,
	[BillingAddress] [nvarchar](70) NOT NULL,
	[BillingAddress2] [nvarchar](70) NULL,
	[BillingCity] [nvarchar](40) NOT NULL,
	[BillingState] [nvarchar](40) NOT NULL,
	[BillingZip] [nvarchar](30) NOT NULL,
	[BillingCountry] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](30) NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[CCNumber] [nvarchar](100) NULL,
	[CCExp] [nvarchar](10) NULL,
	[CCCardCode] [nvarchar](10) NULL,
	[CCAmount] [decimal](18, 2) NULL,
	[TrxDescription] [nvarchar](max) NULL,
	[TrxApproved] [bit] NOT NULL,
	[TrxAuthorizationCode] [nvarchar](100) NULL,
	[TrxMessage] [nvarchar](max) NULL,
	[TrxResponseCode] [nvarchar](10) NULL,
	[TrxID] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [nvarchar](128) NOT NULL,
	[OrderID] [nvarchar](128) NOT NULL,
	[ProductID] [nvarchar](128) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Title] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Keywords] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[AlbumID] [bigint] NULL,
	[Filename] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
	[Approved] [bit] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_dbo.Picture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PictureAlbum]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureAlbum](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_dbo.PictureAlbum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plugin]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plugin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DLL] [nvarchar](max) NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Plugin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Poll]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poll](
	[Id] [uniqueidentifier] NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[IsClosed] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Poll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PollAnswer]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollAnswer](
	[Id] [uniqueidentifier] NOT NULL,
	[Answer] [nvarchar](max) NULL,
	[Poll_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.PollAnswer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PollVote]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollVote](
	[Id] [uniqueidentifier] NOT NULL,
	[PollAnswer_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.PollVote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [uniqueidentifier] NOT NULL,
	[PostContent] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[VoteCount] [int] NOT NULL,
	[DateEdited] [datetime] NOT NULL,
	[IsSolution] [bit] NOT NULL,
	[IsTopicStarter] [bit] NOT NULL,
	[FlaggedAsSpam] [bit] NULL,
	[IpAddress] [nvarchar](max) NULL,
	[Topic_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivateMessage]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateMessage](
	[Id] [uniqueidentifier] NOT NULL,
	[DateSent] [datetime] NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[IsRead] [bit] NOT NULL,
	[UserFrom_Id] [nvarchar](128) NOT NULL,
	[UserTo_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.PrivateMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [nvarchar](128) NOT NULL,
	[ProductCategoryID] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Make] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[SKU] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Cost] [decimal](18, 2) NULL,
	[QuantityPerUnit] [int] NULL,
	[Weight] [nvarchar](20) NULL,
	[Dimensions] [nvarchar](50) NULL,
	[Sizes] [nvarchar](50) NULL,
	[Colors] [nvarchar](50) NULL,
	[MaterialType] [nvarchar](50) NULL,
	[PartNumber] [nvarchar](50) NULL,
	[ShortDescription] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ManufacturerURL] [nvarchar](max) NULL,
	[UnitsInStock] [int] NOT NULL,
	[OutOfStock] [bit] NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Email] [nvarchar](max) NULL,
	[Birthday] [datetime] NULL,
	[BirthdayVisible] [bit] NULL,
	[Address] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Signature] [nvarchar](max) NULL,
	[Avatar] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Profile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [uniqueidentifier] NOT NULL,
	[ForumName] [nvarchar](max) NULL,
	[ForumUrl] [nvarchar](max) NULL,
	[IsClosed] [bit] NOT NULL,
	[EnableRSSFeeds] [bit] NOT NULL,
	[DisplayEditedBy] [bit] NOT NULL,
	[EnablePostFileAttachments] [bit] NOT NULL,
	[EnableMarkAsSolution] [bit] NOT NULL,
	[EnableSpamReporting] [bit] NOT NULL,
	[EnableMemberReporting] [bit] NOT NULL,
	[EnableEmailSubscriptions] [bit] NOT NULL,
	[ManuallyAuthoriseNewMembers] [bit] NOT NULL,
	[NewMemberEmailConfirmation] [bit] NULL,
	[EmailAdminOnNewMemberSignUp] [bit] NOT NULL,
	[TopicsPerPage] [int] NOT NULL,
	[PostsPerPage] [int] NOT NULL,
	[ActivitiesPerPage] [int] NOT NULL,
	[EnablePrivateMessages] [bit] NOT NULL,
	[MaxPrivateMessagesPerMember] [int] NOT NULL,
	[PrivateMessageFloodControl] [int] NOT NULL,
	[EnableSignatures] [bit] NOT NULL,
	[EnablePoints] [bit] NOT NULL,
	[PointsAllowedToVoteAmount] [int] NOT NULL,
	[PointsAddedPerPost] [int] NOT NULL,
	[PointsAddedPostiveVote] [int] NOT NULL,
	[PointsDeductedNagativeVote] [int] NOT NULL,
	[PointsAddedForSolution] [int] NOT NULL,
	[AdminEmailAddress] [nvarchar](max) NULL,
	[NotificationReplyEmail] [nvarchar](max) NULL,
	[SMTP] [nvarchar](max) NULL,
	[SMTPUsername] [nvarchar](max) NULL,
	[SMTPPassword] [nvarchar](max) NULL,
	[SMTPPort] [nvarchar](max) NULL,
	[SMTPEnableSSL] [bit] NULL,
	[SpamQuestion] [nvarchar](max) NULL,
	[SpamAnswer] [nvarchar](max) NULL,
	[EnableAkisment] [bit] NULL,
	[AkismentKey] [nvarchar](max) NULL,
	[CurrentDatabaseVersion] [nvarchar](max) NULL,
	[EnablePolls] [bit] NULL,
	[SuspendRegistration] [bit] NULL,
	[DefaultLanguage_Id] [uniqueidentifier] NOT NULL,
	[NewMemberStartingRole] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[ID] [nvarchar](128) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ProductID] [nvarchar](128) NOT NULL,
	[Quantity] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[AspNetUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[Solved] [bit] NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Views] [int] NOT NULL,
	[IsSticky] [bit] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[Post_Id] [uniqueidentifier] NULL,
	[Poll_Id] [uniqueidentifier] NULL,
	[Category_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic_Tag]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic_Tag](
	[TopicTag_Id] [uniqueidentifier] NOT NULL,
	[Topic_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Topic_Tag] PRIMARY KEY CLUSTERED 
(
	[TopicTag_Id] ASC,
	[Topic_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TopicNotification]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicNotification](
	[Id] [uniqueidentifier] NOT NULL,
	[Topic_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.TopicNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TopicTag]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicTag](
	[Id] [uniqueidentifier] NOT NULL,
	[Tag] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.TopicTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UploadedFile]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedFile](
	[Id] [uniqueidentifier] NOT NULL,
	[Filename] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
	[Post_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UploadedFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[AlbumID] [bigint] NULL,
	[Filename] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
	[Approved] [bit] NULL,
	[Visible] [bit] NULL,
	[Thumbnail] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Video] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoAlbum]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoAlbum](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_dbo.VideoAlbum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisitorInfo]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](25) NOT NULL,
	[PageURL] [nvarchar](max) NULL,
	[ReferringURL] [nvarchar](max) NULL,
	[BrowserName] [nvarchar](100) NULL,
	[BrowserType] [nvarchar](100) NULL,
	[BrowserUserAgent] [nvarchar](max) NULL,
	[BrowserVersion] [nvarchar](20) NULL,
	[IsCrawler] [bit] NOT NULL,
	[JSVersion] [nvarchar](max) NULL,
	[OperatingSystem] [nvarchar](20) NULL,
	[Keywords] [nvarchar](max) NULL,
	[SearchEngine] [nvarchar](20) NULL,
	[Country] [nvarchar](30) NULL,
	[Language] [nvarchar](100) NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.VisitorInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vote]    Script Date: 10/15/2015 4:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[Id] [uniqueidentifier] NOT NULL,
	[Amount] [int] NOT NULL,
	[DateVoted] [datetime] NULL,
	[VotedByMembershipUser_Id] [nvarchar](128) NULL,
	[Post_Id] [uniqueidentifier] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Vote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Announcement] ON 

INSERT [dbo].[Announcement] ([ID], [UserID], [Title], [Body], [Visible], [Timestamp]) VALUES (1, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Test Announcement 1', N'<p>This is a test Announcement changed w</p>', 1, CAST(N'2015-10-15 21:15:21.930' AS DateTime))
INSERT [dbo].[Announcement] ([ID], [UserID], [Title], [Body], [Visible], [Timestamp]) VALUES (2, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Test Announcement 2', N'<p>Test Announcement 2 Body</p>', 1, CAST(N'2015-10-15 21:15:21.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Announcement] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'12d55f2f-4832-4711-a508-185e0e350761', N'Moderator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8391415b-21e9-4c18-b7c4-87bf61320cd1', N'Guest')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'bbc106ea-4729-462b-83e0-2e4dd382e0cd', N'Administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f3ab1400-5bc4-4747-a580-86e1aeefab3a', N'Standard Members')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'bbc106ea-4729-462b-83e0-2e4dd382e0cd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1ebb5770-3a0c-4655-87ce-e457fcbe5791', N'f3ab1400-5bc4-4747-a580-86e1aeefab3a')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [LastActivityDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttempt], [Comment], [Slug], [DisableEmailNotifications], [DisablePosting], [DisablePrivateMessages], [DisableFileUploads]) VALUES (N'1ebb5770-3a0c-4655-87ce-e457fcbe5791', N'user1', N'AInbU4gD+pBZ7lGJlKTZLRnelOglu/nLr8chXLu6F/Ix+bJSX+QidoAjdMnvPf9Chw==', N'636d1773-267c-4c22-b28a-a5be2def402d', N'ApplicationUser', NULL, NULL, 1, 0, CAST(N'2015-10-15 21:15:16.150' AS DateTime), CAST(N'2015-10-15 21:15:16.150' AS DateTime), CAST(N'2015-10-15 21:15:16.150' AS DateTime), CAST(N'2015-10-15 21:15:16.150' AS DateTime), NULL, 0, 0, NULL, N'user1', 0, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [LastActivityDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttempt], [Comment], [Slug], [DisableEmailNotifications], [DisablePosting], [DisablePrivateMessages], [DisableFileUploads]) VALUES (N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'admin', N'AOPgVnFQuE+o2AkxqThTIfw/atrOyKqNfqOkMHYn0b8eXkDyhY0yJK9Wg+sqUQv6nw==', N'e55dfa25-3262-4f2b-b65f-41300cbe6e4b', N'ApplicationUser', NULL, NULL, 1, 0, CAST(N'2015-10-15 21:15:15.117' AS DateTime), CAST(N'2015-10-15 21:15:15.117' AS DateTime), CAST(N'2015-10-15 21:15:15.117' AS DateTime), CAST(N'2015-10-15 21:15:15.117' AS DateTime), NULL, 0, 0, NULL, N'admin', 0, 0, 0, NULL)
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'2ac1fc11-2f9e-4d5a-9df4-29715f10b6d1', N'VoteUp', N'PosterVoteUp', N'First Vote Up Received', N'This badge is awarded to users after they receive their first vote up from another user.', N'PosterVoteUpBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'52284d2b-7ed6-4154-9ccc-3a7d99b18cca', N'Time', N'MemberForAYear', N'Member For A Year', N'This badge is awarded to a user after their first year anniversary.', N'MemberForAYearBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'9a247d50-35b5-4cd2-adaa-a0cf013325ac', N'Post', N'PostContainsUmbraco', N'Mentioned Umbraco In A Post Or Topic', N'This badge is awarded to a user who mentions Umbraco in their latest post.', N'MentionsUmbracoBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'8250f9f0-84d2-4dff-b651-c3df9e12bf2a', N'MarkAsSolution', N'PosterMarkAsSolution', N'Post Selected As Answer', N'This badge is awarded to the poster of a post marked as the topic answer, the first time they author an answer.', N'PosterMarkAsSolutionBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'c9913ee2-b8e0-4543-8930-c723497ee65c', N'VoteUp', N'UserVoteUp', N'You''ve Given Your First Vote Up', N'This badge is awarded to users after they make their first vote up.', N'UserVoteUpBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'd68c289a-e3f7-4f55-ae4f-fc7ac2147781', N'MarkAsSolution', N'AuthorMarkAsSolution', N'Your Question Solved', N'This badge is awarded to topic authors the first time they have a post marked as the answer.', N'UserMarkAsSolutionBadge.png')
INSERT [dbo].[Category] ([Id], [Name], [Description], [IsLocked], [SortOrder], [DateCreated], [Slug], [Category_Id]) VALUES (N'19e657f8-b181-4a9c-9a54-a532015e439d', N'Example Category', NULL, 0, 0, CAST(N'2015-10-15 21:15:16.360' AS DateTime), N'example-category', NULL)
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'900c3949-12c6-47e1-a51a-a532015e43a0', 1, N'19e657f8-b181-4a9c-9a54-a532015e439d', N'f80eff4c-03b7-480d-9cbe-a532015e43a0', N'f3ab1400-5bc4-4747-a580-86e1aeefab3a')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'6ffd75c6-5d33-48c3-8035-a532015e43a1', 1, N'19e657f8-b181-4a9c-9a54-a532015e439d', N'4b90894f-ddfa-4b0b-ab06-a532015e43a0', N'f3ab1400-5bc4-4747-a580-86e1aeefab3a')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'aaeee163-3483-43de-90b0-a532015e43a1', 1, N'19e657f8-b181-4a9c-9a54-a532015e439d', N'1464eef4-e05e-41dc-9760-a532015e43a0', N'f3ab1400-5bc4-4747-a580-86e1aeefab3a')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'1ed3ce37-7e3d-46d8-9f22-a532015e43a1', 1, N'19e657f8-b181-4a9c-9a54-a532015e439d', N'7cfbd5ea-795a-463a-a850-a532015e43a0', N'f3ab1400-5bc4-4747-a580-86e1aeefab3a')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'09ea9bcf-dc19-4703-ac97-a532015e43a1', 1, N'19e657f8-b181-4a9c-9a54-a532015e439d', N'447a68c9-00ea-461e-a9fd-a532015e43a0', N'f3ab1400-5bc4-4747-a580-86e1aeefab3a')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'dc3f12cc-8077-48ec-b48a-a532015e43a1', 1, N'19e657f8-b181-4a9c-9a54-a532015e439d', N'14e51adb-8926-4e93-80f3-a532015e43a0', N'f3ab1400-5bc4-4747-a580-86e1aeefab3a')
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (1, N'SMTPServer', N'mail.domain.com', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (2, N'SMTPUsername', N'webmaster@domain.com', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (3, N'SMTPPassword', N'Jqo4z3D0ODFMpmOFs4QiBiWm0RsOwkKLvFvMcsSjysA=', 1)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (4, N'SiteURL', N'http://localhost:3588', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (5, N'SiteName', N'DigiOz .NET Portal', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (6, N'SiteEncryptionKey', N'ZdlAtlR4hT34utDBFn7n', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (7, N'WebmasterEmail', N'webmaster@domain.com', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (8, N'PaymentLoginID', N'[PaymentLoginID]', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (9, N'PaymentTransactionKey', N'[PaymentTransactionKey]', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (10, N'PaymentTestMode', N'false', 0)
SET IDENTITY_INSERT [dbo].[Config] OFF
INSERT [dbo].[Language] ([Id], [Name], [LanguageCulture], [FlagImageFileName], [RightToLeft]) VALUES (N'01be9003-544e-4dcd-b8d3-a532015e43a7', N'English (United Kingdom)', N'en-GB', NULL, 0)
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'93a1089e-b966-4f46-be76-a532015e43a7', N'Layout.Nav.Register', NULL, CAST(N'2015-10-15 21:15:16.420' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'045d2905-585f-4d89-83c8-a532015e43b7', N'Layout.Nav.Logon', NULL, CAST(N'2015-10-15 21:15:16.457' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5a38edc5-3c52-4636-ae52-a532015e43c0', N'Layout.Nav.Activity', NULL, CAST(N'2015-10-15 21:15:16.480' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6188f567-48ef-4052-9de3-a532015e43c6', N'Layout.Nav.Leaderboard', NULL, CAST(N'2015-10-15 21:15:16.510' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dedbdf53-ac20-49a5-9df4-a532015e43cd', N'Layout.Nav.Home', NULL, CAST(N'2015-10-15 21:15:16.527' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'17f73c75-a993-4d49-ba5f-a532015e43d2', N'Layout.Nav.Admin', NULL, CAST(N'2015-10-15 21:15:16.540' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd6ee22d1-4c4a-4bed-b6db-a532015e43d6', N'Layout.CreateButton', NULL, CAST(N'2015-10-15 21:15:16.557' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'59381df6-3b70-4398-82e5-a532015e43da', N'Layout.PoweredBy', NULL, CAST(N'2015-10-15 21:15:16.583' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'aedbe008-fff7-4839-a7c4-a532015e43e4', N'Topic.Votes', NULL, CAST(N'2015-10-15 21:15:16.600' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c41f53c0-e238-4e09-9bf3-a532015e43e8', N'Topic.Comments', NULL, CAST(N'2015-10-15 21:15:16.617' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2ac7620a-af3a-4540-b912-a532015e43ed', N'Topic.StartedBy', NULL, CAST(N'2015-10-15 21:15:16.630' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'75d6ebc9-5b7a-43c1-befb-a532015e43fb', N'Topic.InCategory', NULL, CAST(N'2015-10-15 21:15:16.677' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e2657549-7fd5-442a-ac1e-a532015e4400', N'Topic.LatestBy', NULL, CAST(N'2015-10-15 21:15:16.697' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'06a1b5c4-5c91-4a6c-90c0-a532015e4408', N'Topic.Views', NULL, CAST(N'2015-10-15 21:15:16.723' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'361671c4-9567-40c3-bf92-a532015e440d', N'Post.VoteUp', NULL, CAST(N'2015-10-15 21:15:16.737' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'10956e21-7b7c-4dbf-bed8-a532015e4411', N'Post.VoteDown', NULL, CAST(N'2015-10-15 21:15:16.753' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3bd31554-134e-4dd3-b3ce-a532015e4416', N'Post.IsSolution', NULL, CAST(N'2015-10-15 21:15:16.797' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b302ed85-973b-4220-af02-a532015e4423', N'Post.PostedThis', NULL, CAST(N'2015-10-15 21:15:16.813' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2730414b-8d76-4838-98d5-a532015e4428', N'Post.Posts', NULL, CAST(N'2015-10-15 21:15:16.830' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'602c6451-00f8-444b-96e1-a532015e442d', N'Post.Points', NULL, CAST(N'2015-10-15 21:15:16.847' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dcb284a3-da34-4c3e-8ec4-a532015e4432', N'Post.LastEdited', NULL, CAST(N'2015-10-15 21:15:16.877' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'11ed8757-d8ae-43f4-abeb-a532015e443b', N'Post.Report', NULL, CAST(N'2015-10-15 21:15:16.893' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'45d5047a-0296-46b3-9e24-a532015e4444', N'Post.Edit', NULL, CAST(N'2015-10-15 21:15:16.923' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bec596c7-0286-4f44-b913-a532015e4449', N'Post.Delete', NULL, CAST(N'2015-10-15 21:15:16.937' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b32fe522-e8ce-4eb0-8cf3-a532015e444d', N'LogOn.LogOn', NULL, CAST(N'2015-10-15 21:15:16.953' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'eed2db59-cbf2-4b32-98be-a532015e4452', N'LogOn.LogOff', NULL, CAST(N'2015-10-15 21:15:16.967' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f9cdd514-13f5-40e2-b946-a532015e445a', N'Post.PleaseWait', NULL, CAST(N'2015-10-15 21:15:16.997' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'eac7af1e-561d-4acf-89c8-a532015e445e', N'Topic.DiscussionTaggedWith', NULL, CAST(N'2015-10-15 21:15:17.010' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'832cc288-045d-4a08-886c-a532015e4463', N'Topic.TitleFallBack', NULL, CAST(N'2015-10-15 21:15:17.027' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3c8a4818-a7d1-46d0-8bdc-a532015e4468', N'Topic.Subscribe', NULL, CAST(N'2015-10-15 21:15:17.053' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2e2b1be2-6478-4720-8a6b-a532015e4470', N'Topic.UnSubscribe', NULL, CAST(N'2015-10-15 21:15:17.067' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f7a9605c-d08a-412d-9b27-a532015e4474', N'Topic.IsLocked', NULL, CAST(N'2015-10-15 21:15:17.083' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8ad76561-0f47-4d30-b0a3-a532015e447a', N'Topic.CreateDiscussion', NULL, CAST(N'2015-10-15 21:15:17.100' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6704178b-72af-42f4-88d2-a532015e4484', N'Topic.TagThisTopic', NULL, CAST(N'2015-10-15 21:15:17.137' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5fe996cf-9184-4bef-8e3b-a532015e4489', N'Tags.PopularTags', NULL, CAST(N'2015-10-15 21:15:17.150' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b6179a59-fef9-4193-9f5c-a532015e4490', N'Stats.FooterMainStatText', NULL, CAST(N'2015-10-15 21:15:17.177' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bd65c869-f439-4b49-9fdf-a532015e4495', N'Stats.LatestMembers', NULL, CAST(N'2015-10-15 21:15:17.190' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'95e015b1-fff4-47c2-ac85-a532015e4499', N'PM.Title', NULL, CAST(N'2015-10-15 21:15:17.207' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5f91e154-f973-4b6b-83f4-a532015e449e', N'PM.From', NULL, CAST(N'2015-10-15 21:15:17.223' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'893e9007-e60c-4096-8a0a-a532015e44a6', N'PM.Sent', NULL, CAST(N'2015-10-15 21:15:17.250' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'43fbc52c-f6bc-492a-aa7c-a532015e44ab', N'PM.BackToInbox', NULL, CAST(N'2015-10-15 21:15:17.267' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'814d0e78-3141-4434-beff-a532015e44b0', N'PM.Reply', NULL, CAST(N'2015-10-15 21:15:17.280' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'68bba560-00df-45eb-8afd-a532015e44b4', N'PM.SentPrivateMessages', NULL, CAST(N'2015-10-15 21:15:17.310' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'78553c23-bb55-452e-b14c-a532015e44be', N'PM.To', NULL, CAST(N'2015-10-15 21:15:17.330' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'706c81e2-3ebc-4274-b0e1-a532015e44c3', N'PM.Subject', NULL, CAST(N'2015-10-15 21:15:17.357' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a75a7d22-30aa-4fcd-9fd5-a532015e44cb', N'PM.Date', NULL, CAST(N'2015-10-15 21:15:17.373' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'243d91d5-b856-4059-844b-a532015e44d0', N'PM.Read', NULL, CAST(N'2015-10-15 21:15:17.387' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'eca53376-61f8-47c4-a920-a532015e44d4', N'PM.Delete', NULL, CAST(N'2015-10-15 21:15:17.403' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1638dddc-5c80-4bbf-8938-a532015e44e1', N'PM.NoMessages', NULL, CAST(N'2015-10-15 21:15:17.447' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'be960851-bf40-4276-9dd0-a532015e44e6', N'PM.Create', NULL, CAST(N'2015-10-15 21:15:17.463' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f6540ef1-41ea-4c82-b92a-a532015e44eb', N'PM.ReceivedPrivateMessages', NULL, CAST(N'2015-10-15 21:15:17.487' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'99a31b0e-515d-41e2-95de-a532015e44f2', N'PM.CreatePrivateMessage', NULL, CAST(N'2015-10-15 21:15:17.503' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9d5e9266-17dc-4ef8-80ed-a532015e44f7', N'PM.Send', NULL, CAST(N'2015-10-15 21:15:17.520' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0802c517-4a69-402d-907a-a532015e44fd', N'PM.OriginalMessage', NULL, CAST(N'2015-10-15 21:15:17.547' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'260b2b1e-40cb-4f75-bbb2-a532015e4504', N'Buttons.Send', NULL, CAST(N'2015-10-15 21:15:17.577' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'81b5833b-2786-4d6a-bf3b-a532015e450d', N'Report.ReportPostBy', NULL, CAST(N'2015-10-15 21:15:17.607' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fc0bfaf5-edb6-42b9-b8df-a532015e4516', N'Buttons.Edit', NULL, CAST(N'2015-10-15 21:15:17.623' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'18839245-2095-4ba4-a7ba-a532015e451a', N'Points.ThisWeeksHighEarners', NULL, CAST(N'2015-10-15 21:15:17.637' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e4d3f2ec-3dd6-45db-be2c-a532015e451f', N'SideBox.MyTools', NULL, CAST(N'2015-10-15 21:15:17.653' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'69fbf03d-afea-4080-ae1f-a532015e4528', N'PM.PrivateMessages', NULL, CAST(N'2015-10-15 21:15:17.680' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fcfe5c36-d0c1-48ab-a04c-a532015e452c', N'Members.SearchMembers', NULL, CAST(N'2015-10-15 21:15:17.697' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a530fbf6-43b9-4f87-b80c-a532015e4531', N'Buttons.Search', NULL, CAST(N'2015-10-15 21:15:17.713' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8035b9ad-61ec-4fc3-8e3b-a532015e4536', N'Members.Users', NULL, CAST(N'2015-10-15 21:15:17.740' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'80840a1f-e251-4ffe-911d-a532015e453f', N'Members.Points', NULL, CAST(N'2015-10-15 21:15:17.760' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0063326f-33f1-45f1-b38e-a532015e4544', N'Members.DateJoined', NULL, CAST(N'2015-10-15 21:15:17.787' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cfbd0eec-7918-4cf2-9f25-a532015e454c', N'Report.Report', NULL, CAST(N'2015-10-15 21:15:17.800' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'829aa141-0905-4f32-8c42-a532015e4550', N'Members.Register', NULL, CAST(N'2015-10-15 21:15:17.817' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'76600753-4526-46ae-8fb5-a532015e4555', N'Members.AlreadyRegistered', NULL, CAST(N'2015-10-15 21:15:17.833' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'72a822e1-30ea-4e46-a022-a532015e455a', N'Members.LogOnMessage', NULL, CAST(N'2015-10-15 21:15:17.860' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a13b146e-2e5e-45e9-967a-a532015e4562', N'Buttons.LogOn', NULL, CAST(N'2015-10-15 21:15:17.873' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b1c4fd19-8cf4-4dea-9b60-a532015e4566', N'Members.ProfileTitle', NULL, CAST(N'2015-10-15 21:15:17.890' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7fd34c9c-47fc-4b56-8af9-a532015e456b', N'Members.Profile.Joined', NULL, CAST(N'2015-10-15 21:15:17.907' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'21a99f60-f286-458a-a07d-a532015e457a', N'Members.Profile.Posts', NULL, CAST(N'2015-10-15 21:15:17.957' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9d335bef-d2bc-4ce5-b501-a532015e457f', N'Members.Profile.Points', NULL, CAST(N'2015-10-15 21:15:17.973' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cacefaf5-2f0f-42a5-8482-a532015e4587', N'Buttons.Report', NULL, CAST(N'2015-10-15 21:15:17.997' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'02226c66-83e2-4810-83cb-a532015e458c', N'Members.Profile.Address', NULL, CAST(N'2015-10-15 21:15:18.013' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4bc75812-b23f-4cd0-b4ca-a532015e4590', N'Members.Profile.City', NULL, CAST(N'2015-10-15 21:15:18.030' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'07b78f8e-d26a-4647-8c39-a532015e4595', N'Members.Profile.State', NULL, CAST(N'2015-10-15 21:15:18.083' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'61b4241b-0334-400a-a7c5-a532015e45a5', N'Members.Profile.Zip', NULL, CAST(N'2015-10-15 21:15:18.097' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd878916e-f45c-4335-a86f-a532015e45aa', N'Members.Profile.Country', NULL, CAST(N'2015-10-15 21:15:18.117' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dbc0b47a-def2-498e-9d3a-a532015e45af', N'Members.Profile.Website', NULL, CAST(N'2015-10-15 21:15:18.130' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b1f8dd20-1a5a-4a7f-a56f-a532015e45b4', N'Members.Profile.DiscussionActivity', NULL, CAST(N'2015-10-15 21:15:18.160' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ce5d1192-1f98-43fd-89c1-a532015e45bd', N'Ajax.PleaseWait', NULL, CAST(N'2015-10-15 21:15:18.177' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'277a1e0d-9d6c-488f-8899-a532015e45c2', N'Members.Profile.Badges', NULL, CAST(N'2015-10-15 21:15:18.203' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'977e9eb8-a0ab-4743-9d56-a532015e45c9', N'Members.EditProfile', NULL, CAST(N'2015-10-15 21:15:18.220' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'79297a02-1547-42d4-947b-a532015e45ce', N'Buttons.Save', NULL, CAST(N'2015-10-15 21:15:18.237' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'73f15489-8503-4ef8-a5dd-a532015e45d3', N'Members.EditMember', NULL, CAST(N'2015-10-15 21:15:18.253' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'251abea8-d112-4a43-adb3-a532015e45db', N'Leaderboard.ThisWeeksStars', NULL, CAST(N'2015-10-15 21:15:18.280' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0ce74d5c-d263-43ba-9dbd-a532015e45e0', N'Leaderboard.ThisYearsStars', NULL, CAST(N'2015-10-15 21:15:18.297' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6f11e742-6c0f-4238-aebf-a532015e45e5', N'Leaderboard.LeaderboardTitle', NULL, CAST(N'2015-10-15 21:15:18.313' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ecd7c4a1-52eb-4fb6-9223-a532015e45ea', N'Home.LatestDiscussions', NULL, CAST(N'2015-10-15 21:15:18.327' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f6ff7f47-3ee2-4440-bbc5-a532015e45f2', N'Home.Rss', NULL, CAST(N'2015-10-15 21:15:18.357' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a2f63eca-72f3-4745-84da-a532015e45f7', N'Activity.ActivityTitle', NULL, CAST(N'2015-10-15 21:15:18.373' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'31770798-b3c8-4e0f-b744-a532015e45fc', N'Notification.SubscribeByEmail', NULL, CAST(N'2015-10-15 21:15:18.403' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd99ce1e7-41fa-4004-902b-a532015e4605', N'Notification.UnSubscribeByEmail', NULL, CAST(N'2015-10-15 21:15:18.420' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'308fcde6-94dc-46e8-a9e8-a532015e460a', N'Notification.Subscribe', NULL, CAST(N'2015-10-15 21:15:18.437' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'08f33201-4cfd-49d9-893d-a532015e460f', N'Notification.UnSubscribe', NULL, CAST(N'2015-10-15 21:15:18.463' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'96dc4634-9342-4487-9dce-a532015e4617', N'Category.NoDiscussions', NULL, CAST(N'2015-10-15 21:15:18.480' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'882fe436-fe4f-47b1-9b70-a532015e461c', N'Category.CategoriesSideHeading', NULL, CAST(N'2015-10-15 21:15:18.497' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'820c6ed1-6bfa-4ff4-a94c-a532015e4621', N'PM.RecipientUsername', NULL, CAST(N'2015-10-15 21:15:18.510' AS DateTime))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'647a3b82-02e4-459c-af1e-a532015e4629', N'PM.MessageSubject', NULL, CAST(N'2015-10-15 21:15:18.540' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9262a312-7fde-4dde-9908-a532015e462e', N'Post.Label.TopicName', NULL, CAST(N'2015-10-15 21:15:18.557' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'288d3d07-a2b7-483d-8019-a532015e4633', N'Post.Label.IsStickyTopic', NULL, CAST(N'2015-10-15 21:15:18.570' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5035ed6a-348f-40b6-adab-a532015e4638', N'Post.Label.LockTopic', NULL, CAST(N'2015-10-15 21:15:18.607' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'734bc701-91ef-436e-95f1-a532015e4642', N'Post.label.TopicCategory', NULL, CAST(N'2015-10-15 21:15:18.623' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'17584993-9268-4719-b3cf-a532015e4647', N'Members.Label.Username', NULL, CAST(N'2015-10-15 21:15:18.650' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bcf8874a-b074-4554-a03c-a532015e4650', N'Members.Label.EmailAddress', NULL, CAST(N'2015-10-15 21:15:18.667' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4df4d1f1-3e05-48e8-b3cb-a532015e4655', N'Members.Label.Password', NULL, CAST(N'2015-10-15 21:15:18.683' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'222ac029-8cb6-469a-a053-a532015e465a', N'Members.Label.ConfirmPassword', NULL, CAST(N'2015-10-15 21:15:18.700' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a77ae5d9-a9e4-4e82-ae2b-a532015e4662', N'Members.Label.UserIsApproved', NULL, CAST(N'2015-10-15 21:15:18.730' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a7d80203-55ee-4f30-a031-a532015e4667', N'Members.Label.Comment', NULL, CAST(N'2015-10-15 21:15:18.747' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd61fc242-a437-44d8-8273-a532015e466c', N'Members.Label.Roles', NULL, CAST(N'2015-10-15 21:15:18.763' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'268e2f0a-9fed-41bb-91ea-a532015e4671', N'Members.Label.Signature', NULL, CAST(N'2015-10-15 21:15:18.777' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'007d297a-d258-4f43-8884-a532015e467b', N'Members.Label.Website', NULL, CAST(N'2015-10-15 21:15:18.817' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'921fffd2-d9a4-4699-a0fd-a532015e4681', N'Members.Label.RememberMe', NULL, CAST(N'2015-10-15 21:15:18.833' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bac960d0-1b5f-4874-9e85-a532015e468b', N'Members.Label.Users', NULL, CAST(N'2015-10-15 21:15:18.867' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e4b859f8-5d6c-4126-8f9c-a532015e4690', N'Members.Label.DateJoined', NULL, CAST(N'2015-10-15 21:15:18.883' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c3d85ff1-bdcc-4218-8a77-a532015e4695', N'Errors.NoAccess', NULL, CAST(N'2015-10-15 21:15:18.900' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fccce5e2-be24-4fef-91f7-a532015e469a', N'Errors.GenericMessage', NULL, CAST(N'2015-10-15 21:15:18.927' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1ace1d97-1803-4b03-bbfd-a532015e46a3', N'Errors.NoPermission', NULL, CAST(N'2015-10-15 21:15:18.947' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'02d51dd1-8a46-4adf-a646-a532015e46a8', N'Topic.Notification.NewTopics', NULL, CAST(N'2015-10-15 21:15:18.963' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'69f82147-c57f-4e1e-9ca0-a532015e46b0', N'Topic.Notification.Subject', NULL, CAST(N'2015-10-15 21:15:18.987' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'aa3e9b65-d5f5-4f39-b22d-a532015e46b5', N'PM.SendingToQuickly', NULL, CAST(N'2015-10-15 21:15:19.007' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0b8744b8-4a2a-4d3e-ba43-a532015e46be', N'PM.SentItemsOverCapcity', NULL, CAST(N'2015-10-15 21:15:19.037' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'db9f7b3d-25c5-4f44-8269-a532015e46c3', N'PM.ReceivedItemsOverCapcity', NULL, CAST(N'2015-10-15 21:15:19.053' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'74dff443-5a66-4efa-9698-a532015e46c8', N'PM.MessageSent', NULL, CAST(N'2015-10-15 21:15:19.070' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5740f246-9e21-4a6a-a00c-a532015e46d4', N'PM.UnableFindMember', NULL, CAST(N'2015-10-15 21:15:19.110' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'012acb42-9094-4b1b-b27a-a532015e46d9', N'PM.TalkToSelf', NULL, CAST(N'2015-10-15 21:15:19.127' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'83204f7e-96bf-43a7-9d97-a532015e46df', N'Post.Updated', NULL, CAST(N'2015-10-15 21:15:19.143' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b54bb245-2a09-41d4-beca-a532015e46e7', N'Topic.Deleted', NULL, CAST(N'2015-10-15 21:15:19.173' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f2a298a7-ce0f-433e-b1ef-a532015e46ec', N'Post.Deleted', NULL, CAST(N'2015-10-15 21:15:19.187' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'05440f09-40f9-4545-90e6-a532015e46f1', N'Post.Notification.NewPosts', NULL, CAST(N'2015-10-15 21:15:19.207' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd5cef700-a880-45fa-9d21-a532015e46f6', N'Post.Notification.Subject', NULL, CAST(N'2015-10-15 21:15:19.237' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f1ad52e8-a0ef-4e29-b932-a532015e46ff', N'Report.ReportSent', NULL, CAST(N'2015-10-15 21:15:19.253' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'454a1cc8-f37e-41f1-879c-a532015e4704', N'Members.NowRegistered', NULL, CAST(N'2015-10-15 21:15:19.280' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ddd6dd33-085f-4720-b38b-a532015e470c', N'Members.NowRegisteredNeedApproval', NULL, CAST(N'2015-10-15 21:15:19.297' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'282754bd-219c-4e15-8e36-a532015e4711', N'Members.NowLoggedIn', NULL, CAST(N'2015-10-15 21:15:19.313' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'70522d47-04fc-4892-9b69-a532015e4716', N'Members.Errors.PasswordIncorrect', NULL, CAST(N'2015-10-15 21:15:19.327' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'567b50ad-7efa-431f-b053-a532015e471e', N'Members.Errors.PasswordAttemptsExceeded', NULL, CAST(N'2015-10-15 21:15:19.357' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5ca17a8d-9ac0-4318-a157-a532015e4724', N'Members.Errors.UserLockedOut', NULL, CAST(N'2015-10-15 21:15:19.373' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'65f2d78d-a837-44a0-8ff2-a532015e4728', N'Members.Errors.UserNotApproved', NULL, CAST(N'2015-10-15 21:15:19.390' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e2ed381e-f41a-445e-b63e-a532015e472e', N'Members.Errors.LogonGeneric', NULL, CAST(N'2015-10-15 21:15:19.407' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7d98ffd7-0475-4e91-a166-a532015e4736', N'Members.NowLoggedOut', NULL, CAST(N'2015-10-15 21:15:19.437' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c63bb513-87fe-43a3-b134-a532015e473c', N'Member.ProfileUpdated', NULL, CAST(N'2015-10-15 21:15:19.463' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'21d3205a-5cab-4096-9ba5-a532015e4744', N'Language.Changed', NULL, CAST(N'2015-10-15 21:15:19.480' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'71c0b70d-00e2-4f9c-9e41-a532015e4749', N'Rss.LatestActivity.Title', NULL, CAST(N'2015-10-15 21:15:19.497' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3be0d97f-252b-4e75-bf78-a532015e474e', N'Rss.LatestActivity.Description', NULL, CAST(N'2015-10-15 21:15:19.517' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'01c02e83-bce0-49df-a858-a532015e4753', N'Errors.NothingToDisplay', NULL, CAST(N'2015-10-15 21:15:19.543' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'222841e6-e454-4b6e-b6f4-a532015e475b', N'Rss.Category.Title', NULL, CAST(N'2015-10-15 21:15:19.560' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8ed3b6e9-78e7-4d30-9fb0-a532015e4760', N'Rss.Category.Description', NULL, CAST(N'2015-10-15 21:15:19.577' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b47205da-9e63-4ba8-88bf-a532015e4766', N'Report.Reporter', NULL, CAST(N'2015-10-15 21:15:19.593' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dfbf1acc-0410-4a47-a29b-a532015e476e', N'Report.MemberReported', NULL, CAST(N'2015-10-15 21:15:19.623' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f4c30737-a7b5-4f4a-bd66-a532015e4773', N'Report.Reason', NULL, CAST(N'2015-10-15 21:15:19.647' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4660a687-d4f9-4a49-982b-a532015e477d', N'Report.MemberReport', NULL, CAST(N'2015-10-15 21:15:19.673' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9789c814-a222-4b0f-ac5d-a532015e4782', N'Report.Admin', NULL, CAST(N'2015-10-15 21:15:19.690' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'77d11b95-cff4-4a30-a534-a532015e4787', N'Report.PostReported', NULL, CAST(N'2015-10-15 21:15:19.707' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd2b3e1f0-7339-47f7-9b02-a532015e478d', N'Report.PostReport', NULL, CAST(N'2015-10-15 21:15:19.723' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'298dae4e-4a17-45b9-95c3-a532015e4795', N'Badges.UnableToAward', NULL, CAST(N'2015-10-15 21:15:19.757' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'38499831-4648-4128-9b51-a532015e479c', N'Badge.UnknownBadge', NULL, CAST(N'2015-10-15 21:15:19.777' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1838cca6-a053-4fa8-bf53-a532015e47a1', N'Badge.BadegEnumNoClass', NULL, CAST(N'2015-10-15 21:15:19.793' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9e3a70e5-fc67-4c2e-b36f-a532015e47a6', N'Members.Errors.DuplicateUserName', NULL, CAST(N'2015-10-15 21:15:19.820' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dc482dc5-1f04-4c7f-89e0-a532015e47af', N'Members.Errors.DuplicateEmail', NULL, CAST(N'2015-10-15 21:15:19.840' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5195f4c9-921b-48b4-b828-a532015e47b5', N'Members.Errors.InvalidPassword', NULL, CAST(N'2015-10-15 21:15:19.867' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ac5f26d7-4861-46e0-b7c4-a532015e47bd', N'Members.Errors.InvalidEmail', NULL, CAST(N'2015-10-15 21:15:19.883' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'eaa5f8a3-c261-4c8e-be1a-a532015e47c2', N'Members.Errors.InvalidAnswer', NULL, CAST(N'2015-10-15 21:15:19.900' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'105279b5-1c39-43f9-bfb0-a532015e47c7', N'Members.Errors.InvalidQuestion', NULL, CAST(N'2015-10-15 21:15:19.920' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b352728e-7012-4a09-8949-a532015e47cf', N'Members.Errors.InvalidUserName', NULL, CAST(N'2015-10-15 21:15:19.947' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'295aaf10-264e-4f2d-8c9f-a532015e47d5', N'Members.Errors.ProviderError', NULL, CAST(N'2015-10-15 21:15:19.963' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8bbb708a-509d-499b-9c36-a532015e47da', N'Members.Errors.UserRejected', NULL, CAST(N'2015-10-15 21:15:19.980' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c8f0f550-8eb8-4651-8f98-a532015e47df', N'Members.Errors.Unknown', NULL, CAST(N'2015-10-15 21:15:20.000' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e425add5-501e-47e2-8f88-a532015e47e8', N'Members.NewMemberRegistered', NULL, CAST(N'2015-10-15 21:15:20.027' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1673cd66-6670-4b52-aab7-a532015e47ed', N'Members.Admin', NULL, CAST(N'2015-10-15 21:15:20.047' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c9ed0af4-01db-41fc-9ff5-a532015e47f2', N'Members.NewMemberSubject', NULL, CAST(N'2015-10-15 21:15:20.073' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'96dea059-970f-4709-bb69-a532015e47fb', N'Members.CantUnlock', NULL, CAST(N'2015-10-15 21:15:20.090' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1cff725f-f572-4a3f-b022-a532015e4800', N'Members.ForgotPassword.Email', NULL, CAST(N'2015-10-15 21:15:20.107' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'437f4c88-c34a-4cb9-8d21-a532015e4805', N'Members.ForgotPassword.Subject', NULL, CAST(N'2015-10-15 21:15:20.160' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'10f8b873-15b1-41f3-9e07-a532015e4815', N'Members.ForgotPassword.SuccessMessage', NULL, CAST(N'2015-10-15 21:15:20.180' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e0f26f0c-a0c3-4dad-b553-a532015e481a', N'Members.ForgotPassword.ErrorMessage', NULL, CAST(N'2015-10-15 21:15:20.197' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'edd7a7ab-aa5e-41b5-8df0-a532015e481f', N'Members.ChangePassword.Success', NULL, CAST(N'2015-10-15 21:15:20.213' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7650ac39-a698-4056-937c-a532015e482a', N'Members.ChangePassword.Error', NULL, CAST(N'2015-10-15 21:15:20.250' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9308ca03-aae5-48fe-8c6b-a532015e482f', N'Buttons.ChangePassword', NULL, CAST(N'2015-10-15 21:15:20.267' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8d827a19-5ab8-4235-aefd-a532015e4837', N'Members.ChangePassword.Title', NULL, CAST(N'2015-10-15 21:15:20.297' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fe95c7fb-728b-444f-8faf-a532015e483d', N'Members.ChangePassword.Text', NULL, CAST(N'2015-10-15 21:15:20.313' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'00a42434-7695-4db4-a9e2-a532015e4845', N'Members.ChangePassword.Link', NULL, CAST(N'2015-10-15 21:15:20.340' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'450633c1-b00e-4415-a6a6-a532015e484a', N'Members.ForgotPassword.Title', NULL, CAST(N'2015-10-15 21:15:20.357' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0ea35501-ee0f-4e9b-b2d9-a532015e484f', N'Buttons.ResetPassword', NULL, CAST(N'2015-10-15 21:15:20.373' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4e615fea-053b-43a9-bfe1-a532015e4854', N'Members.ForgotPassword.Link', NULL, CAST(N'2015-10-15 21:15:20.400' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a14d4735-aa18-4946-998e-a532015e485d', N'Members.Label.CurrentPassword', NULL, CAST(N'2015-10-15 21:15:20.420' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b7d9267b-47ea-429f-8a6e-a532015e4863', N'Members.Label.NewPassword', NULL, CAST(N'2015-10-15 21:15:20.437' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'795500f1-d0b9-4623-8ceb-a532015e4868', N'Members.Label.ConfirmNewPassword', NULL, CAST(N'2015-10-15 21:15:20.457' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e77794b2-09a3-4e5e-9c78-a532015e4873', N'Members.Label.EmailAddressBlank', NULL, CAST(N'2015-10-15 21:15:20.497' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dd5e531a-dc7c-4a2e-80a8-a532015e4879', N'Activity.Badge', NULL, CAST(N'2015-10-15 21:15:20.513' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ebd74ac8-1566-4b84-858f-a532015e487f', N'Activity.UserAwardedBadge', NULL, CAST(N'2015-10-15 21:15:20.530' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'96fa3556-1987-4227-b25a-a532015e4884', N'Activity.UserJoined', NULL, CAST(N'2015-10-15 21:15:20.550' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'19f76a8e-9789-4846-b806-a532015e488c', N'Activity.ProfileUpdated', NULL, CAST(N'2015-10-15 21:15:20.577' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a145b634-8236-48ae-9dd8-a532015e4892', N'Topic.Label.SubscribeToTopic', NULL, CAST(N'2015-10-15 21:15:20.607' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a2287351-8f2c-4e70-aaae-a532015e489b', N'Badges.PageTitle', NULL, CAST(N'2015-10-15 21:15:20.627' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ff4773a5-31f5-4080-81f0-a532015e48a4', N'Layout.Nav.Badges', NULL, CAST(N'2015-10-15 21:15:20.657' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ab3cbd89-fc61-4e7f-b5dd-a532015e48aa', N'Topic.Label.TopicTitle', NULL, CAST(N'2015-10-15 21:15:20.677' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'91a4164c-6fc6-4d7b-a621-a532015e48b3', N'Poll.Button.Create', NULL, CAST(N'2015-10-15 21:15:20.703' AS DateTime))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1ff2717e-7eb6-4f20-8a85-a532015e48b8', N'Poll.Placeholder.TypeAnswerHere', NULL, CAST(N'2015-10-15 21:15:20.723' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'429fbd00-6845-4634-a100-a532015e48be', N'Topic.OptionsHeading', NULL, CAST(N'2015-10-15 21:15:20.740' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'04c54b17-2d0a-4caf-b40f-a532015e48c3', N'Poll.Button.Remove', NULL, CAST(N'2015-10-15 21:15:20.770' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e68b555b-ab45-4352-8f17-a532015e48cb', N'Poll.Button.Vote', NULL, CAST(N'2015-10-15 21:15:20.787' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'05e07c99-99f4-47e7-ac4a-a532015e48d1', N'Error.WrongAnswerRegistration', NULL, CAST(N'2015-10-15 21:15:20.807' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd70e2d4f-6fd8-4022-88cd-a532015e48d7', N'Members.LoginOrText', NULL, CAST(N'2015-10-15 21:15:20.827' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2b787f2d-088b-4aed-a445-a532015e48e0', N'Members.Profile.IsSocialAccount', NULL, CAST(N'2015-10-15 21:15:20.857' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'923d28f0-a53c-4966-aa42-a532015e48e6', N'Date.JustNow', NULL, CAST(N'2015-10-15 21:15:20.877' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9251a675-3c6b-403d-8036-a532015e48ec', N'Date.OneMinuteAgo', NULL, CAST(N'2015-10-15 21:15:20.907' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'05ec61c5-54be-45d7-bb1a-a532015e48f5', N'Date.MinutesAgo', NULL, CAST(N'2015-10-15 21:15:20.927' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bcaab735-88f2-45c8-b973-a532015e48fa', N'Date.OneHourAgo', NULL, CAST(N'2015-10-15 21:15:20.943' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'327dcfab-ffeb-4593-8beb-a532015e4903', N'Date.HoursAgo', NULL, CAST(N'2015-10-15 21:15:20.970' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fb2bbb7c-28e1-4f52-aade-a532015e490b', N'Date.Yesterday', NULL, CAST(N'2015-10-15 21:15:20.997' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'acbb61d5-bebf-49a3-909a-a532015e490f', N'Date.DaysAgo', NULL, CAST(N'2015-10-15 21:15:21.013' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c546b679-9dc8-47d0-9c0e-a532015e4914', N'Date.WeeksAgo', NULL, CAST(N'2015-10-15 21:15:21.030' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ceae90c8-52c8-4817-afef-a532015e4919', N'Side.Search', NULL, CAST(N'2015-10-15 21:15:21.057' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4364a88c-e465-4b59-8b9e-a532015e4921', N'Search.NoResults', NULL, CAST(N'2015-10-15 21:15:21.073' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6825a348-453b-490e-827d-a532015e4927', N'Topic.CommentsDetails', NULL, CAST(N'2015-10-15 21:15:21.097' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c58151c0-eb4b-47d5-88a1-a532015e4933', N'Members.DeleteAllPosts', NULL, CAST(N'2015-10-15 21:15:21.130' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'95e3059e-4ede-4575-980a-a532015e4938', N'Buttons.CreatePost', NULL, CAST(N'2015-10-15 21:15:21.147' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b0f7e261-115d-43cc-b1fc-a532015e493c', N'Topic.Label.Category', NULL, CAST(N'2015-10-15 21:15:21.163' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4a3693e8-506b-4c1c-9060-a532015e4941', N'Editor.NeedHelp', NULL, CAST(N'2015-10-15 21:15:21.190' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ad6cf6ba-5538-4c43-81dd-a532015e494a', N'Members.BanUser', NULL, CAST(N'2015-10-15 21:15:21.207' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3324bda5-2585-4bc3-9828-a532015e494f', N'Members.UnBanUser', NULL, CAST(N'2015-10-15 21:15:21.227' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f64bfd74-cbe6-4ad3-9be3-a532015e4954', N'Errors.NoPermissionPolls', NULL, CAST(N'2015-10-15 21:15:21.243' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2101bdd2-061b-4158-a783-a532015e495d', N'Topic.ShowMorePosts', NULL, CAST(N'2015-10-15 21:15:21.270' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'41dc384b-2f3f-49c7-925f-a532015e4962', N'Topic.ShowMorePostsLoading', NULL, CAST(N'2015-10-15 21:15:21.290' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3ab8d137-8b78-46e4-9940-a532015e4968', N'Topic.AlreadyAnswered', NULL, CAST(N'2015-10-15 21:15:21.313' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6b2d5adf-f4cf-4f35-a82b-a532015e496f', N'Topic.Comment', NULL, CAST(N'2015-10-15 21:15:21.330' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'87712465-a4da-43d7-af08-a532015e4974', N'Stats.FooterActiveUsersText', NULL, CAST(N'2015-10-15 21:15:21.350' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'df16706c-e66b-4bec-9f89-a532015e4979', N'PostFilter.OrderBy', NULL, CAST(N'2015-10-15 21:15:21.377' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'83736420-4651-49c2-89bf-a532015e4982', N'PostFilter.Standard', NULL, CAST(N'2015-10-15 21:15:21.393' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dd1557bc-487f-47a8-ad94-a532015e4987', N'PostFilter.Newest', NULL, CAST(N'2015-10-15 21:15:21.413' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c0570a2c-22fe-4e2e-97cf-a532015e498c', N'PostFilter.Votes', NULL, CAST(N'2015-10-15 21:15:21.427' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cecca554-e228-4adb-9aca-a532015e4991', N'PM.NewPrivateMessageSubject', NULL, CAST(N'2015-10-15 21:15:21.457' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'da1b6552-e038-4379-8079-a532015e499b', N'PM.NewPrivateMessageBody', NULL, CAST(N'2015-10-15 21:15:21.480' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0a1b744d-bbad-4ec4-a349-a532015e49a0', N'Post.DeleteConfirmation', NULL, CAST(N'2015-10-15 21:15:21.497' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a6e0262f-e6d8-4551-83ac-a532015e49a5', N'Category.SubCategoriesHeading', NULL, CAST(N'2015-10-15 21:15:21.513' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8041174c-d311-4ade-9b80-a532015e49af', N'Category.AllCategories', NULL, CAST(N'2015-10-15 21:15:21.547' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4f58129c-bb61-4bc2-91ea-a532015e49b4', N'Category.MostRecent', NULL, CAST(N'2015-10-15 21:15:21.563' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3d24688a-d1e8-4aa7-8834-a532015e49bc', N'Error.EmailIsBanned', NULL, CAST(N'2015-10-15 21:15:21.590' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2a45b950-bb5e-45c9-9c2d-a532015e49c2', N'Post.FilesUploaded', NULL, CAST(N'2015-10-15 21:15:21.607' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'be4577aa-9c3d-4bcc-a967-a532015e49c7', N'Post.Attach', NULL, CAST(N'2015-10-15 21:15:21.627' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c6eefcb8-3db3-42ad-b0ea-a532015e49cc', N'Post.Upload', NULL, CAST(N'2015-10-15 21:15:21.643' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'28b748ff-6401-445b-b3d0-a532015e49d5', N'Post.UploadBannedFileExtension', NULL, CAST(N'2015-10-15 21:15:21.670' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f69783ee-d450-4b60-b361-a532015e49da', N'Post.UploadFileTooBig', NULL, CAST(N'2015-10-15 21:15:21.687' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'caeea5c4-1966-4644-88c3-a532015e49df', N'File.SuccessfullyDeleted', NULL, CAST(N'2015-10-15 21:15:21.707' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'43ead283-1815-479b-bfe3-a532015e49e8', N'Members.MemberEmailAuthorisationNeeded', NULL, CAST(N'2015-10-15 21:15:21.737' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ac1374af-a9c2-41cd-aa29-a532015e49ee', N'Members.MemberEmailAuthorisation.EmailBody', NULL, CAST(N'2015-10-15 21:15:21.753' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'16c2df3c-ed6f-42a1-b522-a532015e49f3', N'Members.MemberEmailAuthorisation.Subject', NULL, CAST(N'2015-10-15 21:15:21.787' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'202abbde-e387-41ef-adfa-a532015e49fd', N'Members.NowApproved', NULL, CAST(N'2015-10-15 21:15:21.803' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'09134274-8022-4455-9f51-a532015e4a02', N'Members.MemberEmailAuthorisationNeededMessage', NULL, CAST(N'2015-10-15 21:15:21.823' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dd073463-dfd5-45af-9a5f-a532015e4a07', N'Members.MemberEmailAuthorisationResend', NULL, CAST(N'2015-10-15 21:15:21.840' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'48bf6a68-fc96-4ee6-b36f-a532015e4a10', N'Members.MessageMe', NULL, CAST(N'2015-10-15 21:15:21.867' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'33ce5f26-3737-44fb-b0fd-a532015e4a15', N'Confirmation.DeleteMembersPosts', NULL, CAST(N'2015-10-15 21:15:21.887' AS DateTime))
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8b679407-c4ac-4e54-ab18-a532015e43b7', N'Register', N'93a1089e-b966-4f46-be76-a532015e43a7', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c8181610-7c26-4b64-9996-a532015e43c0', N'Log On', N'045d2905-585f-4d89-83c8-a532015e43b7', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0abfb3e9-1b41-4f25-ad73-a532015e43c6', N'Activity', N'5a38edc5-3c52-4636-ae52-a532015e43c0', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'013a9ecc-10a5-4da3-b21c-a532015e43cd', N'Leaderboard', N'6188f567-48ef-4052-9de3-a532015e43c6', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'77bd6581-8106-4e61-aabb-a532015e43d2', N'Home', N'dedbdf53-ac20-49a5-9df4-a532015e43cd', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'33f76f7f-359f-4f27-818f-a532015e43d6', N'Admin', N'17f73c75-a993-4d49-ba5f-a532015e43d2', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'77922744-fbef-40ce-b0be-a532015e43da', N'New Discussion', N'd6ee22d1-4c4a-4bed-b6db-a532015e43d6', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7def183c-60f8-47fd-b3af-a532015e43e4', N'Powered by ', N'59381df6-3b70-4398-82e5-a532015e43da', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e9abd259-be89-4f5c-8dab-a532015e43e8', N'Votes', N'aedbe008-fff7-4839-a7c4-a532015e43e4', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ee4784e0-963d-49ce-b7f2-a532015e43ed', N'Answers', N'c41f53c0-e238-4e09-9bf3-a532015e43e8', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'226f9c49-42bd-4fd5-9cd4-a532015e43fb', N'Started {0} by {1}', N'2ac7620a-af3a-4540-b912-a532015e43ed', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4c6889e6-4cb8-47bf-8294-a532015e4400', N' in ', N'75d6ebc9-5b7a-43c1-befb-a532015e43fb', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd6f79b18-c49d-4048-ad73-a532015e4408', N'Latest By', N'e2657549-7fd5-442a-ac1e-a532015e4400', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e13cb2e6-e9e6-4621-b247-a532015e440d', N'Views', N'06a1b5c4-5c91-4a6c-90c0-a532015e4408', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'aaca7fb4-3a8d-476d-8538-a532015e4411', N'Vote Up', N'361671c4-9567-40c3-bf92-a532015e440d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'689cb449-7354-48ae-a1d1-a532015e4416', N'Vote Down', N'10956e21-7b7c-4dbf-bed8-a532015e4411', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6c638e34-4557-420b-ac5f-a532015e4423', N'Is Solution', N'3bd31554-134e-4dd3-b3ce-a532015e4416', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'57d16e4b-8d28-44a2-a37c-a532015e4428', N'posted this', N'b302ed85-973b-4220-af02-a532015e4423', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0aae8fd3-6fa4-49a1-ac18-a532015e442d', N'Posts', N'2730414b-8d76-4838-98d5-a532015e4428', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2692e389-2f9b-440a-b4fe-a532015e4432', N'Points', N'602c6451-00f8-444b-96e1-a532015e442d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4e33e3f2-8280-45ed-99b7-a532015e443b', N'Last edited', N'dcb284a3-da34-4c3e-8ec4-a532015e4432', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'472156bb-277f-4900-b921-a532015e4444', N'Report', N'11ed8757-d8ae-43f4-abeb-a532015e443b', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'49d28a4e-7fb8-4da1-811b-a532015e4449', N'Edit', N'45d5047a-0296-46b3-9e24-a532015e4444', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'63dd106f-032b-466e-b504-a532015e444d', N'Delete', N'bec596c7-0286-4f44-b913-a532015e4449', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0e66f6b9-8a87-49d7-a8d8-a532015e4452', N'Log On', N'b32fe522-e8ce-4eb0-8cf3-a532015e444d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a9843438-9a60-4893-a221-a532015e4459', N'Log Off', N'eed2db59-cbf2-4b32-98be-a532015e4452', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b7406b47-b9f3-486d-beac-a532015e445e', N'Please Wait...', N'f9cdd514-13f5-40e2-b946-a532015e445a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ae3ad447-e5de-4ad7-9a0a-a532015e4463', N'Discussions Tagged With: ', N'eac7af1e-561d-4acf-89c8-a532015e445e', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'86056200-e2b3-4e6e-bfbd-a532015e4468', N'Discussion Topic', N'832cc288-045d-4a08-886c-a532015e4463', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'83c591cc-b4b7-4b54-bf5e-a532015e4470', N'Subscribe', N'3c8a4818-a7d1-46d0-8bdc-a532015e4468', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e09aad0e-1492-4933-90e9-a532015e4474', N'Unsubscribe', N'2e2b1be2-6478-4720-8a6b-a532015e4470', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0aff3ebe-61ae-4176-99ed-a532015e447a', N'Topic Is Locked', N'f7a9605c-d08a-412d-9b27-a532015e4474', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd7f168da-c457-49a9-89cb-a532015e4484', N'Create Discussion', N'8ad76561-0f47-4d30-b0a3-a532015e447a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a8f4dc0e-1379-4c6c-b058-a532015e4489', N'Tag this topic', N'6704178b-72af-42f4-88d2-a532015e4484', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'82145d53-97e4-495a-9614-a532015e4490', N'Popular Tags', N'5fe996cf-9184-4bef-8e3b-a532015e4489', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2d97485f-1634-4376-861a-a532015e4495', N'Our {0} members have posted {1} times in {2} discussions', N'b6179a59-fef9-4193-9f5c-a532015e4490', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ae97241a-25ae-4ac0-bb3e-a532015e4499', N'Latest Members:', N'bd65c869-f439-4b49-9fdf-a532015e4495', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3f01ec86-df05-4d9b-8ef6-a532015e449e', N'Message: ', N'95e015b1-fff4-47c2-ac85-a532015e4499', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'48883cc2-4bcf-4cd3-8373-a532015e44a6', N'From: ', N'5f91e154-f973-4b6b-83f4-a532015e449e', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2f01669e-452f-4244-986a-a532015e44ab', N'Sent:', N'893e9007-e60c-4096-8a0a-a532015e44a6', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'bde8024f-14aa-48fa-9e28-a532015e44b0', N'Back To Inbox', N'43fbc52c-f6bc-492a-aa7c-a532015e44ab', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2f0a4160-6ed5-4149-b39b-a532015e44b4', N'Reply', N'814d0e78-3141-4434-beff-a532015e44b0', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0e2fab76-6c14-4a2d-8963-a532015e44be', N'Sent Private Messages', N'68bba560-00df-45eb-8afd-a532015e44b4', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0ad8f3c4-06f2-4fea-a3c9-a532015e44c3', N'To', N'78553c23-bb55-452e-b14c-a532015e44be', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3ac49e7f-a588-43ab-bf30-a532015e44cb', N'Subject', N'706c81e2-3ebc-4274-b0e1-a532015e44c3', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5a9ec5f8-d88f-4af2-b697-a532015e44d0', N'Date', N'a75a7d22-30aa-4fcd-9fd5-a532015e44cb', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a9a85379-3ceb-44cd-9489-a532015e44d4', N'Read', N'243d91d5-b856-4059-844b-a532015e44d0', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd05a4d0f-afca-4fcf-8976-a532015e44e1', N'Delete', N'eca53376-61f8-47c4-a920-a532015e44d4', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8f8c5288-56ac-42e9-923f-a532015e44e6', N'You currently don''t have any private messages', N'1638dddc-5c80-4bbf-8938-a532015e44e1', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'aedc9dcb-334f-4de7-9503-a532015e44eb', N'Create', N'be960851-bf40-4276-9dd0-a532015e44e6', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9890eaf2-5a58-49e9-982b-a532015e44f2', N'Received Private Messages', N'f6540ef1-41ea-4c82-b92a-a532015e44eb', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3b3e1155-6fca-4ada-936e-a532015e44f7', N'Create Private Message', N'99a31b0e-515d-41e2-95de-a532015e44f2', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a1a48a9c-0090-4a6a-af2a-a532015e44fc', N'Send', N'9d5e9266-17dc-4ef8-80ed-a532015e44f7', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'dfd02a66-4a9d-4dd6-ace7-a532015e4504', N'Original Message', N'0802c517-4a69-402d-907a-a532015e44fd', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0fa4056a-0b71-4d61-a561-a532015e450d', N'Send', N'260b2b1e-40cb-4f75-bbb2-a532015e4504', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1c6700b7-e8cd-45aa-9c5b-a532015e4516', N'Report Post By: ', N'81b5833b-2786-4d6a-bf3b-a532015e450d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0bb13319-844b-494e-b607-a532015e451a', N'Edit', N'fc0bfaf5-edb6-42b9-b8df-a532015e4516', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7c71d452-0422-4d7e-a08b-a532015e451f', N'This Weeks High Earners', N'18839245-2095-4ba4-a7ba-a532015e451a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'623f7c04-6620-472b-ba91-a532015e4527', N'My Tools', N'e4d3f2ec-3dd6-45db-be2c-a532015e451f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'adc38a4f-7753-484c-8bb1-a532015e452c', N'Private Messages', N'69fbf03d-afea-4080-ae1f-a532015e4528', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8a814fbe-5fbe-44db-b901-a532015e4531', N'Search Members', N'fcfe5c36-d0c1-48ab-a04c-a532015e452c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e5d482ea-4057-4722-a60e-a532015e4536', N'Search', N'a530fbf6-43b9-4f87-b80c-a532015e4531', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a44a8983-9f65-4e92-b5ab-a532015e453f', N'Users', N'8035b9ad-61ec-4fc3-8e3b-a532015e4536', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a74def6e-8fda-4fc2-8eb2-a532015e4544', N'Points', N'80840a1f-e251-4ffe-911d-a532015e453f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'70a215ac-b799-4c11-a0b7-a532015e454c', N'Date Joined', N'0063326f-33f1-45f1-b38e-a532015e4544', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4a5f075c-e480-4931-99ca-a532015e4550', N'Report ', N'cfbd0eec-7918-4cf2-9f25-a532015e454c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'bfb778e6-3d68-4bc8-a498-a532015e4555', N'Register', N'829aa141-0905-4f32-8c42-a532015e4550', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a888fffa-215c-45f0-8fcf-a532015e455a', N'You are already registered? Why would you want to do it again?', N'76600753-4526-46ae-8fb5-a532015e4555', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f5ddfed0-6ec0-4422-93d1-a532015e4562', N'Please enter your user name and password. Or {0} if you don''t have an account', N'72a822e1-30ea-4e46-a022-a532015e455a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'69aee37e-ed3a-4013-9b57-a532015e4566', N'Log On', N'a13b146e-2e5e-45e9-967a-a532015e4562', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9be22616-0e2f-4b39-86c9-a532015e456b', N' Profile', N'b1c4fd19-8cf4-4dea-9b60-a532015e4566', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'afdd98c7-130f-4938-a0f0-a532015e457a', N'Joined:', N'7fd34c9c-47fc-4b56-8af9-a532015e456b', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e654e40e-5ad8-4314-879a-a532015e457f', N'Posts:', N'21a99f60-f286-458a-a07d-a532015e457a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3e54e361-6cc4-4d19-9a98-a532015e4586', N'Points:', N'9d335bef-d2bc-4ce5-b501-a532015e457f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'35e8ab7a-f83b-412c-8f9f-a532015e458b', N'Report', N'cacefaf5-2f0f-42a5-8482-a532015e4587', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'db820395-d221-41e1-af04-a532015e4590', N'Address', N'02226c66-83e2-4810-83cb-a532015e458c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'45cbf48d-31e4-42c6-80e8-a532015e4595', N'City', N'4bc75812-b23f-4cd0-b4ca-a532015e4590', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e2ffbc28-9a5f-468c-84af-a532015e45a5', N'State', N'07b78f8e-d26a-4647-8c39-a532015e4595', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7459b614-8f11-4240-9b22-a532015e45aa', N'Zip', N'61b4241b-0334-400a-a7c5-a532015e45a5', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ee96b38c-de45-4832-a050-a532015e45af', N'Country', N'd878916e-f45c-4335-a86f-a532015e45aa', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'55a8fa05-4d3d-497a-909e-a532015e45b3', N'Website', N'dbc0b47a-def2-498e-9d3a-a532015e45af', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0e753a17-af19-4d16-b973-a532015e45bc', N'Discussion Activity', N'b1f8dd20-1a5a-4a7f-a56f-a532015e45b4', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'61e7dbbf-def5-4051-b304-a532015e45c2', N'Please Wait...', N'ce5d1192-1f98-43fd-89c1-a532015e45bd', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7dd587b3-028e-4b71-af24-a532015e45c9', N'Badges', N'277a1e0d-9d6c-488f-8899-a532015e45c2', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1f608739-3b72-4269-b08b-a532015e45ce', N'Edit Profile', N'977e9eb8-a0ab-4743-9d56-a532015e45c9', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1f8678cc-7a5b-4ed1-86db-a532015e45d3', N'Save', N'79297a02-1547-42d4-947b-a532015e45ce', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9b4f9b84-161f-4f89-935a-a532015e45db', N'Edit Member', N'73f15489-8503-4ef8-a5dd-a532015e45d3', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'27567f33-6d70-4430-bf45-a532015e45e0', N'This Weeks Stars', N'251abea8-d112-4a43-adb3-a532015e45db', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6bf84956-b242-451e-91f4-a532015e45e5', N'This Years Rock Stars', N'0ce74d5c-d263-43ba-9dbd-a532015e45e0', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'518e44fb-552a-401e-ace2-a532015e45ea', N'Global Leaderboard', N'6f11e742-6c0f-4238-aebf-a532015e45e5', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b15f2a12-7818-49ed-a3b6-a532015e45f2', N'Latest Discussions', N'ecd7c4a1-52eb-4fb6-9223-a532015e45ea', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'03e0ee4a-66a0-4a3f-9920-a532015e45f7', N'Rss', N'f6ff7f47-3ee2-4440-bbc5-a532015e45f2', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'56e1e0cb-c4d8-48bb-bba8-a532015e45fc', N'Activity', N'a2f63eca-72f3-4745-84da-a532015e45f7', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'db3f44c2-5229-4aff-b1f2-a532015e4605', N'Subscribe Via Email', N'31770798-b3c8-4e0f-b744-a532015e45fc', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'873f9620-1937-4cb5-b9be-a532015e460a', N'Unsubscribe From Emails', N'd99ce1e7-41fa-4004-902b-a532015e4605', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6aec05c0-4dac-4602-aeff-a532015e460f', N'Subscribe', N'308fcde6-94dc-46e8-a9e8-a532015e460a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'bb15702a-0081-4f81-9deb-a532015e4617', N'UnSubscribe', N'08f33201-4cfd-49d9-893d-a532015e460f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'65e0ccad-4599-4c2c-91d4-a532015e461c', N'Currently no discussions in this category', N'96dc4634-9342-4487-9dce-a532015e4617', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0a32b849-e3aa-40e3-b310-a532015e4621', N'Categories', N'882fe436-fe4f-47b1-9b70-a532015e461c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9bf5f268-32f3-4d9c-9154-a532015e4629', N'Recipient Username', N'820c6ed1-6bfa-4ff4-a94c-a532015e4621', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a81637e8-e80b-4413-9fc8-a532015e462e', N'Subject', N'647a3b82-02e4-459c-af1e-a532015e4629', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'18f1827c-9af9-41f3-a193-a532015e4633', N'Topic Name', N'9262a312-7fde-4dde-9908-a532015e462e', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ebec4a36-dc20-4892-b642-a532015e4638', N'Is Sticky Topic', N'288d3d07-a2b7-483d-8019-a532015e4633', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5c4388a4-4a0d-4fa7-b151-a532015e4642', N'Lock Topic', N'5035ed6a-348f-40b6-adab-a532015e4638', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'eb4d80aa-59ff-4c8e-8464-a532015e4647', N'Topic Category', N'734bc701-91ef-436e-95f1-a532015e4642', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e1c9be3f-3ff1-4b10-b0a2-a532015e4650', N'Username', N'17584993-9268-4719-b3cf-a532015e4647', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ae20c62c-ae78-4a20-9ab4-a532015e4654', N'Email address (Used by Gravatar to show your Avatar image)', N'bcf8874a-b074-4554-a03c-a532015e4650', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a6be4259-18e3-412f-9311-a532015e465a', N'Password', N'4df4d1f1-3e05-48e8-b3cb-a532015e4655', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'733e4f14-3ed9-4f3a-8416-a532015e4662', N'Confirm Password', N'222ac029-8cb6-469a-a053-a532015e465a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'10c121d9-19c8-4a17-95ba-a532015e4667', N'User is Approved', N'a77ae5d9-a9e4-4e82-ae2b-a532015e4662', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8e8e2803-dec7-45e3-b749-a532015e466c', N'Comment', N'a7d80203-55ee-4f30-a031-a532015e4667', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'94c6b767-3e2e-4483-9615-a532015e4671', N'Roles', N'd61fc242-a437-44d8-8273-a532015e466c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd4b71800-e969-4413-a9b6-a532015e467b', N'Signature', N'268e2f0a-9fed-41bb-91ea-a532015e4671', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'770761ee-4ad7-4a56-9791-a532015e4681', N'Website', N'007d297a-d258-4f43-8884-a532015e467b', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'bb2629a7-c7af-419f-91f8-a532015e468b', N'Remember Me?', N'921fffd2-d9a4-4699-a0fd-a532015e4681', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd8378546-4ffe-4123-8991-a532015e4690', N'Users', N'bac960d0-1b5f-4874-9e85-a532015e468b', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4a29f4b9-ca84-451a-ae5e-a532015e4695', N'Date Joined', N'e4b859f8-5d6c-4126-8f9c-a532015e4690', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'89777693-f0cb-479d-b0ec-a532015e469a', N'No Access', N'c3d85ff1-bdcc-4218-8a77-a532015e4695', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'00bc455a-3ab3-480d-a895-a532015e46a3', N'Sorry an error occured', N'fccce5e2-be24-4fef-91f7-a532015e469a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3c7052bf-afd9-4877-b571-a532015e46a8', N'You do not have permission to perform this action', N'1ace1d97-1803-4b03-bbfd-a532015e46a3', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a3ad8d38-7f70-46eb-b822-a532015e46b0', N'A new topic has been created in the {0} category', N'02d51dd1-8a46-4adf-a646-a532015e46a8', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'40f05b8e-ba23-4abe-9621-a532015e46b5', N'New Discussion On ', N'69f82147-c57f-4e1e-9ca0-a532015e46b0', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5dbb174d-9c47-4db8-a3cf-a532015e46be', N'You are trying to send messages to quickly', N'aa3e9b65-d5f5-4f39-b22d-a532015e46b5', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'128abd21-0472-490a-a745-a532015e46c3', N'Your sent items is over capacity - delete messages to be able to send', N'0b8744b8-4a2a-4d3e-ba43-a532015e46be', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'23bd9dc2-b8eb-4b96-a999-a532015e46c8', N'{0} has exceeded their inbox size - unable to send message', N'db9f7b3d-25c5-4f44-8269-a532015e46c3', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'91d09f22-aa6b-4ee6-aa4f-a532015e46d4', N'Message Sent', N'74dff443-5a66-4efa-9698-a532015e46c8', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e882dcc3-7e3e-4607-b650-a532015e46d9', N'Unable to find that member', N'5740f246-9e21-4a6a-a00c-a532015e46d4', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3ad43d48-1615-4102-b4db-a532015e46df', N'Talking to yourself is a bit weird. isn''t it?', N'012acb42-9094-4b1b-b27a-a532015e46d9', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'760b28c0-0bb4-427d-90d6-a532015e46e7', N'Post Updated', N'83204f7e-96bf-43a7-9d97-a532015e46df', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2a567403-b098-4bff-9b9e-a532015e46ec', N'Topic Deleted', N'b54bb245-2a09-41d4-beca-a532015e46e7', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6f84f0b6-dd3f-4c2e-9cbc-a532015e46f1', N'Post Deleted', N'f2a298a7-ce0f-433e-b1ef-a532015e46ec', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'cb5205f2-3de7-4921-aee2-a532015e46f6', N'A new post has been created in the {0} topic', N'05440f09-40f9-4545-90e6-a532015e46f1', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7b25c72d-b4c7-49c4-a81d-a532015e46ff', N'New Post On ', N'd5cef700-a880-45fa-9d21-a532015e46f6', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2b810bd1-d400-4468-8f27-a532015e4704', N'Report Sent', N'f1ad52e8-a0ef-4e29-b932-a532015e46ff', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'858ca846-5939-45b4-9405-a532015e470c', N'You are now registered', N'454a1cc8-f37e-41f1-879c-a532015e4704', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c1252ed0-13db-4761-9d12-a532015e4711', N'You are now registered. But the forum admin must authorise your account', N'ddd6dd33-085f-4720-b38b-a532015e470c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'29640482-f93d-4063-9b88-a532015e4716', N'You are now logged in', N'282754bd-219c-4e15-8e36-a532015e4711', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'38f948bf-2609-4275-b68a-a532015e471e', N'The user or password provided is incorrect.', N'70522d47-04fc-4892-9b69-a532015e4716', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f1cf1cd1-7a7e-4966-8fc6-a532015e4723', N'The maximum number of password attempts has been exceeded.', N'567b50ad-7efa-431f-b053-a532015e471e', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9c18d0c5-99d1-4c67-9ba7-a532015e4728', N'User is locked out.', N'5ca17a8d-9ac0-4318-a157-a532015e4724', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a86d28b7-f1b9-406b-a587-a532015e472e', N'User has not been approved.', N'65f2d78d-a837-44a0-8ff2-a532015e4728', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'12543c59-dd67-43e7-bbda-a532015e4736', N'Unable to login.', N'e2ed381e-f41a-445e-b63e-a532015e472e', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4b32a807-cb75-456f-898f-a532015e473c', N'You are now logged out', N'7d98ffd7-0475-4e91-a166-a532015e4736', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'be549bc6-190a-407d-bbd8-a532015e4743', N'Profile Updated', N'c63bb513-87fe-43a3-b134-a532015e473c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'eb4d243c-84e2-4a43-888b-a532015e4748', N'Language Changed', N'21d3205a-5cab-4096-9ba5-a532015e4744', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6afdf8fb-d5c6-4c16-a9ab-a532015e474e', N'Latest Forum Discussions', N'71c0b70d-00e2-4f9c-9e41-a532015e4749', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6d1adf0b-a97f-4995-b560-a532015e4753', N'Recent discussions', N'3be0d97f-252b-4e75-bf78-a532015e474e', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'bafd817c-7dd2-4e10-b3a7-a532015e475b', N'Nothing To Display', N'01c02e83-bce0-49df-a858-a532015e4753', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9e1869be-ab03-4ecd-af7c-a532015e4760', N'{0} Discussions', N'222841e6-e454-4b6e-b6f4-a532015e475b', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3c01ee35-32b1-4b6d-8529-a532015e4765', N'Latest discussions happening in the {0} category', N'8ed3b6e9-78e7-4d30-9fb0-a532015e4760', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6f039983-e5fa-4137-9650-a532015e476d', N'Reporter', N'b47205da-9e63-4ba8-88bf-a532015e4766', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f67aa2ea-6680-4144-b30e-a532015e4773', N'Member Reported', N'dfbf1acc-0410-4a47-a29b-a532015e476e', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'13a74c90-ed28-46af-8876-a532015e477d', N'Reason', N'f4c30737-a7b5-4f4a-bd66-a532015e4773', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1d7b1b97-8af4-4b4f-9420-a532015e4782', N'Member Report', N'4660a687-d4f9-4a49-982b-a532015e477d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd700aff2-e8df-4796-be17-a532015e4787', N'Admin', N'9789c814-a222-4b0f-ac5d-a532015e4782', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ef73ce96-cdd6-459c-be17-a532015e478d', N'Post Reported In', N'77d11b95-cff4-4a30-a534-a532015e4787', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ef30e6e8-4c45-458b-ab9b-a532015e4795', N'Post Report', N'd2b3e1f0-7339-47f7-9b02-a532015e478d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'03c79526-1ae3-4a49-a943-a532015e479c', N'Unable to award badges as badge collection is null for user {0}', N'298dae4e-4a17-45b9-95c3-a532015e4795', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd200bc70-9420-4e81-9686-a532015e47a1', N'Unknown badge type {0}', N'38499831-4648-4128-9b51-a532015e479c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4750a06b-36ad-4d15-b3ef-a532015e47a6', N'The badge enum type {0} has no corresponding class specified.', N'1838cca6-a053-4fa8-bf53-a532015e47a1', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'46811c62-32ce-4cf0-81ec-a532015e47af', N'User name already exists. Please enter a different user name.', N'9e3a70e5-fc67-4c2e-b36f-a532015e47a6', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7528abd5-0a74-49ed-bb74-a532015e47b4', N'A user name for that e-mail address already exists. Please enter a different e-mail address.', N'dc482dc5-1f04-4c7f-89e0-a532015e47af', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b770906a-f884-44f9-a710-a532015e47bc', N'The password provided is invalid. Please enter a valid password value.', N'5195f4c9-921b-48b4-b828-a532015e47b5', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5451521f-822d-45cd-86f6-a532015e47c1', N'The e-mail address provided is invalid. Please check the value and try again.', N'ac5f26d7-4861-46e0-b7c4-a532015e47bd', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'393f51e4-3de0-432d-b788-a532015e47c7', N'The password retrieval answer provided is invalid. Please check the value and try again.', N'eaa5f8a3-c261-4c8e-be1a-a532015e47c2', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'cb307fb9-ec2f-48ba-90af-a532015e47cf', N'The password retrieval question provided is invalid. Please check the value and try again.', N'105279b5-1c39-43f9-bfb0-a532015e47c7', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e0f48a66-fa00-4ddc-aaa2-a532015e47d4', N'The user name provided is invalid. Please check the value and try again.', N'b352728e-7012-4a09-8949-a532015e47cf', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'91e4420c-87ae-4629-8933-a532015e47d9', N'The authentication provider returned an error. Please verify your entry and try again. If the problem persists please contact your system administrator.', N'295aaf10-264e-4f2d-8c9f-a532015e47d5', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5b4eb35e-642c-4229-891c-a532015e47df', N'The user creation request has been canceled. Please verify your entry and try again. If the problem persists please contact your system administrator.', N'8bbb708a-509d-499b-9c36-a532015e47da', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7b27c572-aa01-4e2a-bc42-a532015e47e7', N'An unknown error occurred. Please verify your entry and try again. If the problem persists please contact your system administrator.', N'c8f0f550-8eb8-4651-8f98-a532015e47df', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3614d802-3d0e-4921-815c-a532015e47ed', N'New member registered on {0} ({1})', N'e425add5-501e-47e2-8f88-a532015e47e8', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ca9f1912-a3f7-45d5-8af2-a532015e47f2', N'Admin', N'1673cd66-6670-4b52-aab7-a532015e47ed', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1f913d37-add1-4d17-b59d-a532015e47fa', N'New Member Registered', N'c9ed0af4-01db-41fc-9ff5-a532015e47f2', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a1f65440-668c-43cd-9a25-a532015e47ff', N'User does not exist - cannot unlock.', N'96dea059-970f-4709-bb69-a532015e47fb', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'838da0ad-e2e5-496b-9859-a532015e4805', N'You have requested that your password is reset on {0}. Your new password is below', N'1cff725f-f572-4a3f-b022-a532015e4800', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9604dad6-9160-4fab-9d5c-a532015e4815', N'Password Reset', N'437f4c88-c34a-4cb9-8d21-a532015e4805', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0d6a0473-ee5e-40b4-ad06-a532015e481a', N'A new password has been emailed to you', N'10f8b873-15b1-41f3-9e07-a532015e4815', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6adfe18f-bb44-44cf-8832-a532015e481f', N'Error resetting password', N'e0f26f0c-a0c3-4dad-b553-a532015e481a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd013188b-3c55-49b8-9729-a532015e4829', N'Password Changed', N'edd7a7ab-aa5e-41b5-8df0-a532015e481f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5b272976-b878-4ba8-87b6-a532015e482f', N'The current password is incorrect or the new password is invalid.', N'7650ac39-a698-4056-937c-a532015e482a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b9123d10-3a9a-4405-905c-a532015e4837', N'Change Password', N'9308ca03-aae5-48fe-8c6b-a532015e482f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'abaff510-5dab-4d34-91e7-a532015e483d', N'Change Password', N'8d827a19-5ab8-4235-aefd-a532015e4837', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4c00ba86-a445-49be-be0f-a532015e4845', N'New passwords are required to be a minimum of {0} characters in length.', N'fe95c7fb-728b-444f-8faf-a532015e483d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5deec4a4-4e2f-4d44-b4d3-a532015e484a', N'Click here if you want to {0}', N'00a42434-7695-4db4-a9e2-a532015e4845', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd903336f-6174-4c16-9978-a532015e484f', N'Forgot Password', N'450633c1-b00e-4415-a6a6-a532015e484a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c727fd83-cc9c-49ec-8896-a532015e4854', N'Reset Password', N'0ea35501-ee0f-4e9b-b2d9-a532015e484f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1ce1af41-582f-490e-9753-a532015e485d', N'Forgot your password?', N'4e615fea-053b-43a9-bfe1-a532015e4854', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7230ac82-58f8-4eeb-8738-a532015e4862', N'Current Password', N'a14d4735-aa18-4946-998e-a532015e485d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8bfc4138-182c-4b26-90d6-a532015e4868', N'New Password', N'b7d9267b-47ea-429f-8a6e-a532015e4863', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'afb04f8e-8660-4f9a-b077-a532015e4873', N'Confirm New Password', N'795500f1-d0b9-4623-8ceb-a532015e4868', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'347ba521-3b1e-45e1-829d-a532015e4879', N'Enter your email address', N'e77794b2-09a3-4e5e-9c78-a532015e4873', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b3b06a49-91d3-4465-9104-a532015e487e', N'badge ', N'dd5e531a-dc7c-4a2e-80a8-a532015e4879', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e833c048-6b3f-4b1f-be75-a532015e4884', N'has been awarded the', N'ebd74ac8-1566-4b84-858f-a532015e487f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7283f799-bd83-48db-8aee-a532015e488c', N'is a new member in the forum', N'96fa3556-1987-4227-b25a-a532015e4884', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ee3b70ba-fd27-4f9a-aafa-a532015e4891', N'has an updated profile', N'19f76a8e-9789-4846-b806-a532015e488c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7fa6cb33-ed5f-4f75-8562-a532015e489b', N'Get notified of replies?', N'a145b634-8236-48ae-9dd8-a532015e4892', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c9619a40-f8d8-45b1-ae09-a532015e48a4', N'Badges', N'a2287351-8f2c-4e70-aaae-a532015e489b', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'470887da-9db6-4248-8efc-a532015e48aa', N'Badges', N'ff4773a5-31f5-4080-81f0-a532015e48a4', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'26088fe8-81d9-4641-a295-a532015e48b2', N'Title', N'ab3cbd89-fc61-4e7f-b5dd-a532015e48aa', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0d0cca07-33aa-42e7-8241-a532015e48b8', N'Add A Poll To This Topic', N'91a4164c-6fc6-4d7b-a621-a532015e48b3', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3fd0dc98-343a-4476-870b-a532015e48bd', N'Type A Poll Answer Here', N'1ff2717e-7eb6-4f20-8a85-a532015e48b8', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'fd054502-f6a3-4e09-89a0-a532015e48c2', N'Topic Options', N'429fbd00-6845-4634-a100-a532015e48be', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b7511a3a-e639-4e33-9e4f-a532015e48cb', N'Remove Poll From Topic', N'04c54b17-2d0a-4caf-b40f-a532015e48c3', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'61e0eda0-2d42-4ac8-85be-a532015e48d1', N'Submit Vote', N'e68b555b-ab45-4352-8f17-a532015e48cb', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ebbdb476-3f41-4bb0-8c24-a532015e48d7', N'There was an error with your answer. Please try again', N'05e07c99-99f4-47e7-ac4a-a532015e48d1', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c5f620bd-9b5f-4df4-a0d0-a532015e48e0', N'Or', N'd70e2d4f-6fd8-4022-88cd-a532015e48d7', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'549240d5-0b90-4bed-b1b1-a532015e48e5', N'Social Account', N'2b787f2d-088b-4aed-a445-a532015e48e0', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'50dbfbca-0722-4f69-9f07-a532015e48eb', N'Just now', N'923d28f0-a53c-4966-aa42-a532015e48e6', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'184682dd-dd3f-4609-a4dd-a532015e48f5', N'1 minute ago', N'9251a675-3c6b-403d-8036-a532015e48ec', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'49b2ca32-4515-48e8-b69e-a532015e48fa', N'{0} minutes ago', N'05ec61c5-54be-45d7-bb1a-a532015e48f5', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f1d5346f-e943-41cc-9062-a532015e4902', N'1 hour ago', N'bcaab735-88f2-45c8-b973-a532015e48fa', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a9121b61-83ce-407b-b879-a532015e490a', N'{0} hours ago', N'327dcfab-ffeb-4593-8beb-a532015e4903', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b3980891-699e-4460-bcd0-a532015e490f', N'yesterday', N'fb2bbb7c-28e1-4f52-aade-a532015e490b', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e8769ade-1ee6-47cf-82bb-a532015e4914', N'{0} days ago', N'acbb61d5-bebf-49a3-909a-a532015e490f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'509125d4-0da6-4ac7-9919-a532015e4919', N'{0} weeks ago', N'c546b679-9dc8-47d0-9c0e-a532015e4914', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'510a69fe-8556-4461-8174-a532015e4921', N'Search', N'ceae90c8-52c8-4817-afef-a532015e4919', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'37923e41-326b-4d73-89d3-a532015e4926', N'Sorry no results found', N'4364a88c-e465-4b59-8b9e-a532015e4921', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'eb7f08f4-10c0-4021-bd80-a532015e4932', N'Comments', N'6825a348-453b-490e-827d-a532015e4927', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e2845773-a762-434b-8a7f-a532015e4937', N'Delete All Posts', N'c58151c0-eb4b-47d5-88a1-a532015e4933', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'619322fd-2e05-4a84-9f89-a532015e493c', N'Add Post', N'95e3059e-4ede-4575-980a-a532015e4938', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd6626dd1-19e7-4c57-b140-a532015e4941', N'Choose Category', N'b0f7e261-115d-43cc-b1fc-a532015e493c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'15f66345-992b-4060-86b3-a532015e4949', N'Need formatting help?', N'4a3693e8-506b-4c1c-9060-a532015e4941', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3a82aa69-2152-4a60-bbc1-a532015e494e', N'Ban User', N'ad6cf6ba-5538-4c43-81dd-a532015e494a', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ac5dd9f2-fb2e-43c4-b668-a532015e4954', N'Unban User', N'3324bda5-2585-4bc3-9828-a532015e494f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4e252393-c33a-49f8-9583-a532015e495c', N'Topic Created. But you do not have permission to create polls', N'f64bfd74-cbe6-4ad3-9be3-a532015e4954', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6e85a9d4-2639-448b-8ef8-a532015e4962', N'Show More Posts', N'2101bdd2-061b-4158-a783-a532015e495d', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b58b4748-e175-4781-83d8-a532015e4967', N'Loading Posts...', N'41dc384b-2f3f-49c7-925f-a532015e4962', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ec8d867b-c691-43ec-8631-a532015e496e', N'Questions that may already have your answer', N'3ab8d137-8b78-46e4-9940-a532015e4968', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'94e7559e-ba5c-4211-b67e-a532015e4974', N'Answer', N'6b2d5adf-f4cf-4f35-a82b-a532015e496f', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'52bd24b3-e8ff-4a0a-9440-a532015e4979', N'Members Currently Online:', N'87712465-a4da-43d7-af08-a532015e4974', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a4f1f2eb-ea3f-4773-96ca-a532015e4981', N'Order By:', N'df16706c-e66b-4bec-9f89-a532015e4979', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9f23b5ee-44e4-439f-a2b3-a532015e4987', N'Standard', N'83736420-4651-49c2-89bf-a532015e4982', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'47b25695-8995-4363-b247-a532015e498c', N'Newest', N'dd1557bc-487f-47a8-ad94-a532015e4987', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'bc3f8613-e356-443f-9a16-a532015e4991', N'Votes', N'c0570a2c-22fe-4e2e-97cf-a532015e498c', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'63b44296-afe1-4f3d-b319-a532015e499b', N'New Private Message', N'cecca554-e228-4adb-9aca-a532015e4991', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9a40691b-80a7-4151-978d-a532015e49a0', N'{0} has just sent you a private message.', N'da1b6552-e038-4379-8079-a532015e499b', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b194cebb-8c6d-44fb-bb37-a532015e49a5', N'Are you sure you want to delete?', N'0a1b744d-bbad-4ec4-a349-a532015e49a0', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c056d2a3-3cd6-42e2-b2a0-a532015e49af', N'Sub Categories In', N'a6e0262f-e6d8-4551-83ac-a532015e49a5', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'eade8724-2db0-4f57-bfc6-a532015e49b4', N'All Categories', N'8041174c-d311-4ade-9b80-a532015e49af', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'15ca70bc-8781-4fff-abf8-a532015e49bc', N'Most recent:', N'4f58129c-bb61-4bc2-91ea-a532015e49b4', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1a8ce1ff-23f4-4cd2-ae40-a532015e49c1', N'The email address or domain you are trying to use is banned', N'3d24688a-d1e8-4aa7-8834-a532015e49bc', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b8da02ff-a7f1-4a71-9d78-a532015e49c6', N'Files uploaded successfully', N'2a45b950-bb5e-45c9-9c2d-a532015e49c2', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'62bb5471-39bd-4d3e-afbd-a532015e49cc', N'Attach', N'be4577aa-9c3d-4bcc-a967-a532015e49c7', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f513b0bd-2889-4734-803d-a532015e49d4', N'Upload Files', N'c6eefcb8-3db3-42ad-b0ea-a532015e49cc', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7d77c176-40b2-4fcc-8ee1-a532015e49d9', N'File extension not allowed', N'28b748ff-6401-445b-b3d0-a532015e49d5', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'42b614c2-318f-463f-aa9e-a532015e49de', N'File upload is too big', N'f69783ee-d450-4b60-b361-a532015e49da', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'267df3b6-6990-439e-b95c-a532015e49e8', N'File deleted', N'caeea5c4-1966-4644-88c3-a532015e49df', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'db042c7d-6164-4a59-adee-a532015e49ed', N'We have sent you a confirmation email - please click the confirmation link in your email to approve your account.', N'43ead283-1815-479b-bfe3-a532015e49e8', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0600559d-7788-4d3c-abd7-a532015e49f3', N'You have registered on {0} - In order to continue you must confirm your email address by clicking the link below. {1}', N'ac1374af-a9c2-41cd-aa29-a532015e49ee', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'39c2c5cd-5a5a-443b-b05a-a532015e49fc', N'Email Confirmation', N'16c2df3c-ed6f-42a1-b522-a532015e49f3', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7e59aef6-c5dd-432a-88d0-a532015e4a02', N'Your account has now been approved - Thank you', N'202abbde-e387-41ef-adfa-a532015e49fd', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4b91ff6c-8896-4ad5-914d-a532015e4a07', N'Click the link in your confirmation email to approve your account.', N'09134274-8022-4455-9f51-a532015e4a02', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'835b5784-82e1-4769-8a99-a532015e4a0f', N'Resend Confirmation Email', N'dd073463-dfd5-45af-9a5f-a532015e4a07', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2a4ff58b-7d9a-4b10-b8d7-a532015e4a14', N'Message Me', N'48bf6a68-fc96-4ee6-b36f-a532015e4a10', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5c0535e7-80aa-4752-b434-a532015e4a1a', N'Are you sure? This will delete all the members posts and topics!', N'33ce5f26-3737-44fb-b0fd-a532015e4a15', N'01be9003-544e-4dcd-b8d3-a532015e43a7')
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (1, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Home', N'Top', N'Home', N'Index', NULL, NULL, 1, CAST(N'2015-10-15 21:15:21.957' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (2, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'About', N'Top', N'Home', N'About', NULL, NULL, 1, CAST(N'2015-10-15 21:15:21.977' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (3, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Contact', N'Top', N'Home', N'Contact', NULL, NULL, 1, CAST(N'2015-10-15 21:15:21.977' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (4, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Forum', N'Top', N'Forum', N'', NULL, NULL, 1, CAST(N'2015-10-15 21:15:21.977' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (5, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Links', N'Top', N'Links', N'', NULL, NULL, 1, CAST(N'2015-10-15 21:15:21.977' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (6, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Home', N'Left', N'Home', N'Index', NULL, NULL, 1, CAST(N'2015-10-15 21:15:21.977' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (7, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Pictures', N'Left', N'Pictures', N'Index', NULL, NULL, 1, CAST(N'2015-10-15 21:15:21.977' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (8, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Videos', N'Left', N'Videos', N'Index', NULL, NULL, 1, CAST(N'2015-10-15 21:15:21.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (1, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Home', N'/Home/Index', N'<p><span style=''font-size: medium;''><strong>Welcome to DigiOz .NET Portal!</strong></span></p>
<p>DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and&nbsp;C#&nbsp;which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.</p>
<p>Some Features included in this Portal System include:</p>
<ul>
<li>An Administrative Dashboard, where the Webmaster can Manage the Site and related Features.</li>
<li>A Page Manager, to allow Admins to Create new Pages, Edit existing Pages or Delete Them.</li>
<li>A Database Driven Configuration System to fine tune the Portal System</li>
<li>Some Database Utilities to help Manage the Site Database</li>
<li>File Manager, which allows you to add or remove files to your site.</li>
<li>Module Manager, allow you to install new Plugins to the Portal.</li>
<li>Forum Manager allows you to Manage Forum Posts, Threads, and Users.</li>
<li>Poll Manager lets you create new polls to display on the site.</li>
<li>The Statistics section lets you see site related statistics such as the number of visitors, number of page Views, etc.</li>
<li>Menu Manager lets you add new Menu links both to internal pages and external sites.</li>
<li>User Manager lets you manage the registered users of the site.</li>
<li>Announcements section let''''s you add, edit or remove site wide announcements to the users, which show up on the Home Index Page.</li>
<li>Picture Manager lets you create Picture Galleries, and add or remove pictures from the site.</li>
<li>Video Manager allows you to upload and display Videos to your site and manage them.</li>
<li>Link Manager allows you to create a links page to do link exchagne with other sites similar to yours.</li>
<li>Chat Manager lets you manage the Chat Database Table.</li>
</ul>
<p><strong><span style=''font-size: medium;''>About DigiOz Multimedia, Inc</span></strong></p>
<p><strong><span style=''font-size: medium;''></span></strong>DigiOz Multimedia, Inc is a Chicago, Illinois USA based Software Development Company which provides web design for personal and business use, CRM, custom programming for web and PC, design database driven systems for clients, as well as business process modeling and consulting. We also have an active Open Source Community that provides many IT Systems and Web Portals as Open Source Products for Everyone to share and enjoy.</p>
<p>Visit us at <a href=''http://www.digioz.com''>www.digioz.com</a> for more information, or email us at <a href=''mailto:support@digioz.com''>support@digioz.com</a>. </p>', N'DigiOz .NET Portal, CMS, Portal, Web Portal, ASP.NET MVC', N'DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and C# which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.', 1, CAST(N'2015-10-15 21:15:21.983' AS DateTime))
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (2, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'Contact', N'/Home/Contact', N'<h2>Contact</h2>
<h3>Below is our Contact Information:</h3>
<address>One Microsoft Way<br /> Redmond, WA 98052-6399<br /> <abbr title=''Phone''>P:</abbr> 425.555.0100</address><address><strong>Support:</strong> <a href=''mailto:Support@example.com''>Support@example.com</a><br /> <strong>Marketing:</strong> <a href=''mailto:Marketing@example.com''>Marketing@example.com</a></address>', NULL, NULL, 1, CAST(N'2015-10-15 21:15:22.003' AS DateTime))
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (3, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'About', N'/Home/About', N'<h2>About</h2>
<h3>Some information about us:</h3>
<p>Use this area to provide additional information.</p>', NULL, NULL, 1, CAST(N'2015-10-15 21:15:22.003' AS DateTime))
SET IDENTITY_INSERT [dbo].[Page] OFF
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'14e51adb-8926-4e93-80f3-a532015e43a0', N'Create Polls')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'0ddb6568-a187-46e9-9544-a532015e43a0', N'Sticky Topics')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'f41256ee-5e28-4c8c-9697-a532015e43a0', N'Deny Access')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'1464eef4-e05e-41dc-9760-a532015e43a0', N'Vote In Polls')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'f80eff4c-03b7-480d-9cbe-a532015e43a0', N'Delete Posts')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'c0174f33-f0f4-4569-a84b-a532015e43a0', N'Lock Topics')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'7cfbd5ea-795a-463a-a850-a532015e43a0', N'Edit Posts')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'447a68c9-00ea-461e-a9fd-a532015e43a0', N'Create Topics')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'4b90894f-ddfa-4b0b-ab06-a532015e43a0', N'Attach Files')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'3499a154-26cb-42fa-b7d8-a532015e43a0', N'Read Only')
SET IDENTITY_INSERT [dbo].[Plugin] ON 

INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (1, N'Chat', NULL, 1)
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (2, N'Store', NULL, 1)
SET IDENTITY_INSERT [dbo].[Plugin] OFF
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([ID], [UserID], [Email], [Birthday], [BirthdayVisible], [Address], [Address2], [City], [State], [Zip], [Country], [Signature], [Avatar], [FirstName], [LastName]) VALUES (1, N'e0318fa0-7a4e-48bc-9087-f99cb4899f90', N'webmaster@domain.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ID], [UserID], [Email], [Birthday], [BirthdayVisible], [Address], [Address2], [City], [State], [Zip], [Country], [Signature], [Avatar], [FirstName], [LastName]) VALUES (2, N'1ebb5770-3a0c-4655-87ce-e457fcbe5791', N'user1@mail.com', CAST(N'1975-07-24 00:00:00.000' AS DateTime), 1, N'1 Main Street', N'Ste 100', N'Chicago', N'IL', N'60601', N'USA', N'User One Some Company, Inc.', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Profile] OFF
INSERT [dbo].[Settings] ([Id], [ForumName], [ForumUrl], [IsClosed], [EnableRSSFeeds], [DisplayEditedBy], [EnablePostFileAttachments], [EnableMarkAsSolution], [EnableSpamReporting], [EnableMemberReporting], [EnableEmailSubscriptions], [ManuallyAuthoriseNewMembers], [NewMemberEmailConfirmation], [EmailAdminOnNewMemberSignUp], [TopicsPerPage], [PostsPerPage], [ActivitiesPerPage], [EnablePrivateMessages], [MaxPrivateMessagesPerMember], [PrivateMessageFloodControl], [EnableSignatures], [EnablePoints], [PointsAllowedToVoteAmount], [PointsAddedPerPost], [PointsAddedPostiveVote], [PointsDeductedNagativeVote], [PointsAddedForSolution], [AdminEmailAddress], [NotificationReplyEmail], [SMTP], [SMTPUsername], [SMTPPassword], [SMTPPort], [SMTPEnableSSL], [SpamQuestion], [SpamAnswer], [EnableAkisment], [AkismentKey], [CurrentDatabaseVersion], [EnablePolls], [SuspendRegistration], [DefaultLanguage_Id], [NewMemberStartingRole]) VALUES (N'13003e94-9972-4a02-8a82-a532015e4a1a', N'Digioz Forum', N'http://www.mydomain.com', 0, 1, 1, 0, 1, 1, 1, 1, 0, NULL, 1, 20, 20, 20, 1, 50, 1, 0, 1, 1, 1, 0, 2, 4, N'my@email.com', N'noreply@myemail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, NULL, N'01be9003-544e-4dcd-b8d3-a532015e43a7', N'f3ab1400-5bc4-4747-a580-86e1aeefab3a')
SET IDENTITY_INSERT [dbo].[VisitorInfo] ON 

INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (1, N'::1', N'/', NULL, N'InternetExplorer', N'InternetExplorer11', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', N'11.0', 0, N'3.0', N'WinNT', NULL, N'', N'United States', N'en-US,en;q=0.7,fa;q=0.3', CAST(N'2015-10-15 16:15:29.763' AS DateTime))
INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (2, N'::1', N'/__browserLink/requestData/e9f3e8febd8e4503824b53ee8ea12fe9', N'http://localhost:3588/', N'InternetExplorer', N'InternetExplorer11', N'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', N'11.0', 0, N'3.0', N'WinNT', NULL, N'', N'United States', N'en-US,en;q=0.7,fa;q=0.3', CAST(N'2015-10-15 16:15:39.533' AS DateTime))
SET IDENTITY_INSERT [dbo].[VisitorInfo] OFF
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Announcement_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Announcement] CHECK CONSTRAINT [FK_dbo.Announcement_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BadgeTypeTimeLastChecked]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BadgeTypeTimeLastChecked_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BadgeTypeTimeLastChecked] CHECK CONSTRAINT [FK_dbo.BadgeTypeTimeLastChecked_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Category_dbo.Category_Category_Id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_dbo.Category_dbo.Category_Category_Id]
GO
ALTER TABLE [dbo].[CategoryNotification]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CategoryNotification_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryNotification] CHECK CONSTRAINT [FK_dbo.CategoryNotification_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[CategoryNotification]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CategoryNotification_dbo.Category_Category_Id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryNotification] CHECK CONSTRAINT [FK_dbo.CategoryNotification_dbo.Category_Category_Id]
GO
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CategoryPermissionForRole_dbo.AspNetRoles_MembershipRole_Id] FOREIGN KEY([MembershipRole_Id])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_dbo.CategoryPermissionForRole_dbo.AspNetRoles_MembershipRole_Id]
GO
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CategoryPermissionForRole_dbo.Category_Category_Id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_dbo.CategoryPermissionForRole_dbo.Category_Category_Id]
GO
ALTER TABLE [dbo].[CategoryPermissionForRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CategoryPermissionForRole_dbo.Permission_Permission_Id] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryPermissionForRole] CHECK CONSTRAINT [FK_dbo.CategoryPermissionForRole_dbo.Permission_Permission_Id]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Chat_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_dbo.Chat_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[LocaleStringResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocaleStringResource_dbo.Language_Language_Id] FOREIGN KEY([Language_Id])
REFERENCES [dbo].[Language] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LocaleStringResource] CHECK CONSTRAINT [FK_dbo.LocaleStringResource_dbo.Language_Language_Id]
GO
ALTER TABLE [dbo].[LocaleStringResource]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LocaleStringResource_dbo.LocaleResourceKey_LocaleResourceKey_Id] FOREIGN KEY([LocaleResourceKey_Id])
REFERENCES [dbo].[LocaleResourceKey] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LocaleStringResource] CHECK CONSTRAINT [FK_dbo.LocaleStringResource_dbo.LocaleResourceKey_LocaleResourceKey_Id]
GO
ALTER TABLE [dbo].[MembershipUser_Badge]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MembershipUser_Badge_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MembershipUser_Badge] CHECK CONSTRAINT [FK_dbo.MembershipUser_Badge_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[MembershipUser_Badge]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MembershipUser_Badge_dbo.Badge_Badge_Id] FOREIGN KEY([Badge_Id])
REFERENCES [dbo].[Badge] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MembershipUser_Badge] CHECK CONSTRAINT [FK_dbo.MembershipUser_Badge_dbo.Badge_Badge_Id]
GO
ALTER TABLE [dbo].[MembershipUserPoints]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MembershipUserPoints_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MembershipUserPoints] CHECK CONSTRAINT [FK_dbo.MembershipUserPoints_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menu_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_dbo.Menu_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_dbo.Order_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetail_dbo.Order_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_dbo.OrderDetail_dbo.Order_OrderID]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetail_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_dbo.OrderDetail_dbo.Product_ProductID]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Page_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_dbo.Page_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Picture_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_dbo.Picture_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Picture_dbo.PictureAlbum_AlbumID] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[PictureAlbum] ([ID])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_dbo.Picture_dbo.PictureAlbum_AlbumID]
GO
ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Poll_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [FK_dbo.Poll_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[PollAnswer]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PollAnswer_dbo.Poll_Poll_Id] FOREIGN KEY([Poll_Id])
REFERENCES [dbo].[Poll] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PollAnswer] CHECK CONSTRAINT [FK_dbo.PollAnswer_dbo.Poll_Poll_Id]
GO
ALTER TABLE [dbo].[PollVote]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PollVote_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PollVote] CHECK CONSTRAINT [FK_dbo.PollVote_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[PollVote]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PollVote_dbo.PollAnswer_PollAnswer_Id] FOREIGN KEY([PollAnswer_Id])
REFERENCES [dbo].[PollAnswer] ([Id])
GO
ALTER TABLE [dbo].[PollVote] CHECK CONSTRAINT [FK_dbo.PollVote_dbo.PollAnswer_PollAnswer_Id]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Post_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_dbo.Post_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Post_dbo.Topic_Topic_Id] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_dbo.Post_dbo.Topic_Topic_Id]
GO
ALTER TABLE [dbo].[PrivateMessage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PrivateMessage_dbo.AspNetUsers_UserFrom_Id] FOREIGN KEY([UserFrom_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrivateMessage] CHECK CONSTRAINT [FK_dbo.PrivateMessage_dbo.AspNetUsers_UserFrom_Id]
GO
ALTER TABLE [dbo].[PrivateMessage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PrivateMessage_dbo.AspNetUsers_UserTo_Id] FOREIGN KEY([UserTo_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PrivateMessage] CHECK CONSTRAINT [FK_dbo.PrivateMessage_dbo.AspNetUsers_UserTo_Id]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.ProductCategory_ProductCategoryID] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.ProductCategory_ProductCategoryID]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Profile_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_dbo.Profile_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Settings_dbo.AspNetRoles_NewMemberStartingRole] FOREIGN KEY([NewMemberStartingRole])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_dbo.Settings_dbo.AspNetRoles_NewMemberStartingRole]
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Settings_dbo.Language_DefaultLanguage_Id] FOREIGN KEY([DefaultLanguage_Id])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_dbo.Settings_dbo.Language_DefaultLanguage_Id]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ShoppingCart_dbo.AspNetUsers_AspNetUser_Id] FOREIGN KEY([AspNetUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_dbo.ShoppingCart_dbo.AspNetUsers_AspNetUser_Id]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ShoppingCart_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_dbo.ShoppingCart_dbo.Product_ProductID]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Topic_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_dbo.Topic_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Topic_dbo.Category_Category_Id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_dbo.Topic_dbo.Category_Category_Id]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Topic_dbo.Poll_Poll_Id] FOREIGN KEY([Poll_Id])
REFERENCES [dbo].[Poll] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_dbo.Topic_dbo.Poll_Poll_Id]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Topic_dbo.Post_Post_Id] FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_dbo.Topic_dbo.Post_Post_Id]
GO
ALTER TABLE [dbo].[Topic_Tag]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Topic_Tag_dbo.Topic_TopicTag_Id] FOREIGN KEY([TopicTag_Id])
REFERENCES [dbo].[Topic] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Topic_Tag] CHECK CONSTRAINT [FK_dbo.Topic_Tag_dbo.Topic_TopicTag_Id]
GO
ALTER TABLE [dbo].[Topic_Tag]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Topic_Tag_dbo.TopicTag_Topic_Id] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[TopicTag] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Topic_Tag] CHECK CONSTRAINT [FK_dbo.Topic_Tag_dbo.TopicTag_Topic_Id]
GO
ALTER TABLE [dbo].[TopicNotification]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TopicNotification_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TopicNotification] CHECK CONSTRAINT [FK_dbo.TopicNotification_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[TopicNotification]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TopicNotification_dbo.Topic_Topic_Id] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[TopicNotification] CHECK CONSTRAINT [FK_dbo.TopicNotification_dbo.Topic_Topic_Id]
GO
ALTER TABLE [dbo].[UploadedFile]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UploadedFile_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UploadedFile] CHECK CONSTRAINT [FK_dbo.UploadedFile_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[UploadedFile]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UploadedFile_dbo.Post_Post_Id] FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Post] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UploadedFile] CHECK CONSTRAINT [FK_dbo.UploadedFile_dbo.Post_Post_Id]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Video_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_dbo.Video_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Video_dbo.VideoAlbum_AlbumID] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[VideoAlbum] ([ID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_dbo.Video_dbo.VideoAlbum_AlbumID]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vote_dbo.AspNetUsers_MembershipUser_Id] FOREIGN KEY([MembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_dbo.Vote_dbo.AspNetUsers_MembershipUser_Id]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vote_dbo.AspNetUsers_VotedByMembershipUser_Id] FOREIGN KEY([VotedByMembershipUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_dbo.Vote_dbo.AspNetUsers_VotedByMembershipUser_Id]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vote_dbo.Post_Post_Id] FOREIGN KEY([Post_Id])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_dbo.Vote_dbo.Post_Post_Id]
GO
