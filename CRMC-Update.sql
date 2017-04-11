USE [CRMC]
GO

sp_rename 'dbo.Configuration','dbo.ConfigurationBak';

/****** Object:  Table [dbo].[Configuration]    Script Date: 3/28/2017 9:49:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Configuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MinFontSize] [int] NOT NULL,
	[MaxFontSize] [int] NOT NULL,
	[KioskEntryTopMargin] [int] NOT NULL,
	[ScreenBottomMargin] [int] NOT NULL,
	[GeneralRotationDelay] [float] NOT NULL,
	[PriorityRotationDelay] [float] NOT NULL,
	[KioskDisplayRecycleCount] [int] NOT NULL,
	[Volume] [float] NOT NULL,
	[GrowAnimationDuration] [float] NOT NULL,
	[ShrinkAnimationDuration] [float] NOT NULL,
	[FallAnimationDurationTimeModifier] [float] NOT NULL,
	[ConfigurationMode] [int] NOT NULL,
	[Active] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.WallConfigurations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

