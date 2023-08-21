using DBConnection;
using OneOfOne.Core.Daos.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Daos
{
    public class ProductoDao : RepositoryBase, IProductoDao
    {
        public DataTable Listar()
        {
            DataTable dt;

            try
            {
                dt = ListarSP("Productos_Listar").Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dt;
        }

        public DataTable ObtenerProducto(long IdProducto)
        {
            DataTable dt;
            List<SqlParameter> lParameter = new List<SqlParameter>();
            try
            {
                lParameter.Add(new SqlParameter("IdProducto", IdProducto));
                dt = base.ListarSP("Producto_Obtener", lParameter).Tables[0];            
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            return dt;
        }
        public DataTable ObtenerFotosProducto(long IdProducto)
        {
            DataTable dt;
            List<SqlParameter> lParameter = new List<SqlParameter>();
            try
            {
                lParameter.Add(new SqlParameter("IdProducto", IdProducto));
                dt = base.ListarSP("FotosProducto_Obtener", lParameter).Tables[0];            
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dt;
        }
    }
}
