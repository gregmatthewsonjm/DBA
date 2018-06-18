CREATE TABLE [dbo].[Configurations]
(
[configuration_id] [int] NOT NULL,
[name] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[value] [sql_variant] NULL,
[minimum] [sql_variant] NULL,
[maximum] [sql_variant] NULL,
[value_in_use] [sql_variant] NULL,
[description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[is_dynamic] [bit] NOT NULL,
[is_advanced] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Configurations] ADD CONSTRAINT [PK_Configuration_Id] PRIMARY KEY CLUSTERED  ([configuration_id]) ON [PRIMARY]
GO
