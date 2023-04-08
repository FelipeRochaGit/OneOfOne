using OneOfOne.Core.Services;
using OneOfOne.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationOneOfOne
{
    public partial class Home : System.Web.UI.Page
    {
        private readonly IProductoService _productoService;

        public Home()
        {
            _productoService = new ProductoService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = _productoService.Listar();
                rpCatalogo.DataSource = dt;
                rpCatalogo.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void rpCatalogo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            long idProducto = long.Parse(e.CommandArgument.ToString());

            switch (e.CommandName)
            {
                case "VerProducto":
                    Response.Redirect($"Producto.aspx?IdProducto={idProducto}");
                    break;
                default:
                    break;
            }
        }
    }
}