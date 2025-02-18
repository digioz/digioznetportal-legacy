USE [digiozportal3]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Announcement]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Chat]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [nvarchar](128) NOT NULL,
	[ParentId] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[ReferenceId] [nvarchar](max) NULL,
	[ReferenceType] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Likes] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommentConfig]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentConfig](
	[Id] [nvarchar](128) NOT NULL,
	[ReferenceId] [nvarchar](max) NULL,
	[ReferenceType] [nvarchar](max) NULL,
	[ReferenceTitle] [nvarchar](max) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.CommentConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommentLike]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentLike](
	[Id] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[CommentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CommentLike] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Link]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[LinkCategoryID] [int] NOT NULL,
	[Visible] [bit] NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LinkCategory]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Visible] [bit] NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.LinkCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[LogVisitor]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[MailingList]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingList](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DefaultEmailFrom] [nvarchar](50) NOT NULL,
	[DefaultFromName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.MailingList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MailingListCampaign]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingListCampaign](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[FromName] [nvarchar](50) NOT NULL,
	[FromEmail] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](255) NOT NULL,
	[Banner] [nvarchar](255) NULL,
	[Body] [nvarchar](max) NOT NULL,
	[VisitorCount] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.MailingListCampaign] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MailingListCampaignRelation]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingListCampaignRelation](
	[ID] [uniqueidentifier] NOT NULL,
	[MailingListID] [uniqueidentifier] NOT NULL,
	[MailingListCampaignID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MailingListCampaignRelation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MailingListSubscriber]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingListSubscriber](
	[ID] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.MailingListSubscriber] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MailingListSubscriberRelation]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingListSubscriberRelation](
	[ID] [uniqueidentifier] NOT NULL,
	[MailingListID] [uniqueidentifier] NOT NULL,
	[MailingListSubscriberID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MailingListSubscriberRelation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Menu]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[Controller] [nvarchar](max) NULL,
	[Action] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Target] [nvarchar](max) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Module]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[Location] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NULL,
	[DisplayInBox] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Module] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [nvarchar](128) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[InvoiceNumber] [nvarchar](20) NULL,
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/27/2018 6:12:47 AM ******/
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
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[MaterialType] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 12/27/2018 6:12:47 AM ******/
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

