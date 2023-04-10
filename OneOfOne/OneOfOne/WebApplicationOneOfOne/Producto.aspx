<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="WebApplicationOneOfOne.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Css\StylesProducto.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#chkTalle2").click(function () {
                if ($(this).is(":checked")) {
                    $("#chkTalle1").prop("checked", false);
                }
            });

            $("#chkTalle1").click(function () {
                if ($(this).is(":checked")) {
                    $("#chkTalle2").prop("checked", false);
                }
            });

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

    <div class="producto row">
        <div class="col-6 ">
    <asp:Image ID="imgProducto" runat="server" CssClass="w-100 Imagenes" />
    <asp:Image ID="imgProducto1" ImageUrl="~/Imagenes/Buzo1.png" runat="server" CssClass="w-100 Imagenes mt-2" />
    <asp:Image ID="imgProducto2" ImageUrl="~/Imagenes/Buzo1.png" runat="server" CssClass="w-100 Imagenes mt-2" />
    <asp:Image ID="imgProducto3" ImageUrl="~/Imagenes/Buzo1.png" runat="server" CssClass="w-100 Imagenes mt-2" />
    <asp:Image ID="imgProducto4" ImageUrl="~/Imagenes/Buzo1.png" runat="server" CssClass="w-100 Imagenes mt-2" />
            </div>
        <div class="DetallesProducto">
    <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
    <br />
    <asp:Label ID="lblPrecio" runat="server"></asp:Label>
    <br />
    <asp:CheckBox ID="chkTalle1" ClientIDMode="Static" runat="server" Text="Talle 1" />
    <asp:CheckBox ID="chkTalle2" ClientIDMode="Static" runat="server" Text="Talle 2" />
    <br />
    <label for="cantidad-productos">Cantidad de productos:</label>
    <asp:TextBox ID="txtCantidadProductos" runat="server" TextMode="number" ClientIDMode="Static" Width="50px" Value="1"></asp:TextBox>
    <button onclick="aumentarCantidad()">+</button>
    <button onclick="disminuirCantidad()">-</button>
    <asp:Button ID="btnAgregarAlCarrito" runat="server" Text="Agregar al carrito" OnClick="btnAgregarAlCarrito_Click" OnClientClick="return validarTalle()"/>
            </div>
    </div>
</asp:Content>
