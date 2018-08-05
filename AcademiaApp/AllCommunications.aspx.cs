using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcademiaApp
{
    public partial class AllCommunications : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["comm"]))
            {
                DeleteCommunication();
            }
        }

        public void DeleteCommunication()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM T_COMMUNICATION WHERE COMMUNICATION_ID='"+Request.QueryString["comm"]+"'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("AllCommunications.aspx",false);
                }
            }
            catch (Exception e)
            {
                conn.Close();
            }
            finally
            {
                conn.Close();
            }
        }
    }
}