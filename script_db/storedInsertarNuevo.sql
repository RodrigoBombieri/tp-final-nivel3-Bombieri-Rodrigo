USE [CATALOGO_WEB_DB]
GO

/****** Object:  StoredProcedure [dbo].[storedInsertarNuevo]    Script Date: 26/1/2024 19:41:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER procedure [dbo].[storedInsertarNuevo] 
@email varchar(100),
@pass varchar(20)
as
insert into USERS (email, pass, admin) output inserted.id values (@email, @pass, 0)
GO

