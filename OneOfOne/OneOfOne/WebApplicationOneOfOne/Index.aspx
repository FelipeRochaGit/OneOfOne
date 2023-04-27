<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplicationOneOfOne.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Css\StylesIndex.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="contenedor">


        <div class="video-container">
            <video src="Videos/Vídeo promocional Moda.mp4" autoplay muted loop></video>
        </div>
        <div class="Logo1Of1">
            <img src="Imagenes/Logo1Of1.png" alt="Alternate Text" />
        </div>

        <h4>Ultimo Lanzamientos</h4>
        <div class="UltimoLanzamiento">
                <div class="Imagen">
                    <img src="Imagenes/Buzo1.png" alt="" />
                </div>
                <div class="Imagen">
                    <img src="Imagenes/Buzo1.png" alt="" />
                </div>
            </div>


    </div>
</asp:Content>
