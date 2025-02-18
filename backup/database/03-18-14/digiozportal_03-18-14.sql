USE [digiozportal]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/18/2014 1:46:01 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/18/2014 1:46:01 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/18/2014 1:46:01 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/18/2014 1:46:01 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/18/2014 1:46:01 PM ******/
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigKey] [nvarchar](255) NULL,
	[ConfigValue] [nvarchar](255) NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Link]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Category] [nvarchar](100) NULL,
	[Visible] [bit] NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogVisitor]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogVisitor](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](20) NULL,
	[BrowserType] [nvarchar](max) NULL,
	[Language] [nvarchar](50) NULL,
	[IsBot] [bit] NULL,
	[Country] [nvarchar](50) NULL,
	[ReferringURL] [nvarchar](max) NULL,
	[SearchString] [nvarchar](255) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_LogVisitor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](20) NOT NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[URL] [nvarchar](max) NULL,
	[Target] [nvarchar](20) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[URL] [nvarchar](255) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Keywords] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Visible] [bit] NOT NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[AlbumID] [bigint] NULL,
	[Filename] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
	[Approved] [bit] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PictureAlbum]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureAlbum](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Timestamp] [datetime] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_PictureAlbum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profile]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Birthday] [date] NULL,
	[BirthdayVisible] [bit] NULL,
	[Address] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](20) NULL,
	[Country] [nvarchar](50) NULL,
	[Signature] [nvarchar](max) NULL,
	[Avatar] [nvarchar](128) NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[AlbumID] [bigint] NULL,
	[Filename] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Timestamp] [datetime] NULL,
	[Approved] [bit] NULL,
	[Visible] [bit] NULL,
	[Thumbnail] [nvarchar](128) NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoAlbum]    Script Date: 3/18/2014 1:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoAlbum](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Timestamp] [datetime] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_VideoAlbum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Announcement] ON 

INSERT [dbo].[Announcement] ([ID], [UserID], [Title], [Body], [Visible], [Timestamp]) VALUES (1, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Test Announcement 1', N'<p>This is a test Announcement changed w</p>', 1, CAST(0x0000A26300000000 AS DateTime))
INSERT [dbo].[Announcement] ([ID], [UserID], [Title], [Body], [Visible], [Timestamp]) VALUES (2, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Test Announcement 2', N'<p>Test Announcement 2 Body changed</p>', 1, CAST(0x0000A2A2002C4F74 AS DateTime))
SET IDENTITY_INSERT [dbo].[Announcement] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f6771cf0-9fcf-4cf4-8925-9ffb2234febc', N'Administrator')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'f6771cf0-9fcf-4cf4-8925-9ffb2234febc')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'admin', N'AB7Ve9Byy0eRSbjFZzoyC4D8mQ0MKuUwTEGlseYcWYNkr22iBbYXa3RiVNGGDe2NyQ==', N'0de200ac-bd09-403a-aaa0-3b9675a99cca', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'8e0a7d57-8f94-4f16-bacd-b5e224667c0d', N'user1', N'AFJ0p5RRggbVxKYn5QNT9UFPMSgZc8m6M7ySQ/BYRdhI23IoLNjO8SBao3E+vf/dsQ==', N'85af0c98-d46a-40f4-a59b-0fd27a990345', N'ApplicationUser')
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue]) VALUES (1, N'SMTPServer', N'mail.domain.com')
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue]) VALUES (2, N'SMTPUsername', N'webmaster@domain.com')
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue]) VALUES (3, N'SMTPPassword', N'password')
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue]) VALUES (4, N'SiteURL', N'http://localhost:3588')
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue]) VALUES (6, N'SiteName', N'DigiOz .NET Portal')
INSERT [dbo].[Config] ([ID], [ConfigKey], [ConfigValue]) VALUES (7, N'WebmasterEmail', N'webmaster@domain.com')
SET IDENTITY_INSERT [dbo].[Config] OFF
SET IDENTITY_INSERT [dbo].[Link] ON 

