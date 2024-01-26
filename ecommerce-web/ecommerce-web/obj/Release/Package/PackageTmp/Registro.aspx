<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ecommerce_web.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80vw;
            margin: auto;
            overflow: hidden;
        }

        .row {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .col-4 {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 50%;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-input {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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

        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

            a:hover {
                text-decoration: underline;
            }

        .validacion {
            color: red;
            font-size: 12px;
        }

        @media only screen and (max-width: 600px) {
            .container {
                width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-4">
                <h1>Crea tu Perfil</h1>
                <div class="mb-3">
                    <asp:Label ID="lblEmail" runat="server" CssClass="form-input" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtEmail" required TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ErrorMessage="Formato de email incorrecto.." CssClass="validacion" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblPass" runat="server" CssClass="form-input" Text="Password"></asp:Label>
                    <asp:TextBox ID="txtPassword" required TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="btnRegistro" CssClass="btn btn-primary" OnClick="btnRegistro_Click" runat="server" Text="Registrarse" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
