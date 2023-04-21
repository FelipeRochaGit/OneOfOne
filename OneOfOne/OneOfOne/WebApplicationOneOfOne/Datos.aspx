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
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">

    <div class="text-center">
        <h1>Datos de la compra</h1>
    </div>
    <div class="d-flex">

        <div class="divformulario">
            <div class="formulario">
    <div class="form-border ">
        <h3 class="accordion-header">
            <button id="btnDatosContacto" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                <div class="d-flex w-100">
                    <h3>Datos de contacto</h3>
                </div>
                <div class="d-flex justify-content-end w-100">
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
                <div class="d-flex justify-content-end w-100">
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
                <div class="d-flex justify-content-end w-100">
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

    </div>
            </div>




        <div class="d-block columnaDivProducto">
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