INSERT [dbo].[Link] ([ID], [Name], [URL], [Description], [Category], [Visible], [Timestamp]) VALUES (1, N'DigiOz Multimedia', N'http://www.digioz.com', N'DigiOz Multimedia Website', N'Programming', 1, CAST(0x0000A28A00000000 AS DateTime))
INSERT [dbo].[Link] ([ID], [Name], [URL], [Description], [Category], [Visible], [Timestamp]) VALUES (2, N'Test Link', N'http://www.test.com', N'<p>This is a test link!</p>', N'Other', 1, CAST(0x0000A2A2002C6D44 AS DateTime))
SET IDENTITY_INSERT [dbo].[Link] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (5, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Home', N'Top', N'Home', N'Index', NULL, NULL, 1, CAST(0x0000A26100000000 AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (6, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'About', N'Top', N'Home', N'About', NULL, NULL, 1, CAST(0x0000A26100000000 AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (7, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Contact', N'Top', N'Home', N'Contact', NULL, NULL, 1, CAST(0x0000A26100000000 AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (8, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Home', N'Left', N'Home', N'Index', NULL, NULL, 1, CAST(0x0000A26100000000 AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (2009, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Links', N'Left', N'Links', N'Index', NULL, N'_blank', 1, CAST(0x0000A2A2002BF93C AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (2010, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Pictures', N'Top', N'Pictures', N'Index', NULL, NULL, 1, CAST(0x0000A2CB00F00FE9 AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (2011, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Videos', N'Top', N'Videos', N'Index', NULL, NULL, 1, CAST(0x0000A2CB00F02B6B AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (2012, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Pictures', N'Left', N'Pictures', N'Index', NULL, NULL, 1, CAST(0x0000A2CB00F053C3 AS DateTime))
INSERT [dbo].[Menu] ([ID], [UserID], [Name], [Location], [Controller], [Action], [URL], [Target], [Visible], [Timestamp]) VALUES (2013, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Videos', N'Left', N'Videos', N'Index', NULL, NULL, 1, CAST(0x0000A2CB00F087AA AS DateTime))
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (3, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Home', N'/Home/Index', N'<p><span style="font-size: medium;"><strong>Welcome to DigiOz .NET Portal!</strong></span></p>
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
<li>Announcements section let''s you add, edit or remove site wide announcements to the users, which show up on the Home Index Page.</li>
<li>Picture Manager lets you create Picture Galleries, and add or remove pictures from the site.</li>
<li>Video Manager allows you to upload and display Videos to your site and manage them.</li>
<li>Link Manager allows you to create a links page to do link exchagne with other sites similar to yours.</li>
<li>Chat Manager lets you manage the Chat Database Table.</li>
</ul>
<p><strong><span style="font-size: medium;">About DigiOz Multimedia, Inc</span></strong></p>
<p><strong><span style="font-size: medium;"></span></strong>DigiOz Multimedia, Inc is a Chicago, Illinois USA based Software Development Company which provides web design for personal and business use, CRM, custom programming for web and PC, design database driven systems for clients, as well as business process modeling and consulting. We also have an active Open Source Community that provides many IT Systems and Web Portals as Open Source Products for Everyone to share and enjoy.</p>
<p>Visit us at <a href="http://www.digioz.com">www.digioz.com</a> for more information, or email us at <a href="mailto:support@digioz.com">support@digioz.com</a>. </p>', N'DigiOz .NET Portal, CMS, Portal, Web Portal, ASP.NET MVC', N'DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and C# which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.', 1, CAST(0x0000A26E00A4DE74 AS DateTime))
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (4, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'About', N'/Home/About', N'<h2>About</h2>
<h3>Some Information About Us</h3>
<p>Use this area to provide additional information.</p>', NULL, NULL, 1, CAST(0x0000A26E009FE4A1 AS DateTime))
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (5, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Contact', N'/Home/Contact', N'<h2>Contact</h2>
<h3>Below is our Contact Information:</h3>
<address>One Microsoft Way<br /> Redmond, WA 98052-6399<br /> <abbr title="Phone">P:</abbr> 425.555.0100</address><address><strong>Support:</strong> <a href="mailto:Support@example.com">Support@example.com</a><br /> <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a></address>', NULL, NULL, 1, CAST(0x0000A26E00A016D7 AS DateTime))
INSERT [dbo].[Page] ([ID], [UserID], [Title], [URL], [Body], [Keywords], [Description], [Visible], [Timestamp]) VALUES (6, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'Test Page', N'test-page', N'<p>This is the body of the <strong>Test</strong> Page 1.</p>', N'test, page,', N'This is a Test Page', 1, CAST(0x0000A2A2002B8138 AS DateTime))
SET IDENTITY_INSERT [dbo].[Page] OFF
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible]) VALUES (1, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'd0d9156f-3ecd-4ea7-8880-93b5d5237817.jpg', N'Picture 1', CAST(0x0000A2CA00DF99B1 AS DateTime), 1, 1)
INSERT [dbo].[Picture] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible]) VALUES (2, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'c1703689-8c50-45c9-b3fd-2f4c1894099e.jpg', N'Picture 2', CAST(0x0000A2CA00DFB5DE AS DateTime), 1, 1)
INSERT [dbo].[Picture] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible]) VALUES (3, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'a93b416f-1ef4-4afe-919e-839ebca3a629.jpg', N'Picture 3', CAST(0x0000A2CA00E0229B AS DateTime), 1, 1)
INSERT [dbo].[Picture] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible]) VALUES (4, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'3e368bcf-6fee-4833-bf16-c9e332ec159a.jpg', N'Picture 4', CAST(0x0000A2CA00E04D8A AS DateTime), 1, 1)
INSERT [dbo].[Picture] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible]) VALUES (5, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'1cd5da7a-1472-4862-b135-240f84c5f24a.jpg', N'Picture 5', CAST(0x0000A2CA00E08361 AS DateTime), 1, 1)
INSERT [dbo].[Picture] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible]) VALUES (6, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'aa5954f6-26d1-4621-81ae-5eecfe383684.jpg', N'Picture 6', CAST(0x0000A2CA00E0A7BF AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Picture] OFF
SET IDENTITY_INSERT [dbo].[PictureAlbum] ON 

INSERT [dbo].[PictureAlbum] ([ID], [Description], [Timestamp], [Visible]) VALUES (1, N'Album 1', CAST(0x0000A2CA00D10FCE AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PictureAlbum] OFF
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([ID], [UserID], [Email], [Birthday], [BirthdayVisible], [Address], [Address2], [City], [State], [Zip], [Country], [Signature], [Avatar]) VALUES (1, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', N'webmaster@domain.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Profile] ([ID], [UserID], [Email], [Birthday], [BirthdayVisible], [Address], [Address2], [City], [State], [Zip], [Country], [Signature], [Avatar]) VALUES (2, N'8e0a7d57-8f94-4f16-bacd-b5e224667c0d', N'user1@mail.com', CAST(0x07240B00 AS Date), 1, N'1 Main Street', N'Ste 100', N'Chicago', N'IL', N'60601', N'USA', N'User One
Some Company, Inc.', NULL)
SET IDENTITY_INSERT [dbo].[Profile] OFF
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible], [Thumbnail]) VALUES (3, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'02d3bbbb-5361-496a-88ce-047506c73df5.avi', N'Video 1', CAST(0x0000A2CA0129934E AS DateTime), 1, 1, N'b42d56de-4c50-48cc-bb89-3284a3114f60.jpg')
INSERT [dbo].[Video] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible], [Thumbnail]) VALUES (4, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'f7a89f15-978d-4bbb-a34f-2f32477152a0.avi', N'Video 2', CAST(0x0000A2CA012A3705 AS DateTime), 1, 1, N'927d8fec-8760-41c0-ace7-ba76be141759.jpg')
INSERT [dbo].[Video] ([ID], [UserID], [AlbumID], [Filename], [Description], [Timestamp], [Approved], [Visible], [Thumbnail]) VALUES (5, N'3b4a49c1-60e0-4e75-80ba-c853c8b3f912', 1, N'f511a075-0974-4ef0-8a6f-c0cec588a519.avi', N'Video 3', CAST(0x0000A2CB011D2358 AS DateTime), 1, 1, N'74bc23ea-8c26-4348-88ae-f6596aeb0000.jpg')
SET IDENTITY_INSERT [dbo].[Video] OFF
SET IDENTITY_INSERT [dbo].[VideoAlbum] ON 

INSERT [dbo].[VideoAlbum] ([ID], [Description], [Timestamp], [Visible]) VALUES (1, N'Video Album 1', CAST(0x0000A2CA0122553D AS DateTime), 1)
INSERT [dbo].[VideoAlbum] ([ID], [Description], [Timestamp], [Visible]) VALUES (2, N'Video Album 2', CAST(0x0000A2CB011D5ED6 AS DateTime), 1)
INSERT [dbo].[VideoAlbum] ([ID], [Description], [Timestamp], [Visible]) VALUES (3, N'Video Album 3', CAST(0x0000A2CB011D6BBE AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[VideoAlbum] OFF
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK_Announcement_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Announcement] CHECK CONSTRAINT [FK_Announcement_AspNetUsers]
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
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_AspNetUsers]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_AspNetUsers]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_AspNetUsers]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_PictureAlbum] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[PictureAlbum] ([ID])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_PictureAlbum]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_AspNetUsers]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_AspNetUsers]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_VideoAlbum] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[VideoAlbum] ([ID])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_VideoAlbum]
GO
