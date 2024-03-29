USE [master]
GO
/****** Object:  Database [OneOfOne]    Script Date: 21/8/2023 19:30:10 ******/
CREATE DATABASE [OneOfOne]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OneOfOne', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OneOfOne.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OneOfOne_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OneOfOne_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OneOfOne] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [OneOfOne] SET QUERY_STORE = OFF
GO
USE [OneOfOne]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 21/8/2023 19:30:10 ******/
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
/****** Object:  Table [dbo].[DatosPersonales]    Script Date: 21/8/2023 19:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatosPersonales](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[DniCuil] [varchar](50) NULL,
	[Celular] [varchar](20) NULL,
	[Mail] [varchar](20) NULL,
 CONSTRAINT [PK_DatosPersonales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Envio]    Script Date: 21/8/2023 19:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envio](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](100) NULL,
	[Altura] [varchar](20) NULL,
	[Piso] [varchar](20) NULL,
	[Departamento] [varchar](20) NULL,
	[CodigoPostal] [varchar](50) NULL,
	[Importe] [float] NULL,
	[Fecha] [datetime] NULL,
	[IdDatosPersonales] [bigint] NULL,
 CONSTRAINT [PK_Envio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagenesPorProducto]    Script Date: 21/8/2023 19:30:10 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 21/8/2023 19:30:10 ******/
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
/****** Object:  Table [dbo].[Talle]    Script Date: 21/8/2023 19:30:10 ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 21/8/2023 19:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ImporteTotal] [float] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdEnvio] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 21/8/2023 19:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[IdVenta] [bigint] NOT NULL,
	[Id] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[ImporteParcial] [float] NOT NULL,
	[IdEstadoVenta] [int] NOT NULL,
 CONSTRAINT [PK__VentaDet__7E6A32AC5B69C8A6] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Descripcion], [FechaAlta], [FechaModificacion], [IdEstado]) VALUES (1, N'Buzo', CAST(N'2023-04-01T14:59:27.047' AS DateTime), NULL, 1)
INSERT [dbo].[Categoria] ([Id], [Descripcion], [FechaAlta], [FechaModificacion], [IdEstado]) VALUES (2, N'Remera', CAST(N'2023-04-01T15:23:24.073' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[ImagenesPorProducto] ON 

INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (1, 1, N'Imagenes\buzo1.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (2, 1, N'Imagenes\buzo1.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (3, 1, N'Imagenes\buzo1.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (4, 1, N'Imagenes\buzo1.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (5, 2, N'Imagenes\remera1.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (6, 2, N'Imagenes\remera1.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (7, 2, N'Imagenes\remera1.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (8, 3, N'Imagenes\remera2.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (9, 3, N'Imagenes\remera2.png')
INSERT [dbo].[ImagenesPorProducto] ([id], [idProducto], [ImgUrl]) VALUES (10, 3, N'Imagenes\remera2.png')
SET IDENTITY_INSERT [dbo].[ImagenesPorProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [IdCategoria], [Descripcion], [Costo], [Precio], [FechaAlta], [FechaModificacion], [IdEstado], [ImgURL]) VALUES (1, 1, N'Buzo1', 5000, 25000, CAST(N'2023-04-01T15:06:12.460' AS DateTime), NULL, 1, N'Imagenes\buzo1.png')
INSERT [dbo].[Producto] ([Id], [IdCategoria], [Descripcion], [Costo], [Precio], [FechaAlta], [FechaModificacion], [IdEstado], [ImgURL]) VALUES (2, 2, N'Remera1', 2000, 10000, CAST(N'2023-04-01T15:28:52.407' AS DateTime), NULL, 1, N'Imagenes\remera1.png')
INSERT [dbo].[Producto] ([Id], [IdCategoria], [Descripcion], [Costo], [Precio], [FechaAlta], [FechaModificacion], [IdEstado], [ImgURL]) VALUES (3, 2, N'Remera2', 2000, 10000, CAST(N'2023-04-01T15:29:05.260' AS DateTime), NULL, 1, N'Imagenes\remera2.png')
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Talle] ON 

INSERT [dbo].[Talle] ([Id], [IdProducto], [Descripcion], [Stock], [FechaAlta], [FechaModificacion], [IdEstado]) VALUES (1, 1, N'1', 100, CAST(N'2023-04-01T15:04:09.660' AS DateTime), NULL, 1)
INSERT [dbo].[Talle] ([Id], [IdProducto], [Descripcion], [Stock], [FechaAlta], [FechaModificacion], [IdEstado]) VALUES (4, 1, N'2', 100, CAST(N'2023-04-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Talle] ([Id], [IdProducto], [Descripcion], [Stock], [FechaAlta], [FechaModificacion], [IdEstado]) VALUES (5, 2, N'1', 100, CAST(N'2023-04-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Talle] ([Id], [IdProducto], [Descripcion], [Stock], [FechaAlta], [FechaModificacion], [IdEstado]) VALUES (7, 2, N'2', 100, CAST(N'2023-04-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Talle] ([Id], [IdProducto], [Descripcion], [Stock], [FechaAlta], [FechaModificacion], [IdEstado]) VALUES (9, 3, N'1', 100, CAST(N'2023-04-01T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Talle] ([Id], [IdProducto], [Descripcion], [Stock], [FechaAlta], [FechaModificacion], [IdEstado]) VALUES (10, 3, N'2', 100, CAST(N'2023-04-01T00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Talle] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([Id], [ImporteTotal], [Fecha], [IdEnvio]) VALUES (9, 60000, CAST(N'2023-08-21T18:04:10.513' AS DateTime), NULL)
INSERT [dbo].[Venta] ([Id], [ImporteTotal], [Fecha], [IdEnvio]) VALUES (10, 10000, CAST(N'2023-08-21T18:04:26.720' AS DateTime), NULL)
INSERT [dbo].[Venta] ([Id], [ImporteTotal], [Fecha], [IdEnvio]) VALUES (11, 40000, CAST(N'2023-08-21T18:10:27.623' AS DateTime), NULL)
INSERT [dbo].[Venta] ([Id], [ImporteTotal], [Fecha], [IdEnvio]) VALUES (14, 510000, CAST(N'2023-08-21T19:00:12.470' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [Id], [IdProducto], [Cantidad], [ImporteParcial], [IdEstadoVenta]) VALUES (9, 1, 1, 2, 50000, 1)
INSERT [dbo].[VentaDetalle] ([IdVenta], [Id], [IdProducto], [Cantidad], [ImporteParcial], [IdEstadoVenta]) VALUES (9, 2, 2, 1, 10000, 1)
INSERT [dbo].[VentaDetalle] ([IdVenta], [Id], [IdProducto], [Cantidad], [ImporteParcial], [IdEstadoVenta]) VALUES (10, 1, 2, 1, 10000, 1)
INSERT [dbo].[VentaDetalle] ([IdVenta], [Id], [IdProducto], [Cantidad], [ImporteParcial], [IdEstadoVenta]) VALUES (11, 1, 3, 1, 10000, 1)
INSERT [dbo].[VentaDetalle] ([IdVenta], [Id], [IdProducto], [Cantidad], [ImporteParcial], [IdEstadoVenta]) VALUES (11, 2, 3, 3, 30000, 1)
INSERT [dbo].[VentaDetalle] ([IdVenta], [Id], [IdProducto], [Cantidad], [ImporteParcial], [IdEstadoVenta]) VALUES (14, 1, 2, 1, 10000, 1)
INSERT [dbo].[VentaDetalle] ([IdVenta], [Id], [IdProducto], [Cantidad], [ImporteParcial], [IdEstadoVenta]) VALUES (14, 2, 2, 50, 500000, 1)
GO
ALTER TABLE [dbo].[Envio]  WITH CHECK ADD  CONSTRAINT [FK_Envio_DatosPersonales] FOREIGN KEY([IdDatosPersonales])
REFERENCES [dbo].[DatosPersonales] ([Id])
GO
ALTER TABLE [dbo].[Envio] CHECK CONSTRAINT [FK_Envio_DatosPersonales]
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
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Envio] FOREIGN KEY([IdEnvio])
REFERENCES [dbo].[Envio] ([Id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Envio]
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
/****** Object:  StoredProcedure [dbo].[FotosProducto_Obtener]    Script Date: 21/8/2023 19:30:10 ******/
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
/****** Object:  StoredProcedure [dbo].[Producto_Obtener]    Script Date: 21/8/2023 19:30:10 ******/
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
/****** Object:  StoredProcedure [dbo].[Productos_Listar]    Script Date: 21/8/2023 19:30:10 ******/
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
/****** Object:  StoredProcedure [dbo].[Venta_Insert]    Script Date: 21/8/2023 19:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Venta_Insert](
@VentasDetalleXml xml 
)
--exec [Venta_Insert]
as

declare @IdVenta bigint, @ImporteTotal float
declare @idoc int

create table #tVentaDetalle (IdVenta bigint, Id bigint, IdProducto bigint, Cantidad int, ImporteParcial float, IdEstadoVenta int)

BEGIN

	BEGIN TRY

	EXEC sp_xml_preparedocument @idoc OUTPUT, @VentasDetalleXml --Inicia el puntero con la cabeza del multiarray xml.

	INSERT INTO #tVentaDetalle 
	(
		IdVenta,Id,IdProducto,Cantidad,ImporteParcial,IdEstadoVenta
	)
	SELECT 1, 1, Id, Cantidad, PrecioTotal, 1
	FROM OPENXML(@idoc, '/ds/dt',1) 
	WITH 
	( 
		Id bigint 'Id',
		Cantidad int 'Cantidad',
		PrecioTotal float 'PrecioTotal'
	)

	-------------------------------
	------INSERT VENTA-------------
	-------------------------------
	set @ImporteTotal = (SELECT SUM(ImporteParcial) FROM #tVentaDetalle)

	INSERT INTO Venta VALUES (@ImporteTotal, GETDATE(), NULL) --IdEnvio por ahora NULL

	set @IdVenta = @@IDENTITY

	-------------------------------
	------INSERT DETALLE-----------
	-------------------------------
	insert into VentaDetalle (Id, IdVenta, IdProducto, Cantidad, ImporteParcial, IdEstadoVenta)
	SELECT 
	ROW_NUMBER() OVER(ORDER BY Id),
	@IdVenta,
	t.IdProducto,
	t.Cantidad,
	t.ImporteParcial,
	1 --Hacer tabla estado
	FROM #tVentaDetalle t

	END try
	BEGIN CATCH
	
		ROLLBACK
		return;
	
	END CATCH;

drop table #tVentaDetalle

END
GO
USE [master]
GO
ALTER DATABASE [OneOfOne] SET  READ_WRITE 
GO
