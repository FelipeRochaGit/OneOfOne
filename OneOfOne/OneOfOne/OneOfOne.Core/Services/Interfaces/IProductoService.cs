using OneOfOne.Core.Daos.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Services.Interfaces
{
    public interface IProductoService
    {
        DataTable Listar();
        DataTable ObtenerProducto(long IdProducto);
        DataTable ObtenerFotosProducto(long idProducto);
    }
}