/****** Object:  Table [dbo].[Picture]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[PictureAlbum]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureAlbum](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_dbo.PictureAlbum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plugin]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Poll]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poll](
	[Id] [uniqueidentifier] NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[IsClosed] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Featured] [bit] NOT NULL,
	[AllowMultipleOptionsVote] [bit] NOT NULL,
	[MembershipUser_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Poll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PollAnswer]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[PollUsersVote]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollUsersVote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[PollId] [nvarchar](max) NULL,
	[DateVoted] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.PollUsersVote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PollVote]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 12/27/2018 6:12:47 AM ******/
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
	[Visible] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Visible] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductOption]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOption](
	[ID] [nvarchar](128) NOT NULL,
	[ProductID] [nvarchar](128) NOT NULL,
	[OptionType] [nvarchar](50) NOT NULL,
	[OptionValue] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.ProductOption] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[RSS]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[MaxCount] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.RSS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 12/27/2018 6:12:47 AM ******/
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
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[MaterialType] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[AspNetUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SlideShow]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlideShow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SlideShow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[VideoAlbum]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoAlbum](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_dbo.VideoAlbum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisitorInfo]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[VisitorSession]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Vote]    Script Date: 12/27/2018 6:12:47 AM ******/
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
/****** Object:  Table [dbo].[Zone]    Script Date: 12/27/2018 6:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ZoneType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Zone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Announcement] ON 

GO
INSERT [dbo].[Announcement] ([ID], [UserID], [Title], [Body], [Visible], [Timestamp]) VALUES (1, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Test Announcement 1', N'<p>This is a test Announcement.</p>', 1, CAST(N'2018-04-30T20:20:24.643' AS DateTime))
GO
INSERT [dbo].[Announcement] ([ID], [UserID], [Title], [Body], [Visible], [Timestamp]) VALUES (2, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Test Announcement 2', N'<p>Test Announcement 2 Body</p>', 1, CAST(N'2018-04-30T20:20:24.673' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Announcement] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4c2014a4-35fc-4505-935c-0b912eef0e92', N'Guest')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'550b4e01-248e-44b5-9e7c-e1313436dce2', N'Administrator')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8e50a892-0f7d-40df-b8c3-7b746ccc4679', N'Moderator')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ff65b1a0-8020-4962-9ed4-6264f9b8eea5', N'Standard Members')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'550b4e01-248e-44b5-9e7c-e1313436dce2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0e5f401f-3431-475e-925e-2dc9e74280c5', N'ff65b1a0-8020-4962-9ed4-6264f9b8eea5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [LastActivityDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttempt], [Comment], [Slug], [DisableEmailNotifications], [DisablePosting], [DisablePrivateMessages], [DisableFileUploads]) VALUES (N'0e5f401f-3431-475e-925e-2dc9e74280c5', N'user1', N'ALl0vPEEa6SCXfvRbHFEzGKZ65CVGIGb/tD07SBq8YECl94fhbrzZm2LJ4pL6ukIYA==', N'26b497f2-995f-436c-a6fd-1f4416c8fc41', N'ApplicationUser', NULL, NULL, 1, 0, CAST(N'2018-04-30T20:20:16.803' AS DateTime), CAST(N'2018-04-30T20:20:16.803' AS DateTime), CAST(N'2018-04-30T20:20:16.803' AS DateTime), CAST(N'2018-04-30T20:20:16.803' AS DateTime), NULL, 0, 0, NULL, N'user1', 0, 0, 0, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [LastActivityDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttempt], [Comment], [Slug], [DisableEmailNotifications], [DisablePosting], [DisablePrivateMessages], [DisableFileUploads]) VALUES (N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'admin', N'ALCyUIBtQHBa8gR1zBdXmWxsLZ8rq+vU09oOg6eW1tL/KIHmJHac8M+wVVQy2bEdlg==', N'd4789b45-cf9a-44bb-811f-fbd9cfc995d2', N'ApplicationUser', NULL, NULL, 1, 0, CAST(N'2018-04-30T20:20:15.663' AS DateTime), CAST(N'2018-04-30T20:20:15.663' AS DateTime), CAST(N'2018-04-30T20:20:15.663' AS DateTime), CAST(N'2018-04-30T20:20:15.663' AS DateTime), CAST(N'2018-12-02T20:29:27.637' AS DateTime), 0, 0, NULL, N'admin', 0, 0, 0, NULL)
GO

SET IDENTITY_INSERT [dbo].[Config] ON 

GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (1, N'SMTPServer', N'mail.domain.com', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (2, N'SMTPPort', N'587', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (3, N'SMTPUsername', N'webmaster@domain.com', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (4, N'SMTPPassword', N'ohuiChQV5zxEwpmisiiWcIvlEVBH/zaroX1Rd9SD6zU=', 1)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (5, N'SiteURL', N'http://localhost:6969', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (6, N'SiteName', N'DigiOz .NET Portal', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (7, N'SiteEncryptionKey', N'BlAMwXxp7oMxGtWzIZYe', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (8, N'WebmasterEmail', N'webmaster@domain.com', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (9, N'PaymentLoginID', N'6b74ZBkn5u3', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (10, N'PaymentTransactionKey', N'9M4Tc3s89w3C39cq', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (11, N'PaymentTestMode', N'true', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (12, N'TwitterHandle', N'@digioz', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (13, N'PaymentTransactionFee', N'0', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (14, N'NumberOfAnnouncements', N'2', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (15, N'ShowContactForm', N'false', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (16, N'VisitorSessionPurgePeriod', N'30', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (17, N'PaypalMode', N'sandbox', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (18, N'PaypalClientId', N'AfBQZ3rwN5BKZN6QOJL4zBa1-Uph0KpxxrpMz2ro9RQO_W_CT_1-31GaM-iNo5S0WxIO4Z-LJtW5RInf', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (19, N'PaypalClientSecret', N'EGpl6DrqoaOWVysXEatofIjglg1i1XwHwSIhcw7jZ8duvfgxZAI6SeE8TVmbgHOXxJB7pyKW2O5cOhqj', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (20, N'PaypalConnectionTimeout', N'360000', 0)
GO
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue], [IsEncrypted]) VALUES (21, N'EnableCommentsOnAllPages', N'true', 0)
GO
SET IDENTITY_INSERT [dbo].[Config] OFF
GO
INSERT [dbo].[Language] ([Id], [Name], [LanguageCulture], [FlagImageFileName], [RightToLeft]) VALUES (N'c4b2685b-eb6c-4c11-971c-a8d2014f2942', N'English (United States)', N'en-US', NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (1, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Home', N'TopMenu', N'Home', N'Index', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.673' AS DateTime), 1)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (2, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'About', N'TopMenu', N'Home', N'About', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 2)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (3, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Contact', N'TopMenu', N'Home', N'Contact', NULL, NULL, 0, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 3)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (4, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Forum', N'TopMenu', N'Forum', N'Index', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 4)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (5, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Links', N'TopMenu', N'Links', N'Index', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 5)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (6, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Chat', N'TopMenu', N'Chat', N'Index', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 6)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (7, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Store', N'TopMenu', N'Store', N'Index', NULL, NULL, 0, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 7)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (8, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Twitter', N'TopMenu', N'Twitter', N'Index', NULL, NULL, 0, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 8)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (9, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Home', N'LeftMenu', N'Home', N'Index', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 9)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (10, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Pictures', N'LeftMenu', N'Pictures', N'Index', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 10)
GO
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp], [SortOrder]) VALUES (11, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Videos', N'LeftMenu', N'Videos', N'Index', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.720' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Page] ON 

GO
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (1, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Home', N'/Home/Index', N'<p><span style=''font-size: medium;''><strong>Welcome to DigiOz .NET Portal!</strong></span></p>
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
<p>Visit us at <a href=''http://www.digioz.com''>www.digioz.com</a> for more information, or email us at <a href=''mailto:support@digioz.com''>support@digioz.com</a>. </p>', N'DigiOz .NET Portal, CMS, Portal, Web Portal, ASP.NET MVC', N'DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and C# which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.', 1, CAST(N'2018-04-30T20:20:24.720' AS DateTime))
GO
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (2, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'Contact', N'/Home/Contact', N'<h2>Contact</h2>
<h3>Below is our Contact Information:</h3>
<address>One Microsoft Way<br /> Redmond, WA 98052-6399<br /> <abbr title=''Phone''>P:</abbr> 425.555.0100</address><address><strong>Support:</strong> <a href=''mailto:Support@example.com''>Support@example.com</a><br /> <strong>Marketing:</strong> <a href=''mailto:Marketing@example.com''>Marketing@example.com</a></address>', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.767' AS DateTime))
GO
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (3, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'About', N'/Home/About', N'<h2>About</h2>
<h3>Some information about us:</h3>
<p>Use this area to provide additional information.</p>', NULL, NULL, 1, CAST(N'2018-04-30T20:20:24.767' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Page] OFF
GO
SET IDENTITY_INSERT [dbo].[Plugin] ON 

GO
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (1, N'Chat', NULL, 1)
GO
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (2, N'Store', NULL, 1)
GO
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (3, N'Twitter', NULL, 0)
GO
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (4, N'WhoIsOnline', NULL, 1)
GO
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (5, N'SlideShow', NULL, 0)
GO
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (6, N'Comments', NULL, 0)
GO
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (7, N'RSSFeed', NULL, 0)
GO
INSERT [dbo].[Plugin] ([Id], [Name], [DLL], [IsEnabled]) VALUES (1002, N'LatestPictures', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Plugin] OFF
GO

SET IDENTITY_INSERT [dbo].[Profile] ON 

GO
INSERT [dbo].[Profile] ([ID], [UserID], [Email], [Birthday], [BirthdayVisible], [Address], [Address2], [City], [State], [Zip], [Country], [Signature], [Avatar], [FirstName], [LastName]) VALUES (1, N'd1c447c1-b022-4c92-93e8-ab9aaea65224', N'webmaster@domain.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Profile] ([ID], [UserID], [Email], [Birthday], [BirthdayVisible], [Address], [Address2], [City], [State], [Zip], [Country], [Signature], [Avatar], [FirstName], [LastName]) VALUES (2, N'0e5f401f-3431-475e-925e-2dc9e74280c5', N'user1@mail.com', CAST(N'1975-07-24T00:00:00.000' AS DateTime), 1, N'1 Main Street', N'Ste 100', N'Chicago', N'IL', N'60601', N'USA', N'User One Some Company, Inc.', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Profile] OFF
GO

SET IDENTITY_INSERT [dbo].[Zone] ON 

GO
INSERT [dbo].[Zone] ([ID], [Name], [ZoneType]) VALUES (1, N'Top', N'Module')
GO
INSERT [dbo].[Zone] ([ID], [Name], [ZoneType]) VALUES (2, N'TopMenu', N'Menu')
GO
INSERT [dbo].[Zone] ([ID], [Name], [ZoneType]) VALUES (3, N'Left', N'Module')
GO
INSERT [dbo].[Zone] ([ID], [Name], [ZoneType]) VALUES (4, N'LeftMenu', N'Menu')
GO
INSERT [dbo].[Zone] ([ID], [Name], [ZoneType]) VALUES (5, N'BodyTop', N'Module')
GO
INSERT [dbo].[Zone] ([ID], [Name], [ZoneType]) VALUES (6, N'BodyBottom', N'Module')
GO
INSERT [dbo].[Zone] ([ID], [Name], [ZoneType]) VALUES (7, N'Bottom', N'Module')
GO
SET IDENTITY_INSERT [dbo].[Zone] OFF
GO
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
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Chat_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_dbo.Chat_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Link]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Link_dbo.LinkCategory_LinkCategoryID] FOREIGN KEY([LinkCategoryID])
REFERENCES [dbo].[LinkCategory] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Link] CHECK CONSTRAINT [FK_dbo.Link_dbo.LinkCategory_LinkCategoryID]
GO
ALTER TABLE [dbo].[MailingListCampaignRelation]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MailingListCampaignRelation_dbo.MailingList_MailingListID] FOREIGN KEY([MailingListID])
REFERENCES [dbo].[MailingList] ([ID])
GO
ALTER TABLE [dbo].[MailingListCampaignRelation] CHECK CONSTRAINT [FK_dbo.MailingListCampaignRelation_dbo.MailingList_MailingListID]
GO
ALTER TABLE [dbo].[MailingListCampaignRelation]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MailingListCampaignRelation_dbo.MailingListCampaign_MailingListCampaignID] FOREIGN KEY([MailingListCampaignID])
REFERENCES [dbo].[MailingListCampaign] ([ID])
GO
ALTER TABLE [dbo].[MailingListCampaignRelation] CHECK CONSTRAINT [FK_dbo.MailingListCampaignRelation_dbo.MailingListCampaign_MailingListCampaignID]
GO
ALTER TABLE [dbo].[MailingListSubscriberRelation]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MailingListSubscriberRelation_dbo.MailingList_MailingListID] FOREIGN KEY([MailingListID])
REFERENCES [dbo].[MailingList] ([ID])
GO
ALTER TABLE [dbo].[MailingListSubscriberRelation] CHECK CONSTRAINT [FK_dbo.MailingListSubscriberRelation_dbo.MailingList_MailingListID]
GO
ALTER TABLE [dbo].[MailingListSubscriberRelation]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MailingListSubscriberRelation_dbo.MailingListSubscriber_MailingListSubscriberID] FOREIGN KEY([MailingListSubscriberID])
REFERENCES [dbo].[MailingListSubscriber] ([ID])
GO
ALTER TABLE [dbo].[MailingListSubscriberRelation] CHECK CONSTRAINT [FK_dbo.MailingListSubscriberRelation_dbo.MailingListSubscriber_MailingListSubscriberID]
GO

ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menu_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_dbo.Menu_dbo.AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Module_dbo.AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_dbo.Module_dbo.AspNetUsers_UserID]
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
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.ProductCategory_ProductCategoryID] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.ProductCategory_ProductCategoryID]
GO
ALTER TABLE [dbo].[ProductOption]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductOption_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [FK_dbo.ProductOption_dbo.Product_ProductID]
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
