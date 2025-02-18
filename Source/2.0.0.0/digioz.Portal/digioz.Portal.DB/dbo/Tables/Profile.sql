CREATE TABLE [dbo].[Profile] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [UserID]          NVARCHAR (128) NOT NULL,
    [Email]           NVARCHAR (255) NULL,
    [Birthday]        DATE           NULL,
    [BirthdayVisible] BIT            NULL,
    [Address]         NVARCHAR (255) NULL,
    [Address2]        NVARCHAR (255) NULL,
    [City]            NVARCHAR (50)  NULL,
    [State]           NVARCHAR (50)  NULL,
    [Zip]             NVARCHAR (20)  NULL,
    [Country]         NVARCHAR (50)  NULL,
    [Signature]       NVARCHAR (MAX) NULL,
    [Avatar]          NVARCHAR (128) NULL,
    CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Profile_AspNetUsers] FOREIGN KEY ([UserID]) REFERENCES [dbo].[AspNetUsers] ([Id])
);

