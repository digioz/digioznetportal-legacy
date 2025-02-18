CREATE TABLE [dbo].[Link] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100) NOT NULL,
    [URL]         NVARCHAR (MAX) NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Category]    NVARCHAR (100) NULL,
    [Visible]     BIT            NULL,
    [Timestamp]   DATETIME       NULL,
    CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED ([ID] ASC)
);

