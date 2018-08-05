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
    public partial class AllContents : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["con"]))
            {
                DeleteContent();
            }
        }
        //Hard delete
        public void DeleteContent()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM T_CONTENTS WHERE CONTENT_ID='" + Request.QueryString["con"] + "'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("AllContents.aspx", false);
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
    }
}