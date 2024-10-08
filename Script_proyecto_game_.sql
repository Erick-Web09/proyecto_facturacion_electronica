USE [master]
GO
/****** Object:  Database [proyecto_facturacion_game]    Script Date: 24/09/2024 20:19:17 ******/
CREATE DATABASE [proyecto_facturacion_game]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyecto_facturacion_game', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\proyecto_facturacion_game.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyecto_facturacion_game_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\proyecto_facturacion_game_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [proyecto_facturacion_game] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto_facturacion_game].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto_facturacion_game] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [proyecto_facturacion_game] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto_facturacion_game] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto_facturacion_game] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET  ENABLE_BROKER 
GO
ALTER DATABASE [proyecto_facturacion_game] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto_facturacion_game] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [proyecto_facturacion_game] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto_facturacion_game] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto_facturacion_game] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto_facturacion_game] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto_facturacion_game] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto_facturacion_game] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyecto_facturacion_game] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [proyecto_facturacion_game] SET QUERY_STORE = ON
GO
ALTER DATABASE [proyecto_facturacion_game] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [proyecto_facturacion_game]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 24/09/2024 20:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Dirección] [varchar](200) NULL,
	[Teléfono] [char](10) NULL,
	[Correo_Electrónico] [varchar](100) NULL,
	[Tipo_Cliente] [varchar](20) NULL,
	[Número_Identificación] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Venta]    Script Date: 24/09/2024 20:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_Venta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Venta] [int] NULL,
	[ID_Producto] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[Precio_Unitario] [decimal](10, 2) NOT NULL,
	[Subtotal]  AS ([Cantidad]*[Precio_Unitario]) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas_Electronicas]    Script Date: 24/09/2024 20:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas_Electronicas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Venta_FE] [int] NULL,
	[Fecha_Emisión] [datetime] NOT NULL,
	[Monto_Total] [decimal](10, 2) NOT NULL,
	[Estado_Factura] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 24/09/2024 20:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Producto_Inv] [int] NULL,
	[Fecha_Registro] [datetime] NOT NULL,
	[Stock_Disponible] [int] NOT NULL,
	[Última_Actualización] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 24/09/2024 20:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Producto] [varchar](100) NOT NULL,
	[Descripción] [text] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Categoría] [varchar](50) NOT NULL,
	[ID_Proveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 24/09/2024 20:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Dirección] [varchar](200) NULL,
	[Teléfono] [varchar](15) NULL,
	[Correo_Electrónico] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 24/09/2024 20:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NULL,
	[Fecha_Venta] [datetime] NOT NULL,
	[Monto_total] [decimal](10, 2) NOT NULL,
	[Estado_Venta] [varchar](10) NOT NULL,
	[Tipo_Venta] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detalles_Venta]  WITH CHECK ADD  CONSTRAINT [fk_idproducto_productos] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Productos] ([ID])
GO
ALTER TABLE [dbo].[Detalles_Venta] CHECK CONSTRAINT [fk_idproducto_productos]
GO
ALTER TABLE [dbo].[Detalles_Venta]  WITH CHECK ADD  CONSTRAINT [fk_idventa_ventas] FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Ventas] ([ID])
GO
ALTER TABLE [dbo].[Detalles_Venta] CHECK CONSTRAINT [fk_idventa_ventas]
GO
ALTER TABLE [dbo].[Facturas_Electronicas]  WITH CHECK ADD  CONSTRAINT [fk_idventafe_ventas] FOREIGN KEY([ID_Venta_FE])
REFERENCES [dbo].[Ventas] ([ID])
GO
ALTER TABLE [dbo].[Facturas_Electronicas] CHECK CONSTRAINT [fk_idventafe_ventas]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([ID_Producto_Inv])
REFERENCES [dbo].[Productos] ([ID])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [fk_idproveedor_proveedor] FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedor] ([ID])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [fk_idproveedor_proveedor]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID])
GO
USE [master]
GO
ALTER DATABASE [proyecto_facturacion_game] SET  READ_WRITE 
GO
