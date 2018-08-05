using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AcademiaApp.Common
{
    public static class UserDetails
    {
        static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

        public static string GetFullNameByUserID(string UserID)
        {
            string FullName = string.Empty;

            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_USERS WHERE USER_ID='"+UserID+"'", conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count>0)
                    {
                        if (ds.Tables[0].Rows.Count>0)
                        {
                            FullName = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                        }
                    }
                }
            }
            return FullName;
        }
    }
}