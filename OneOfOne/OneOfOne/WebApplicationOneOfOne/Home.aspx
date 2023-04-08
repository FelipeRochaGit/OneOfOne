<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplicationOneOfOne.Home" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    HOME
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Css\StylesHome.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
        <div class="container-sm text-center mt-5">
            <img src="Imagenes/Logo1Of1.png" class="Logo1Of1" />
            <div class="row" style="margin-top: 100px!important">
                <asp:Repeater ID="rpCatalogo"  runat="server" OnItemCommand="rpCatalogo_ItemCommand">
                    <ItemTemplate>
                        <div class="<%#Eval ("Encolumnado") %> mt-5 p-0">
                        <asp:LinkButton ClientIDMode="AutoID" ID="lnkImagen" CommandArgument='<%# Eval("Id") %>'  CommandName="VerProducto" runat="server" >
                            <asp:image  ID="imgButton" runat="server"  ImageUrl='<%# Eval("ImgURL") %>' CssClass="w-100 FotoCatalogo" />
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
</asp:Content>
