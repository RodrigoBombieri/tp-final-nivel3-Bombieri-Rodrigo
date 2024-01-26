USE [CATALOGO_WEB_DB]
GO

/****** Object:  StoredProcedure [dbo].[storedListar]    Script Date: 26/1/2024 19:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER procedure [dbo].[storedListar] as

Select A.Id, Codigo, Nombre, A.Descripcion, M.Descripcion Marca, C.Descripcion Categoria, A.IdMarca, A.IdCategoria, ImagenUrl, Precio 
from ARTICULOS A, MARCAS M, CATEGORIAS C 
where A.IdMarca = M.Id and A.IdCategoria = C.Id
GO

