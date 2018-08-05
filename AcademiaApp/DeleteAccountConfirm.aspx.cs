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
    public partial class DeleteAccountConfirm : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["ROLE"])))
            {
                if (Convert.ToString(Session["ROLE"]) == "Teacher")
                {
                    this.MasterPageFile = "~/Master/TeacherMaster.master";
                }
                if (Convert.ToString(Session["ROLE"]) == "ADMIN")
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE T_USERS SET IS_DELETED=1 WHERE USER_ID='" + Convert.ToString(Session["USER_ID"]) + "'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session.Clear();
                    Session.RemoveAll();
                    Session.Abandon();
                    Response.Redirect("Index.aspx");
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}