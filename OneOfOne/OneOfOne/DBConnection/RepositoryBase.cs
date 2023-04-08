using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBConnection
{
    public class RepositoryBase : IRepositoryBase
    {
        #region StoredProcedures

        public DataSet ListarSP(string nombreSP, List<SqlParameter> lParam = null, string connectionString = "DBConnection")
        {
            DataSet dataSet = new DataSet();
            SqlCommand sqlCommand = new SqlCommand();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter();

            try
            {
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = nombreSP;

                if(lParam != null)
                {
                    foreach (SqlParameter param in lParam)
                    {
                        sqlCommand.Parameters.Add(param);
                    }
                }

                using (SqlConnection connection = new SqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionString].ToString();
                    sqlCommand.Connection = connection;
                    sqlAdapter = new SqlDataAdapter(sqlCommand);
                    connection.Open();
                    //_MessageError = string.Empty; //TODO
                    //connection.InfoMessage += cn_InfoMessage; //TODO
                    sqlAdapter.Fill(dataSet);
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlCommand.Dispose();
            }

            return dataSet;
        }
        public void EjecutarSP(string nombreSP, List<SqlParameter> lParam, string connectionString = "DBConnection")
        {
            SqlCommand sqlCommand = new SqlCommand();
            SqlDataAdapter sqlAdapter = new SqlDataAdapter();

            try
            {
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = nombreSP;

                foreach (SqlParameter param in lParam)
                {
                    sqlCommand.Parameters.Add(param);
                }

                using (SqlConnection connection = new SqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionString].ToString();
                    sqlCommand.Connection = connection;
                    sqlAdapter = new SqlDataAdapter(sqlCommand);
                    connection.Open();
                    //_MessageError = string.Empty; //TODO
                    //connection.InfoMessage += cn_InfoMessage; //TODO
                    //sqlAdapter.exe
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlCommand.Dispose();
            }
        }

        #endregion
    }
}
