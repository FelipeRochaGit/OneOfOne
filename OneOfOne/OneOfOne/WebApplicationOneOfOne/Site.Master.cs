using Newtonsoft.Json;
using OneOfOne.Core.Services;
using OneOfOne.Core.Services.Interfaces;
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

        protected void btnSuscribirMail_Click(object sender, EventArgs e)
        {
           IMasterService masterService = new MasterService();
            if (!masterService.registrarMail(txtMail.Text)){
                lblErrorMail.Text = "El email ingresado ya se encuentra suscrito";
            }
            
        }


        //protected void btnComprar_Click(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        Response.Redirect("Datos.aspx");
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}















    }






}