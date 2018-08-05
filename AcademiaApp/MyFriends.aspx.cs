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
    public partial class MyFriends : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(Request.QueryString["un"]))
            {
                Unfriend();
            }
        }

        public void Unfriend()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM T_FRIEND_REQUESTS WHERE FRND_REQ_ID='" + Request.QueryString["un"] + "'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("MyFriends.aspx", false);
                }
            }
            catch (Exception ex)
            {
                conn.Close();
                Response.Redirect("Error.aspx", false);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}