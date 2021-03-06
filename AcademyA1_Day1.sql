USE [master]
GO
/****** Object:  Database [AcademyA.Libreria]    Script Date: 2/14/2022 2:36:31 PM ******/
CREATE DATABASE [AcademyA.Libreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AcademyA.Libreria', FILENAME = N'C:\Users\giada.pantalone\AcademyA.Libreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AcademyA.Libreria_log', FILENAME = N'C:\Users\giada.pantalone\AcademyA.Libreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AcademyA.Libreria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AcademyA.Libreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AcademyA.Libreria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET ARITHABORT OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AcademyA.Libreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AcademyA.Libreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AcademyA.Libreria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AcademyA.Libreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AcademyA.Libreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AcademyA.Libreria] SET  MULTI_USER 
GO
ALTER DATABASE [AcademyA.Libreria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AcademyA.Libreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AcademyA.Libreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AcademyA.Libreria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AcademyA.Libreria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AcademyA.Libreria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AcademyA.Libreria] SET QUERY_STORE = OFF
GO
USE [AcademyA.Libreria]
GO
/****** Object:  Table [dbo].[Autori]    Script Date: 2/14/2022 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Cognome] [nvarchar](50) NOT NULL,
	[AnnoDiNascita] [int] NOT NULL,
 CONSTRAINT [PK_Autori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibriConId]    Script Date: 2/14/2022 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibriConId](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](50) NOT NULL,
	[Trama] [nvarchar](max) NULL,
	[IdAutore] [int] NOT NULL,
	[IdCasaEditrice] [int] NOT NULL,
	[AnnoDiPubblicazione] [int] NOT NULL,
	[Prezzo] [float] NOT NULL,
	[IdGenere] [int] NOT NULL,
	[Quantita] [int] NOT NULL,
	[Audiolibro] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[LibriView]    Script Date: 2/14/2022 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LibriView] -- view e table possono avere lo stesso nome
as
SELECT libriConId.Titolo,
	  libriConId.Trama,
	  --libriConId.IdAutore,
	  Autore				=autori.Nome +''+ autori.Cognome,
	  --autori.Nome, 
	  --autori.Cognome,
	  --libriConId.IdCasaEditrice,
	 -- caseEditrici.Nome		as CasaEditrice,
	  libriConId.AnnoDiPubblicazione,
	  libriConId.Prezzo,
	  --libriConId.IdGenere,
	--  Genere				=generi.Descrizione,
	  libriConId.Quantita,
	  libriConId.Audiolibro
FROM dbo.LibriConId as libriConId
right JOIN dbo.Autori				as autori --= INNERJOIN =PRENDE UNO O + CAMPI 
	ON autori.Id=libriConId.IdAutore

--JOIN dbo.CaseEditrici as caseEditrici
--ON caseEditrici.Id=libriConId.IdCasaEditrice
--JOIN dbo.Generi as generi
--ON generi.Id=libriConId.IdGenere
GO
/****** Object:  Table [dbo].[CaseEditrici]    Script Date: 2/14/2022 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseEditrici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Sede] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CaseEditrici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generi]    Script Date: 2/14/2022 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Generi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lettere]    Script Date: 2/14/2022 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lettere](
	[Letter] [nvarchar](5) NOT NULL,
	[Num] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Numeri]    Script Date: 2/14/2022 2:36:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Numeri](
	[Num] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autori] ON 

INSERT [dbo].[Autori] ([Id], [Nome], [Cognome], [AnnoDiNascita]) VALUES (1, N'Luigi', N'Pirandello', 1867)
INSERT [dbo].[Autori] ([Id], [Nome], [Cognome], [AnnoDiNascita]) VALUES (2, N'Lev', N'Tolstoj', 1828)
INSERT [dbo].[Autori] ([Id], [Nome], [Cognome], [AnnoDiNascita]) VALUES (3, N'Tomasi', N'Di Lampedusa', 1896)
INSERT [dbo].[Autori] ([Id], [Nome], [Cognome], [AnnoDiNascita]) VALUES (4, N'Giada', N'Pantalone', 1994)
SET IDENTITY_INSERT [dbo].[Autori] OFF
GO
SET IDENTITY_INSERT [dbo].[CaseEditrici] ON 

INSERT [dbo].[CaseEditrici] ([Id], [Nome], [Sede]) VALUES (1, N'Feltrinelli', N'Roma')
INSERT [dbo].[CaseEditrici] ([Id], [Nome], [Sede]) VALUES (2, N'Mondadori', N'Milano')
INSERT [dbo].[CaseEditrici] ([Id], [Nome], [Sede]) VALUES (3, N'Giunti', N'Torino')
SET IDENTITY_INSERT [dbo].[CaseEditrici] OFF
GO
SET IDENTITY_INSERT [dbo].[Generi] ON 

INSERT [dbo].[Generi] ([Id], [Descrizione]) VALUES (1, N'Classico italiano')
INSERT [dbo].[Generi] ([Id], [Descrizione]) VALUES (2, N'Classico russo')
SET IDENTITY_INSERT [dbo].[Generi] OFF
GO
INSERT [dbo].[Lettere] ([Letter], [Num]) VALUES (N'a', 1)
INSERT [dbo].[Lettere] ([Letter], [Num]) VALUES (N'b', 2)
GO
SET IDENTITY_INSERT [dbo].[LibriConId] ON 

INSERT [dbo].[LibriConId] ([Id], [Titolo], [Trama], [IdAutore], [IdCasaEditrice], [AnnoDiPubblicazione], [Prezzo], [IdGenere], [Quantita], [Audiolibro]) VALUES (1, N'Uno, nessuno e centomila', N'Vitangelo Moscarda scopre di non conoscersi,  di non essere una persona, di indossare centomila maschere, una per ogni persona  che conosce e una anche per sé stesso. Vitangelo è uno, è tanti  e allo stesso tempo è nessuno.   Interviene allora la follia, unica via di scampo dalla tragicità   e la paradossalità della vita.', 1, 2, 2016, 24.76, 1, 100, 0)
INSERT [dbo].[LibriConId] ([Id], [Titolo], [Trama], [IdAutore], [IdCasaEditrice], [AnnoDiPubblicazione], [Prezzo], [IdGenere], [Quantita], [Audiolibro]) VALUES (2, N'Uno, nessuno e centomila', N'Vitangelo Moscarda scopre di non conoscersi,  di non essere una persona, di indossare centomila maschere, una per ogni persona  che conosce e una anche per sé stesso. Vitangelo è uno, è tanti  e allo stesso tempo è nessuno.   Interviene allora la follia, unica via di scampo dalla tragicità   e la paradossalità della vita.', 1, 2, 2016, 24.76, 1, 100, 0)
INSERT [dbo].[LibriConId] ([Id], [Titolo], [Trama], [IdAutore], [IdCasaEditrice], [AnnoDiPubblicazione], [Prezzo], [IdGenere], [Quantita], [Audiolibro]) VALUES (3, N'Il Gattopardo', N'---', 2, 3, 2018, 9.5, 1, 78, 0)
INSERT [dbo].[LibriConId] ([Id], [Titolo], [Trama], [IdAutore], [IdCasaEditrice], [AnnoDiPubblicazione], [Prezzo], [IdGenere], [Quantita], [Audiolibro]) VALUES (4, N'Il Gattopardo', N'---', 2, 3, 2018, 4.76, 1, 0, 1)
INSERT [dbo].[LibriConId] ([Id], [Titolo], [Trama], [IdAutore], [IdCasaEditrice], [AnnoDiPubblicazione], [Prezzo], [IdGenere], [Quantita], [Audiolibro]) VALUES (5, N'Anna Karenina', N'..........', 3, 2, 2000, 8.9, 2, 50, 1)
INSERT [dbo].[LibriConId] ([Id], [Titolo], [Trama], [IdAutore], [IdCasaEditrice], [AnnoDiPubblicazione], [Prezzo], [IdGenere], [Quantita], [Audiolibro]) VALUES (6, N'Anna Karenina', N'..........', 3, 2, 2000, 23.45, 2, 134, 0)
SET IDENTITY_INSERT [dbo].[LibriConId] OFF
GO
INSERT [dbo].[Numeri] ([Num]) VALUES (1)
INSERT [dbo].[Numeri] ([Num]) VALUES (2)
INSERT [dbo].[Numeri] ([Num]) VALUES (3)
INSERT [dbo].[Numeri] ([Num]) VALUES (4)
GO
ALTER TABLE [dbo].[LibriConId]  WITH CHECK ADD  CONSTRAINT [FK_LibriConId_Autori] FOREIGN KEY([IdAutore])
REFERENCES [dbo].[Autori] ([Id])
GO
ALTER TABLE [dbo].[LibriConId] CHECK CONSTRAINT [FK_LibriConId_Autori]
GO
ALTER TABLE [dbo].[LibriConId]  WITH CHECK ADD  CONSTRAINT [FK_LibriConId_CaseEditrici] FOREIGN KEY([IdCasaEditrice])
REFERENCES [dbo].[CaseEditrici] ([Id])
GO
ALTER TABLE [dbo].[LibriConId] CHECK CONSTRAINT [FK_LibriConId_CaseEditrici]
GO
ALTER TABLE [dbo].[LibriConId]  WITH CHECK ADD  CONSTRAINT [FK_LibriConId_Generi] FOREIGN KEY([IdGenere])
REFERENCES [dbo].[Generi] ([Id])
GO
ALTER TABLE [dbo].[LibriConId] CHECK CONSTRAINT [FK_LibriConId_Generi]
GO
USE [master]
GO
ALTER DATABASE [AcademyA.Libreria] SET  READ_WRITE 
GO
