CREATE TABLE [dbo].[Page] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [UserID]      NVARCHAR (128) NOT NULL,
    [Title]       NVARCHAR (255) NOT NULL,
    [URL]         NVARCHAR (255) NOT NULL,
    [Body]        NVARCHAR (MAX) NULL,
    [Keywords]    NVARCHAR (MAX) NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Visible]     BIT            NOT NULL,
    [Timestamp]   DATETIME       NULL,
    CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Page_AspNetUsers] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id])
);

