using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Modelos
{
    public class Venta
    {
        public long Id { get; set; }
        public float ImporteTotal { get; set; }
        public DateTime Fecha { get; set; }
        public long IdEnvio { get; set; } 
        public List<VentaDetalle> VentasDetalle { get; set; }
    }
}
