<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="WebApplicationOneOfOne.Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript">

        function checkChange() {
            //var check1 = $('[id$=ckbTalle1]')[0];
            //var check2 = $('[id$=ckbTalle2]')[0];

            //check1.checked = !check2.checked;
            //check2.checked = !check1.checked;

            //if (check2.change) {
            //    check1.checked = false;
            //}
            //if (check1.change) {
            //    check2.checked = false;
            //}
            $('[id$=ckbTalle1]').change(function () {
                if (('[id$=ckbTalle1]').is('checked'){
                    alert("HOLA")
                }
            })

        }

        $('[id$=ckbTalle1]').change(function () {
            alert('aaaaaaaaa');

            if (this.checked) {
                alert('aaaaaaaaa');
            } else {
                var a = 0;
            }
        });


    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <asp:Image ID="imgProducto" runat="server" CssClass="w-100 FotoCatalogo" />
    <asp:CheckBox ID="ckbTalle1" CssClass="hola" runat="server" Checked="true" Text="Talle 1" onClick="checkChange()" />
    <asp:CheckBox ID="ckbTalle2" runat="server" Text="Talle 2" onClick="checkChange()" />
    <asp:Button ID="btnAgregarAlCarrito" runat="server" Text="Agregar al carrito" OnClick="btnAgregarAlCarrito_Click" />
    <div class="carrito">
    </div>

</asp:Content>
