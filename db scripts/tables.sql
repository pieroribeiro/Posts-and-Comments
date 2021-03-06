USE [DBPosts]
GO
/****** Object:  Table [dbo].[TBComments]    Script Date: 03/02/2019 19:11:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBComments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_post] [bigint] NOT NULL,
	[description] [varchar](1500) NOT NULL,
	[date] [datetime] NOT NULL,
	[id_user] [bigint] NOT NULL,
	[status] [char](1) NOT NULL,
 CONSTRAINT [PK_TBComments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBPosts]    Script Date: 03/02/2019 19:11:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBPosts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [char](1) NOT NULL,
 CONSTRAINT [PK_TBPosts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[TBComments] ADD  CONSTRAINT [DF_TBComments_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[TBComments] ADD  CONSTRAINT [DF_TBComments_status]  DEFAULT ('A') FOR [status]
GO
ALTER TABLE [dbo].[TBPosts] ADD  CONSTRAINT [DF_TBPosts_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[TBPosts] ADD  DEFAULT ('A') FOR [status]
GO
