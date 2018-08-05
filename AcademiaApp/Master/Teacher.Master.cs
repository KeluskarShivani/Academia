using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AcademiaApp.Master
{
    public partial class Teacher: System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["USER_ID"])))
            {
                Response.Redirect("Index.aspx");
            }
        }
    }
}