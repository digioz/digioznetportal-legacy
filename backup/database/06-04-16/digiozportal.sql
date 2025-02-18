USE [digiozportal]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 6/4/2016 2:00:41 PM ******/
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
/****** Object:  Table [dbo].[Announcement]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Badge]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[BadgeTypeTimeLastChecked]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[BannedEmail]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[BannedWord]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[CategoryNotification]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[CategoryPermissionForRole]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Chat]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Config]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Link]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[LocaleResourceKey]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[LocaleStringResource]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[LogVisitor]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[MembershipUser_Badge]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[MembershipUserPoints]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Page]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Picture]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[PictureAlbum]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Plugin]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Poll]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[PollAnswer]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[PollVote]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[PrivateMessage]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Profile]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Settings]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Topic]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Topic_Tag]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[TopicNotification]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[TopicTag]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[UploadedFile]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[Video]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[VideoAlbum]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[VisitorInfo]    Script Date: 6/4/2016 2:00:42 PM ******/
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
/****** Object:  Table [dbo].[VisitorSession]    Script Date: 6/4/2016 2:00:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IpAddress] [nvarchar](25) NOT NULL,
	[PageUrl] [nvarchar](max) NULL,
	[SessionId] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.VisitorSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vote]    Script Date: 6/4/2016 2:00:42 PM ******/
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

