USE [CATALOGO_WEB_DB]
GO

/****** Object:  StoredProcedure [dbo].[storedAltaArticulo]    Script Date: 26/1/2024 19:41:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER procedure [dbo].[storedAltaArticulo] 
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(50),
@idMarca int,
@idCategoria int,
@imagen varchar(1000),
@precio decimal
as
insert into ARTICULOS values (@codigo, @nombre, @descripcion, @idMarca, @idCategoria, @imagen, @precio) 
GO

