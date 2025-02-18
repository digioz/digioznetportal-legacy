CREATE TABLE [dbo].[VideoAlbum] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (255) NULL,
    [Timestamp]   DATETIME       NULL,
    [Visible]     BIT            NULL,
    CONSTRAINT [PK_VideoAlbum] PRIMARY KEY CLUSTERED ([ID] ASC)
);

