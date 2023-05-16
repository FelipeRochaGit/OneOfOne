<%@ Page Title="" Language="C#" MasterPageFile="~/Compra.Master" AutoEventWireup="true" CodeBehind="Datos.aspx.cs" Inherits="WebApplicationOneOfOne.Datos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Css\StylesDatos.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script>
        $(document).ready(function () {
            $("[id$=btnDatosContacto]").click(function () {
                if ($("[id$=btnDatosContacto] .flecha").hasClass("fa-chevron-down")) {
                    $("[id$=btnDatosContacto] .flecha").removeClass("fa-chevron-down");
                    $("[id$=btnDatosContacto] .flecha").addClass("fa-chevron-up");
                } else {
                    $("[id$=btnDatosContacto] .flecha").removeClass("fa-chevron-up");
                    $("[id$=btnDatosContacto] .flecha").addClass("fa-chevron-down");
                }
            });
            $("[id$=btnDatosEnvio]").click(function () {
                if ($("[id$=btnDatosEnvio] .flecha").hasClass("fa-chevron-down")) {
                    $("[id$=btnDatosEnvio] .flecha").removeClass("fa-chevron-down");
                    $("[id$=btnDatosEnvio] .flecha").addClass("fa-chevron-up");
                } else {
                    $("[id$=btnDatosEnvio] .flecha").removeClass("fa-chevron-up");
                    $("[id$=btnDatosEnvio] .flecha").addClass("fa-chevron-down");
                }
            });
            $("[id$=btnDatosPersonales]").click(function () {
                if ($("[id$=btnDatosPersonales] .flecha").hasClass("fa-chevron-down")) {
                    $("[id$=btnDatosPersonales] .flecha").removeClass("fa-chevron-down");
                    $("[id$=btnDatosPersonales] .flecha").addClass("fa-chevron-up");
                } else {
                    $("[id$=btnDatosPersonales] .flecha").removeClass("fa-chevron-up");
                    $("[id$=btnDatosPersonales] .flecha").addClass("fa-chevron-down");
                }
            });
            $(".verDetalle").click(function () {
                if ($('.container-tbl-producto-movil').css('max-height') == '0px') {
                    $('.container-tbl-producto-movil').addClass('open');
                    $('.overlay-verDetalle').css('display', 'block');
                    $('.overlay-verDetalle').addClass('visible');
                    $(".verDetalle .flecha").removeClass("fa-chevron-down");
                    $(".verDetalle .flecha").addClass("fa-chevron-up");
                    $('[id$=lblVerDetalle]').text("Ocultar detalles");
                } else {
                    $('.container-tbl-producto-movil').removeClass('open');
                    $('.overlay-verDetalle').removeClass('visible');
                    $(".verDetalle .flecha").removeClass("fa-chevron-up");
                    $(".verDetalle .flecha").addClass("fa-chevron-down");
                    $('[id$=lblVerDetalle]').text("Ver detalles de la compra");

                }
            });
            $('.overlay-verDetalle').click(function () {
                $('.container-tbl-producto-movil').removeClass('open');
                $('.overlay-verDetalle').removeClass('visible');
                $(".verDetalle .flecha").removeClass("fa-chevron-up");
                $(".verDetalle .flecha").addClass("fa-chevron-down");
                $('[id$=lblVerDetalle]').text("Ver detalles de la compra");
            })
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">

    <%--<div class="text-center">
        <h1>Datos de la compra</h1>
    </div>--%>
    <div class="divContainer">
        <div class="verDetalle">
            <div class="d-flex">
                <div style="width:30px;">
                    <i class="flecha fa-solid fa-chevron-down"></i>
                </div>
                <div style="min-width:200px;">
                    <asp:Label ID="lblVerDetalle" CssClass="ml-1 mr-1" runat="server">Ver detalles de la compra </asp:Label>
                </div>
                <div>
                    <asp:Label Text="$16000" runat="server" />
                </div>
            </div>
    </div>

    <div class="divformulario">
        <div class="formulario">
            <%--CUADRO DE LOS PRODUCTOS EN EL CARRITO OCULTO PARA CELULARES--%>
            <div class="container-tbl-producto-movil">
                <div class="table-producto-movil">
                    <table class="tbl-producto-movil">
                        <tr>
                            <td class="img">
                                <img src="Imagenes/Buzo1.png" alt="Alternate Text" />
                            </td>
                            <td class="descripcion">Descripcion</td>
                            <td class="precio">Precio</td>
                        </tr>
                    </table>
                </div>
                <div class="footer-tbl-producto-movil">
                    <div>
                        <div class="contenido-footer-producto-movil">
                            <div class="precioDatos">
                                <asp:Label Text="SubTotal" runat="server" />
                                <asp:Label CssClass="Precio" Text='10' runat="server" />
                            </div>

                            <div class="precioDatos">
                                <asp:Label Text="Costo De Envio" runat="server" />
                                <asp:Label CssClass="Precio" Text='10' runat="server" />
                            </div>
                            <div class="divPrecioDatos">
                                <div class="precioDatos">
                                    <asp:Label CssClass="Total" Text="Total" runat="server" />
                                    <asp:Label CssClass="Precio" Text='10' runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overlay-verDetalle"></div>
            <%--FONDO NEGRO QUE SE PONE CUANDO SE HACE CLICK SOBRE VER DETALLE--%>
            <%--FORMULARIO--%>
            <div class="form-border ">
                <h3 class="accordion-header">
                    <button id="btnDatosContacto" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <div class="d-flex w-100">
                            <h3>Datos de contacto</h3>
                        </div>
                        <div class="d-flex justify-content-end">
                            <i class="flecha fa-solid fa-chevron-down"></i>
                        </div>
                    </button>
                </h3>
                <div id="collapseOne" class="accordion-collapse collapse mt-3" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <asp:TextBox ID="txtMail" runat="server" CssClass="form-control mb-2" placeholder="Email" />
                        <asp:TextBox ID="txtMail2" runat="server" CssClass="form-control mb-2" placeholder="Repetir email" />
                        <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control mb-2" placeholder="Celular" />
                    </div>
                </div>
            </div>

            <div class="form-border ">
                <h3 class="accordion-header">
                    <button id="btnDatosEnvio" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseOne">
                        <div class="d-flex w-100">
                            <h3>Datos de envío</h3>
                        </div>
                        <div class="d-flex justify-content-end">
                            <i class="flecha fa-solid fa-chevron-down"></i>
                        </div>
                    </button>
                </h3>
                <div id="collapseTwo" class="accordion-collapse collapse mt-3" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <asp:DropDownList ID="ddlPais" runat="server" CssClass="form-select mb-2">
                            <asp:ListItem Text="Pais" Disabled="true" Selected="True" />
                            <asp:ListItem Text="Argentina" />
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlProvincias" runat="server" CssClass="form-select mb-2">
                            <asp:ListItem Text="Provincia" Disabled="true" Selected="True" />
                            <asp:ListItem Text="Capital Federal (CABA)" />
                            <asp:ListItem Text="Gran Buenos Aires (GBA)" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control mb-2" placeholder="Calle" />
                        <asp:TextBox ID="txtAltura" runat="server" CssClass="form-control mb-2" placeholder="Altura" />
                        <asp:TextBox ID="txtPiso" runat="server" CssClass="form-control mb-2" placeholder="Piso (opcional)" />
                        <asp:TextBox ID="txtDepartamento" runat="server" CssClass="form-control mb-2" placeholder="Depto (opcional)" />
                        <asp:TextBox ID="txtCodigoPostal" runat="server" CssClass="form-control mb-1" placeholder="Código postal" />
                        <a href="https://www.correoargentino.com.ar/formularios/cpa" target="_blank">Buscá tu C.P</a>
                    </div>
                </div>
            </div>

            <div class="form-border ">
                <h3 class="accordion-header">
                    <button id="btnDatosPersonales" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseOne">

                        <div class="d-flex w-100">
                            <h3>Datos personales</h3>
                        </div>
                        <div class="d-flex justify-content-end">
                            <i class="flecha fa-solid fa-chevron-down"></i>
                        </div>
                    </button>
                </h3>
                <div id="collapseThree" class="accordion-collapse collapse mt-3" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control mb-2" placeholder="Nombre/s" />
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control mb-2" placeholder="Apellido/s" />
                        <asp:TextBox ID="txtDniCuil" runat="server" CssClass="form-control mb-2" placeholder="Dni/cuil" />
                        <asp:CheckBox ID="chkRecepcion" runat="server" CssClass="btn-check" Text="Otra persona recibe el producto" />
                    </div>
                </div>
            </div>
            <div class="divBtnContinuar">
                <asp:Button Text="Continuar" runat="server" />
            </div>
        </div>
    </div>


    <%--COLUMNA DE LOS PRODUCTOS EN EL CARRITO DE LA DERECHA DE LA PAGINA--%>

    <div class="columnaDivProducto">
        <div class="divProductos">
            <div class="divitemsCarrito">
                <div class="ItemCompras">
                    <div class="divImagen">
                        <img src="Imagenes/Buzo1.png" alt="Alternate Text" />
                    </div>
                    <div class="divDescripcion">
                        Descripcion
                    </div>
                    <div class="divPrecio">
                        Precio
                    </div>

                </div>
                <div class="ItemCompras">
                    <div class="divImagen">
                        <img src="Imagenes/Buzo1.png" alt="Alternate Text" />
                    </div>
                    <div class="divDescripcion">
                        Descripcion
                    </div>
                    <div class="divPrecio">
                        Precio
                    </div>

                </div>
            </div>
            <div class="divPrecioDatos">
                <div class="precioDatos">
                    <asp:Label Text="SubTotal" runat="server" />
                    <asp:Label CssClass="Precio" Text='10' runat="server" />
                </div>

                <div class="precioDatos">
                    <asp:Label Text="Costo De Envio" runat="server" />
                    <asp:Label CssClass="Precio" Text='10' runat="server" />
                </div>
            </div>
            <div class="divPrecioDatos">
                <div class="precioDatos">
                    <asp:Label CssClass="Total" Text="Total" runat="server" />
                    <asp:Label CssClass="Precio" Text='10' runat="server" />
                </div>
            </div>
        </div>

    </div>
    </div>
</asp:Content>
