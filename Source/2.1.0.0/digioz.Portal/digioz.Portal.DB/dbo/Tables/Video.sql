CREATE TABLE [dbo].[Video] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserID]      NVARCHAR (128) NULL,
    [AlbumID]     BIGINT         NULL,
    [Filename]    NVARCHAR (128) NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Timestamp]   DATETIME       NULL,
    [Approved]    BIT            NULL,
    [Visible]     BIT            NULL,
    [Thumbnail]   NVARCHAR (128) NULL,
    CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Video_AspNetUsers] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Video_VideoAlbum] FOREIGN KEY ([AlbumID]) REFERENCES [dbo].[VideoAlbum] ([ID])
);



