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
    public class VentaDao : RepositoryBase, IVentaDao
    {
        public DataSet Insert(DataSet dsCarrito)
        {
			DataSet ds = new DataSet();
			List<SqlParameter> lParam = new List<SqlParameter>();

			try
			{
				lParam.Add(new SqlParameter("@VentasDetalleXml", dsCarrito.GetXml()));
				ds = base.ListarSP("Venta_Insert", lParam);
			}
			catch (Exception)
			{

				throw;
			}

			return ds;
        }
    }
}
