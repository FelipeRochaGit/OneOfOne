using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebApplicationOneOfOne
{
    /// <summary>
    /// Descripción breve de WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        //[WebMethod(EnableSession = true)]
        //public void CargarCarrito()
        //{
        //    try
        //    {
        //        if (Session["dtCarrito"] != null)
        //        {
        //            rpCarrito.datasource = Session["dtCarrito"];
        //            rpCarrito.dataBind()
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        throw;
        //    }
            
        //}

        [WebMethod(EnableSession = true)]
        public void EliminarItem(string index)
        {
            try
            {
                string id = index.Split(',')[0];
                string talle = index.Split(',')[1];
                DataTable carrito = (DataTable)Session["dtCarrito"];
                DataRow rowProducto = carrito.Select($"Id = {id} and Talle = {talle}")[0];
                rowProducto.Delete();
                carrito.AcceptChanges();
                Session["dtcarrito"] = carrito;


            }
            catch (Exception ex)
            {
                throw;
            }
            
        }

        [WebMethod(EnableSession = true)]
        public void ActualizarCantidad(int index,int cantidad)
        {
            try
            {
                DataTable carrito = (DataTable)Session["dtCarrito"];
                carrito.Rows[index]["cantidad"] = cantidad;
                carrito.AcceptChanges();
                Session["carrito"] = carrito;

            }
            catch (Exception ex)
            {

                throw;
            }
            
        }
    }
}
