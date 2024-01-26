<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductoDetalle.aspx.cs" Inherits="ecommerce_web.ProductoDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .col-6 {
            width: 40%; /* En pantallas pequeñas, ocupa el 100% del ancho */
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .mb-3 {
            margin-bottom: 15px;
            text-align: center;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 8px;
            overflow: hidden;
        }

        .card-img-top {
            width: 100%;
            height: auto;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .card-text {
            margin-bottom: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

            .btn-primary:hover {
                background-color: #0056b3;
            }

        .star {
            text-decoration: none;
            font-size: 25px;
            color: darkcyan;
            transition: color 0.3s;
        }

            .star:hover,
            .star.active {
                color: gold;
            }

        .imgDetalle {
            width: 100%; /* Asegura que la imagen se ajuste al ancho del contenedor */
            height: auto;
        }

        @media only screen and (max-width: 768px) {
            .col-6 {
                width: 100%; /* En pantallas pequeñas, ocupa el 100% del ancho */
                margin-bottom: 20px;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Detalle Producto</h1>

        <div class="row">
            <% foreach (dominio.Articulo articulo in ListaArticulos)
                { %>
            <div class="col-6">
                <div class="mb-3">
                    <div class="card">
                        <img src="<%: articulo.UrlImagen %>" class="card-img-top imgDetalle mx-auto d-block" alt=".." />
                        <div class="card-body">
                            <h5 class="card-title"><%: articulo.Nombre %></h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">Código: <%: articulo.Codigo %></p>
                            <p class="card-text">Descripcion: <%: articulo.Descripcion %></p>
                            <p class="card-text">Marca: <%: articulo.Marca.Descripcion %></p>
                            <p class="card-text">Categoria: <%: articulo.Categoria.Descripcion %></p>
                            <p class="card-text">Precio: $<%: articulo.Precio %></p>
                            <a href="Favoritos.aspx?id=<%: articulo.Id %>&usuario=<%: ObtenerIdUsuario() %>" class="star" title="Agregar a Favoritos!">★</a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <asp:Button ID="btnVolver" CssClass="btn btn-primary" OnClick="btnVolver_Click" runat="server" Text="Volver" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
