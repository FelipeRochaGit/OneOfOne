using OneOfOne.Core.Daos;
using OneOfOne.Core.Daos.Interfaces;
using OneOfOne.Core.Models;
using OneOfOne.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Xsl;

namespace OneOfOne.Core.Services
{
    public class VentaService : IVentaService
    {
        private IVentaDao _ventaDao;

        public VentaService() 
        {
            _ventaDao = new VentaDao();
        }

        public DataSet Insert(DataSet dsCarrito)
        {
            DataSet ds = new DataSet();

            try
            {
                _ventaDao.Insert(dsCarrito);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ds;
        }

        public List<Venta> listarVenta()
        {
            return new List<Venta>();
        }
    }
}
