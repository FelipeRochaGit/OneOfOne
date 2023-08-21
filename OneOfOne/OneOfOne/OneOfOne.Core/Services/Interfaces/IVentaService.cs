using OneOfOne.Core.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Services.Interfaces
{
    public interface IVentaService
    {
        DataSet Insert(DataSet dsCarrito);
        List<Venta> listarVenta();
    }
}
