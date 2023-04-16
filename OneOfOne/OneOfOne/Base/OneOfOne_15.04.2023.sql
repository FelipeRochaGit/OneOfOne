
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
/****** Object:  Table [dbo].[ImagenesPorProducto]    Script Date: 15/04/2023 15:36:05 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 15/04/2023 15:36:05 ******/
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
	[Encolumnado] [varchar](10) NULL,
 CONSTRAINT [PK__Producto__3214EC07F5216F72] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Talle]    Script Date: 15/04/2023 15:36:05 ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 15/04/2023 15:36:05 ******/
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
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 15/04/2023 15:36:05 ******/
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

INSERT [dbo].[Producto] ([Id], [IdCategoria], [Descripcion], [Costo], [Precio], [FechaAlta], [FechaModificacion], [IdEstado], [ImgURL], [Encolumnado]) VALUES (1, 1, N'Buzo1', 5000, 25000, CAST(N'2023-04-01T15:06:12.460' AS DateTime), NULL, 1, N'Imagenes\buzo1.png', N'col-12')
INSERT [dbo].[Producto] ([Id], [IdCategoria], [Descripcion], [Costo], [Precio], [FechaAlta], [FechaModificacion], [IdEstado], [ImgURL], [Encolumnado]) VALUES (2, 2, N'Remera1', 2000, 10000, CAST(N'2023-04-01T15:28:52.407' AS DateTime), NULL, 1, N'Imagenes\remera1.png', N'col-6')
INSERT [dbo].[Producto] ([Id], [IdCategoria], [Descripcion], [Costo], [Precio], [FechaAlta], [FechaModificacion], [IdEstado], [ImgURL], [Encolumnado]) VALUES (3, 2, N'Remera2', 2000, 10000, CAST(N'2023-04-01T15:29:05.260' AS DateTime), NULL, 1, N'Imagenes\remera2.png', N'col-6')
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
/****** Object:  StoredProcedure [dbo].[FotosProducto_Obtener]    Script Date: 15/04/2023 15:36:05 ******/
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
/****** Object:  StoredProcedure [dbo].[Producto_Obtener]    Script Date: 15/04/2023 15:36:05 ******/
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
/****** Object:  StoredProcedure [dbo].[Productos_Listar]    Script Date: 15/04/2023 15:36:05 ******/
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
