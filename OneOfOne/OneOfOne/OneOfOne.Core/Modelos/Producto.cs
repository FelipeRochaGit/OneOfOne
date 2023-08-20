using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Modelos
{
    public class Producto
    {
        public string IdCategoria { get; set; }
        public string Descripcion { get; set; }
        public string Costo { get; set; }
        public string Precio { get; set; }
        public string FechaAlta { get; set; }
        public string FechaModificacion { get; set; }
        public string ImgURL { get; set; }
        public string IdEstado { get; set; }
    }
}
