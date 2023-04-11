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

        [WebMethod(EnableSession = true)]
        public string CargarCarrito()
        {
            try
            {
                if (Session["dtCarrito"] != null)
                {

                
                string jsonString = JsonConvert.SerializeObject(Session["dtCarrito"]);
                return jsonString;
                }
            }
            catch (Exception ex)
            {
                
                throw;
            }
            return JsonConvert.SerializeObject("");
        }
        
        [WebMethod(EnableSession = true)]
        public string EliminarItem(string itemIndex)
        {
            try
            {
                int index=Convert.ToInt32(itemIndex.ToString());
                DataTable carrito = (DataTable)Session["dtCarrito"];
                carrito.Rows[index].Delete();
                carrito.AcceptChanges();
                Session["carrito"] = carrito;
                return CargarCarrito();


            }
            catch (Exception ex)
            {

                throw;
            }
            
        }
    }
}
