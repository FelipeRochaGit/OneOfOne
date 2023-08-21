using OneOfOne.Core.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationOneOfOne
{
    public partial class Datos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = (DataTable)Session["dtCarrito"];
                rpItemsCarrito.DataSource = dt;
                rpItemsCarrito.DataBind();

                SetearTotales(dt);
            }
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["dtCarrito"];
            Guardar(dt);
        }

        protected void SetearTotales(DataTable dtCarrito)
        {
            float subTotal = 0;
            float costoDeEnvio = 1;
            float total = 0;

            subTotal = dtCarrito.Rows.Cast<DataRow>().Select(x => float.Parse(x.Field<string>("PrecioTotal"))).Sum();
            total = subTotal + costoDeEnvio;

            lblSubTotal.Text = subTotal.ToString();
            lblCostoEnvio.Text = costoDeEnvio.ToString();
            lblTotal.Text = total.ToString();
        }

        protected void Guardar(DataTable dtCarrito)
        {
            Venta venta = new Venta();
            List<VentaDetalle> lVentaDetalle = new List<VentaDetalle>();

            foreach (DataRow row in dtCarrito.Rows)
            {
                VentaDetalle vd = new VentaDetalle();
                vd.IdProducto = long.Parse(row["Id"].ToString());

                lVentaDetalle.Add(vd);
            }

            venta.VentasDetalle = lVentaDetalle;
        }
    }
}