using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBConnection
{
    public interface IRepositoryBase
    {
        DataSet ListarSP(string nombreSP, List<SqlParameter> lParam = null, string connectionString = "DBConnection");
        void EjecutarSP(string nombreSP, List<SqlParameter> lParam = null, string connectionString = "DBConnection");

    }
}
