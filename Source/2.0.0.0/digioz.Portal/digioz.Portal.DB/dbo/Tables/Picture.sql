CREATE TABLE [dbo].[Picture] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserID]      NVARCHAR (128) NULL,
    [AlbumID]     BIGINT         NULL,
    [Filename]    NVARCHAR (128) NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Timestamp]   DATETIME       NULL,
    [Approved]    BIT            NULL,
    [Visible]     BIT            NULL,
    CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Picture_AspNetUsers] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Picture_PictureAlbum] FOREIGN KEY ([AlbumID]) REFERENCES [dbo].[PictureAlbum] ([ID])
);

