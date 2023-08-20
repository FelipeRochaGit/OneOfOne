using DBConnection;
using OneOfOne.Core.Daos.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneOfOne.Core.Daos
{
    public class MasterDao : RepositoryBase, IMasterDao
    {
        public bool registrarMail(string mail)
        {
            DataTable dt;
            List<SqlParameter> lParameter = new List<SqlParameter>();
            try
            {
                lParameter.Add(new SqlParameter("email", mail));
                dt = base.ListarSP("mail_suscribir", lParameter).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dt.Rows[0][0].ToString()=="ok";
        }
    }
}
