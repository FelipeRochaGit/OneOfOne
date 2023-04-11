<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="WebApplicationOneOfOne.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Css\StylesProducto.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript">



        $(document).ready(function () {
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


            //$("#chkTalle2").click(function () {
            //    if ($(this).is(":checked")) {
            //        $("#chkTalle1").prop("checked", false);
            //    }
            //});

            //$("#chkTalle1").click(function () {
            //    if ($(this).is(":checked")) {
            //        $("#chkTalle2").prop("checked", false);
            //    }
            //});

            var botones = document.getElementsByTagName("button");
            for (var i = 0; i < botones.length; i++) {
                botones[i].addEventListener("click", function (e) {
                    e.preventDefault();
                });
            }
        });


        function aumentarCantidad() {
            // Obtenemos el valor actual del campo de cantidad de productos
            var cantidadProductos = document.getElementById("txtCantidadProductos");
            var cantidad = parseInt(cantidadProductos.value);

            // Incrementamos la cantidad de productos
            if (cantidad < 10) {
                cantidad++;
            }

            // Actualizamos el campo de cantidad de productos
            cantidadProductos.value = cantidad;
        }

        function disminuirCantidad() {
            // Obtenemos el valor actual del campo de cantidad de productos
            var cantidadProductos = document.getElementById("txtCantidadProductos");
            var cantidad = parseInt(cantidadProductos.value);

            // Decrementamos la cantidad de productos
            if (cantidad > 1) {
                cantidad--;
            }

            // Actualizamos el campo de cantidad de productos
            cantidadProductos.value = cantidad;
        }

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

    <div class="">
        <div class="producto">
            <div class="columnaImagen mb-5">
                <asp:Image ID="imgProducto" runat="server" CssClass="Imagenes" />
                <asp:Image ID="imgProducto1" ImageUrl="~/Imagenes/Buzo1.png" runat="server" CssClass="Imagenes img-fluid mt-2" />
                <asp:Image ID="imgProducto2" ImageUrl="~/Imagenes/Buzo1.png" runat="server" CssClass="Imagenes img-fluid mt-2" />
                <asp:Image ID="imgProducto3" ImageUrl="~/Imagenes/Buzo1.png" runat="server" CssClass="Imagenes img-fluid mt-2" />
                <asp:Image ID="imgProducto4" ImageUrl="~/Imagenes/Buzo1.png" runat="server" CssClass="Imagenes img-fluid mt-2" />
            </div>
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

                <div class="dropdown d-flex w-100">
                    <label for="cantidad-productos">Cantidad:</label>
                    <div>
                        <button class="ddlCantidadProducto ">1 Unidad</button>
                        <div class="dropdown-content">
                            <a href="#">1 Unidad</a>
                            <a href="#">2 Unidad</a>
                            <a href="#">3 Unidad</a>
                            <a href="#">4 Unidad</a>
                            <a href="#">5 Unidad</a>
                            <a href="#">6 Unidad</a>
                        </div>
                    </div>
                </div>
                <asp:TextBox ID="txtCantidadProductos" runat="server" TextMode="number" ClientIDMode="Static" Width="50px" Value="1"></asp:TextBox>
                <button onclick="aumentarCantidad()">+</button>
                <button onclick="disminuirCantidad()">-</button><br />
                <br />
                <asp:Button ID="btnAgregarAlCarrito" CssClass="btn btn-dark" runat="server" Text="Agregar al carrito" OnClick="btnAgregarAlCarrito_Click" OnClientClick="return validarTalle()" />
            </div>
        </div>
    </div>
    <script>



</script>
</asp:Content>
