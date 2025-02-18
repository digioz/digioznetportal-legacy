CREATE TABLE [dbo].[LogVisitor] (
    [ID]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [IPAddress]    NVARCHAR (20)  NULL,
    [BrowserType]  NVARCHAR (MAX) NULL,
    [Language]     NVARCHAR (50)  NULL,
    [IsBot]        BIT            NULL,
    [Country]      NVARCHAR (50)  NULL,
    [ReferringURL] NVARCHAR (MAX) NULL,
    [SearchString] NVARCHAR (255) NULL,
    [Timestamp]    DATETIME       NULL,
    CONSTRAINT [PK_LogVisitor] PRIMARY KEY CLUSTERED ([ID] ASC)
);

