USE [digioz_portal]
GO
/****** Object:  StoredProcedure [dbo].[spActivateUser]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActivateUser] 
	@in_id BIGINT,
	@in_token VARCHAR(50)
AS
BEGIN
	UPDATE tblusers SET [is_active]=1 WHERE [id]=@in_id AND [token]=@in_token;
END

GO
/****** Object:  StoredProcedure [dbo].[spAddLogEntry]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddLogEntry] 
	@in_log TEXT
AS
BEGIN
	INSERT INTO tbllogs ([log]) VALUES (@in_log);
END

GO
/****** Object:  StoredProcedure [dbo].[spDoesEmailExist]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDoesEmailExist] 
	@in_email varchar(50)
AS
BEGIN
	SELECT * FROM tblprofile WHERE [email]=@in_email;
END

GO
/****** Object:  StoredProcedure [dbo].[spDoesUserExist]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDoesUserExist] 
	@in_username varchar(50)
AS
BEGIN
	SELECT * FROM tblusers WHERE [username]=@in_username;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsers]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllUsers] 
AS
BEGIN
	SELECT * FROM tblusers;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetIPs]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetIPs] 
	@in_user_id bigint
AS
BEGIN
	SELECT * FROM tbliplog WHERE [user_id]=@in_user_id;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetIPsByUserID]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetIPsByUserID] 
	@in_user_id bigint
AS
BEGIN
	SELECT * FROM tbliplog WHERE [user_id] = @in_user_id;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetMenu]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetMenu] 
	@in_menutype varchar(20)
AS
BEGIN
	SELECT * FROM tblmenu WHERE [menutype] = @in_menutype;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetUserById]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserById] 
	@in_id BIGINT
AS
BEGIN
	SELECT * FROM tblusers where [id]=@in_id;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetUserIDFromUsername]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserIDFromUsername] 
	@in_username varchar(50)
AS
BEGIN
	SELECT [id] FROM tblusers WHERE [username] = @in_username;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetUsernameAndPassword]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUsernameAndPassword] 
	@in_username VARCHAR(50)
AS
BEGIN
	SELECT * FROM tblusers
	WHERE [username] = @in_username;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetUserProfile]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserProfile] 
	@in_username VARCHAR(50)
AS
BEGIN
	SELECT u.username, p.* FROM tblusers u, tblprofile p WHERE u.id = p.id AND u.username = @in_username;
END

GO
/****** Object:  StoredProcedure [dbo].[spInsertIP]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertIP] 
	@in_user_id bigint,
	@in_ip_address varchar(20)
AS
BEGIN
	INSERT INTO tbliplog ([user_id], [ip_address]) 
	VALUES (@in_user_id, @in_ip_address);
END

GO
/****** Object:  StoredProcedure [dbo].[spIsUserAdmin]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIsUserAdmin]
	@in_username varchar(50)
AS
BEGIN
	SELECT * FROM tblusers WHERE [username]=@in_username AND is_admin=1;
END

GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegisterUser] 
	@in_username VARCHAR(50),
	@in_password VARCHAR(100),
	@in_token VARCHAR(50),
	@in_fname VARCHAR(50),
	@in_lname VARCHAR(50),
	@in_email VARCHAR(100)
AS
BEGIN
	INSERT INTO tblusers ([username],[password],[token])
			  VALUES (@in_username, @in_password, @in_token);

	INSERT INTO tblprofile ([user_id],[fname],[lname],[email])
				VALUES (@@IDENTITY, @in_fname, @in_lname, @in_email);

	SELECT [id] FROM tblusers WHERE [username]=@in_username;
END

GO
/****** Object:  StoredProcedure [dbo].[spSaveUserProfile]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSaveUserProfile] 
	  @in_username VARCHAR(50),
	  @in_password VARCHAR(100),
	  @in_fname VARCHAR(50),
	  @in_lname VARCHAR(50),
	  @in_address VARCHAR(100),
	  @in_address2 VARCHAR(100),
	  @in_city VARCHAR(50),
	  @in_state VARCHAR(20),
	  @in_zip VARCHAR(10),
	  @in_country VARCHAR(30),
	  @in_email VARCHAR(100),
	  @in_email2 VARCHAR(100),
	  @in_website VARCHAR(255),
	  @in_twitter VARCHAR(50),
	  @in_facebook VARCHAR(255),
	  @in_phone VARCHAR(50)
AS
BEGIN
	DECLARE @var_id BIGINT;
	SET @var_id = (SELECT [id] FROM tblusers WHERE [username]=@in_username);

	UPDATE tblprofile SET
			[fname] = @in_fname,
			[lname] = @in_lname,
			[address] = @in_address,
			[address2] = @in_address2,
			[city] = @in_city,
			[state] = @in_state,
			[zip] = @in_zip,
			[country] = @in_country,
			[email] = @in_email,
			[email2] = @in_email2,
			[website] = @in_website,
			[twitter] = @in_twitter,
			[facebook] = @in_facebook,
			[phone] = @in_phone
	WHERE [user_id] = @var_id;

	IF @in_password <> ''
	BEGIN
		UPDATE tblusers SET [password]=@in_password WHERE [username]=@in_username;
	END;
END

GO
/****** Object:  StoredProcedure [dbo].[spUpdateUser]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateUser] 
	@in_id BIGINT,
	@in_isactive int,
	@in_isadmin int
AS
BEGIN
	UPDATE tblusers 
	SET [is_admin]=@in_isadmin, [is_active]=@in_isactive  
	WHERE [id]=@in_id;
END

GO
/****** Object:  Table [dbo].[tbliplog]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbliplog](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[ip_address] [varchar](20) NULL,
	[timestamp] [datetime] NULL,
 CONSTRAINT [PK_tbliplog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbllogs]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbllogs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[log] [text] NULL,
	[timestamp] [datetime] NULL,
 CONSTRAINT [PK_tbllogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblmenu]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblmenu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[linktext] [varchar](50) NOT NULL,
	[actionname] [varchar](50) NULL,
	[actioncontroller] [varchar](50) NULL,
	[linkurl] [text] NULL,
	[menutype] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblmenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblprofile]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblprofile](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](20) NULL,
	[zip] [varchar](10) NULL,
	[country] [varchar](30) NULL,
	[email] [varchar](100) NULL,
	[email2] [varchar](100) NULL,
	[website] [varchar](255) NULL,
	[twitter] [varchar](50) NULL,
	[facebook] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[timestamp] [datetime] NULL,
 CONSTRAINT [PK_tblprofile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblusers]    Script Date: 10/20/2013 7:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblusers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[token] [varchar](50) NULL,
	[is_active] [int] NULL,
	[is_admin] [int] NULL,
	[timestamp] [datetime] NULL,
 CONSTRAINT [PK_tblusers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbliplog] ON 

GO
INSERT [dbo].[tbliplog] ([id], [user_id], [ip_address], [timestamp]) VALUES (1, 1, N'::1', CAST(0x0000A17F0089421A AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbliplog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblmenu] ON 

GO
INSERT [dbo].[tblmenu] ([id], [linktext], [actionname], [actioncontroller], [linkurl], [menutype]) VALUES (1, N'Home', N'Index', N'Home', NULL, N'top')
GO
SET IDENTITY_INSERT [dbo].[tblmenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tblprofile] ON 

GO
INSERT [dbo].[tblprofile] ([id], [user_id], [fname], [lname], [address], [address2], [city], [state], [zip], [country], [email], [email2], [website], [twitter], [facebook], [phone], [timestamp]) VALUES (1, 1, N'Admin', N'User', N'', N'', N'', N'', N'', N'', N'digioz@gmail.com', N'', N'', N'', N'', N'', CAST(0x0000A14700F6FF78 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblprofile] OFF
GO
SET IDENTITY_INSERT [dbo].[tblusers] ON 

GO
INSERT [dbo].[tblusers] ([id], [username], [password], [token], [is_active], [is_admin], [timestamp]) VALUES (1, N'admin', N'k9wP3fo9zDWmSt3l0nY1Hw==', N'253E2D1F-F454-454E-BF99-B53229BCCC3B', 1, 1, CAST(0x0000A14700F6FF72 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblusers] OFF
GO
ALTER TABLE [dbo].[tbliplog] ADD  CONSTRAINT [DF_tbliplog_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[tbllogs] ADD  CONSTRAINT [DF_tbllogs_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[tblprofile] ADD  CONSTRAINT [DF_tblprofile_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[tblusers] ADD  CONSTRAINT [DF_tblusers_is_active]  DEFAULT ((0)) FOR [is_active]
GO
ALTER TABLE [dbo].[tblusers] ADD  CONSTRAINT [DF_tblusers_is_admin]  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[tblusers] ADD  CONSTRAINT [DF_tblusers_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[tbliplog]  WITH CHECK ADD  CONSTRAINT [FK_tbliplog_tblusers] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblusers] ([id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tbliplog] CHECK CONSTRAINT [FK_tbliplog_tblusers]
GO
ALTER TABLE [dbo].[tblprofile]  WITH NOCHECK ADD  CONSTRAINT [FK_tblprofile_tblusers] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblusers] ([id])
ON UPDATE SET NULL
ON DELETE SET NULL
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tblprofile] CHECK CONSTRAINT [FK_tblprofile_tblusers]
GO
