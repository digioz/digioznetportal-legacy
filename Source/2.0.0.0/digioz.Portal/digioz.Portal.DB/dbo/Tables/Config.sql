CREATE TABLE [dbo].[Config] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [ConfigKey]   NVARCHAR (255) NULL,
    [ConfigValue] NVARCHAR (255) NULL,
    CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED ([ID] ASC)
);

