<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductosLista.aspx.cs" Inherits="ecommerce_web.PoductosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .col-6 {
            width: 100%; /* En pantallas pequeñas, ocupa el 100% del ancho */
            margin-bottom: 20px;
        }

        .mb-3 {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

            .table th,
            .table td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
            }

            .table th {
                background-color: #007bff;
                color: #fff;
            }

            .table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

        .btn-accion {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }

            .btn-accion:hover {
                background-color: #218838;
            }

        .btn-nuevo {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            display: inline-block;
        }

            .btn-nuevo:hover {
                background-color: #0056b3;
            }

        @media only screen and (max-width: 768px) {
            .col-6 {
                width: 100%; /* En pantallas pequeñas, ocupa el 100% del ancho */
                margin-bottom: 20px;
            }

            .table td,
            .table th {
                font-size: 12px; /* Reducir el tamaño de fuente en la tabla para pantallas pequeñas */
            }
        }

        @media only screen and (max-width: 480px) {
            .col-6 {
                width: 100%; /* En pantallas móviles más pequeñas, ocupa el 100% del ancho */
                margin-bottom: 20px;
            }

            .table td,
            .table th {
                font-size: 10px; /* Ajustar el tamaño de fuente aún más para pantallas móviles más pequeñas */
            }
        }
    </style>



    <h1>Lista de Productos con Store Procedure</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label runat="server" Text="Filtrar: "></asp:Label>
                <asp:TextBox ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
            <div class="mb-3">
                <asp:CheckBox ID="chkFiltroAvanzado" Text="Filtro Avanzado" AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" runat="server" />
            </div>
        </div>

        <%if (chkFiltroAvanzado.Checked)
            {%>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label ID="lblCampo" runat="server" Text="Campo"></asp:Label>
                    <asp:DropDownList ID="ddlCampo" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" runat="server">
                        <asp:ListItem Text="Precio"></asp:ListItem>
                        <asp:ListItem Text="Nombre"></asp:ListItem>
                        <asp:ListItem Text="Descripcion"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label ID="lblCriterio" runat="server" Text="Criterio"></asp:Label>
                    <asp:DropDownList ID="ddlCriterio" CssClass="form-control" AutoPostBack="true" runat="server">
                        <asp:ListItem Text="Igual a"></asp:ListItem>
                        <asp:ListItem Text="Mayor a"></asp:ListItem>
                        <asp:ListItem Text="Menor a"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-3">
                    <asp:Label ID="lblFiltroAvanzado" runat="server" Text="Filtro"></asp:Label>
                    <asp:TextBox ID="txtFiltroAvanzado" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" OnClick="btnBuscar_Click" Text="Buscar" />
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <asp:GridView ID="dgvProductos" DataKeyNames="Id" OnSelectedIndexChanged="dgvProductos_SelectedIndexChanged"
        CssClass="table" AutoGenerateColumns="false"
        OnPageIndexChanging="dgvProductos_PageIndexChanging"
        AllowPaging="true" PageSize="5" runat="server">
        <Columns>
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
            <asp:BoundField DataField="Nombre" HeaderText="Codigo" />
            <asp:BoundField DataField="Descripcion" HeaderText="Codigo" />
            <asp:BoundField DataField="Marca" HeaderText="Codigo" />
            <asp:BoundField DataField="Categoria" HeaderText="Codigo" />
            <asp:ImageField DataImageUrlField="UrlImagen" ControlStyle-Height="100px" ControlStyle-Width="100px" HeaderText="Imagen" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:F2}" />
            <asp:CommandField ShowSelectButton="true" SelectText="✍︎" HeaderText="Accion" />
        </Columns>
    </asp:GridView>
    <a href="FormularioProducto.aspx" class="btn btn-nuevo">Nuevo Producto</a>
</asp:Content>
