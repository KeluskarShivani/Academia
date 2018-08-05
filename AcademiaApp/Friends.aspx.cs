using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AcademiaApp
{
    public partial class Friends : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["ROLE"])))
            {
                if (Convert.ToString(Session["ROLE"])=="Teacher")
                {
                    this.MasterPageFile = "~/Master/TeacherMaster.master";
                }
                if (Convert.ToString(Session["ROLE"])=="ADMIN")
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["sn"]))
                {
                    SendFriendRequestOnFly(Request.QueryString["sn"]);
                }
            }
        }

        public void SendFriendRequestOnFly(string UserID)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO T_FRIEND_REQUESTS VALUES('" + Guid.NewGuid().ToString() + "','" + Convert.ToString(Session["USER_ID"]) + "','" + Request.QueryString["sn"] + "','Pending','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,0)", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Friends.aspx",false);
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