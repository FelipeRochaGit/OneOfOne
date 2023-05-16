<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="WebApplicationOneOfOne.Catalogo" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Tienda Online
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Css\StylesCatalogo.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script>


        $(document).ready(function () {
            var width = $(window).width();
            if (width <= 1025) {
                $('.flecha').removeClass('fa-chevron-up').addClass('fa-chevron-down');
            }

            $('.desplegable').click(function () {
                var flecha = $(this).find('.flecha');
                var container = $(this).closest('.container-filtro');
                var opciones = container.find('.filtro-opciones');

                if (opciones.css('display') == 'none') {
                    opciones.slideDown();

                    flecha.removeClass('fa-chevron-down').addClass('fa-chevron-up');


                } else {
                    opciones.slideUp();
                    flecha.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                }
            });


            $('.Talle').click(function () {
                if ($(this).hasClass('active')) {
                    $(this).removeClass('active')
                } else {
                    $(this).addClass('active')

                }
            })

            $('.colores').click(function () {
                if ($(this).hasClass('active')) {
                    $(this).removeClass('active')
                } else {
                    $(this).addClass('active')

                }
            })

            var div = document.querySelector('.filtros-movil');
            var divOffset = div.offsetTop;
            var isSticky = false;
            window.addEventListener('scroll', function () {

                if (!isSticky && window.pageYOffset >= divOffset) {
                    div.classList.add('sticky');
                    div.style.marginTop = '0';
                    isSticky = true;
                }
                else if (isSticky && window.pageYOffset < divOffset) {
                    div.classList.remove('sticky');
                    isSticky = false;
                }
            });

            $('.col-btn-filtro').click(function () {
                if ($('.col-filtros').css('display') == 'none') {
                    $('.col-filtros').css('display', 'block');
                    $('.overlay-filtro-movil').css('display', 'block');
                }
                $('.overlay-filtro-movil').click(function () {
                    $('.col-filtros').css('display', 'none');
                    $('.overlay-filtro-movil').css('display', 'none');
                })
            })

            

            
            $(document).click(function (event) {
                var target = $(event.target);
                if (!target.closest('.col-btn-orden').length && !target.closest('.Ordenar').length) {
                    $('.Ordenar').removeClass('active');
                    $('.desplegableOrdenar .flecha').removeClass('fa-chevron-down').addClass('fa-chevron-down');
                }
            });

            $('.col-btn-orden .desplegableOrdenar').click(function () {
                if ($('.Ordenar').css('max-height') == '0px') {
                    $('.Ordenar').addClass('active');
                    $('.desplegableOrdenar .flecha').removeClass('fa-chevron-down').addClass('fa-chevron-up');

                }
                else {
                    $('.Ordenar').removeClass('active');
                    $('.desplegableOrdenar .flecha').removeClass('fa-chevron-down').addClass('fa-chevron-down');


                }
            })

            $('.Ordenar span').click(function () {
                $('.Ordenar span').removeClass('active');
                $(this).addClass('active');
            })

        })
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">



    <div class="overlay-filtro-movil"></div>

    <div class="row-catalogo mb-5">
        <div class="col-filtros aparecer">
            <%--COLUMNA DE FILTROS--%>
            <div class="div-filtros">
                <div class="columna-filtros">
                    <div class="container-filtro">
                        <div class="filtro filtro-titulo ">
                            <asp:Label Text="Filtros" runat="server" />
                        </div>
                    </div>

                    <%--CATEGORIAS--%>
                    <div class="container-filtro">
                        <div class="filtro">
                            <div class="desplegable desplegable-categorias">
                                <div class="w-100">Categoria</div>
                                <div><i class="flecha fa-solid fa-chevron-up"></i></div>
                            </div>
                        </div>
                        <div class="filtro-categorias filtro-opciones">
                            <div>
                                <asp:CheckBox Text="Remeras" runat="server" />
                            </div>
                            <div>
                                <asp:CheckBox Text="Buzos" runat="server" />
                            </div>
                        </div>
                    </div>

                    <%--TALLE--%>
                    <div class="container-filtro">
                        <div class="filtro">
                            <div class="desplegable desplegable-talles">
                                <div class="w-100">Talle</div>
                                <div><i class="flecha fa-solid fa-chevron-up"></i></div>
                            </div>
                        </div>
                        <div class="filtro-talles filtro-opciones">
                            <div class="text-center">
                                <button id="btnTalle1" class="Talle mr-2" onclick="return false;">
                                    1
                                </button>
                                <button id="btnTalle2" class="Talle" onclick="return false;">
                                    2
                                </button>
                                <asp:CheckBox ID="chkTalle1" CssClass="d-none" Text="1" runat="server" />
                                <asp:CheckBox ID="chkTalle2" CssClass="d-none" Text="2" runat="server" />
                            </div>
                        </div>
                    </div>
                    <%--PRECIO--%>
                    <div class="container-filtro">
                        <div class="filtro">
                            <div class="desplegable desplegable-colores">
                                <div class="w-100">Color</div>
                                <div><i class="flecha fa-solid fa-chevron-up"></i></div>
                            </div>
                        </div>
                        <div class="filtro-opciones">
                            <div class="filtro-colores">
                                <div class="color mr-3">
                                    <button class="colores negro" onclick="return false;">
                                    </button>
                                    <span>Negro</span>
                                </div>
                                <div class="color ml-3">
                                    <button class="colores blanco " onclick="return false;">
                                    </button>
                                    <span>Blanco</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-catalogo">

            <div class="row-productos">
                <div class="filtros-movil">
                    <div class="col-titulo">Catalogo</div>
                    <div class="col-btn-filtro"><i class="fa-solid fa-sliders mr-1"></i>Filtro</div>
                    <div class="col-btn-orden">
                        <span class="desplegableOrdenar">Ordenar por <i class="flecha fa-solid fa-chevron-up"></i></span>
                        <%--<div class="divOrdenar">--%>
                            <div class="Ordenar">
                                <span class="active">Destacados </span>
                                <span>Recientes</span>
                                <span>Mayor Precio</span>
                                <span>Menor Precio</span>
                            </div>
                        <%--</div>--%>
                    </div>



                </div>
                <asp:Repeater ID="rpCatalogo" runat="server" OnItemCommand="rpCatalogo_ItemCommand">
                    <ItemTemplate>
                        <div class="col-productos">
                            <asp:LinkButton ClientIDMode="AutoID" ID="lnkImagen" CommandArgument='<%# Eval("Id") %>' CommandName="VerProducto" runat="server">
                                <div class="card-producto">
                                    <asp:Image ID="imgButton" runat="server" ImageUrl='<%# Eval("ImgURL") %>' />
                                </div>
                                <div class="descripcion-producto">
                                    <b><span><%# Eval("Descripcion") %></span></b>
                                    <span class="descripcion-producto-catalogo"><%# Eval("descripcion") %> oversize unisex</span>
                                    <b><span>$<%# Eval("Precio") %></span></b>
                                </div>
                            </asp:LinkButton>
                        </div>
                        <div class="col-productos ">
                            <asp:LinkButton ClientIDMode="AutoID" ID="LinkButton1" CommandArgument='<%# Eval("Id") %>' CommandName="VerProducto" runat="server">
                                <div class="card-producto">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImgURL") %>' />
                                </div>
                                <div class="descripcion-producto">
                                    <b><span><%# Eval("Descripcion") %></span></b>
                                    <span class="descripcion-producto-catalogo"><%# Eval("descripcion") %> oversize unisex</span>
                                    <b><span>$<%# Eval("Precio") %></span></b>
                                </div>
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>



        </div>



    </div>
</asp:Content>
