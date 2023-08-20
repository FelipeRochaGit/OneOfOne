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
                GuardarDatos(dt);
            }
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            var a = 0;
        }

        protected void SetearTotales(DataTable dtCarrito)
        {
            float subTotal = 0;
            float costoDeEnvio = 1;
            float total = 0;

            //hacer con linQ
            foreach (DataRow row in dtCarrito.Rows)
            {
                subTotal += float.Parse(row["PrecioTotal"].ToString());
            }

            total = subTotal + costoDeEnvio;

            lblSubTotal.Text = subTotal.ToString();
            lblCostoEnvio.Text = costoDeEnvio.ToString();
            lblTotal.Text = total.ToString();
        }

        protected void GuardarDatos(DataTable dtCarrito)
        {
            List<VentaDetalle> lVentaDetalle = new List<VentaDetalle>();

            foreach (DataRow row in dtCarrito.Rows)
            {
                VentaDetalle vd = new VentaDetalle();
                vd.IdProducto = 123;

                lVentaDetalle.Add(vd
                    );
            }
        }
    }
}