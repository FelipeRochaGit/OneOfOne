﻿using OneOfOne.Core.Services;
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
    public partial class Productos : System.Web.UI.Page
    {
        IProductoService _productoService;

        public Productos()
        {
            _productoService = new ProductoService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtProductoGeneral = new DataTable();
            long idProducto;
            try
            {
                if (!IsPostBack)
                {
                    if (string.IsNullOrEmpty(Request.QueryString["IdProducto"]))
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        idProducto = long.Parse(Request["idProducto"].ToString());
                        dtProductoGeneral = _productoService.ObtenerProducto(idProducto);
                        DataTable dtFotos = _productoService.ObtenerFotosProducto(idProducto);
                        ValidarStockTalles(dtProductoGeneral);
                        VerProducto(dtProductoGeneral);
                        CargarFotosDelProducto(dtFotos);
                        DataTable dtCarrito = (DataTable)Session["dtCarrito"];
                        if (!string.IsNullOrEmpty(Request.QueryString["Agregar"]))
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "clientScript", "$(function (){" +
                           "$('[id$=btnCarrito]').click(); $('[id$=hfCantidadSeleccionada]').val(1) })", true);
                        }
                    }
                    
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void VerProducto(DataTable dtProductoGeneral)
        {
            Session["dtProductoGeneral"] = new DataTable(); //tabla que va a tener los 2 registros del producto (los 2 talles)
            string imgURL;
            string descripcion;
            string precio;

            try
            {
                imgURL = dtProductoGeneral.Rows[0]["ImgURL"].ToString();
                descripcion = dtProductoGeneral.Rows[0]["Descripcion"].ToString();
                precio = $"$ {dtProductoGeneral.Rows[0]["Precio"].ToString()}";
                imgProductoPC.ImageUrl = imgURL;


                lblDescripcion.Text = descripcion;
                lblPrecio.Text = precio;
                Session["dtProductoGeneral"] = dtProductoGeneral;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void CargarFotosDelProducto(DataTable dtFotos)
        {
            rpFotosProductosPC.DataSource = dtFotos;
            rpFotosProductosPC.DataBind();

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
            float Precio;
            float PrecioTotal;
            string talle;

            try
            {
                idProducto = long.Parse(dtProducto.Rows[0]["Id"].ToString());
                cantidad = int.Parse(dtProducto.Rows[0]["Cantidad"].ToString());
                talle = dtProducto.Rows[0]["Talle"].ToString();
                Precio= int.Parse(dtProducto.Rows[0]["Precio"].ToString());
                PrecioTotal =cantidad*Precio;
                //buscamos en el carrito el producto elegido y el talle
                var rowProducto = dtCarrito.Select($"Id = {idProducto} and Talle = {talle}");

                //si no encuentra ese producto y talle, mergeamos
                if (rowProducto.Length == 0)
                {
                    dtCarrito.Merge(dtProducto);
                }
                else //si el producto y talle ya estaban agregados, incrementamos la cantidad
                {
                    int c = int.Parse(rowProducto[0]["Cantidad"].ToString());
                    float pt = int.Parse(rowProducto[0]["PrecioTotal"].ToString());
                    float p = int.Parse(rowProducto[0]["Precio"].ToString());
                    c += cantidad;
                    rowProducto[0]["Cantidad"] = c;
                    //multiplicamos la columna cantidad por el precio individual y seteamos el precio total del articulo
                    pt = c * p;
                    rowProducto[0]["PrecioTotal"] = pt;
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
        /// <param name="dtProductoGeneral"></param>
        public void ValidarStockTalles(DataTable dtProductoGeneral)
        {
            int stockTalle1;
            int stockTalle2;

            try
            {
                stockTalle1 = int.Parse(dtProductoGeneral.Rows[0]["Stock"].ToString());
                stockTalle2 = int.Parse(dtProductoGeneral.Rows[1]["Stock"].ToString());

                chkTalle1.Enabled = stockTalle1 > 0;
                chkTalle2.Enabled = stockTalle2 > 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAgregarAlCarrito_Click(object sender, EventArgs e)
        {

            DataTable dtCarrito = (DataTable)Session["dtCarrito"]; //tabla general del carrito
            DataTable dtProductoGeneral = (DataTable)Session["dtProductoGeneral"]; //tabla del producto con los 2 rows de c/talle y su stock
            DataTable dtProductoIndividual = dtProductoGeneral.Clone(); //tabla que va a tener solamente el row del talle seleccionado
            try
            {

                //vemos que talle se selecciono
                var talleSeleccionado = chkTalle1.Checked ? "1" : "2";

                //de la tabla general filtramos por el talle seleccionado
                DataRow rowTalleElegido = dtProductoGeneral.Select($"Talle = {talleSeleccionado}")[0];

                //seteamos la tabla individual que va a tener solamente el row del talle seleccionado
                dtProductoIndividual.ImportRow(rowTalleElegido);

                //agregamos columna Cantidad y la seteamos
                dtProductoIndividual.Columns.Add("Cantidad");
                dtProductoIndividual.Rows[0]["Cantidad"] = hfCantidadSeleccionada.Value;
                //agregamos columna PrecioTotal (Precio*Cantidad) y la seteamos
                dtProductoIndividual.Columns.Add("PrecioTotal");
                float PrecioIndividual = float.Parse(dtProductoIndividual.Rows[0]["Precio"].ToString());
                dtProductoIndividual.Rows[0]["PrecioTotal"] = PrecioIndividual * Convert.ToInt32(hfCantidadSeleccionada.Value);




                //si el carrito es null copiamos directamente
                if (Session["dtCarrito"] == null)
                {
                    dtCarrito = new DataTable();
                    dtCarrito = dtProductoIndividual.Copy();
                }
                else //si ya existe validamos si el carrito ya tiene el producto seleccionado o no
                {
                    AgregarProducto(dtCarrito, dtProductoIndividual);
                }

                Session["dtCarrito"] = dtCarrito;
                var url = Request.Url.ToString();
                if (string.IsNullOrEmpty(Request.QueryString["Agregar"]))
                {
                    url += "&Agregar=True";
                }
                Response.Redirect(url);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}