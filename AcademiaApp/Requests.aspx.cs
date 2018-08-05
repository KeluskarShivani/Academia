using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace AcademiaApp
{
    public partial class Requests : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(Request.QueryString["del"]))
            {
                DeleteRequest();   
            }
            if (!string.IsNullOrEmpty(Request.QueryString["acp"])&&!string.IsNullOrEmpty(Request.QueryString["rf"]))
            {
                AcceptRequest();   
            }
        }

        public void DeleteRequest()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM T_FRIEND_REQUESTS WHERE FRND_REQ_ID='"+Request.QueryString["del"]+"'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Requests.aspx", false);
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
        public void AcceptRequest()
        {
            try
            {
                int Result = 0;
                using (SqlCommand cmd = new SqlCommand("UPDATE T_FRIEND_REQUESTS SET STATUS='Accepted',ACTION_TAKEN_ON='"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"' WHERE FRND_REQ_ID='" + Request.QueryString["acp"] + "'", conn))
                {
                    conn.Open();
                    Result= cmd.ExecuteNonQuery();
                    conn.Close();
               }
                //Add to notification
                string Remark = string.Empty;
                Remark = Common.UserDetails.GetFullNameByUserID(Convert.ToString(Session["USER_ID"])) + " is now friend with " + Common.UserDetails.GetFullNameByUserID(Request.QueryString["rf"]) + "'";
                if (Result>0)
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO T_NOTIFICATIONS VALUES('" + Guid.NewGuid().ToString() + "','" + Convert.ToString(Session["USER_ID"]) + "','" + Request.QueryString["rf"] + "','" + Remark.Replace("'", "''") + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)", conn))
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect("Requests.aspx", false);
                    }
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