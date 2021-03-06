USE [master]
GO
/****** Object:  Database [GiadaPantalone.GestioneStrutture]    Script Date: 2/18/2022 3:31:52 PM ******/
CREATE DATABASE [GiadaPantalone.GestioneStrutture]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GiadaPantalone.GestioneStrutture', FILENAME = N'C:\Users\giada.pantalone\GiadaPantalone.GestioneStrutture.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GiadaPantalone.GestioneStrutture_log', FILENAME = N'C:\Users\giada.pantalone\GiadaPantalone.GestioneStrutture_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GiadaPantalone.GestioneStrutture].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET ARITHABORT OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET  MULTI_USER 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET QUERY_STORE = OFF
GO
USE [GiadaPantalone.GestioneStrutture]
GO
/****** Object:  Table [dbo].[Pernottamenti]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pernottamenti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomePernottamento] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Strutture]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Strutture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Citta] [nvarchar](50) NOT NULL,
	[Nazione] [nvarchar](50) NOT NULL,
	[IdTipoDiStruttura] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrutturePernottamenti]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrutturePernottamenti](
	[IdStruttura] [int] NOT NULL,
	[IdPernottamento] [int] NOT NULL,
	[CostoPerPersona] [float] NOT NULL,
 CONSTRAINT [PK_StrutturePernottamenti] PRIMARY KEY CLUSTERED 
(
	[IdStruttura] ASC,
	[IdPernottamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clienti]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clienti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Cognome] [nvarchar](50) NOT NULL,
	[DataDiNascita] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prenotazioni]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prenotazioni](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[DataCheckIn] [date] NOT NULL,
	[DataCheckOut] [date] NOT NULL,
	[NumeroPersone] [int] NOT NULL,
	[IdStruttura] [int] NOT NULL,
	[IdPernottamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PrenotazioniView]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PrenotazioniView]
as
select TipoDiPernottamento=pe.NomePernottamento,
		Cliente= c.Nome + ' ' + c.Cognome,
		Struttura=s.Nome,
		CheckIn =p.DataCheckIn,
		CheckOut=p.DataCheckOut,
		Persone=p.NumeroPersone,
		TOTALE =-DATEDIFF(day,p.DataCheckOut,p.DataCheckIn)*p.NumeroPersone*sp.CostoPerPersona
from dbo.Prenotazioni		as p
join dbo.Pernottamenti		as pe
on pe.Id=p.IdPernottamento 
join dbo.Clienti			as c
on c.Id=p.IdCliente
join dbo.Strutture			as s
on s.Id=p.IdStruttura
join dbo.StrutturePernottamenti as sp
on pe.Id=sp.IdPernottamento 
and s.Id=sp.IdStruttura
GO
/****** Object:  View [dbo].[GuadagnoPerStruttura]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GuadagnoPerStruttura]
as
select pv.Struttura,
		GUADAGNO =SUM(pv.TOTALE)
from dbo.PrenotazioniView		as pv
group by pv.Struttura
GO
/****** Object:  Table [dbo].[ServiziOfferti]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiziOfferti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeDelServizio] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StruttureServiziOfferti]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StruttureServiziOfferti](
	[IdStruttura] [int] NOT NULL,
	[IdServizioOfferto] [int] NOT NULL,
 CONSTRAINT [PK_StruttureServiziOfferti] PRIMARY KEY CLUSTERED 
(
	[IdStruttura] ASC,
	[IdServizioOfferto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDiStrutture]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDiStrutture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomeTipologia] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clienti] ON 

INSERT [dbo].[Clienti] ([Id], [Nome], [Cognome], [DataDiNascita]) VALUES (1, N'Giada', N'Pantalone', CAST(N'1994-01-13' AS Date))
INSERT [dbo].[Clienti] ([Id], [Nome], [Cognome], [DataDiNascita]) VALUES (2, N'Mario', N'Rossi', CAST(N'1979-03-03' AS Date))
SET IDENTITY_INSERT [dbo].[Clienti] OFF
GO
SET IDENTITY_INSERT [dbo].[Pernottamenti] ON 

INSERT [dbo].[Pernottamenti] ([Id], [NomePernottamento]) VALUES (1, N'Solo pernottamento')
INSERT [dbo].[Pernottamenti] ([Id], [NomePernottamento]) VALUES (2, N'Pernottamento e prima colazione')
INSERT [dbo].[Pernottamenti] ([Id], [NomePernottamento]) VALUES (3, N'Mezza pensione')
INSERT [dbo].[Pernottamenti] ([Id], [NomePernottamento]) VALUES (4, N'Pensione Completa')
SET IDENTITY_INSERT [dbo].[Pernottamenti] OFF
GO
SET IDENTITY_INSERT [dbo].[Prenotazioni] ON 

INSERT [dbo].[Prenotazioni] ([Id], [IdCliente], [DataCheckIn], [DataCheckOut], [NumeroPersone], [IdStruttura], [IdPernottamento]) VALUES (1, 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-05' AS Date), 2, 1, 1)
INSERT [dbo].[Prenotazioni] ([Id], [IdCliente], [DataCheckIn], [DataCheckOut], [NumeroPersone], [IdStruttura], [IdPernottamento]) VALUES (2, 2, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-15' AS Date), 3, 1, 1)
INSERT [dbo].[Prenotazioni] ([Id], [IdCliente], [DataCheckIn], [DataCheckOut], [NumeroPersone], [IdStruttura], [IdPernottamento]) VALUES (3, 2, CAST(N'2022-03-11' AS Date), CAST(N'2022-03-15' AS Date), 5, 3, 1)
INSERT [dbo].[Prenotazioni] ([Id], [IdCliente], [DataCheckIn], [DataCheckOut], [NumeroPersone], [IdStruttura], [IdPernottamento]) VALUES (4, 1, CAST(N'2022-03-12' AS Date), CAST(N'2022-03-15' AS Date), 4, 3, 2)
SET IDENTITY_INSERT [dbo].[Prenotazioni] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiziOfferti] ON 

INSERT [dbo].[ServiziOfferti] ([Id], [NomeDelServizio]) VALUES (1, N'Piscina')
INSERT [dbo].[ServiziOfferti] ([Id], [NomeDelServizio]) VALUES (2, N'Wifi')
INSERT [dbo].[ServiziOfferti] ([Id], [NomeDelServizio]) VALUES (3, N'Cassaforte')
INSERT [dbo].[ServiziOfferti] ([Id], [NomeDelServizio]) VALUES (4, N'Spa E Centro Benessere')
INSERT [dbo].[ServiziOfferti] ([Id], [NomeDelServizio]) VALUES (5, N'Animali Ammessi')
SET IDENTITY_INSERT [dbo].[ServiziOfferti] OFF
GO
SET IDENTITY_INSERT [dbo].[Strutture] ON 

INSERT [dbo].[Strutture] ([Id], [Nome], [Citta], [Nazione], [IdTipoDiStruttura]) VALUES (1, N'Il tempio', N'Roma', N'Italia', 2)
INSERT [dbo].[Strutture] ([Id], [Nome], [Citta], [Nazione], [IdTipoDiStruttura]) VALUES (2, N'Arion Athens Hotel', N'Atene', N'Grecia', 2)
INSERT [dbo].[Strutture] ([Id], [Nome], [Citta], [Nazione], [IdTipoDiStruttura]) VALUES (3, N'Agriturismo L''Erpice', N'Francavilla Al Mare', N'Italia', 1)
INSERT [dbo].[Strutture] ([Id], [Nome], [Citta], [Nazione], [IdTipoDiStruttura]) VALUES (4, N'Magna Sevilla', N'Siviglia', N'Spagna', 4)
INSERT [dbo].[Strutture] ([Id], [Nome], [Citta], [Nazione], [IdTipoDiStruttura]) VALUES (5, N'Villa Elly', N'Dubrovnik', N'Croazia', 3)
SET IDENTITY_INSERT [dbo].[Strutture] OFF
GO
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (1, 1, 52)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (1, 2, 67)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (1, 3, 99)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (1, 4, 139)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (2, 1, 29)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (2, 2, 36)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (3, 1, 15)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (3, 2, 19)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (3, 3, 38)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (4, 1, 51)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (5, 1, 22)
INSERT [dbo].[StrutturePernottamenti] ([IdStruttura], [IdPernottamento], [CostoPerPersona]) VALUES (5, 2, 30)
GO
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (1, 2)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (1, 3)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (1, 4)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (2, 1)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (2, 4)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (3, 1)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (3, 2)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (3, 5)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (4, 1)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (4, 5)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (5, 1)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (5, 2)
INSERT [dbo].[StruttureServiziOfferti] ([IdStruttura], [IdServizioOfferto]) VALUES (5, 3)
GO
SET IDENTITY_INSERT [dbo].[TipoDiStrutture] ON 

INSERT [dbo].[TipoDiStrutture] ([Id], [NomeTipologia]) VALUES (1, N'Agriturismo')
INSERT [dbo].[TipoDiStrutture] ([Id], [NomeTipologia]) VALUES (2, N'Hotel')
INSERT [dbo].[TipoDiStrutture] ([Id], [NomeTipologia]) VALUES (3, N'Casa vacanze')
INSERT [dbo].[TipoDiStrutture] ([Id], [NomeTipologia]) VALUES (4, N'Residence')
SET IDENTITY_INSERT [dbo].[TipoDiStrutture] OFF
GO
ALTER TABLE [dbo].[Prenotazioni]  WITH CHECK ADD  CONSTRAINT [FK_PrenotazioniCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clienti] ([Id])
GO
ALTER TABLE [dbo].[Prenotazioni] CHECK CONSTRAINT [FK_PrenotazioniCliente]
GO
ALTER TABLE [dbo].[Prenotazioni]  WITH CHECK ADD  CONSTRAINT [FK_PrenotazioniPern] FOREIGN KEY([IdPernottamento])
REFERENCES [dbo].[Pernottamenti] ([Id])
GO
ALTER TABLE [dbo].[Prenotazioni] CHECK CONSTRAINT [FK_PrenotazioniPern]
GO
ALTER TABLE [dbo].[Prenotazioni]  WITH CHECK ADD  CONSTRAINT [FK_PrenotazioniStrutture] FOREIGN KEY([IdStruttura])
REFERENCES [dbo].[Strutture] ([Id])
GO
ALTER TABLE [dbo].[Prenotazioni] CHECK CONSTRAINT [FK_PrenotazioniStrutture]
GO
ALTER TABLE [dbo].[Strutture]  WITH CHECK ADD  CONSTRAINT [FK_TpStruttura] FOREIGN KEY([IdTipoDiStruttura])
REFERENCES [dbo].[TipoDiStrutture] ([Id])
GO
ALTER TABLE [dbo].[Strutture] CHECK CONSTRAINT [FK_TpStruttura]
GO
ALTER TABLE [dbo].[StrutturePernottamenti]  WITH CHECK ADD FOREIGN KEY([IdPernottamento])
REFERENCES [dbo].[Pernottamenti] ([Id])
GO
ALTER TABLE [dbo].[StrutturePernottamenti]  WITH CHECK ADD FOREIGN KEY([IdStruttura])
REFERENCES [dbo].[Strutture] ([Id])
GO
ALTER TABLE [dbo].[StruttureServiziOfferti]  WITH CHECK ADD FOREIGN KEY([IdServizioOfferto])
REFERENCES [dbo].[ServiziOfferti] ([Id])
GO
ALTER TABLE [dbo].[StruttureServiziOfferti]  WITH CHECK ADD FOREIGN KEY([IdStruttura])
REFERENCES [dbo].[Strutture] ([Id])
GO
ALTER TABLE [dbo].[Prenotazioni]  WITH CHECK ADD  CONSTRAINT [CK_Data] CHECK  (([DataCheckOut]>[DataCheckIn]))
GO
ALTER TABLE [dbo].[Prenotazioni] CHECK CONSTRAINT [CK_Data]
GO
/****** Object:  StoredProcedure [dbo].[InserisciPrenotazioni]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserisciPrenotazioni]
@idC int, @dataIn date,@dataOut date,@n int,@idS int, @idP int
as
insert into dbo.Prenotazioni
values
( @idC,@dataIn,@dataOut,@n,@idS,@idP)
GO
/****** Object:  StoredProcedure [dbo].[StrutturePerServizio]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StrutturePerServizio]
@servizio nvarchar(50)
as

select  st.Nome,
		st.Citta,
		st.Nazione
		--ServiziOfferti				=s.NomeDelServizio
from dbo.Strutture						as st
join dbo.StruttureServiziOfferti		as so
on so.IdStruttura=st.Id
join dbo.ServiziOfferti					as s
on s.Id=so.IdServizioOfferto
where s.NomeDelServizio=@servizio
GO
/****** Object:  StoredProcedure [dbo].[StrutturePerTipo]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StrutturePerTipo]
@tipo nvarchar(50)
as
select s.Nome,
	   s.Citta,
	   s.Nazione
from dbo.Strutture				as s
join dbo.TipoDiStrutture		as ts
on s.IdTipoDiStruttura=ts.Id
where ts.NomeTipologia=@tipo
GO
/****** Object:  StoredProcedure [dbo].[StrutturePerTipoPernottamento]    Script Date: 2/18/2022 3:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StrutturePerTipoPernottamento]
@pern nvarchar (50)
as
select s.Nome,
	   s.Citta,
	   s.Nazione
from dbo.Strutture				AS s
join dbo.StrutturePernottamenti	as sp
on s.Id=sp.IdStruttura
join dbo.Pernottamenti			as p
on p.Id =sp.IdPernottamento
where p.NomePernottamento=@pern
GO
USE [master]
GO
ALTER DATABASE [GiadaPantalone.GestioneStrutture] SET  READ_WRITE 
GO
