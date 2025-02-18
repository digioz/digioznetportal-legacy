CREATE TABLE [dbo].[Announcement] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [UserID]    NVARCHAR (128) NOT NULL,
    [Title]     NVARCHAR (255) NOT NULL,
    [Body]      NVARCHAR (MAX) NULL,
    [Visible]   BIT            NOT NULL,
    [Timestamp] DATETIME       NULL,
    CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Announcement_AspNetUsers] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id])
);

