using OneOfOne.Core.Daos;
using OneOfOne.Core.Daos.Interfaces;
using OneOfOne.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Services
{
    public class ProductoService : IProductoService
    {
        private IProductoDao _productoDao;

        public ProductoService()
        {
            _productoDao = new ProductoDao();
        }

        public DataTable Listar()
        {
            DataTable dt;
            try
            {
                dt = _productoDao.Listar();
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
            try
            {
                dt = _productoDao.ObtenerProducto(IdProducto);
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
            try
            {
                dt = _productoDao.ObtenerFotosProducto(IdProducto);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;        
        }
    }
}
