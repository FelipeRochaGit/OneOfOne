using OneOfOne.Core.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.CompilerServices;
using OneOfOne.Core.Services.Interfaces;
using OneOfOne.Core.Services;

namespace WebApplicationOneOfOne
{
    public partial class Datos : System.Web.UI.Page
    {
        IVentaService _ventaService;

        public Datos()
        {
            _ventaService = new VentaService();
        }

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
            try
            {
                DataSet dsCarrito = new DataSet("ds");
                dtCarrito.TableName = "dt";
                dsCarrito.Tables.Add(dtCarrito.Copy()); //TODO

                _ventaService.Insert(dsCarrito);

                Session["dtCarrito"] = null; //TODO
                Response.Redirect("Index.aspx"); //TODO
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}