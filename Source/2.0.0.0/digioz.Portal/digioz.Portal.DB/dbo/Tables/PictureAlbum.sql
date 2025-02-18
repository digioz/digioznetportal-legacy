CREATE TABLE [dbo].[PictureAlbum] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (255) NULL,
    [Timestamp]   DATETIME       NULL,
    [Visible]     BIT            NULL,
    CONSTRAINT [PK_PictureAlbum] PRIMARY KEY CLUSTERED ([ID] ASC)
);

