using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationOneOfOne
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dtCarrito = (DataTable)Session["dtCarrito"];
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Datos.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}