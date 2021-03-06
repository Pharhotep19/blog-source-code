USE [sqltocb]
GO
/****** Object:  Table [dbo].[FriendBookUpdates]    Script Date: 4/7/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- tag::Excerpt[]
CREATE TABLE [dbo].[FriendBookUpdates](
	[Id] [uniqueidentifier] NOT NULL,
	[PostedDate] [datetime] NOT NULL,
	[Body] [nvarchar](256) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FriendBookUpdates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
-- end::Excerpt[]
/****** Object:  Table [dbo].[FriendBookUsers]    Script Date: 4/7/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendBookUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FriendBookUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FriendBookUsersFriends]    Script Date: 4/7/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendBookUsersFriends](
	[UserId] [uniqueidentifier] NOT NULL,
	[FriendUserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FriendBookUsersFriends] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[FriendUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 4/7/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[Id] [uniqueidentifier] NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoppingCartItems]    Script Date: 4/7/2017 3:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItems](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ShoppingCartId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ShoppingCartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FriendBookUsers] ADD  CONSTRAINT [DF_FriendBookUser_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ShoppingCart] ADD  CONSTRAINT [DF_ShoppingCart_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ShoppingCartItems] ADD  CONSTRAINT [DF_ShoppingCartItems_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[FriendBookUpdates]  WITH CHECK ADD  CONSTRAINT [FK_FriendBookUpdates_FriendBookUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[FriendBookUsers] ([Id])
GO
ALTER TABLE [dbo].[FriendBookUpdates] CHECK CONSTRAINT [FK_FriendBookUpdates_FriendBookUsers]
GO
ALTER TABLE [dbo].[FriendBookUsersFriends]  WITH CHECK ADD  CONSTRAINT [FK_FriendBookUsersFriends_FriendBookUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[FriendBookUsers] ([Id])
GO
ALTER TABLE [dbo].[FriendBookUsersFriends] CHECK CONSTRAINT [FK_FriendBookUsersFriends_FriendBookUsers]
GO
ALTER TABLE [dbo].[FriendBookUsersFriends]  WITH CHECK ADD  CONSTRAINT [FK_FriendBookUsersFriends_FriendBookUsers1] FOREIGN KEY([UserId])
REFERENCES [dbo].[FriendBookUsers] ([Id])
GO
ALTER TABLE [dbo].[FriendBookUsersFriends] CHECK CONSTRAINT [FK_FriendBookUsersFriends_FriendBookUsers1]
GO
ALTER TABLE [dbo].[ShoppingCartItems]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCartItems_ShoppingCart] FOREIGN KEY([ShoppingCartId])
REFERENCES [dbo].[ShoppingCart] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCartItems] CHECK CONSTRAINT [FK_ShoppingCartItems_ShoppingCart]
GO
