USE [CATALOGO_WEB_DB]
GO

/****** Object:  StoredProcedure [dbo].[storedModificarArticulo]    Script Date: 26/1/2024 19:42:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER procedure [dbo].[storedModificarArticulo] 
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(50),
@idMarca int,
@idCategoria int,
@imagen varchar(1000),
@precio decimal,
@id int
as
Update ARTICULOS set Codigo = @codigo, Nombre = @nombre, Descripcion = @descripcion, IdMarca = @idMarca, 
IdCategoria = @idCategoria, ImagenUrl = @imagen, Precio = @precio
Where Id = @id
GO