INSERT [dbo].[Announcement] ([ID], [UserID], [Title], [Body], [Visible], [Timestamp]) VALUES (1, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Test Announcement 1', N'<p>This is a test Announcement changed w</p>', 1, CAST(N'2016-05-14 23:52:38.527' AS DateTime))
INSERT [dbo].[Announcement] ([ID], [UserID], [Title], [Body], [Visible], [Timestamp]) VALUES (2, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Test Announcement 2', N'<p>Test Announcement 2 Body</p>', 1, CAST(N'2016-05-14 23:52:38.630' AS DateTime))
SET IDENTITY_INSERT [dbo].[Announcement] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'00abbf88-312d-4124-a12f-bb3b73b9a880', N'Moderator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4fa81c09-af23-4030-bbd6-a8ecab962f35', N'Administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8a559150-0a30-4004-a4a5-02cf104db714', N'Guest')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'd211576e-c8d1-4f12-81ae-9cba209d1920', N'Standard Members')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2a7d6067-8b44-4960-8935-a775c8736e10', N'4fa81c09-af23-4030-bbd6-a8ecab962f35')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f364a163-da4f-4d16-9a11-b4c7d8eb6ee1', N'd211576e-c8d1-4f12-81ae-9cba209d1920')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [LastActivityDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttempt], [Comment], [Slug], [DisableEmailNotifications], [DisablePosting], [DisablePrivateMessages], [DisableFileUploads]) VALUES (N'2a7d6067-8b44-4960-8935-a775c8736e10', N'admin', N'AN3eOT2AjVYdrz7+epcGLTYip5wC9A9iqKIN0uG6fXSU7Ko8rIZsWvlXmHUES1Rn0g==', N'ecbe6982-f85e-471f-9e4d-5ed6e3b3976f', N'ApplicationUser', NULL, NULL, 1, 0, CAST(N'2016-05-14 23:52:05.127' AS DateTime), CAST(N'2016-05-14 23:52:05.127' AS DateTime), CAST(N'2016-05-14 23:52:05.127' AS DateTime), CAST(N'2016-05-14 23:52:05.127' AS DateTime), NULL, 0, 0, NULL, N'admin', 0, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [LastActivityDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttempt], [Comment], [Slug], [DisableEmailNotifications], [DisablePosting], [DisablePrivateMessages], [DisableFileUploads]) VALUES (N'f364a163-da4f-4d16-9a11-b4c7d8eb6ee1', N'user1', N'AKKOfnBngXcp56oTEmVgnSE42fHPvMNJrdu1pvaM0W/Qqu0k2/HVc2TaIxuJD6cTnw==', N'fc537e23-0d76-4ffd-8cc9-e8cf74eb69ec', N'ApplicationUser', NULL, NULL, 1, 0, CAST(N'2016-05-14 23:52:08.307' AS DateTime), CAST(N'2016-05-14 23:52:08.307' AS DateTime), CAST(N'2016-05-14 23:52:08.307' AS DateTime), CAST(N'2016-05-14 23:52:08.307' AS DateTime), NULL, 0, 0, NULL, N'user1', 0, 0, 0, NULL)
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'2ac1fc11-2f9e-4d5a-9df4-29715f10b6d1', N'VoteUp', N'PosterVoteUp', N'First Vote Up Received', N'This badge is awarded to users after they receive their first vote up from another user.', N'PosterVoteUpBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'52284d2b-7ed6-4154-9ccc-3a7d99b18cca', N'Time', N'MemberForAYear', N'Member For A Year', N'This badge is awarded to a user after their first year anniversary.', N'MemberForAYearBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'9a247d50-35b5-4cd2-adaa-a0cf013325ac', N'Post', N'PostContainsUmbraco', N'Mentioned Umbraco In A Post Or Topic', N'This badge is awarded to a user who mentions Umbraco in their latest post.', N'MentionsUmbracoBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'8250f9f0-84d2-4dff-b651-c3df9e12bf2a', N'MarkAsSolution', N'PosterMarkAsSolution', N'Post Selected As Answer', N'This badge is awarded to the poster of a post marked as the topic answer, the first time they author an answer.', N'PosterMarkAsSolutionBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'c9913ee2-b8e0-4543-8930-c723497ee65c', N'VoteUp', N'UserVoteUp', N'You''ve Given Your First Vote Up', N'This badge is awarded to users after they make their first vote up.', N'UserVoteUpBadge.png')
INSERT [dbo].[Badge] ([Id], [Type], [Name], [DisplayName], [Description], [Image]) VALUES (N'd68c289a-e3f7-4f55-ae4f-fc7ac2147781', N'MarkAsSolution', N'AuthorMarkAsSolution', N'Your Question Solved', N'This badge is awarded to topic authors the first time they have a post marked as the answer.', N'UserMarkAsSolutionBadge.png')
INSERT [dbo].[Category] ([Id], [Name], [Description], [IsLocked], [SortOrder], [DateCreated], [Slug], [Category_Id]) VALUES (N'a2defc02-c8f8-4b51-b8c4-a60601895a33', N'Example Category', NULL, 0, 0, CAST(N'2016-05-14 23:52:09.123' AS DateTime), N'example-category', NULL)
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'930f7c54-4269-4d08-85b3-a60601895a65', 1, N'a2defc02-c8f8-4b51-b8c4-a60601895a33', N'75445d6f-71ae-4c29-a5dd-a60601895a60', N'd211576e-c8d1-4f12-81ae-9cba209d1920')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'9eaed528-1e01-49cb-8f3e-a60601895a69', 1, N'a2defc02-c8f8-4b51-b8c4-a60601895a33', N'663f1990-c145-4c12-8942-a60601895a60', N'd211576e-c8d1-4f12-81ae-9cba209d1920')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'95851e73-ccd5-43b1-8e12-a60601895a6a', 1, N'a2defc02-c8f8-4b51-b8c4-a60601895a33', N'aeac5a4a-0a26-441d-965e-a60601895a60', N'd211576e-c8d1-4f12-81ae-9cba209d1920')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'58827d9c-29fc-4093-9481-a60601895a6a', 1, N'a2defc02-c8f8-4b51-b8c4-a60601895a33', N'a00eb58e-2211-4c8c-afad-a60601895a60', N'd211576e-c8d1-4f12-81ae-9cba209d1920')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'40cec5d2-08e0-4355-8389-a60601895a6b', 1, N'a2defc02-c8f8-4b51-b8c4-a60601895a33', N'5b030946-c66d-4c06-9806-a60601895a60', N'd211576e-c8d1-4f12-81ae-9cba209d1920')
INSERT [dbo].[CategoryPermissionForRole] ([Id], [IsTicked], [Category_Id], [Permission_Id], [MembershipRole_Id]) VALUES (N'96aaee2d-9a6a-4ecd-b569-a60601895a6c', 1, N'a2defc02-c8f8-4b51-b8c4-a60601895a33', N'25a893df-e665-4822-acf0-a60601895a60', N'd211576e-c8d1-4f12-81ae-9cba209d1920')
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (1, N'SMTPServer', N'mail.domain.com', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (2, N'SMTPUsername', N'webmaster@domain.com', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (3, N'SMTPPassword', N'mp+yLJJ/2H6UckIdO03fxakFxJaIG6f4IJCOmM8eNB8=', 1)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (4, N'SiteURL', N'http://localhost:3588', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (5, N'SiteName', N'DigiOz .NET Portal', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (6, N'SiteEncryptionKey', N'eJkx2xTkifTLYmfqmOES', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (7, N'WebmasterEmail', N'webmaster@domain.com', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (8, N'PaymentLoginID', N'[PaymentLoginID]', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (9, N'PaymentTransactionKey', N'[PaymentTransactionKey]', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (10, N'PaymentTestMode', N'false', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (11, N'TwitterHandle', N'@digioz', 0)
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (12, N'TwitterWidgetID', N'342728688481214464', 0)
SET IDENTITY_INSERT [dbo].[Config] OFF
INSERT [dbo].[Language] ([Id], [Name], [LanguageCulture], [FlagImageFileName], [RightToLeft]) VALUES (N'c0ef68f2-38e7-4411-9e94-a60601895aa1', N'English (United States)', N'en-US', NULL, 0)
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2dba921d-4dd2-4941-8e1e-a60601895aa3', N'Layout.Nav.Register', NULL, CAST(N'2016-05-14 23:52:09.627' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ecae5c56-02c2-463e-a51c-a60601895af2', N'Layout.Nav.Logon', NULL, CAST(N'2016-05-14 23:52:09.793' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9bb0d2ff-1ebd-4fd1-920e-a60601895b06', N'Layout.Nav.Activity', NULL, CAST(N'2016-05-14 23:52:09.907' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6f9ba525-1a44-40d8-9ec8-a60601895b2d', N'Layout.Nav.Leaderboard', NULL, CAST(N'2016-05-14 23:52:10.027' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2ac1bfe8-e39e-4351-92f1-a60601895b4e', N'Layout.Nav.Home', NULL, CAST(N'2016-05-14 23:52:10.117' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'abf1b0e0-9c5f-475b-811f-a60601895b69', N'Layout.Nav.Admin', NULL, CAST(N'2016-05-14 23:52:10.220' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'044c32da-383d-421c-9153-a60601895b86', N'Layout.CreateButton', NULL, CAST(N'2016-05-14 23:52:10.290' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8f77c510-cf11-478d-a2fc-a60601895ba3', N'Layout.PoweredBy', NULL, CAST(N'2016-05-14 23:52:10.390' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2d844ae1-5821-4571-b921-a60601895bc0', N'Topic.Votes', NULL, CAST(N'2016-05-14 23:52:10.480' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a5972388-031a-4aaf-808f-a60601895bda', N'Topic.Comments', NULL, CAST(N'2016-05-14 23:52:10.570' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bdea52f5-759e-4cab-a5e9-a60601895bfb', N'Topic.StartedBy', NULL, CAST(N'2016-05-14 23:52:10.677' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a4fb5535-c38e-4420-bae9-a60601895c17', N'Topic.InCategory', NULL, CAST(N'2016-05-14 23:52:10.770' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b641dec8-77b4-4333-ba85-a60601895c2c', N'Topic.LatestBy', NULL, CAST(N'2016-05-14 23:52:10.857' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cdb42ff6-79d4-4bec-92f6-a60601895c48', N'Topic.Views', NULL, CAST(N'2016-05-14 23:52:10.950' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3b4a1e6f-fb0e-49cb-b203-a60601895c62', N'Post.VoteUp', NULL, CAST(N'2016-05-14 23:52:11.040' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd3cfe2e5-fbf7-4398-b20c-a60601895c87', N'Post.VoteDown', NULL, CAST(N'2016-05-14 23:52:11.157' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0b1f4f7e-25b7-4cb9-a592-a60601895ca5', N'Post.IsSolution', NULL, CAST(N'2016-05-14 23:52:11.247' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'136bbd91-c75a-4cd7-81b3-a60601895cc6', N'Post.PostedThis', NULL, CAST(N'2016-05-14 23:52:11.390' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e9aad3dd-d1b8-447c-89f5-a60601895ce8', N'Post.Posts', NULL, CAST(N'2016-05-14 23:52:11.470' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ba8b195a-328c-4bf0-ad88-a60601895d04', N'Post.Points', NULL, CAST(N'2016-05-14 23:52:11.590' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dee4a969-a4e9-43d2-a115-a60601895d24', N'Post.LastEdited', NULL, CAST(N'2016-05-14 23:52:11.683' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c42ce8e6-5af9-4865-bd69-a60601895d48', N'Post.Report', NULL, CAST(N'2016-05-14 23:52:11.820' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ab609aeb-6dc2-4ea3-8387-a60601895d67', N'Post.Edit', NULL, CAST(N'2016-05-14 23:52:11.893' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5f37f02d-a442-4add-afa0-a60601895d7d', N'Post.Delete', NULL, CAST(N'2016-05-14 23:52:11.997' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'644b77a2-c10d-4d95-9eac-a60601895d9f', N'LogOn.LogOn', NULL, CAST(N'2016-05-14 23:52:12.080' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a3e922d9-90d2-442c-bde2-a60601895dbe', N'LogOn.LogOff', NULL, CAST(N'2016-05-14 23:52:12.187' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'91d1f367-85e4-48c0-90e5-a60601895ddf', N'Post.PleaseWait', NULL, CAST(N'2016-05-14 23:52:12.313' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b8fe1204-3c0d-4eaa-98c3-a60601895e02', N'Topic.DiscussionTaggedWith', NULL, CAST(N'2016-05-14 23:52:12.413' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e9693fb9-87fd-4a08-bac4-a60601895e1a', N'Topic.TitleFallBack', NULL, CAST(N'2016-05-14 23:52:12.530' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a9417b9b-3dbe-4014-9cde-a60601895e3e', N'Topic.Subscribe', NULL, CAST(N'2016-05-14 23:52:12.637' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1355bb60-1656-4af9-a7ec-a60601895e5c', N'Topic.UnSubscribe', NULL, CAST(N'2016-05-14 23:52:12.737' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3d101850-6c0b-4e79-be11-a60601895e81', N'Topic.IsLocked', NULL, CAST(N'2016-05-14 23:52:12.837' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0b449a4e-a5b3-4536-bcdd-a60601895e9f', N'Topic.CreateDiscussion', NULL, CAST(N'2016-05-14 23:52:12.933' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'df76dc98-5305-4815-b855-a60601895ebc', N'Topic.TagThisTopic', NULL, CAST(N'2016-05-14 23:52:13.037' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7d3bf6d4-43e7-4571-aa7f-a60601895ed5', N'Tags.PopularTags', NULL, CAST(N'2016-05-14 23:52:13.130' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'eb001fb6-cd19-455e-bd44-a60601895ef0', N'Stats.FooterMainStatText', NULL, CAST(N'2016-05-14 23:52:13.233' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'499b9f24-ed54-4613-bae6-a60601895f0f', N'Stats.LatestMembers', NULL, CAST(N'2016-05-14 23:52:13.307' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'605b9563-4ee1-4481-a93f-a60601895f2b', N'PM.Title', NULL, CAST(N'2016-05-14 23:52:13.400' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6b7f2af3-2332-4545-b757-a60601895f4e', N'PM.From', NULL, CAST(N'2016-05-14 23:52:13.517' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b72b4a6b-ac5c-4ff2-b78e-a60601895f6a', N'PM.Sent', NULL, CAST(N'2016-05-14 23:52:13.607' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9196b1c7-9e73-4dfc-a7a7-a60601895f86', N'PM.BackToInbox', NULL, CAST(N'2016-05-14 23:52:13.710' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6989b8b6-c1d6-4c47-81be-a60601895fa6', N'PM.Reply', NULL, CAST(N'2016-05-14 23:52:13.813' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4b636012-7ad4-43ed-ac59-a60601895fbe', N'PM.SentPrivateMessages', NULL, CAST(N'2016-05-14 23:52:13.920' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'996cb4af-1ded-4602-97dd-a60601895fe9', N'PM.To', NULL, CAST(N'2016-05-14 23:52:14.030' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7ce6b7a7-804f-407d-9f25-a60601896004', N'PM.Subject', NULL, CAST(N'2016-05-14 23:52:14.157' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'aa4ff531-33d8-4fde-9545-a60601896025', N'PM.Date', NULL, CAST(N'2016-05-14 23:52:14.233' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7dc30a05-469b-4f93-ad2e-a6060189603b', N'PM.Read', NULL, CAST(N'2016-05-14 23:52:14.333' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1fc02f3c-a681-4c82-a597-a6060189605b', N'PM.Delete', NULL, CAST(N'2016-05-14 23:52:14.430' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'58154d2c-a75f-4613-aedc-a60601896078', N'PM.NoMessages', NULL, CAST(N'2016-05-14 23:52:14.533' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'289cdbba-9574-47d2-ac61-a60601896095', N'PM.Create', NULL, CAST(N'2016-05-14 23:52:14.627' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7f37027f-ac84-415d-8986-a606018960b6', N'PM.ReceivedPrivateMessages', NULL, CAST(N'2016-05-14 23:52:14.747' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'30229366-d272-462a-bd20-a606018960d7', N'PM.CreatePrivateMessage', NULL, CAST(N'2016-05-14 23:52:14.827' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e57660fb-2176-4394-8756-a606018960f4', N'PM.Send', NULL, CAST(N'2016-05-14 23:52:14.927' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'52565a69-c581-4712-864e-a60601896114', N'PM.OriginalMessage', NULL, CAST(N'2016-05-14 23:52:15.030' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5ef93070-669c-44ea-8679-a60601896136', N'Buttons.Send', NULL, CAST(N'2016-05-14 23:52:15.157' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bf43c2e0-a23e-4ccf-977d-a60601896158', N'Report.ReportPostBy', NULL, CAST(N'2016-05-14 23:52:15.257' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c3e62476-7f4e-4c1a-bdf5-a60601896171', N'Buttons.Edit', NULL, CAST(N'2016-05-14 23:52:15.393' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7068e517-9fc5-4fce-8ec7-a6060189619d', N'Points.ThisWeeksHighEarners', NULL, CAST(N'2016-05-14 23:52:15.507' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8d96c4ee-eaf5-4521-b5bb-a606018961ba', N'SideBox.MyTools', NULL, CAST(N'2016-05-14 23:52:15.613' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'60c8a750-56eb-4458-974a-a606018961de', N'PM.PrivateMessages', NULL, CAST(N'2016-05-14 23:52:15.723' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ac8fad79-b982-4ea6-970a-a606018961fb', N'Members.SearchMembers', NULL, CAST(N'2016-05-14 23:52:15.803' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'980e8b16-55d6-4f0f-a1df-a60601896222', N'Buttons.Search', NULL, CAST(N'2016-05-14 23:52:15.937' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ecd20cb0-ac45-46ba-8306-a60601896242', N'Members.Users', NULL, CAST(N'2016-05-14 23:52:16.033' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f2f6512d-7e09-46d1-9202-a6060189625e', N'Members.Points', NULL, CAST(N'2016-05-14 23:52:16.140' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'62db73d4-5bf2-4e7c-94ba-a6060189627d', N'Members.DateJoined', NULL, CAST(N'2016-05-14 23:52:16.233' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cd51063b-a487-4723-bc7f-a6060189629b', N'Report.Report', NULL, CAST(N'2016-05-14 23:52:16.367' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fc7b4f9b-4ed4-415b-be17-a606018962c0', N'Members.Register', NULL, CAST(N'2016-05-14 23:52:16.453' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'00278822-83f7-4ba9-8138-a606018962d7', N'Members.AlreadyRegistered', NULL, CAST(N'2016-05-14 23:52:16.540' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a383b0e2-ed74-434a-8934-a60601896301', N'Members.LogOnMessage', NULL, CAST(N'2016-05-14 23:52:16.687' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2c50988b-7a91-4c5e-b9d4-a60601896325', N'Buttons.LogOn', NULL, CAST(N'2016-05-14 23:52:16.790' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'498dc2c9-69c1-49bc-b82c-a60601896343', N'Members.ProfileTitle', NULL, CAST(N'2016-05-14 23:52:16.913' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5aa44e9c-00fb-4674-98c4-a6060189636a', N'Members.Profile.Joined', NULL, CAST(N'2016-05-14 23:52:17.027' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2c7bd323-ea79-48a5-86d6-a6060189638a', N'Members.Profile.Posts', NULL, CAST(N'2016-05-14 23:52:17.163' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'412e6d64-31f1-402a-83c3-a606018963b9', N'Members.Profile.Points', NULL, CAST(N'2016-05-14 23:52:17.287' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'676cdf7f-3c4a-4ab9-84d6-a606018963d9', N'Buttons.Report', NULL, CAST(N'2016-05-14 23:52:17.397' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b7d434fc-1643-4773-9938-a606018963f7', N'Members.Profile.Address', NULL, CAST(N'2016-05-14 23:52:17.493' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'68b4278c-f8a0-463c-a3d8-a60601896410', N'Members.Profile.City', NULL, CAST(N'2016-05-14 23:52:17.613' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e621e4e9-6b6e-4180-afb1-a60601896436', N'Members.Profile.State', NULL, CAST(N'2016-05-14 23:52:17.717' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'bdc1dd0e-633f-418b-b894-a60601896451', N'Members.Profile.Zip', NULL, CAST(N'2016-05-14 23:52:17.810' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'37a99525-be3d-48a0-b317-a6060189646f', N'Members.Profile.Country', NULL, CAST(N'2016-05-14 23:52:17.923' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'45206b2c-9092-4c22-9dfc-a60601896492', N'Members.Profile.Website', NULL, CAST(N'2016-05-14 23:52:18.027' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'edc8c237-9d5c-4953-82fc-a606018964bb', N'Members.Profile.DiscussionActivity', NULL, CAST(N'2016-05-14 23:52:18.193' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'491fc488-a025-4c3f-bdd4-a606018964e4', N'Ajax.PleaseWait', NULL, CAST(N'2016-05-14 23:52:18.290' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'47e361e8-5e37-45b9-b2a8-a60601896506', N'Members.Profile.Badges', NULL, CAST(N'2016-05-14 23:52:18.437' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'55cb77c4-bdea-4608-8123-a6060189652c', N'Members.EditProfile', NULL, CAST(N'2016-05-14 23:52:18.523' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'602e3248-5490-4e7c-aeb0-a6060189655f', N'Buttons.Save', NULL, CAST(N'2016-05-14 23:52:18.730' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'597cdb17-6526-4157-819c-a60601896582', N'Members.EditMember', NULL, CAST(N'2016-05-14 23:52:18.837' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2c949d15-cd96-41f8-80d2-a606018965a3', N'Leaderboard.ThisWeeksStars', NULL, CAST(N'2016-05-14 23:52:18.927' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5e6b7627-e95c-4c0c-857c-a606018965bf', N'Leaderboard.ThisYearsStars', NULL, CAST(N'2016-05-14 23:52:19.013' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dcd0ace2-9e9a-4172-a845-a606018965e5', N'Leaderboard.LeaderboardTitle', NULL, CAST(N'2016-05-14 23:52:19.140' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'848e6da5-ec9e-47f5-bcc2-a60601896602', N'Home.LatestDiscussions', NULL, CAST(N'2016-05-14 23:52:19.237' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9dceeac1-775b-4589-a99f-a6060189661f', N'Home.Rss', NULL, CAST(N'2016-05-14 23:52:19.333' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'289e9b1a-1254-44cb-adec-a6060189663e', N'Activity.ActivityTitle', NULL, CAST(N'2016-05-14 23:52:19.433' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b9f22f03-e7a3-4b78-92b3-a60601896655', N'Notification.SubscribeByEmail', NULL, CAST(N'2016-05-14 23:52:19.550' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'60fc450d-d106-4b42-b08a-a60601896680', N'Notification.UnSubscribeByEmail', NULL, CAST(N'2016-05-14 23:52:19.653' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd28e0661-5384-4ef3-a329-a60601896697', N'Notification.Subscribe', NULL, CAST(N'2016-05-14 23:52:19.747' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5665f330-12ef-4d43-a5c6-a606018966b5', N'Notification.UnSubscribe', NULL, CAST(N'2016-05-14 23:52:19.847' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'db9afacd-62da-4942-b79e-a606018966d1', N'Category.NoDiscussions', NULL, CAST(N'2016-05-14 23:52:19.943' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'98604abd-3e62-4623-861e-a606018966ee', N'Category.CategoriesSideHeading', NULL, CAST(N'2016-05-14 23:52:20.047' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'30b65414-9f65-4ce9-8239-a6060189670d', N'PM.RecipientUsername', NULL, CAST(N'2016-05-14 23:52:20.133' AS DateTime))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0bee246f-b34a-4654-b62d-a60601896728', N'PM.MessageSubject', NULL, CAST(N'2016-05-14 23:52:20.253' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3a6ff63e-57a4-4032-828b-a6060189674c', N'Post.Label.TopicName', NULL, CAST(N'2016-05-14 23:52:20.337' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'efee52b2-5b2a-4c13-95e3-a6060189676c', N'Post.Label.IsStickyTopic', NULL, CAST(N'2016-05-14 23:52:20.443' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1dedde39-bd0b-4cf3-b46f-a6060189678f', N'Post.Label.LockTopic', NULL, CAST(N'2016-05-14 23:52:20.560' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ea906cfe-c89e-4546-92bf-a606018967ae', N'Post.label.TopicCategory', NULL, CAST(N'2016-05-14 23:52:20.660' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b87daae5-54eb-4df4-b9c8-a606018967cd', N'Members.Label.Username', NULL, CAST(N'2016-05-14 23:52:20.763' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1de4ffdf-00a1-4eda-8a47-a606018967f1', N'Members.Label.EmailAddress', NULL, CAST(N'2016-05-14 23:52:20.890' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'24b13794-dbf8-4de7-97e9-a6060189680d', N'Members.Label.Password', NULL, CAST(N'2016-05-14 23:52:21.003' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'5dc44253-7ff2-4119-9b45-a6060189682c', N'Members.Label.ConfirmPassword', NULL, CAST(N'2016-05-14 23:52:21.080' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7190a57d-d5cc-4d30-881a-a60601896847', N'Members.Label.UserIsApproved', NULL, CAST(N'2016-05-14 23:52:21.197' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c9ad8ee8-d309-44e3-8e87-a60601896866', N'Members.Label.Comment', NULL, CAST(N'2016-05-14 23:52:21.273' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dd07867e-028b-4087-bc6f-a60601896882', N'Members.Label.Roles', NULL, CAST(N'2016-05-14 23:52:21.383' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6130909e-9290-4447-9a1f-a606018968a3', N'Members.Label.Signature', NULL, CAST(N'2016-05-14 23:52:21.480' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'828c2f2c-50ee-41a7-97c4-a606018968c4', N'Members.Label.Website', NULL, CAST(N'2016-05-14 23:52:21.590' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd404db89-3003-4930-9831-a606018968e4', N'Members.Label.RememberMe', NULL, CAST(N'2016-05-14 23:52:21.697' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c983d3a6-1b28-4dfc-b79f-a60601896903', N'Members.Label.Users', NULL, CAST(N'2016-05-14 23:52:21.803' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1ee5727a-6f33-4e4b-8df6-a60601896924', N'Members.Label.DateJoined', NULL, CAST(N'2016-05-14 23:52:21.907' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4a6172b2-81ae-4d49-be78-a6060189693c', N'Errors.NoAccess', NULL, CAST(N'2016-05-14 23:52:22.017' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'76526c8b-073a-4656-8aaf-a6060189695e', N'Errors.GenericMessage', NULL, CAST(N'2016-05-14 23:52:22.127' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b2b7839a-e020-4ed4-93d6-a6060189697e', N'Errors.NoPermission', NULL, CAST(N'2016-05-14 23:52:22.213' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'13a8b3a4-bb96-41d1-835a-a606018969a0', N'Topic.Notification.NewTopics', NULL, CAST(N'2016-05-14 23:52:22.337' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4c70ca12-40d2-459f-8e7d-a606018969c2', N'Topic.Notification.Subject', NULL, CAST(N'2016-05-14 23:52:22.437' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0aed03ca-f460-43e4-a150-a606018969e4', N'PM.SendingToQuickly', NULL, CAST(N'2016-05-14 23:52:22.557' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b9731e6e-f4d3-4ffb-8f93-a60601896a06', N'PM.SentItemsOverCapcity', NULL, CAST(N'2016-05-14 23:52:22.660' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3ebc7fe2-6864-4cfe-abc8-a60601896a1d', N'PM.ReceivedItemsOverCapcity', NULL, CAST(N'2016-05-14 23:52:22.760' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e21d5c6d-64c4-489e-a284-a60601896a3e', N'PM.MessageSent', NULL, CAST(N'2016-05-14 23:52:22.867' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a374858a-7c2c-460c-bf48-a60601896a5c', N'PM.UnableFindMember', NULL, CAST(N'2016-05-14 23:52:22.967' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'815f5387-d70c-4fff-a372-a60601896a87', N'PM.TalkToSelf', NULL, CAST(N'2016-05-14 23:52:23.110' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3cfbeaf2-82dd-44c7-8a8b-a60601896ab9', N'Post.Updated', NULL, CAST(N'2016-05-14 23:52:23.267' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'03c132ae-dc2b-4c20-92e7-a60601896add', N'Topic.Deleted', NULL, CAST(N'2016-05-14 23:52:23.380' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cc1fef0f-bc3a-4485-b4a8-a60601896af7', N'Post.Deleted', NULL, CAST(N'2016-05-14 23:52:23.470' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b294da9a-16a9-4881-aadd-a60601896b1c', N'Post.Notification.NewPosts', NULL, CAST(N'2016-05-14 23:52:23.587' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a99c2e9c-bd8f-4bdf-b4a8-a60601896b34', N'Post.Notification.Subject', NULL, CAST(N'2016-05-14 23:52:23.690' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'db316dfb-0e48-4234-9330-a60601896b59', N'Report.ReportSent', NULL, CAST(N'2016-05-14 23:52:23.793' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd5f2d775-1252-4ed3-8738-a60601896b73', N'Members.NowRegistered', NULL, CAST(N'2016-05-14 23:52:23.913' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'df4703c8-c167-410f-9a07-a60601896ba0', N'Members.NowRegisteredNeedApproval', NULL, CAST(N'2016-05-14 23:52:24.047' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'06958cab-0018-483c-9b37-a60601896bbf', N'Members.NowLoggedIn', NULL, CAST(N'2016-05-14 23:52:24.163' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0622bc41-2ed6-4c64-a339-a60601896be7', N'Members.Errors.PasswordIncorrect', NULL, CAST(N'2016-05-14 23:52:24.287' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'11ad951e-d683-4b3d-8b05-a60601896c07', N'Members.Errors.PasswordAttemptsExceeded', NULL, CAST(N'2016-05-14 23:52:24.373' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f8a945d6-dbc1-4936-9dc7-a60601896c29', N'Members.Errors.UserLockedOut', NULL, CAST(N'2016-05-14 23:52:24.507' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd97b3e7d-4e74-42cd-af61-a60601896c49', N'Members.Errors.UserNotApproved', NULL, CAST(N'2016-05-14 23:52:24.593' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3f90fe4d-ea6d-4894-9568-a60601896c69', N'Members.Errors.LogonGeneric', NULL, CAST(N'2016-05-14 23:52:24.707' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd05183f2-e865-4da8-8193-a60601896c8a', N'Members.NowLoggedOut', NULL, CAST(N'2016-05-14 23:52:24.817' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ba613522-cddf-4a9c-aa24-a60601896cab', N'Member.ProfileUpdated', NULL, CAST(N'2016-05-14 23:52:24.927' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'dcf44157-203f-4d51-883a-a60601896cda', N'Language.Changed', NULL, CAST(N'2016-05-14 23:52:25.073' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7b881db4-3ee3-4a8d-ac07-a60601896cf4', N'Rss.LatestActivity.Title', NULL, CAST(N'2016-05-14 23:52:25.183' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'15c487ba-eb46-44cc-bfe5-a60601896d1e', N'Rss.LatestActivity.Description', NULL, CAST(N'2016-05-14 23:52:25.360' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3787ed86-0dba-40f9-b1ce-a60601896d60', N'Errors.NothingToDisplay', NULL, CAST(N'2016-05-14 23:52:25.540' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7db0da5f-4820-4191-b05a-a60601896d9b', N'Rss.Category.Title', NULL, CAST(N'2016-05-14 23:52:25.773' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2a5568c7-0fed-4535-9464-a60601896dc7', N'Rss.Category.Description', NULL, CAST(N'2016-05-14 23:52:25.870' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b2670ab7-b311-4b9c-b482-a60601896de2', N'Report.Reporter', NULL, CAST(N'2016-05-14 23:52:26.003' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'062d50ff-4e29-41d9-87a0-a60601896e15', N'Report.MemberReported', NULL, CAST(N'2016-05-14 23:52:26.227' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'50fd4465-8d9b-42e8-aa83-a60601896e53', N'Report.Reason', NULL, CAST(N'2016-05-14 23:52:26.387' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'449b1a61-f060-48ab-8495-a60601896e8a', N'Report.MemberReport', NULL, CAST(N'2016-05-14 23:52:26.533' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0cb20ec5-19da-4eec-820c-a60601896eab', N'Report.Admin', NULL, CAST(N'2016-05-14 23:52:26.667' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1dddc44a-8bfe-4e5b-8109-a60601896ed2', N'Report.PostReported', NULL, CAST(N'2016-05-14 23:52:26.777' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'881dbc6b-e7fd-4075-b230-a60601896ef3', N'Report.PostReport', NULL, CAST(N'2016-05-14 23:52:26.907' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'18ed325c-022e-4bb3-b459-a60601896f19', N'Badges.UnableToAward', NULL, CAST(N'2016-05-14 23:52:27.017' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'95e173be-a53d-42e4-9b11-a60601896f3a', N'Badge.UnknownBadge', NULL, CAST(N'2016-05-14 23:52:27.130' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f87a4507-f467-4653-a0ad-a60601896f5b', N'Badge.BadegEnumNoClass', NULL, CAST(N'2016-05-14 23:52:27.210' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a7ac8d42-c796-40c6-afd5-a60601896f78', N'Members.Errors.DuplicateUserName', NULL, CAST(N'2016-05-14 23:52:27.313' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'6dd50a4d-d163-4ee7-97ce-a60601896f99', N'Members.Errors.DuplicateEmail', NULL, CAST(N'2016-05-14 23:52:27.417' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ce14dc45-4230-4580-a956-a60601896fb6', N'Members.Errors.InvalidPassword', NULL, CAST(N'2016-05-14 23:52:27.517' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'93c7420c-dc30-41b1-8ff5-a60601896fdb', N'Members.Errors.InvalidEmail', NULL, CAST(N'2016-05-14 23:52:27.643' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'95a67b30-0707-492b-af0f-a60601896ffb', N'Members.Errors.InvalidAnswer', NULL, CAST(N'2016-05-14 23:52:27.747' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'93c62a22-c048-4740-9d56-a6060189701f', N'Members.Errors.InvalidQuestion', NULL, CAST(N'2016-05-14 23:52:27.880' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2d388a90-89c2-4628-8775-a6060189703c', N'Members.Errors.InvalidUserName', NULL, CAST(N'2016-05-14 23:52:27.960' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd66bed24-c161-46e6-afba-a6060189705e', N'Members.Errors.ProviderError', NULL, CAST(N'2016-05-14 23:52:28.080' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'553d8587-ba44-4c53-8f89-a6060189707b', N'Members.Errors.UserRejected', NULL, CAST(N'2016-05-14 23:52:28.173' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'83feb8c7-1d0f-4d8e-ad8a-a6060189709c', N'Members.Errors.Unknown', NULL, CAST(N'2016-05-14 23:52:28.283' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'92173987-032e-45d5-9600-a606018970bd', N'Members.NewMemberRegistered', NULL, CAST(N'2016-05-14 23:52:28.390' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7c7ba682-1380-4e7b-bf70-a606018970d6', N'Members.Admin', NULL, CAST(N'2016-05-14 23:52:28.497' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'82565a7b-49b9-4a79-9593-a606018970f6', N'Members.NewMemberSubject', NULL, CAST(N'2016-05-14 23:52:28.600' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ec04a216-a9a5-4c48-b6a8-a60601897115', N'Members.CantUnlock', NULL, CAST(N'2016-05-14 23:52:28.703' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'afe880b7-f343-4032-a5b2-a60601897135', N'Members.ForgotPassword.Email', NULL, CAST(N'2016-05-14 23:52:28.817' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'28661679-d1b7-411f-b0b3-a60601897156', N'Members.ForgotPassword.Subject', NULL, CAST(N'2016-05-14 23:52:28.937' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4bb8d802-4fd3-4bee-b833-a6060189717c', N'Members.ForgotPassword.SuccessMessage', NULL, CAST(N'2016-05-14 23:52:29.060' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f8537537-8b13-46de-a22b-a6060189719f', N'Members.ForgotPassword.ErrorMessage', NULL, CAST(N'2016-05-14 23:52:29.143' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8bbcd2d7-8da6-46ce-b3c8-a606018971be', N'Members.ChangePassword.Success', NULL, CAST(N'2016-05-14 23:52:29.277' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fb142130-8fca-4acc-b406-a606018971df', N'Members.ChangePassword.Error', NULL, CAST(N'2016-05-14 23:52:29.363' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9f4aa7bd-207f-4c37-b154-a60601897202', N'Buttons.ChangePassword', NULL, CAST(N'2016-05-14 23:52:29.480' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'183dcbd5-bab3-4f07-9e4b-a60601897224', N'Members.ChangePassword.Title', NULL, CAST(N'2016-05-14 23:52:29.597' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'eed1224d-60b1-40ac-ab75-a60601897252', N'Members.ChangePassword.Text', NULL, CAST(N'2016-05-14 23:52:29.770' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a60a4a2f-4121-4f3f-b277-a6060189727b', N'Members.ChangePassword.Link', NULL, CAST(N'2016-05-14 23:52:29.880' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'282b9b14-c433-44e4-b0ee-a606018972a2', N'Members.ForgotPassword.Title', NULL, CAST(N'2016-05-14 23:52:30.037' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'53423a44-814f-4f32-b87a-a606018972ce', N'Buttons.ResetPassword', NULL, CAST(N'2016-05-14 23:52:30.157' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a6c93e05-4eeb-4012-ad93-a606018972f3', N'Members.ForgotPassword.Link', NULL, CAST(N'2016-05-14 23:52:30.287' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'319696d1-0a7d-4723-ae0a-a6060189730f', N'Members.Label.CurrentPassword', NULL, CAST(N'2016-05-14 23:52:30.373' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b18cee92-3d26-4235-9fc3-a60601897331', N'Members.Label.NewPassword', NULL, CAST(N'2016-05-14 23:52:30.493' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f9dd5564-e931-4072-b587-a6060189734d', N'Members.Label.ConfirmNewPassword', NULL, CAST(N'2016-05-14 23:52:30.577' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'c030d4c7-1b2c-46d6-87bf-a60601897367', N'Members.Label.EmailAddressBlank', NULL, CAST(N'2016-05-14 23:52:30.700' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'49d77a4b-d8b4-409a-b3d8-a6060189738e', N'Activity.Badge', NULL, CAST(N'2016-05-14 23:52:30.813' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7d645d88-d8be-4e7d-9025-a606018973ad', N'Activity.UserAwardedBadge', NULL, CAST(N'2016-05-14 23:52:30.923' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'097c7069-5fb1-4254-a32d-a606018973d0', N'Activity.UserJoined', NULL, CAST(N'2016-05-14 23:52:31.037' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9b9e7da5-2896-42fe-aa5f-a606018973f0', N'Activity.ProfileUpdated', NULL, CAST(N'2016-05-14 23:52:31.137' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'ac9b9f9f-da02-480a-820c-a6060189740f', N'Topic.Label.SubscribeToTopic', NULL, CAST(N'2016-05-14 23:52:31.247' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'464cd662-6d22-42c7-8f41-a6060189742f', N'Badges.PageTitle', NULL, CAST(N'2016-05-14 23:52:31.333' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'63ac3534-c0bf-4109-8406-a60601897450', N'Layout.Nav.Badges', NULL, CAST(N'2016-05-14 23:52:31.443' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'28ed94b9-e690-43a3-a40a-a6060189746f', N'Topic.Label.TopicTitle', NULL, CAST(N'2016-05-14 23:52:31.547' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9f626b6e-9968-40dc-9586-a6060189748e', N'Poll.Button.Create', NULL, CAST(N'2016-05-14 23:52:31.650' AS DateTime))
GO
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4ab2b0b2-964f-4230-b93c-a606018974ae', N'Poll.Placeholder.TypeAnswerHere', NULL, CAST(N'2016-05-14 23:52:31.753' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'017cfc20-7294-4751-a3ac-a606018974cb', N'Topic.OptionsHeading', NULL, CAST(N'2016-05-14 23:52:31.853' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'25e31501-acbe-4648-8e4d-a606018974ec', N'Poll.Button.Remove', NULL, CAST(N'2016-05-14 23:52:31.960' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'411f8ed4-68da-4cde-a2a5-a60601897506', N'Poll.Button.Vote', NULL, CAST(N'2016-05-14 23:52:32.073' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e80cbb19-d662-4c51-ab28-a60601897529', N'Error.WrongAnswerRegistration', NULL, CAST(N'2016-05-14 23:52:32.180' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'58e0b102-dc7a-4acf-9450-a60601897548', N'Members.LoginOrText', NULL, CAST(N'2016-05-14 23:52:32.297' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f74c46b6-7192-4818-a282-a60601897576', N'Members.Profile.IsSocialAccount', NULL, CAST(N'2016-05-14 23:52:32.423' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8830e38c-ab20-4997-b079-a60601897595', N'Date.JustNow', NULL, CAST(N'2016-05-14 23:52:32.557' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'42d60798-5ad1-4d34-85cd-a606018975be', N'Date.OneMinuteAgo', NULL, CAST(N'2016-05-14 23:52:32.660' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a87ed201-6668-4fe5-9c13-a606018975d8', N'Date.MinutesAgo', NULL, CAST(N'2016-05-14 23:52:32.790' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b1d8f207-fb9c-4d39-befa-a60601897600', N'Date.OneHourAgo', NULL, CAST(N'2016-05-14 23:52:32.887' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a9b5b9dc-b67b-4d68-8860-a6060189761b', N'Date.HoursAgo', NULL, CAST(N'2016-05-14 23:52:33.003' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7c6d9a51-2beb-40b7-9d18-a60601897643', N'Date.Yesterday', NULL, CAST(N'2016-05-14 23:52:33.127' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'0a8f1356-362f-420b-b090-a60601897665', N'Date.DaysAgo', NULL, CAST(N'2016-05-14 23:52:33.233' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd4eee8a7-9fd0-4ebf-ab32-a60601897685', N'Date.WeeksAgo', NULL, CAST(N'2016-05-14 23:52:33.343' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7725d08f-74f0-4967-a13e-a606018976a7', N'Side.Search', NULL, CAST(N'2016-05-14 23:52:33.447' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3bb56177-8e55-4e4a-bcb0-a606018976cd', N'Search.NoResults', NULL, CAST(N'2016-05-14 23:52:33.577' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'a14fa3f4-0b28-43a5-a564-a606018976eb', N'Topic.CommentsDetails', NULL, CAST(N'2016-05-14 23:52:33.667' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cda9b42f-654c-4a0a-95e7-a60601897710', N'Members.DeleteAllPosts', NULL, CAST(N'2016-05-14 23:52:33.807' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'85c90cb9-5e60-44b0-8544-a60601897737', N'Buttons.CreatePost', NULL, CAST(N'2016-05-14 23:52:33.917' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'89c77e6a-e2bd-4e51-9a0a-a6060189775b', N'Topic.Label.Category', NULL, CAST(N'2016-05-14 23:52:34.040' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'42c60bf2-aa94-4587-b51f-a6060189777b', N'Editor.NeedHelp', NULL, CAST(N'2016-05-14 23:52:34.147' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'94700f9d-2a68-4244-ab42-a6060189779c', N'Members.BanUser', NULL, CAST(N'2016-05-14 23:52:34.257' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8f8a8794-ec2d-4b8f-b5f0-a606018977bb', N'Members.UnBanUser', NULL, CAST(N'2016-05-14 23:52:34.357' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'34392940-711f-4d02-8503-a606018977d6', N'Errors.NoPermissionPolls', NULL, CAST(N'2016-05-14 23:52:34.473' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3c23f7bf-4526-4b76-9158-a606018977fe', N'Topic.ShowMorePosts', NULL, CAST(N'2016-05-14 23:52:34.607' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'd2e4ac54-01f9-4e4e-9c31-a60601897829', N'Topic.ShowMorePostsLoading', NULL, CAST(N'2016-05-14 23:52:34.733' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'860ac872-ad6f-4aaf-ad33-a60601897846', N'Topic.AlreadyAnswered', NULL, CAST(N'2016-05-14 23:52:34.823' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fa514ef0-0f79-4ed7-aac2-a6060189786b', N'Topic.Comment', NULL, CAST(N'2016-05-14 23:52:34.953' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'8f068daa-b2f2-455f-8329-a60601897888', N'Stats.FooterActiveUsersText', NULL, CAST(N'2016-05-14 23:52:35.043' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'cf1ebec3-ff5d-45ce-8909-a606018978a2', N'PostFilter.OrderBy', NULL, CAST(N'2016-05-14 23:52:35.167' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2b59bd27-d856-46b0-8d2a-a606018978cb', N'PostFilter.Standard', NULL, CAST(N'2016-05-14 23:52:35.280' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'344d23c6-c1d1-4082-b3e9-a606018978ec', N'PostFilter.Newest', NULL, CAST(N'2016-05-14 23:52:35.403' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2f52a818-1e23-4dc6-adfb-a6060189791a', N'PostFilter.Votes', NULL, CAST(N'2016-05-14 23:52:35.550' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'65de4ecf-6c28-4efc-81a5-a6060189793d', N'PM.NewPrivateMessageSubject', NULL, CAST(N'2016-05-14 23:52:35.687' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'05103764-8868-48ff-b410-a60601897968', N'PM.NewPrivateMessageBody', NULL, CAST(N'2016-05-14 23:52:35.813' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'46332f18-4b53-4f6b-88ce-a6060189798c', N'Post.DeleteConfirmation', NULL, CAST(N'2016-05-14 23:52:35.937' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'635eb3d4-6e07-4bbc-9d6e-a606018979b2', N'Category.SubCategoriesHeading', NULL, CAST(N'2016-05-14 23:52:36.037' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e42b688d-96b9-48d6-89e1-a606018979d7', N'Category.AllCategories', NULL, CAST(N'2016-05-14 23:52:36.173' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'685ed52c-fd21-48c4-8336-a606018979f7', N'Category.MostRecent', NULL, CAST(N'2016-05-14 23:52:36.267' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'f16383e2-94c9-4e40-bd3b-a60601897a17', N'Error.EmailIsBanned', NULL, CAST(N'2016-05-14 23:52:36.377' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b1d490ec-600e-41bd-8003-a60601897a39', N'Post.FilesUploaded', NULL, CAST(N'2016-05-14 23:52:36.483' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'b2fbef52-02f6-4ed8-b24f-a60601897a5a', N'Post.Attach', NULL, CAST(N'2016-05-14 23:52:36.597' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'2729fe9a-fdc4-4dba-83e7-a60601897a7e', N'Post.Upload', NULL, CAST(N'2016-05-14 23:52:36.770' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'9d2c0383-d19d-48bb-a174-a60601897abc', N'Post.UploadBannedFileExtension', NULL, CAST(N'2016-05-14 23:52:36.930' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'479aaf62-3d19-4af5-bfdd-a60601897ada', N'Post.UploadFileTooBig', NULL, CAST(N'2016-05-14 23:52:37.047' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'7e427ee0-6783-43e9-8338-a60601897b01', N'File.SuccessfullyDeleted', NULL, CAST(N'2016-05-14 23:52:37.180' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'18276c83-5d04-4424-9625-a60601897b26', N'Members.MemberEmailAuthorisationNeeded', NULL, CAST(N'2016-05-14 23:52:37.317' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'e2e44f33-abd9-4887-a0fb-a60601897b52', N'Members.MemberEmailAuthorisation.EmailBody', NULL, CAST(N'2016-05-14 23:52:37.443' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'3b9d884a-e084-4335-99b8-a60601897b78', N'Members.MemberEmailAuthorisation.Subject', NULL, CAST(N'2016-05-14 23:52:37.570' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'790633b5-92c6-4148-ba08-a60601897b9a', N'Members.NowApproved', NULL, CAST(N'2016-05-14 23:52:37.687' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'fc290d3c-00ed-460f-86d8-a60601897bc1', N'Members.MemberEmailAuthorisationNeededMessage', NULL, CAST(N'2016-05-14 23:52:37.843' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'4d33d053-93e4-4e5a-93e1-a60601897bec', N'Members.MemberEmailAuthorisationResend', NULL, CAST(N'2016-05-14 23:52:37.937' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'35642d8d-f109-417d-822e-a60601897c0f', N'Members.MessageMe', NULL, CAST(N'2016-05-14 23:52:38.077' AS DateTime))
INSERT [dbo].[LocaleResourceKey] ([Id], [Name], [Notes], [DateAdded]) VALUES (N'1931df50-3909-49ae-b8d4-a60601897c3d', N'Confirmation.DeleteMembersPosts', NULL, CAST(N'2016-05-14 23:52:38.207' AS DateTime))
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd50f5fc9-30aa-45d9-87dd-a60601895af0', N'Register', N'2dba921d-4dd2-4941-8e1e-a60601895aa3', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5af162a8-8c4e-4221-a4f7-a60601895b06', N'Log On', N'ecae5c56-02c2-463e-a51c-a60601895af2', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd0833b2e-7ad8-436c-a955-a60601895b2d', N'Activity', N'9bb0d2ff-1ebd-4fd1-920e-a60601895b06', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1327fa60-fbac-495a-a2bb-a60601895b4d', N'Leaderboard', N'6f9ba525-1a44-40d8-9ec8-a60601895b2d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6f35fcd8-6055-47c8-8837-a60601895b69', N'Home', N'2ac1bfe8-e39e-4351-92f1-a60601895b4e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'58fc651b-7bf9-4a5f-9f5b-a60601895b86', N'Admin', N'abf1b0e0-9c5f-475b-811f-a60601895b69', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f75f0ebe-3dac-453c-aba8-a60601895ba2', N'New Discussion', N'044c32da-383d-421c-9153-a60601895b86', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'32d90d53-9dfb-4e08-b589-a60601895bc0', N'Powered by ', N'8f77c510-cf11-478d-a2fc-a60601895ba3', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e7f68148-39d4-4172-bacc-a60601895bda', N'Votes', N'2d844ae1-5821-4571-b921-a60601895bc0', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'13b98e3f-e039-41b6-91ca-a60601895bfa', N'Answers', N'a5972388-031a-4aaf-808f-a60601895bda', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8e7920b3-7f94-4837-9269-a60601895c16', N'Started {0} by {1}', N'bdea52f5-759e-4cab-a5e9-a60601895bfb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'213976cd-44b1-4ca6-b302-a60601895c2b', N' in ', N'a4fb5535-c38e-4420-bae9-a60601895c17', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7a06e27c-9a1d-4124-a89d-a60601895c47', N'Latest By', N'b641dec8-77b4-4333-ba85-a60601895c2c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8e97b59f-a20e-4141-a5d8-a60601895c62', N'Views', N'cdb42ff6-79d4-4bec-92f6-a60601895c48', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3e56ea28-e380-4606-a31f-a60601895c86', N'Vote Up', N'3b4a1e6f-fb0e-49cb-b203-a60601895c62', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2e64ad35-a336-4adc-9233-a60601895ca5', N'Vote Down', N'd3cfe2e5-fbf7-4398-b20c-a60601895c87', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'11fea233-48c3-4e4c-be65-a60601895cc5', N'Is Solution', N'0b1f4f7e-25b7-4cb9-a592-a60601895ca5', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a159c27e-6f83-48c6-b776-a60601895ce7', N'posted this', N'136bbd91-c75a-4cd7-81b3-a60601895cc6', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e1b85ecd-c4a4-4be9-b6c2-a60601895d04', N'Posts', N'e9aad3dd-d1b8-447c-89f5-a60601895ce8', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'41f62ad3-9fa3-456f-bb51-a60601895d23', N'Points', N'ba8b195a-328c-4bf0-ad88-a60601895d04', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c0452114-3a5b-40b7-9327-a60601895d47', N'Last edited', N'dee4a969-a4e9-43d2-a115-a60601895d24', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'61a858e8-78d8-443e-b771-a60601895d67', N'Report', N'c42ce8e6-5af9-4865-bd69-a60601895d48', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'35a05b8e-a108-4d43-be97-a60601895d7c', N'Edit', N'ab609aeb-6dc2-4ea3-8387-a60601895d67', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'893d681a-aea1-42b5-847a-a60601895d9e', N'Delete', N'5f37f02d-a442-4add-afa0-a60601895d7d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b5f2a7c2-56d4-4a53-aa70-a60601895dbd', N'Log On', N'644b77a2-c10d-4d95-9eac-a60601895d9f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'78ecdd70-f96a-4573-bb14-a60601895dde', N'Log Off', N'a3e922d9-90d2-442c-bde2-a60601895dbe', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'eb893834-d134-464a-a8bf-a60601895e01', N'Please Wait...', N'91d1f367-85e4-48c0-90e5-a60601895ddf', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'644e7a1e-1d79-46ea-b8e7-a60601895e19', N'Discussions Tagged With: ', N'b8fe1204-3c0d-4eaa-98c3-a60601895e02', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8d98bffd-f845-408f-a2ff-a60601895e3d', N'Discussion Topic', N'e9693fb9-87fd-4a08-bac4-a60601895e1a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c5218539-f048-4c1b-98c3-a60601895e5c', N'Subscribe', N'a9417b9b-3dbe-4014-9cde-a60601895e3e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8369c80f-15be-42da-a4ad-a60601895e80', N'Unsubscribe', N'1355bb60-1656-4af9-a7ec-a60601895e5c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'62a0f57c-9194-43a6-a504-a60601895e9e', N'Topic Is Locked', N'3d101850-6c0b-4e79-be11-a60601895e81', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'068a89b2-21a2-4036-8ab1-a60601895ebc', N'Create Discussion', N'0b449a4e-a5b3-4536-bcdd-a60601895e9f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c529e205-7459-4269-8112-a60601895ed4', N'Tag this topic', N'df76dc98-5305-4815-b855-a60601895ebc', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9d81e190-b402-4bf3-aa8b-a60601895ef0', N'Popular Tags', N'7d3bf6d4-43e7-4571-aa7f-a60601895ed5', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'12688701-5edb-4c42-b1b4-a60601895f0e', N'Our {0} members have posted {1} times in {2} discussions', N'eb001fb6-cd19-455e-bd44-a60601895ef0', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1eccfc56-5f03-44ef-8bc4-a60601895f2a', N'Latest Members:', N'499b9f24-ed54-4613-bae6-a60601895f0f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd5928c37-c3cc-4fd7-8297-a60601895f4b', N'Message: ', N'605b9563-4ee1-4481-a93f-a60601895f2b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'04e08674-18a8-4271-bb00-a60601895f69', N'From: ', N'6b7f2af3-2332-4545-b757-a60601895f4e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'879e18f6-d86d-4fe6-a592-a60601895f85', N'Sent:', N'b72b4a6b-ac5c-4ff2-b78e-a60601895f6a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c0905cce-c41a-4878-b8dc-a60601895fa5', N'Back To Inbox', N'9196b1c7-9e73-4dfc-a7a7-a60601895f86', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'fccfb375-b035-4a0a-9444-a60601895fbd', N'Reply', N'6989b8b6-c1d6-4c47-81be-a60601895fa6', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'325c804e-cf29-40d5-bece-a60601895fe7', N'Sent Private Messages', N'4b636012-7ad4-43ed-ac59-a60601895fbe', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c56c3bca-4376-4f37-b452-a60601896002', N'To', N'996cb4af-1ded-4602-97dd-a60601895fe9', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7769fbef-4e44-4a03-88a6-a60601896024', N'Subject', N'7ce6b7a7-804f-407d-9f25-a60601896004', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd787e92c-5677-4b4b-8cb9-a6060189603a', N'Date', N'aa4ff531-33d8-4fde-9545-a60601896025', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'21d514f0-03f2-4936-a242-a6060189605a', N'Read', N'7dc30a05-469b-4f93-ad2e-a6060189603b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'92631942-eaed-443c-ace0-a60601896077', N'Delete', N'1fc02f3c-a681-4c82-a597-a6060189605b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e13afb8d-4235-45c5-bb32-a60601896094', N'You currently don''t have any private messages', N'58154d2c-a75f-4613-aedc-a60601896078', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e140ba2f-14b9-4f04-9d3e-a606018960b5', N'Create', N'289cdbba-9574-47d2-ac61-a60601896095', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3ce3715b-1363-4785-8844-a606018960d6', N'Received Private Messages', N'7f37027f-ac84-415d-8986-a606018960b6', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'01a9b5c5-1ce7-4ccc-8296-a606018960f2', N'Create Private Message', N'30229366-d272-462a-bd20-a606018960d7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e56d804e-79aa-4bae-9efc-a60601896113', N'Send', N'e57660fb-2176-4394-8756-a606018960f4', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5955a553-9045-43b1-a2ef-a60601896133', N'Original Message', N'52565a69-c581-4712-864e-a60601896114', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'decee362-d65e-48db-bbd5-a60601896157', N'Send', N'5ef93070-669c-44ea-8679-a60601896136', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ab032f6c-353f-428a-bc86-a6060189616f', N'Report Post By: ', N'bf43c2e0-a23e-4ccf-977d-a60601896158', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'70bfbf41-a7aa-4bcc-a3a7-a6060189619c', N'Edit', N'c3e62476-7f4e-4c1a-bdf5-a60601896171', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0c2c5a94-e39d-4303-bda6-a606018961b9', N'This Weeks High Earners', N'7068e517-9fc5-4fce-8ec7-a6060189619d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'fb1006b4-ea58-479f-a86f-a606018961dc', N'My Tools', N'8d96c4ee-eaf5-4521-b5bb-a606018961ba', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'01b16e8d-66b3-4e02-93f1-a606018961fa', N'Private Messages', N'60c8a750-56eb-4458-974a-a606018961de', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'35231bcb-579e-454c-890f-a60601896221', N'Search Members', N'ac8fad79-b982-4ea6-970a-a606018961fb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f27c443b-1596-486a-a78a-a60601896241', N'Search', N'980e8b16-55d6-4f0f-a1df-a60601896222', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e04d3f01-c735-4a4e-a83f-a6060189625d', N'Users', N'ecd20cb0-ac45-46ba-8306-a60601896242', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'78ce7c2b-82ef-4a1f-b0c2-a6060189627c', N'Points', N'f2f6512d-7e09-46d1-9202-a6060189625e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'90009af7-cb3e-4c9b-b4bf-a60601896299', N'Date Joined', N'62db73d4-5bf2-4e7c-94ba-a6060189627d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'cc230468-b796-4478-ad15-a606018962bf', N'Report ', N'cd51063b-a487-4723-bc7f-a6060189629b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'13a091f4-ae3e-4ff3-b9d0-a606018962d5', N'Register', N'fc7b4f9b-4ed4-415b-be17-a606018962c0', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2f71f670-fb6a-4233-b1ba-a60601896300', N'You are already registered? Why would you want to do it again?', N'00278822-83f7-4ba9-8138-a606018962d7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'22567bdf-fcd1-49e9-bfe6-a60601896323', N'Please enter your user name and password. Or {0} if you don''t have an account', N'a383b0e2-ed74-434a-8934-a60601896301', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'37418177-b379-4343-9ab1-a60601896342', N'Log On', N'2c50988b-7a91-4c5e-b9d4-a60601896325', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3289670f-4153-47dc-9b97-a60601896369', N' Profile', N'498dc2c9-69c1-49bc-b82c-a60601896343', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'03532b93-b284-4474-9497-a60601896388', N'Joined:', N'5aa44e9c-00fb-4674-98c4-a6060189636a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e178baf0-0244-4651-8567-a606018963b7', N'Posts:', N'2c7bd323-ea79-48a5-86d6-a6060189638a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'90ad5ef9-09b3-42c0-afaf-a606018963d7', N'Points:', N'412e6d64-31f1-402a-83c3-a606018963b9', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7828b541-67d0-4181-84b4-a606018963f6', N'Report', N'676cdf7f-3c4a-4ab9-84d6-a606018963d9', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8d11fdb8-85c6-4332-8536-a6060189640e', N'Address', N'b7d434fc-1643-4773-9938-a606018963f7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a7ad6975-229f-46fc-b1e8-a60601896434', N'City', N'68b4278c-f8a0-463c-a3d8-a60601896410', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8d193e80-9c30-421f-8a2b-a60601896450', N'State', N'e621e4e9-6b6e-4180-afb1-a60601896436', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'70b7e27c-7d70-4b9d-bff6-a6060189646d', N'Zip', N'bdc1dd0e-633f-418b-b894-a60601896451', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f8fd14fa-b565-47cf-84d5-a60601896490', N'Country', N'37a99525-be3d-48a0-b317-a6060189646f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c420aa51-50ec-4c28-9203-a606018964b9', N'Website', N'45206b2c-9092-4c22-9dfc-a60601896492', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'35b2fb34-0065-4fca-b5e7-a606018964e2', N'Discussion Activity', N'edc8c237-9d5c-4953-82fc-a606018964bb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6fb25185-49dc-41a4-81a5-a60601896504', N'Please Wait...', N'491fc488-a025-4c3f-bdd4-a606018964e4', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6da19f96-ab53-494c-a567-a6060189652a', N'Badges', N'47e361e8-5e37-45b9-b2a8-a60601896506', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'05d08775-0a4e-4166-bcf8-a6060189655e', N'Edit Profile', N'55cb77c4-bdea-4608-8123-a6060189652c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8b86ac47-a5ba-4f5f-bd20-a60601896580', N'Save', N'602e3248-5490-4e7c-aeb0-a6060189655f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0d0ee5de-4bac-4d67-987b-a606018965a1', N'Edit Member', N'597cdb17-6526-4157-819c-a60601896582', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a7adeba3-6e12-4bf3-8b28-a606018965bd', N'This Weeks Stars', N'2c949d15-cd96-41f8-80d2-a606018965a3', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'04e95a99-befc-4c9c-9517-a606018965e2', N'This Years Rock Stars', N'5e6b7627-e95c-4c0c-857c-a606018965bf', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8f226806-aa0e-4be1-b38c-a60601896601', N'Global Leaderboard', N'dcd0ace2-9e9a-4172-a845-a606018965e5', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd372b174-4713-4d96-8c50-a6060189661d', N'Latest Discussions', N'848e6da5-ec9e-47f5-bcc2-a60601896602', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4f0a01dc-6241-4316-9f93-a6060189663c', N'Rss', N'9dceeac1-775b-4589-a99f-a6060189661f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'65a59b7f-a579-433e-8214-a60601896654', N'Activity', N'289e9b1a-1254-44cb-adec-a6060189663e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'43a54c60-fcc7-432a-aa90-a6060189667f', N'Subscribe Via Email', N'b9f22f03-e7a3-4b78-92b3-a60601896655', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'cbc088c1-bafc-40d9-8860-a60601896695', N'Unsubscribe From Emails', N'60fc450d-d106-4b42-b08a-a60601896680', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a156ab41-e823-4dd3-9f4e-a606018966b3', N'Subscribe', N'd28e0661-5384-4ef3-a329-a60601896697', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'96441f40-f442-4fa5-90a7-a606018966d0', N'UnSubscribe', N'5665f330-12ef-4d43-a5c6-a606018966b5', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a6cbc30c-50bf-440f-90e2-a606018966ec', N'Currently no discussions in this category', N'db9afacd-62da-4942-b79e-a606018966d1', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c360f44b-123e-414f-8ed2-a6060189670c', N'Categories', N'98604abd-3e62-4623-861e-a606018966ee', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd3fa3a1a-ee94-4f37-8a2a-a60601896727', N'Recipient Username', N'30b65414-9f65-4ce9-8239-a6060189670d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b659df42-660d-4200-9a87-a6060189674b', N'Subject', N'0bee246f-b34a-4654-b62d-a60601896728', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1c215302-374b-4f4e-85c5-a6060189676a', N'Topic Name', N'3a6ff63e-57a4-4032-828b-a6060189674c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'eb7ca5eb-676f-41ab-818f-a6060189678d', N'Is Sticky Topic', N'efee52b2-5b2a-4c13-95e3-a6060189676c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3b3d6ee7-6cc4-4314-9c79-a606018967ab', N'Lock Topic', N'1dedde39-bd0b-4cf3-b46f-a6060189678f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b11ca3d1-8263-4883-b2d4-a606018967cb', N'Topic Category', N'ea906cfe-c89e-4546-92bf-a606018967ae', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'67c7d58c-67e7-4c2c-9674-a606018967ef', N'Username', N'b87daae5-54eb-4df4-b9c8-a606018967cd', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'aa8725a9-8a1a-4aea-bbf9-a6060189680b', N'Email address (Used by Gravatar to show your Avatar image)', N'1de4ffdf-00a1-4eda-8a47-a606018967f1', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'cd7cfe6a-03cf-4dc6-8a47-a6060189682a', N'Password', N'24b13794-dbf8-4de7-97e9-a6060189680d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'53484716-d1e5-4a4b-9d6c-a60601896845', N'Confirm Password', N'5dc44253-7ff2-4119-9b45-a6060189682c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b9776505-1f5b-4b0b-bb9b-a60601896864', N'User is Approved', N'7190a57d-d5cc-4d30-881a-a60601896847', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6c380d9b-925d-4da9-b0d2-a60601896880', N'Comment', N'c9ad8ee8-d309-44e3-8e87-a60601896866', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'fe44dd00-1370-4cee-94cb-a606018968a1', N'Roles', N'dd07867e-028b-4087-bc6f-a60601896882', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ef66b3e6-70ae-46bf-a4fa-a606018968c2', N'Signature', N'6130909e-9290-4447-9a1f-a606018968a3', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a5f9bb73-1232-4409-b2bf-a606018968e2', N'Website', N'828c2f2c-50ee-41a7-97c4-a606018968c4', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7bc45af3-2502-4a15-9cd4-a60601896901', N'Remember Me?', N'd404db89-3003-4930-9831-a606018968e4', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7cdcce89-7699-4f72-93c8-a60601896921', N'Users', N'c983d3a6-1b28-4dfc-b79f-a60601896903', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'83e94062-38ed-4323-8559-a6060189693a', N'Date Joined', N'1ee5727a-6f33-4e4b-8df6-a60601896924', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'aa779792-85ca-4f14-84e6-a6060189695c', N'No Access', N'4a6172b2-81ae-4d49-be78-a6060189693c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'218d31e9-ead8-4462-870d-a6060189697c', N'Sorry an error occured', N'76526c8b-073a-4656-8aaf-a6060189695e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'191e0fc5-f34b-4a7d-a2ba-a6060189699e', N'You do not have permission to perform this action', N'b2b7839a-e020-4ed4-93d6-a6060189697e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2087cc29-5eb9-4a45-99c7-a606018969c0', N'A new topic has been created in the {0} category', N'13a8b3a4-bb96-41d1-835a-a606018969a0', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7be65db5-fbe2-4f0e-afd9-a606018969e1', N'New Discussion On ', N'4c70ca12-40d2-459f-8e7d-a606018969c2', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e5aa2678-bf70-40e1-9e3f-a60601896a04', N'You are trying to send messages to quickly', N'0aed03ca-f460-43e4-a150-a606018969e4', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1474ce04-e892-40b2-af89-a60601896a1b', N'Your sent items is over capacity - delete messages to be able to send', N'b9731e6e-f4d3-4ffb-8f93-a60601896a06', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'648b14fb-43e8-4c56-a5e0-a60601896a3c', N'{0} has exceeded their inbox size - unable to send message', N'3ebc7fe2-6864-4cfe-abc8-a60601896a1d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b69236ec-647b-44ed-9555-a60601896a5a', N'Message Sent', N'e21d5c6d-64c4-489e-a284-a60601896a3e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f9b52168-096c-490b-9ad9-a60601896a85', N'Unable to find that member', N'a374858a-7c2c-460c-bf48-a60601896a5c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6277c6f4-dc3b-4fb2-8e06-a60601896ab7', N'Talking to yourself is a bit weird. isn''t it?', N'815f5387-d70c-4fff-a372-a60601896a87', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'bdba69d4-6aa4-42c3-9666-a60601896adb', N'Post Updated', N'3cfbeaf2-82dd-44c7-8a8b-a60601896ab9', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f25be070-1550-411c-a37f-a60601896af5', N'Topic Deleted', N'03c132ae-dc2b-4c20-92e7-a60601896add', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8379c544-6d10-4baf-8095-a60601896b1a', N'Post Deleted', N'cc1fef0f-bc3a-4485-b4a8-a60601896af7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'15a68618-bdb2-4125-9a39-a60601896b32', N'A new post has been created in the {0} topic', N'b294da9a-16a9-4881-aadd-a60601896b1c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'65a4f7c2-bff0-493d-a931-a60601896b56', N'New Post On ', N'a99c2e9c-bd8f-4bdf-b4a8-a60601896b34', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'531cf3b0-3f98-4f73-ba19-a60601896b71', N'Report Sent', N'db316dfb-0e48-4234-9330-a60601896b59', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'99f06c97-1a2b-407d-a349-a60601896b9d', N'You are now registered', N'd5f2d775-1252-4ed3-8738-a60601896b73', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e95f80f5-5fbd-4520-af87-a60601896bbd', N'You are now registered. But the forum admin must authorise your account', N'df4703c8-c167-410f-9a07-a60601896ba0', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'220541a1-c1af-4a1b-ad97-a60601896be5', N'You are now logged in', N'06958cab-0018-483c-9b37-a60601896bbf', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3bdc93c4-4cdc-487a-9e66-a60601896c04', N'The user or password provided is incorrect.', N'0622bc41-2ed6-4c64-a339-a60601896be7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'10c5630b-e1f7-4ec6-b26f-a60601896c27', N'The maximum number of password attempts has been exceeded.', N'11ad951e-d683-4b3d-8b05-a60601896c07', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8691492a-203a-46f2-bb26-a60601896c47', N'User is locked out.', N'f8a945d6-dbc1-4936-9dc7-a60601896c29', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7dec5783-fe1d-4ffd-ba38-a60601896c67', N'User has not been approved.', N'd97b3e7d-4e74-42cd-af61-a60601896c49', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1f3c6b0d-b311-446e-832d-a60601896c87', N'Unable to login.', N'3f90fe4d-ea6d-4894-9568-a60601896c69', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6dd4a376-8aa0-4938-ae7b-a60601896ca9', N'You are now logged out', N'd05183f2-e865-4da8-8193-a60601896c8a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd29026f0-2000-4b79-a996-a60601896cd7', N'Profile Updated', N'ba613522-cddf-4a9c-aa24-a60601896cab', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4fb33282-62f7-4d7b-866d-a60601896cf2', N'Language Changed', N'dcf44157-203f-4d51-883a-a60601896cda', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6f106b91-6191-4ee0-aeb8-a60601896d1b', N'Latest Forum Discussions', N'7b881db4-3ee3-4a8d-ac07-a60601896cf4', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9919e3bf-1c6f-458c-8957-a60601896d5c', N'Recent discussions', N'15c487ba-eb46-44cc-bfe5-a60601896d1e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b1f29459-13bc-46b4-8cb9-a60601896d97', N'Nothing To Display', N'3787ed86-0dba-40f9-b1ce-a60601896d60', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2943cf28-59df-4a05-8f47-a60601896dc5', N'{0} Discussions', N'7db0da5f-4820-4191-b05a-a60601896d9b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9e337a86-3f67-4a2e-b569-a60601896de0', N'Latest discussions happening in the {0} category', N'2a5568c7-0fed-4535-9464-a60601896dc7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f60bbdf0-263a-4152-b434-a60601896e12', N'Reporter', N'b2670ab7-b311-4b9c-b482-a60601896de2', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c508569f-3f4f-49fe-b092-a60601896e51', N'Member Reported', N'062d50ff-4e29-41d9-87a0-a60601896e15', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c4f2e89b-3b8d-43bc-bce4-a60601896e87', N'Reason', N'50fd4465-8d9b-42e8-aa83-a60601896e53', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9bf6d42d-47ad-43bd-a684-a60601896ea8', N'Member Report', N'449b1a61-f060-48ab-8495-a60601896e8a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2fd85608-94f6-446a-8ab2-a60601896ed0', N'Admin', N'0cb20ec5-19da-4eec-820c-a60601896eab', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b7ec5728-4e84-40f4-9168-a60601896ef0', N'Post Reported In', N'1dddc44a-8bfe-4e5b-8109-a60601896ed2', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7161ad4b-f65c-4867-b3aa-a60601896f17', N'Post Report', N'881dbc6b-e7fd-4075-b230-a60601896ef3', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1d89fb2e-5e27-4b88-8a2c-a60601896f37', N'Unable to award badges as badge collection is null for user {0}', N'18ed325c-022e-4bb3-b459-a60601896f19', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'aa87f6d7-ad56-4942-9c11-a60601896f59', N'Unknown badge type {0}', N'95e173be-a53d-42e4-9b11-a60601896f3a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7b0b6359-5ed0-49f2-83d3-a60601896f76', N'The badge enum type {0} has no corresponding class specified.', N'f87a4507-f467-4653-a0ad-a60601896f5b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'12ee50b5-4527-4bf6-b804-a60601896f96', N'User name already exists. Please enter a different user name.', N'a7ac8d42-c796-40c6-afd5-a60601896f78', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6ac7068f-1bdd-4efe-932d-a60601896fb4', N'A user name for that e-mail address already exists. Please enter a different e-mail address.', N'6dd50a4d-d163-4ee7-97ce-a60601896f99', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c81aea21-20e9-4943-8cf8-a60601896fd8', N'The password provided is invalid. Please enter a valid password value.', N'ce14dc45-4230-4580-a956-a60601896fb6', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5b6f8a8a-cabc-48a5-83d3-a60601896ff9', N'The e-mail address provided is invalid. Please check the value and try again.', N'93c7420c-dc30-41b1-8ff5-a60601896fdb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6ecad36b-36b2-4d8d-829f-a6060189701c', N'The password retrieval answer provided is invalid. Please check the value and try again.', N'95a67b30-0707-492b-af0f-a60601896ffb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5c4c8713-6658-427f-9dd9-a6060189703a', N'The password retrieval question provided is invalid. Please check the value and try again.', N'93c62a22-c048-4740-9d56-a6060189701f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3f67aff0-3139-4094-856f-a6060189705b', N'The user name provided is invalid. Please check the value and try again.', N'2d388a90-89c2-4628-8775-a6060189703c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7285c213-9e3e-440b-8e73-a60601897079', N'The authentication provider returned an error. Please verify your entry and try again. If the problem persists please contact your system administrator.', N'd66bed24-c161-46e6-afba-a6060189705e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c07a1882-36e7-4e01-9062-a6060189709a', N'The user creation request has been canceled. Please verify your entry and try again. If the problem persists please contact your system administrator.', N'553d8587-ba44-4c53-8f89-a6060189707b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4da7a8ea-9c6a-4850-a433-a606018970ba', N'An unknown error occurred. Please verify your entry and try again. If the problem persists please contact your system administrator.', N'83feb8c7-1d0f-4d8e-ad8a-a6060189709c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'725a5d86-d2b3-4ed9-82e4-a606018970d3', N'New member registered on {0} ({1})', N'92173987-032e-45d5-9600-a606018970bd', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'89d74918-2b73-4ec9-bc37-a606018970f3', N'Admin', N'7c7ba682-1380-4e7b-bf70-a606018970d6', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4e21bde8-c669-4a6a-b009-a60601897113', N'New Member Registered', N'82565a7b-49b9-4a79-9593-a606018970f6', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0f2e6cf2-3e1a-4417-bd4e-a60601897132', N'User does not exist - cannot unlock.', N'ec04a216-a9a5-4c48-b6a8-a60601897115', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6acf974c-bf3a-4db2-9406-a60601897153', N'You have requested that your password is reset on {0}. Your new password is below', N'afe880b7-f343-4032-a5b2-a60601897135', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2ff7a6d8-a492-48f0-a182-a6060189717a', N'Password Reset', N'28661679-d1b7-411f-b0b3-a60601897156', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2307f63e-02a5-4b40-b5a7-a6060189719c', N'A new password has been emailed to you', N'4bb8d802-4fd3-4bee-b833-a6060189717c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7bd15eab-4b19-446a-b617-a606018971bb', N'Error resetting password', N'f8537537-8b13-46de-a22b-a6060189719f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd922b12e-cc7b-4867-ad93-a606018971dd', N'Password Changed', N'8bbcd2d7-8da6-46ce-b3c8-a606018971be', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e5f9839e-cfc3-4673-9848-a606018971ff', N'The current password is incorrect or the new password is invalid.', N'fb142130-8fca-4acc-b406-a606018971df', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f8900d0d-aab9-4923-97cb-a60601897220', N'Change Password', N'9f4aa7bd-207f-4c37-b154-a60601897202', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0c9ea7db-8b57-444f-ab6a-a6060189724f', N'Change Password', N'183dcbd5-bab3-4f07-9e4b-a60601897224', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e475bdd2-aaf8-42d2-bd2a-a60601897278', N'New passwords are required to be a minimum of {0} characters in length.', N'eed1224d-60b1-40ac-ab75-a60601897252', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'08d6bc00-1df5-4328-9508-a6060189729e', N'Click here if you want to {0}', N'a60a4a2f-4121-4f3f-b277-a6060189727b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1fc0927a-bcad-47b5-b040-a606018972cb', N'Forgot Password', N'282b9b14-c433-44e4-b0ee-a606018972a2', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'79abc516-02cf-4768-bc75-a606018972f0', N'Reset Password', N'53423a44-814f-4f32-b87a-a606018972ce', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'23bd2e6a-488a-4174-8c54-a6060189730d', N'Forgot your password?', N'a6c93e05-4eeb-4012-ad93-a606018972f3', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'40c7d6f0-84c5-4731-a9d2-a6060189732e', N'Current Password', N'319696d1-0a7d-4723-ae0a-a6060189730f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7fd70267-a527-4495-89e1-a6060189734b', N'New Password', N'b18cee92-3d26-4235-9fc3-a60601897331', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd591747b-7a04-45e2-b8d3-a60601897364', N'Confirm New Password', N'f9dd5564-e931-4072-b587-a6060189734d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c3ba00e0-356b-46a6-831b-a6060189738b', N'Enter your email address', N'c030d4c7-1b2c-46d6-87bf-a60601897367', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'fafd9ab5-bf23-475e-9b66-a606018973aa', N'badge ', N'49d77a4b-d8b4-409a-b3d8-a6060189738e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'75e9e521-7d6e-426e-8ac4-a606018973cd', N'has been awarded the', N'7d645d88-d8be-4e7d-9025-a606018973ad', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'6a5e5dd5-cff7-4d3a-b876-a606018973ed', N'is a new member in the forum', N'097c7069-5fb1-4254-a32d-a606018973d0', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'974ce631-b38d-4a00-99d0-a6060189740c', N'has an updated profile', N'9b9e7da5-2896-42fe-aa5f-a606018973f0', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'faa55d2e-9054-4baa-a8cd-a6060189742c', N'Get notified of replies?', N'ac9b9f9f-da02-480a-820c-a6060189740f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a846deba-4bb7-438b-a9c9-a6060189744c', N'Badges', N'464cd662-6d22-42c7-8f41-a6060189742f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'25974b30-b119-4730-ab41-a6060189746d', N'Badges', N'63ac3534-c0bf-4109-8406-a60601897450', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'28853d45-7ba6-463f-a083-a6060189748b', N'Title', N'28ed94b9-e690-43a3-a40a-a6060189746f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'cf322368-3d78-4d99-9478-a606018974aa', N'Add A Poll To This Topic', N'9f626b6e-9968-40dc-9586-a6060189748e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
GO
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'455555e8-7baf-4ead-88d6-a606018974c8', N'Type A Poll Answer Here', N'4ab2b0b2-964f-4230-b93c-a606018974ae', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'838eb3b1-0a50-49b1-b577-a606018974e9', N'Topic Options', N'017cfc20-7294-4751-a3ac-a606018974cb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3c12c2a2-4ea5-473b-8950-a60601897502', N'Remove Poll From Topic', N'25e31501-acbe-4648-8e4d-a606018974ec', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'99f4f8ce-e457-4aed-ab72-a60601897526', N'Submit Vote', N'411f8ed4-68da-4cde-a2a5-a60601897506', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'807edf83-1a2f-4fbd-8d2f-a60601897545', N'There was an error with your answer. Please try again', N'e80cbb19-d662-4c51-ab28-a60601897529', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2af0fe70-8509-4069-9a3c-a60601897573', N'Or', N'58e0b102-dc7a-4acf-9450-a60601897548', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'2e0a9a37-59ef-4f1b-8e4c-a60601897592', N'Social Account', N'f74c46b6-7192-4818-a282-a60601897576', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'25901e54-fbef-49a1-beab-a606018975bb', N'Just now', N'8830e38c-ab20-4997-b079-a60601897595', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'61e1231c-6871-4306-a643-a606018975d5', N'1 minute ago', N'42d60798-5ad1-4d34-85cd-a606018975be', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c09f2e51-b7de-457c-b495-a606018975fd', N'{0} minutes ago', N'a87ed201-6668-4fe5-9c13-a606018975d8', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7e60995b-df72-472b-bb9f-a60601897618', N'1 hour ago', N'b1d8f207-fb9c-4d39-befa-a60601897600', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'4a2ce8c5-5f82-48cf-ba64-a60601897640', N'{0} hours ago', N'a9b5b9dc-b67b-4d68-8860-a6060189761b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8917cd4c-c014-4261-af29-a60601897662', N'yesterday', N'7c6d9a51-2beb-40b7-9d18-a60601897643', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b08a8e02-3370-49cb-9348-a60601897681', N'{0} days ago', N'0a8f1356-362f-420b-b090-a60601897665', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'36828335-58e3-4e7b-b5c6-a606018976a3', N'{0} weeks ago', N'd4eee8a7-9fd0-4ebf-ab32-a60601897685', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'41ca18d0-4c14-4cd8-bbac-a606018976ca', N'Search', N'7725d08f-74f0-4967-a13e-a606018976a7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f5eefa77-e5cd-4838-a77b-a606018976e9', N'Sorry no results found', N'3bb56177-8e55-4e4a-bcb0-a606018976cd', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3436c991-d1c5-48f0-898d-a6060189770c', N'Comments', N'a14fa3f4-0b28-43a5-a564-a606018976eb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8cef3db4-e996-48c6-929b-a60601897734', N'Delete All Posts', N'cda9b42f-654c-4a0a-95e7-a60601897710', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a5355140-5979-4721-8d78-a60601897757', N'Add Post', N'85c90cb9-5e60-44b0-8544-a60601897737', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'f48e24b7-71cc-43c0-8c8a-a60601897778', N'Choose Category', N'89c77e6a-e2bd-4e51-9a0a-a6060189775b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'8eddfeab-a6ab-408c-9c4a-a60601897798', N'Need formatting help?', N'42c60bf2-aa94-4587-b51f-a6060189777b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'5c938817-8b19-4bd6-bf07-a606018977b8', N'Ban User', N'94700f9d-2a68-4244-ab42-a6060189779c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'63a6c664-94c3-4fc7-a91c-a606018977d2', N'Unban User', N'8f8a8794-ec2d-4b8f-b5f0-a606018977bb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e99b2025-7dec-4208-b69c-a606018977fb', N'Topic Created. But you do not have permission to create polls', N'34392940-711f-4d02-8503-a606018977d6', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7b3374e2-01e6-4dd5-9426-a60601897826', N'Show More Posts', N'3c23f7bf-4526-4b76-9158-a606018977fe', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'eecfc05a-d7d4-4ff9-ab3c-a60601897843', N'Loading Posts...', N'd2e4ac54-01f9-4e4e-9c31-a60601897829', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'cbc5f58e-e0de-4580-bfd3-a60601897867', N'Questions that may already have your answer', N'860ac872-ad6f-4aaf-ad33-a60601897846', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'aa642393-3d41-4c93-a738-a60601897885', N'Answer', N'fa514ef0-0f79-4ed7-aac2-a6060189786b', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'0f3d7765-b416-45a5-ba53-a6060189789f', N'Members Currently Online:', N'8f068daa-b2f2-455f-8329-a60601897888', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ab444d87-9e22-49a0-922e-a606018978c7', N'Order By:', N'cf1ebec3-ff5d-45ce-8909-a606018978a2', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'454ed96a-c303-48a3-8a60-a606018978e8', N'Standard', N'2b59bd27-d856-46b0-8d2a-a606018978cb', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'1ac2b4f2-aa11-4935-90b4-a60601897916', N'Newest', N'344d23c6-c1d1-4082-b3e9-a606018978ec', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'702ec2c3-f701-47f8-9806-a60601897939', N'Votes', N'2f52a818-1e23-4dc6-adfb-a6060189791a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c43c60e7-0042-4119-81fa-a60601897964', N'New Private Message', N'65de4ecf-6c28-4efc-81a5-a6060189793d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c56e00cb-1821-4001-a8a7-a60601897988', N'{0} has just sent you a private message.', N'05103764-8868-48ff-b410-a60601897968', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'54c0783d-17dd-42f7-94c9-a606018979ae', N'Are you sure you want to delete?', N'46332f18-4b53-4f6b-88ce-a6060189798c', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'128e1a79-c606-4a3a-96e8-a606018979d3', N'Sub Categories In', N'635eb3d4-6e07-4bbc-9d6e-a606018979b2', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3dc3569d-e25b-4a65-8b3b-a606018979f3', N'All Categories', N'e42b688d-96b9-48d6-89e1-a606018979d7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'9e148ddb-2871-4630-a095-a60601897a14', N'Most recent:', N'685ed52c-fd21-48c4-8336-a606018979f7', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'927f7ab3-a198-47d0-b8df-a60601897a35', N'The email address or domain you are trying to use is banned', N'f16383e2-94c9-4e40-bd3b-a60601897a17', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'57354bbe-b3de-4b63-b26a-a60601897a56', N'Files uploaded successfully', N'b1d490ec-600e-41bd-8003-a60601897a39', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'57607db9-e6d2-4ee3-a760-a60601897a7a', N'Attach', N'b2fbef52-02f6-4ed8-b24f-a60601897a5a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'7ec2a88e-e4d9-4219-8a93-a60601897ab8', N'Upload Files', N'2729fe9a-fdc4-4dba-83e7-a60601897a7e', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'118c22bd-9cad-4768-8ab1-a60601897ad7', N'File extension not allowed', N'9d2c0383-d19d-48bb-a174-a60601897abc', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'3803deee-46ec-4cda-b138-a60601897afd', N'File upload is too big', N'479aaf62-3d19-4af5-bfdd-a60601897ada', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'65619ef7-4c7e-4143-8914-a60601897b22', N'File deleted', N'7e427ee0-6783-43e9-8338-a60601897b01', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'b628c417-6833-4b03-8552-a60601897b4b', N'We have sent you a confirmation email - please click the confirmation link in your email to approve your account.', N'18276c83-5d04-4424-9625-a60601897b26', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'ff3e5931-7f02-4f60-a882-a60601897b74', N'You have registered on {0} - In order to continue you must confirm your email address by clicking the link below. {1}', N'e2e44f33-abd9-4887-a0fb-a60601897b52', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'87402003-bbd9-4b47-8e46-a60601897b97', N'Email Confirmation', N'3b9d884a-e084-4335-99b8-a60601897b78', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'c3001b39-e49f-41ac-aa87-a60601897bbd', N'Your account has now been approved - Thank you', N'790633b5-92c6-4148-ba08-a60601897b9a', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'774232d9-31ff-43c1-b766-a60601897be8', N'Click the link in your confirmation email to approve your account.', N'fc290d3c-00ed-460f-86d8-a60601897bc1', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'd484b1f2-b45f-4e65-826d-a60601897c0b', N'Resend Confirmation Email', N'4d33d053-93e4-4e5a-93e1-a60601897bec', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'e1d4b742-89a6-4e8d-875d-a60601897c38', N'Message Me', N'35642d8d-f109-417d-822e-a60601897c0f', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
INSERT [dbo].[LocaleStringResource] ([Id], [ResourceValue], [LocaleResourceKey_Id], [Language_Id]) VALUES (N'a9c1cd54-eede-4eaf-8781-a60601897c5e', N'Are you sure? This will delete all the members posts and topics!', N'1931df50-3909-49ae-b8d4-a60601897c3d', N'c0ef68f2-38e7-4411-9e94-a60601895aa1')
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (1, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Home', N'Top', N'Home', N'Index', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.657' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (2, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'About', N'Top', N'Home', N'About', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.773' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (3, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Contact', N'Top', N'Home', N'Contact', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.773' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (4, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Forum', N'Top', N'Forum', N'', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.773' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (5, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Links', N'Top', N'Links', N'', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.773' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (6, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Home', N'Left', N'Home', N'Index', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.773' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (7, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Pictures', N'Left', N'Pictures', N'Index', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.773' AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (8, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Videos', N'Left', N'Videos', N'Index', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.777' AS DateTime))
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (1, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Home', N'/Home/Index', N'<p><span style=''font-size: medium;''><strong>Welcome to DigiOz .NET Portal!</strong></span></p>
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
<p>Visit us at <a href=''http://www.digioz.com''>www.digioz.com</a> for more information, or email us at <a href=''mailto:support@digioz.com''>support@digioz.com</a>. </p>', N'DigiOz .NET Portal, CMS, Portal, Web Portal, ASP.NET MVC', N'DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and C# which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.', 1, CAST(N'2016-05-14 23:52:38.800' AS DateTime))
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (2, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'Contact', N'/Home/Contact', N'<h2>Contact</h2>
<h3>Below is our Contact Information:</h3>
<address>One Microsoft Way<br /> Redmond, WA 98052-6399<br /> <abbr title=''Phone''>P:</abbr> 425.555.0100</address><address><strong>Support:</strong> <a href=''mailto:Support@example.com''>Support@example.com</a><br /> <strong>Marketing:</strong> <a href=''mailto:Marketing@example.com''>Marketing@example.com</a></address>', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.903' AS DateTime))
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (3, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'About', N'/Home/About', N'<h2>About</h2>
<h3>Some information about us:</h3>
<p>Use this area to provide additional information.</p>', NULL, NULL, 1, CAST(N'2016-05-14 23:52:38.903' AS DateTime))
SET IDENTITY_INSERT [dbo].[Page] OFF
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'c3336dc6-0b7c-4cb0-85d4-a60601895a60', N'Lock Topics')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'663f1990-c145-4c12-8942-a60601895a60', N'Edit Posts')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'aeac5a4a-0a26-441d-965e-a60601895a60', N'Vote In Polls')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'5b030946-c66d-4c06-9806-a60601895a60', N'Create Topics')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'75445d6f-71ae-4c29-a5dd-a60601895a60', N'Delete Posts')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'5c60a8dc-949b-4a51-a6a4-a60601895a60', N'Deny Access')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'16e850f5-6c61-45db-a8a6-a60601895a60', N'Sticky Topics')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'25a893df-e665-4822-acf0-a60601895a60', N'Attach Files')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'a00eb58e-2211-4c8c-afad-a60601895a60', N'Create Polls')
INSERT [dbo].[Permission] ([Id], [Name]) VALUES (N'1c711acb-2c3d-4c62-b721-a60601895a60', N'Read Only')
SET IDENTITY_INSERT [dbo].[Plugin] ON 

INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (1, N'Chat', NULL, 1)
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (2, N'Store', NULL, 1)
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (3, N'Twitter', NULL, 1)
SET IDENTITY_INSERT [dbo].[Plugin] OFF
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([ID], [UserID], [Email], [Birthday], [BirthdayVisible], [Address], [Address2], [City], [State], [Zip], [Country], [Signature], [Avatar], [FirstName], [LastName]) VALUES (1, N'2a7d6067-8b44-4960-8935-a775c8736e10', N'webmaster@domain.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ID], [UserID], [Email], [Birthday], [BirthdayVisible], [Address], [Address2], [City], [State], [Zip], [Country], [Signature], [Avatar], [FirstName], [LastName]) VALUES (2, N'f364a163-da4f-4d16-9a11-b4c7d8eb6ee1', N'user1@mail.com', CAST(N'1975-07-24 00:00:00.000' AS DateTime), 1, N'1 Main Street', N'Ste 100', N'Chicago', N'IL', N'60601', N'USA', N'User One Some Company, Inc.', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Profile] OFF
INSERT [dbo].[Settings] ([Id], [ForumName], [ForumUrl], [IsClosed], [EnableRSSFeeds], [DisplayEditedBy], [EnablePostFileAttachments], [EnableMarkAsSolution], [EnableSpamReporting], [EnableMemberReporting], [EnableEmailSubscriptions], [ManuallyAuthoriseNewMembers], [NewMemberEmailConfirmation], [EmailAdminOnNewMemberSignUp], [TopicsPerPage], [PostsPerPage], [ActivitiesPerPage], [EnablePrivateMessages], [MaxPrivateMessagesPerMember], [PrivateMessageFloodControl], [EnableSignatures], [EnablePoints], [PointsAllowedToVoteAmount], [PointsAddedPerPost], [PointsAddedPostiveVote], [PointsDeductedNagativeVote], [PointsAddedForSolution], [AdminEmailAddress], [NotificationReplyEmail], [SMTP], [SMTPUsername], [SMTPPassword], [SMTPPort], [SMTPEnableSSL], [SpamQuestion], [SpamAnswer], [EnableAkisment], [AkismentKey], [CurrentDatabaseVersion], [EnablePolls], [SuspendRegistration], [DefaultLanguage_Id], [NewMemberStartingRole]) VALUES (N'0412021a-e62f-48e0-b9f3-a60601897c62', N'Digioz Forum', N'http://www.mydomain.com', 0, 1, 1, 0, 1, 1, 1, 1, 0, NULL, 1, 20, 20, 20, 1, 50, 1, 0, 1, 1, 1, 0, 2, 4, N'my@email.com', N'noreply@myemail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 1, NULL, N'c0ef68f2-38e7-4411-9e94-a60601895aa1', N'd211576e-c8d1-4f12-81ae-9cba209d1920')
SET IDENTITY_INSERT [dbo].[VisitorInfo] ON 

INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (1, N'::1', N'/', NULL, N'Chrome', N'Chrome50', N'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', N'50.0', 0, N'3.0', N'WinNT', NULL, N'', N'', N'en-US,en;q=0.8,fa;q=0.6,de;q=0.4', CAST(N'2016-05-14 18:53:15.927' AS DateTime))
INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (2, N'::1', N'/', NULL, N'Chrome', N'Chrome50', N'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', N'50.0', 0, N'3.0', N'WinNT', NULL, N'', N'', N'en-US,en;q=0.8,fa;q=0.6,de;q=0.4', CAST(N'2016-05-14 19:00:31.993' AS DateTime))
INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (3, N'::1', N'/Menu/TwitterMenu', NULL, N'Chrome', N'Chrome50', N'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', N'50.0', 0, N'3.0', N'WinNT', NULL, N'', N'', N'en-US,en;q=0.8,fa;q=0.6,de;q=0.4', CAST(N'2016-05-14 19:05:48.200' AS DateTime))
INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (4, N'::1', N'/', NULL, N'Chrome', N'Chrome50', N'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', N'50.0', 0, N'3.0', N'WinNT', NULL, N'', N'', N'en-US,en;q=0.8,fa;q=0.6,de;q=0.4', CAST(N'2016-05-14 19:05:51.703' AS DateTime))
INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (5, N'::1', N'/Menu/TwitterMenu', NULL, N'InternetExplorer', N'InternetExplorer11', N'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', N'11.0', 0, N'3.0', N'WinNT', NULL, N'', N'', N'en-US,en;q=0.7,fa;q=0.3', CAST(N'2016-05-14 19:08:38.290' AS DateTime))
INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (6, N'::1', N'/', NULL, N'InternetExplorer', N'InternetExplorer11', N'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', N'11.0', 0, N'3.0', N'WinNT', NULL, N'', N'', N'en-US,en;q=0.7,fa;q=0.3', CAST(N'2016-05-14 19:08:38.290' AS DateTime))
INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (7, N'::1', N'/', NULL, N'InternetExplorer', N'InternetExplorer11', N'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', N'11.0', 0, N'3.0', N'WinNT', NULL, N'', N'', N'en-US,en;q=0.7,fa;q=0.3', CAST(N'2016-05-14 19:12:45.363' AS DateTime))
INSERT [dbo].[VisitorInfo] ([ID], [IPAddress], [PageURL], [ReferringURL], [BrowserName], [BrowserType], [BrowserUserAgent], [BrowserVersion], [IsCrawler], [JSVersion], [OperatingSystem], [Keywords], [SearchEngine], [Country], [Language], [Timestamp]) VALUES (8, N'::1', N'/Twitter/Index', NULL, N'InternetExplorer', N'InternetExplorer11', N'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', N'11.0', 0, N'3.0', N'WinNT', NULL, N'', N'', N'en-US,en;q=0.7,fa;q=0.3', CAST(N'2016-05-14 19:12:45.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[VisitorInfo] OFF
SET IDENTITY_INSERT [dbo].[VisitorSession] ON 

INSERT [dbo].[VisitorSession] ([Id], [IpAddress], [PageUrl], [SessionId], [UserName], [DateCreated], [DateModified]) VALUES (1, N'::1', N'http://localhost:7777/', N'hgacsi2jo5ksanw5ioiyaui5', N'admin', CAST(N'2016-05-14 18:53:14.657' AS DateTime), CAST(N'2016-05-14 19:05:51.767' AS DateTime))
INSERT [dbo].[VisitorSession] ([Id], [IpAddress], [PageUrl], [SessionId], [UserName], [DateCreated], [DateModified]) VALUES (2, N'::1', N'http://localhost:7777/Menu/TwitterMenu', N'jdqocaee3kaaxvakogvx1o22', NULL, CAST(N'2016-05-14 19:08:37.367' AS DateTime), CAST(N'2016-05-14 19:08:37.367' AS DateTime))
INSERT [dbo].[VisitorSession] ([Id], [IpAddress], [PageUrl], [SessionId], [UserName], [DateCreated], [DateModified]) VALUES (3, N'::1', N'http://localhost:7777/', N'phw3brcuhhhc2cmo1msdgztv', NULL, CAST(N'2016-05-14 19:08:37.397' AS DateTime), CAST(N'2016-05-14 19:08:37.397' AS DateTime))
INSERT [dbo].[VisitorSession] ([Id], [IpAddress], [PageUrl], [SessionId], [UserName], [DateCreated], [DateModified]) VALUES (4, N'::1', N'http://localhost:7777/Admin/PluginManager', N'nopp4hqqxvgbxtlhslieobc4', N'admin', CAST(N'2016-05-14 19:12:43.767' AS DateTime), CAST(N'2016-05-14 19:14:15.450' AS DateTime))
INSERT [dbo].[VisitorSession] ([Id], [IpAddress], [PageUrl], [SessionId], [UserName], [DateCreated], [DateModified]) VALUES (5, N'::1', N'http://localhost:7777/Twitter/Index', N'4htiubnljn0pfjvuh4wyrqvh', NULL, CAST(N'2016-05-14 19:12:43.710' AS DateTime), CAST(N'2016-05-14 19:12:43.710' AS DateTime))
SET IDENTITY_INSERT [dbo].[VisitorSession] OFF
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
