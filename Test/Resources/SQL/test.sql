USE [Test]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 27.06.2022 1:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 27.06.2022 1:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
	[IDGenre] [int] NOT NULL,
	[IDAuthor] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 27.06.2022 1:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27.06.2022 1:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([ID], [Surname], [FirstName], [Patronymic]) VALUES (1, N'Пушкин', N'Александр', N'Сергеевич')
INSERT [dbo].[Author] ([ID], [Surname], [FirstName], [Patronymic]) VALUES (2, N'Толстой', N'Лев', N'Николаевич')
INSERT [dbo].[Author] ([ID], [Surname], [FirstName], [Patronymic]) VALUES (3, N'Гоголь', N'Николай', N'Васильевич')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [Name], [Date], [IDGenre], [IDAuthor]) VALUES (1, N'Борис Годунов', CAST(N'1869-01-01T00:00:00.000' AS DateTime), 11, 1)
INSERT [dbo].[Book] ([ID], [Name], [Date], [IDGenre], [IDAuthor]) VALUES (2, N'Пиковая дама', CAST(N'1834-01-01T00:00:00.000' AS DateTime), 12, 1)
INSERT [dbo].[Book] ([ID], [Name], [Date], [IDGenre], [IDAuthor]) VALUES (3, N'Капитанская дочка', CAST(N'1836-01-01T00:00:00.000' AS DateTime), 6, 1)
INSERT [dbo].[Book] ([ID], [Name], [Date], [IDGenre], [IDAuthor]) VALUES (4, N'Война и мир', CAST(N'1869-01-01T00:00:00.000' AS DateTime), 6, 2)
INSERT [dbo].[Book] ([ID], [Name], [Date], [IDGenre], [IDAuthor]) VALUES (5, N'Анна Каренина', CAST(N'1877-01-01T00:00:00.000' AS DateTime), 6, 2)
INSERT [dbo].[Book] ([ID], [Name], [Date], [IDGenre], [IDAuthor]) VALUES (6, N'Мертвые души', CAST(N'1842-01-01T00:00:00.000' AS DateTime), 13, 3)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([ID], [Title]) VALUES (1, N'Детектив')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (2, N'Фантастика')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (3, N'Приключения')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (4, N'Фольклор')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (5, N'Проза')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (6, N'Роман')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (7, N'Документальная литература')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (8, N'Религиозная литература')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (9, N'Учебная книга')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (10, N'Документальная литература')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (11, N'Драма')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (12, N'Повесть')
INSERT [dbo].[Genre] ([ID], [Title]) VALUES (13, N'Поэма')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Login], [Password]) VALUES (1, N'1', N'1')
INSERT [dbo].[User] ([ID], [Login], [Password]) VALUES (2, N'2', N'2')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([IDAuthor])
REFERENCES [dbo].[Author] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Genre] FOREIGN KEY([IDGenre])
REFERENCES [dbo].[Genre] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Genre]
GO
