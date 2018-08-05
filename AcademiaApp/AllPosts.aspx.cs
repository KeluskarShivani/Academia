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
    public partial class AllPosts : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["dp"]))
            {
                DeletePost();
            }
        }
        //Hard Delete
        public void DeletePost()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM T_POSTS WHERE POST_ID='"+Request.QueryString["dp"]+"'",conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                conn.Close();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void listPosts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}