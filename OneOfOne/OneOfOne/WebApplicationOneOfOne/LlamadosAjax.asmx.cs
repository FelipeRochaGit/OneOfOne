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

        //[WebMethod(Enable
        //= true)]
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
        public string EliminarItem(string index)
        {
            try
            {
                string id = index.Split(',')[0];
                string talle = index.Split(',')[1];
                float Total = 0;
                DataTable carrito = (DataTable)Session["dtCarrito"];
                DataRow rowProducto = carrito.Select($"Id = {id} and Talle = {talle}")[0];
                rowProducto.Delete();
                carrito.AcceptChanges();
                Session["dtcarrito"] = carrito;
                if (((DataTable)Session["dtcarrito"]).Rows.Count > 0)
                {
                    foreach (DataRow row in carrito.Rows)
                    {
                        Total += float.Parse(row["PrecioTotal"].ToString());
                    }
                    return Total.ToString();
                }
                else
                {
                    return "Carrito Vacio";
                }


            }
            catch (Exception ex)
            {
                throw;
            }
            
        }

        [WebMethod(EnableSession = true)]
        public string ActualizarCantidad(string index,int cantidad,int precio)
        {
            try
            {
                string id = index.Split(',')[0];
                string talle = index.Split(',')[1];
                float Total = 0;
                DataTable carrito = (DataTable)Session["dtCarrito"];
                DataRow rowProducto = carrito.Select($"Id = {id} and Talle = {talle}")[0];
                rowProducto["cantidad"] = cantidad;
                rowProducto["PrecioTotal"] = cantidad * precio;
                Session["carrito"] = carrito;
                foreach (DataRow row in carrito.Rows)
                {
                     Total+= float.Parse(row["PrecioTotal"].ToString());
                }
                return Total.ToString();
                
            }
            catch (Exception ex)
            {

                throw;
            }
            
        }
    }
}
