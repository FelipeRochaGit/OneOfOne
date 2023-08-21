using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Models
{
    public class VentaDetalle
    {
        public long IdVenta { get; set; }
        public long IdVentaDetalle { get; set; }
        public long IdProducto { get; set; }
        public int Cantidad { get; set; }
        public float ImporteParcial { get; set; }
        public int EstadoVenta { get; set; }

    }
}
