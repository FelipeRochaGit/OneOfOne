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
            DataTable dtCarrito = (DataTable)Session["dtCarrito"];

            if (!IsPostBack)
            {
                float SubTotal = 0;
                if (dtCarrito != null)
                {
                    if (dtCarrito.Rows.Count > 0)
                    {
                        foreach (DataRow row in dtCarrito.Rows)
                        {
                            SubTotal += float.Parse(row["PrecioTotal"].ToString());
                        }
                        lblSubTotal.Text = SubTotal.ToString();
                        lblCarritoVacio.Text = "";
                        rpCarrito.DataSource = dtCarrito;
                        rpCarrito.DataBind();
                    }

                }
            }

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