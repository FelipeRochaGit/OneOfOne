using OneOfOne.Core.Services;
using OneOfOne.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
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
            DataTable dtProducto = new DataTable();
            long idProducto;
            try
            {
                if (!IsPostBack)
                {
                    idProducto = long.Parse(Request["idProducto"].ToString());
                    dtProducto = _productoService.ObtenerProducto(idProducto);

                    //ValidarStockTalles(dtProducto);
                    VerProducto(dtProducto);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void VerProducto(DataTable dtProducto)
        {
            Session["dtProducto"] = new DataTable();
            string imgURL;
            string descripcion;
            string precio;

            try
            {
                dtProducto.Columns.Add("Cantidad"); //ver

                imgURL = dtProducto.Rows[0]["ImgURL"].ToString();
                descripcion = dtProducto.Rows[0]["Descripcion"].ToString();
                precio = $"$ {dtProducto.Rows[0]["Precio"].ToString()}";

                imgProducto.ImageUrl = imgURL;
                lblDescripcion.Text = descripcion;
                lblPrecio.Text = precio;

                Session["dtProducto"] = dtProducto;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Valida si el producto que se esta agregando existe en el carrito, si existe acumula la cantidad, si no existe mergea todo el row
        /// </summary>
        /// <param name="dtCarrito"></param>
        /// <param name="dtProducto"></param>
        public void AgregarProducto(DataTable dtCarrito, DataTable dtProducto)
        {
            long idProducto;
            int cantidad;
            bool existe = false;

            try
            {
                idProducto = long.Parse(dtProducto.Rows[0]["Id"].ToString());
                cantidad = int.Parse(dtProducto.Rows[0]["Cantidad"].ToString());

                //recorro los productos del carrito y busco el IdProducto que se esta queriendo agregar
                foreach (DataRow row in dtCarrito.Rows)
                {
                    long i = long.Parse(row["Id"].ToString());
                    int c = int.Parse(row["Cantidad"].ToString());

                    //si lo encuentro incremento la cantidad
                    if (i == idProducto)
                    {
                        c += cantidad;
                        row["Cantidad"] = c;
                        existe = true;
                    }
                }

                //si el producto no se encuentra en el carrito mergeo todo el row
                if (!existe)
                {
                    dtCarrito.Merge(dtProducto);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        /// <summary>
        /// Vemos si hay stock de los talles y habilitamos/deshabilitamos los checkbox de c/tallle
        /// </summary>
        /// <param name="dtProducto"></param>
        //public void ValidarStockTalles(DataTable dtProducto)
        //{
        //    int stockTalle1;
        //    int stockTalle2;

        //    try
        //    {
        //        stockTalle1 = int.Parse(dtProducto.Rows[0]["Stock"].ToString());
        //        stockTalle2 = int.Parse(dtProducto.Rows[1]["Stock"].ToString());

        //        chkTalle1.Enabled = stockTalle1 > 0;
        //        chkTalle2.Enabled = stockTalle2 > 0;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        protected void btnAgregarAlCarrito_Click(object sender, EventArgs e)
        {
            DataTable dtCarrito = (DataTable)Session["dtCarrito"];
            DataTable dtProducto = (DataTable)Session["dtProducto"];

            try
            {
                dtProducto.Rows[0]["Cantidad"] = txtCantidadProductos.Text;

                if (Session["dtCarrito"] == null)
                {
                    dtCarrito = new DataTable();
                    dtCarrito = dtProducto.Copy();
                }
                else
                {
                    AgregarProducto(dtCarrito, dtProducto);
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