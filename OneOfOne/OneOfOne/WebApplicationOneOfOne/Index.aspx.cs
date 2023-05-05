using OneOfOne.Core.Services;
using OneOfOne.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationOneOfOne
{
    public partial class Index : System.Web.UI.Page
    {
        private readonly IProductoService _productoService;

        public Index()
        {
            _productoService = new ProductoService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            try
            {
                if (!IsPostBack)
                {
                    dt = _productoService.Listar();
                    rpDestacados.DataSource = dt;
                    rpDestacados.DataBind();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}