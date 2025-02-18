CREATE TABLE [dbo].[Menu] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [UserID]     NVARCHAR (128) NOT NULL,
    [Name]       NVARCHAR (100) NOT NULL,
    [Location]   NVARCHAR (20)  NOT NULL,
    [Controller] NVARCHAR (50)  NULL,
    [Action]     NVARCHAR (50)  NULL,
    [URL]        NVARCHAR (MAX) NULL,
    [Target]     NVARCHAR (20)  NULL,
    [Visible]    BIT            NOT NULL,
    [Timestamp]  DATETIME       NULL,
    CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Menu_AspNetUsers] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id])
);

