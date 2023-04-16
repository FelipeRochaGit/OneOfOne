<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Datos.aspx.cs" Inherits="WebApplicationOneOfOne.Datos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Css\StylesDatos.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="text-center">
        <h1>Datos de la compra</h1>
    </div>
    <div class=" form-border">
        <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" placeholder="Ingresar E-mail" />
    </div>
    <div class="  form-border">
        <h3>Datos de entrega</h3>
        <asp:CheckBox Text="te lo lleva picho" runat="server" />
    </div>
    <div class="  form-border">
        <h3>Datos de facturacion</h3>
        <b>
            <label>Datos de envio</label>
        </b>
        <asp:DropDownList ID="ddlPais" runat="server" CssClass="form-control ">
            <asp:ListItem Text="Pais" />
            <asp:ListItem Text="Argentina" />
        </asp:DropDownList>
        <asp:DropDownList ID="ddlProvincias" runat="server" CssClass="form-control ">
            <asp:ListItem Text="Provincia" />
            <asp:ListItem Text="Bs. As" />
            <asp:ListItem Text="peru" />
        </asp:DropDownList>
        <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control " placeholder="Calle" />
        <asp:TextBox ID="txtAltura" runat="server" CssClass="form-control " placeholder="Altura" />
        <asp:TextBox ID="txtCodigoPostal" runat="server" CssClass="form-control " placeholder="C.P" />
        <b>
            <label>Datos personales</label>
        </b>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control " placeholder="Nombre" />
        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control " placeholder="Apellido" />
        <asp:TextBox ID="txtDniCuil" runat="server" CssClass="form-control " placeholder="DNI/CUIL" />
        <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control " placeholder="Celular" />
        <asp:TextBox ID="txtBorrar" runat="server" CssClass="form-control " placeholder="Orientacion sexual" />
    </div>
    <div class="divProductos">
        <img src="Imagenes/Buzo1.png" alt="Alternate Text" />
    </div>
</asp:Content>


