<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplicationOneOfOne.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

    <link href="Css\StylesIndex.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script>

        var width = $(window).width();
        //console.log(width)
        
        
        $(document).ready(function () {
            if (width <= 1025) {

                $('.destacados').slick({
                    /*dots: true,*/
                    slidesToShow: 2,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 2000,

                    prevArrow: '',
                    nextArrow: '',
                    responsive: [
                        {
                            breakpoint: 10,
                            settings: {
                                slidesToShow: 2,
                                centerMode: true,
                                variableWidth: false
                            }
                        }
                    ]
                });
            } else {
                $('.destacados').slick({
                    /*dots: true,*/
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 2000,

                    prevArrow: '',
                    nextArrow: '',
                    responsive: [
                        {
                            breakpoint: 10,
                            settings: {
                                slidesToShow: 3,
                                centerMode: true,
                                variableWidth: false
                            }
                        }
                    ]
                });
            }
            
        })


    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">



    <div class="video-container">
        <div class="Overlay-Video">
            <div class="contenedor-texto-botones">
                <div class="contenedor-texto-video">
                    <label class="titulo titulo-One1">One</label>
                    <label class="titulo titulo-of text-white">of</label>
                    <label class="titulo titulo-One2">One</label>
                    <img src="Imagenes/Logo.png" class="Logo" alt="Alternate Text" />
                </div>
                <a href="Catalogo.aspx" class="text-decoration-none">
                    <div class="comprar-ahora">
                        <span>Comprar ahora</span>
                    </div>
                </a>

            </div>
        </div>
        <video src="Videos/VideoPromocionalModa.mp4" autoplay muted playsinline loop></video>

    </div>
    <main class="mainContainer">
    <div class="row w-100" style="margin-top: 10%">
        <div class="col-7 ml-5">
            <img src="Imagenes/portada1.jpg" style="background: rgb(172 169 169 / 0.2); width: 100%; max-height: 80%" class="img-fluid" alt="" />
        </div>
        <div class="col ">
            <img src="Imagenes/Portada2.jpg" class="img-fluid " style="width: 100%; background: rgb(172 169 169 / 0.2); transform: translate(0%,30%)" alt="" />
        </div>
    </div>

    <div class="titulo-ultimosLanzamientos">
        <h1 class="ml-3">Últimos lanzamientos</h1>
    </div>
    <%--ULTIMO LANZAMIENTO--%>
    <div class="UltimoLanzamiento ">
        <%--buzos--%>
        <div class="columna-imagen">
            <a href="#">
                <img src="Imagenes/Buzos.jpg" alt="" />
            </a>
            <div class="boton-ultimosLanzamientos">
                <span>Buzos</span>
                <a class="text-decoration-none" href="#">
                    <div class="verTodo ">
                        <span>Ver selección</span>
                    </div>
                </a>
            </div>
        </div>

        <%--remeras--%>
        <div class="columna-imagen">
            <a href="#">
                <img src="Imagenes/Remeras.jpg" alt="" />
            </a>
            <div class="boton-ultimosLanzamientos">
                <span>Remeras</span>
                <a class="text-decoration-none" href="#">
                    <div class="verTodo ">
                        <span>Ver selección</span>
                    </div>
                </a>
            </div>
        </div>
    </div>



    <h2 class="ml-3">DESTACADOS</h2>
    <%--CARRUSEL DE DESTACADOS--%>
    <div class="destacados">
        <asp:Repeater ID="rpDestacados" runat="server">
            <ItemTemplate>
                <div class="card-destacados">
                    <a href="Producto.aspx?IdProducto=<%# Eval("Id") %>">
                        <div class="imagen-destacados mb-4">
                            <img src="<%#Eval("imgUrl") %>" class="img-fluid" />
                        </div>
                        <div class="descripcion-destacados">
                            <b><asp:Label Text='<%#Eval("Descripcion") %>' runat="server" /></b><br />
                            <asp:Label Text="Remera Oversize unisex" CssClass="descripcion-prenda-destacados" runat="server" /><br />
                            <b><asp:Label Text='<%#Eval("Precio") %>' runat="server" /></b>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</main>


</asp:Content>
