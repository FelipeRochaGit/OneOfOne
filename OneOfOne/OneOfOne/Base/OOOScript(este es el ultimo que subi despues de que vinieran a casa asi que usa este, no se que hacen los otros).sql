USE [master]
GO
/****** Object:  Database [OneOfOne]    Script Date: 20/8/2023 00:03:49 ******/
CREATE DATABASE [OneOfOne]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OneOfOne', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OneOfOne.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OneOfOne_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OneOfOne_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OneOfOne] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OneOfOne].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OneOfOne] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OneOfOne] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OneOfOne] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OneOfOne] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OneOfOne] SET ARITHABORT OFF 
GO
ALTER DATABASE [OneOfOne] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OneOfOne] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OneOfOne] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OneOfOne] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OneOfOne] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OneOfOne] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OneOfOne] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OneOfOne] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OneOfOne] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OneOfOne] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OneOfOne] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OneOfOne] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OneOfOne] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OneOfOne] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OneOfOne] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OneOfOne] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OneOfOne] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OneOfOne] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OneOfOne] SET  MULTI_USER 
GO
ALTER DATABASE [OneOfOne] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OneOfOne] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OneOfOne] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OneOfOne] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OneOfOne] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OneOfOne] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OneOfOne] SET QUERY_STORE = ON
GO
ALTER DATABASE [OneOfOne] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OneOfOne]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[IdEstado] [int] NOT NULL,
 CONSTRAINT [PK__Categori__3214EC07215EAD78] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagenesPorProducto]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenesPorProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [bigint] NULL,
	[ImgUrl] [varchar](100) NULL,
 CONSTRAINT [PK__Imagenes__3213E83F8AEA8CC0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailSuscripciones]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailSuscripciones](
	[email] [nvarchar](100) NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_MailSuscripciones] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Costo] [float] NOT NULL,
	[Precio] [float] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[IdEstado] [int] NOT NULL,
	[ImgURL] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Producto__3214EC07F5216F72] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Talle]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Talle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdProducto] [bigint] NULL,
	[Descripcion] [varchar](10) NOT NULL,
	[Stock] [int] NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
	[IdEstado] [int] NOT NULL,
 CONSTRAINT [PK__Producto__3214EC07C16B7010] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ImporteTotal] [float] NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[IdVenta] [bigint] NOT NULL,
	[IdVentaDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[ImporteParcial] [float] NOT NULL,
	[IdEstadoVenta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC,
	[IdVentaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImagenesPorProducto]  WITH CHECK ADD  CONSTRAINT [FK_ImagenesPorProducto_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[ImagenesPorProducto] CHECK CONSTRAINT [FK_ImagenesPorProducto_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Talle]  WITH CHECK ADD  CONSTRAINT [FK_Talle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[Talle] CHECK CONSTRAINT [FK_Talle_Producto]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Producto]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([Id])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Venta]
GO
/****** Object:  StoredProcedure [dbo].[FotosProducto_Obtener]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FotosProducto_Obtener](
@idProducto bigint
)
as
BEGIN
select * from ImagenesPorProducto where idProducto=@idProducto
END

GO
/****** Object:  StoredProcedure [dbo].[Mail_Suscribir]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Mail_Suscribir]
@email nvarchar(100)
as
begin
if not exists(select email from MailSuscripciones where email = @email)
begin
insert into MailSuscripciones values (@email, 1)
select 'ok'
end
else
begin
select 'error'
end
end
GO
/****** Object:  StoredProcedure [dbo].[Producto_Obtener]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Producto_Obtener](
@IdProducto bigint
)

as

BEGIN
	
	select 
	p.Id,
	p.Descripcion,
	p.Precio,
	p.ImgURL,
	c.Id as IdCategoria,
	c.Descripcion as DescripcionCategoria,
	t.Descripcion as Talle,
	t.Stock
	from Producto p
	inner join Categoria c
	on c.id = p.IdCategoria
	inner join Talle t
	on p.Id = t.IdProducto

	where p.id = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[Productos_Listar]    Script Date: 20/8/2023 00:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec Productos_Listar

CREATE proc [dbo].[Productos_Listar] 
as

BEGIN
	select * from Producto 
END


GO
USE [master]
GO
ALTER DATABASE [OneOfOne] SET  READ_WRITE 
GO
