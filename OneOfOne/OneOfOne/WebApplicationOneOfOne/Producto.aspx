<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="WebApplicationOneOfOne.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <link href="Css\StylesProducto.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            var width = $(window).width();
            if (width <= 732) {
                $('[id$=pnlMovil]').attr('Style', 'display:block');
                $('[id$=pnlPC]').attr('Style', 'display:none');
                $('[id$=TipoDeDispositivo]').val("Movil");
            } else {
                $('[id$=pnlPC]').attr('Style', 'display:block');
                $('[id$=pnlMovil]').attr('Style', 'display:none');
            }

            if ($("#chkTalle1").is(":checked")) {
                $(".divCheckBox1").addClass("Selected");
            } else {
                $(".divCheckBox1").removeClass("Selected");
            }
            if ($("#chkTalle2").is(":checked")) {
                $(".divCheckBox2").addClass("Selected");
            } else {
                $(".divCheckBox2").removeClass("Selected");

            }

            $(".divCheckBox1").click(function () {

                if ($("#chkTalle1").is(":checked")) {
                    $("#chkTalle1").prop("checked", false);
                    $(".divCheckBox1").removeClass("Selected");



                } else {
                    $("#chkTalle1").prop("checked", true);
                    $("#chkTalle2").prop("checked", false);
                    $(".divCheckBox1").addClass("Selected");
                    $(".divCheckBox2").removeClass("Selected");


                }


            });

            $(".divCheckBox2").click(function () {
                if ($("#chkTalle2").is(":checked")) {
                    $("#chkTalle2").prop("checked", false);
                    $(".divCheckBox2").removeClass("Selected");

                } else {
                    $("#chkTalle2").prop("checked", true);
                    $("#chkTalle1").prop("checked", false);
                    $(".divCheckBox2").addClass("Selected");
                    $(".divCheckBox1").removeClass("Selected");

                }


            });

            /*TODA LA LOGICA DEL DROP DOWN LIST CANTIDAD*/
            $('.dropdown-content .divSpan').click(function () {
                var cantidadSeleccionada = $(this).text();
                if (cantidadSeleccionada != 'Mas de 5 Unidades') {
                    $('.iconoDdl').removeClass('fa-chevron-up')
                    $('.iconoDdl').addClass('fa-chevron-down')
                    $('#btnCantidad').text(cantidadSeleccionada);
                    $("[id$=hfCantidadSeleccionada]").val(parseInt(cantidadSeleccionada));
                    $(".dropdown-content").slideUp();

                } else {
                    $("[id$=btnAplicar]").prop("disabled", true);
                    $(".anadirCantidad").attr("style", "display: block;")

                }
            });




            /*SI SE TOCA EL DDL Y ESTA NO VISIBLE SE ABRE EL DDL Y SI ESTA VISIBLE SE CIERRA, Y CUANDO SE CIERRA EL DDL SE BORRA EL CAMPO DE CANTIDAD*/
            $('.ddlCantidadProducto').click(function () {
                if ($(".dropdown-content").css('display') == 'none') {
                    $(".anadirCantidad").attr("style", "display: none;")
                    $('.dropdown-content').slideDown();
                    $('.iconoDdl').removeClass('fa-chevron-down')
                    $('.iconoDdl').addClass('fa-chevron-up')

                    // Cierra el drop down si se toca otro lugar de la pantalla
                    $(document).on('click.dropdown', function (event) {
                        // Si el clic ha sido en un elemento que no es el dropdown ni sus hijos
                        if (!$(event.target).closest('.dropdown').length) {
                            // Ocultamos el dropdown
                            $('.dropdown-content').slideUp();
                            $('.iconoDdl').removeClass('fa-chevron-up')
                            $('.iconoDdl').addClass('fa-chevron-down')
                            // Quitamos el listener
                            $(document).off('click.dropdown');
                        }
                    });

                } else {
                    $('.dropdown-content').slideUp();
                    $('.iconoDdl').removeClass('fa-chevron-up')
                    $('.iconoDdl').addClass('fa-chevron-down')
                    $("[id$=txtCantidad]").val("");
                    // Quitamos el listener
                    $(document).off('click.dropdown');
                }
            });

            $("[id$=txtCantidad]").on("keyup input", function () {
                // Solo permite agregar numeros y no deja iniciar con 0
                var value = $(this).val().replace(/^0+|[^0-9]/g, "");
                // Establecer el valor del campo de texto en el valor filtrado
                $(this).val(value);
                // Desactiva el boton si el campo de texto esta vacío o es igual a cero
                $("[id$=btnAplicar]").prop("disabled", value === "" || value === "0");
            });

            $("[id$=btnAplicar]").click(function () {
                $("[id$=hfCantidadSeleccionada]").val($("[id$=txtCantidad]").val());
                var cantidadSeleccionada = $("[id$=hfCantidadSeleccionada]").val();
                if (cantidadSeleccionada > 1) {
                    $('#btnCantidad').text(cantidadSeleccionada + " Unidades");
                }
                else {
                    $('#btnCantidad').text(cantidadSeleccionada + " Unidad");
                }
                $('.dropdown-content').slideUp();
                $("[id$=txtCantidad]").val("");
                $('.iconoDdl').removeClass('fa-chevron-up')
                $('.iconoDdl').addClass('fa-chevron-down')
                /*alert($("[id$=hfCantidadSeleccionada]").val())*/
            });

            var botones = document.getElementsByTagName("button");
            for (var i = 0; i < botones.length; i++) {
                botones[i].addEventListener("click", function (e) {
                    e.preventDefault();
                });
            }
            $('.carouselExampleControls').carousel('pause')
        });


        function validarTalle() {
            if (!$("#chkTalle1").prop("checked") && !$("#chkTalle2").prop("checked")) {
                alert('Seleccionar talle');
                return false;
            }

            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
                <asp:HiddenField runat="server" ID="TipoDeDispositivo" Value="" />
    <div class="producto">
        <asp:Panel ID="pnlPC" Visible="true" runat="server">
            <div class="columnaImagen mb-5">
                <asp:Image ID="imgProductoPC" runat="server" CssClass="Imagenes" />
                <asp:Repeater ID="rpFotosProductosPC" runat="server">
                    <ItemTemplate>
                        <asp:Image ClientIDMode="AutoID" ID="imgProducto1" ImageUrl='<%#Eval("imgUrl") %>' runat="server" CssClass="Imagenes img-fluid mt-2" />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlMovil" Visible="true" runat="server">

            <div class="columnaImagen mb-5">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <%--empieza el carousel--%>
                        <div class="carousel-item active">
                            <asp:Image runat="server" ID="imgProductoMovil" class="Imagenes" alt="First slide" />
                        </div>
                        <asp:Repeater ID="rpFotosProductosMovil" runat="server">
                            <ItemTemplate>
                                <div class="carousel-item">
                                    <asp:Image ClientIDMode="AutoID" ID="imgProducto1" ImageUrl='<%#Eval("imgUrl") %>' runat="server" CssClass="Imagenes" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <%--fin del carousel--%>
            </div>
        </asp:Panel>
        <div class="DetallesProducto">
            <h1>
                <asp:Label ID="lblDescripcion" runat="server"></asp:Label></h1>
            <h4>
                <asp:Label ID="lblPrecio" runat="server"></asp:Label></h4>
            <div class="row m-0">
                <div class="divCheckBox1 mr-3 mb-2">
                    <asp:CheckBox ID="chkTalle1" CssClass="chkTalle" ClientIDMode="Static" runat="server" />
                    <asp:Label ID="lblTalle1" CssClass="lblTalle1" Text="Talle 1" runat="server" />
                </div>
                <div class="divCheckBox2">
                    <asp:CheckBox ID="chkTalle2" CssClass="chkTalle" ClientIDMode="Static" runat="server" />
                    <asp:Label ID="lblTalle2" CssClass="lblTalle1" Text="Talle 2" runat="server" />
                </div>
            </div>
            <a href="#">Medidas de talles</a>
            <br />
            <br />

            <div class="d-flex w-100">

                <div class="dropdown ">
                    <div class="ddlCantidadProducto mb-2">
                        <label>Cantidad:</label>
                        <div class="divBtnIcono">
                            <label id="btnCantidad">1 Unidad </label>
                            <label class="iconoDdl fa-solid fa-chevron-down "></label>
                        </div>
                    </div>
                    <div class="dropdown-content">
                        <div class="divSpan"><span>1 Unidad</span></div>
                        <div class="divSpan"><span>2 Unidades</span></div>
                        <div class="divSpan"><span>3 Unidades</span></div>
                        <div class="divSpan"><span>4 Unidades</span></div>
                        <div class="divSpan"><span>5 Unidades</span></div>
                        <div class="divSpan"><span>Mas de 5 Unidades</span></div>
                        <div class="anadirCantidad mb-3">
                            Cantidad:
                                <div class="formAnadir">
                                    <asp:TextBox ID="txtCantidad" CssClass="textboxDentroDdl" runat="server" />
                                    <button id="btnAplicar" disabled>Aplicar</button>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField runat="server" ID="hfCantidadSeleccionada" Value="1" />
            <asp:Button ID="btnAgregarAlCarrito" CssClass="btn btn-dark" runat="server" Text="Agregar al carrito" OnClick="btnAgregarAlCarrito_Click" OnClientClick="return validarTalle()" />
        </div>
    </div>
    <script>



</script>
</asp:Content>
