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
    public partial class Producto : System.Web.UI.Page
    {
        IProductoService _productoService;

        public Producto()
        {
            _productoService = new ProductoService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    VerProducto();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void VerProducto()
        {
            Session["dtProducto"] = new DataTable();
            DataTable dt = new DataTable();
            long idProducto;
            string imgURL; 
            try
            {
                idProducto = long.Parse(Request["IdProducto"].ToString());
                dt = _productoService.ObtenerProducto(idProducto);

                imgURL =dt.Rows[0]["ImgURL"].ToString();
                imgProducto.ImageUrl = imgURL;
                Session["dtProducto"] = dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAgregarAlCarrito_Click(object sender, EventArgs e)
        {
            DataTable dtCarrito = (DataTable)Session["dtCarrito"];
            DataTable dtProducto = (DataTable)Session["dtProducto"];
            try
            {
                if(Session["dtCarrito"] == null)
                {
                    dtCarrito = new DataTable();
                    dtCarrito = dtProducto;
                }
                else
                {
                    dtCarrito.Merge(dtProducto);
                }

                Session["dtCarrito"] = dtCarrito;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}