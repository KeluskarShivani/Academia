using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AcademiaApp
{
    public partial class Messages : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                BindFriendList();
                UpdateMessageRead();
            }
        }


        public void BindFriendList()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT REQ_FROM,(FIRST_NAME+' '+LAST_NAME) AS FULL_NAME FROM T_FRIEND_REQUESTS FR,T_USERS UD WHERE FR.REQ_FROM=UD.USER_ID AND REQ_TO='" + Convert.ToString(Session["USER_ID"]) + "' AND STATUS='Accepted' UNION SELECT REQ_TO,(FIRST_NAME+' '+LAST_NAME) AS FULL_NAME FROM T_FRIEND_REQUESTS FR,T_USERS UD  WHERE FR.REQ_TO=UD.USER_ID AND REQ_FROM='" + Convert.ToString(Session["USER_ID"]) + "' AND STATUS='Accepted' ORDER BY FULL_NAME", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            chkListFriends.DataSource = ds;
                            chkListFriends.DataTextField = "FULL_NAME";
                            chkListFriends.DataValueField = "REQ_FROM";
                            chkListFriends.DataBind();
                        }
                        else
                        {
                            chkListFriends.DataSource = null;
                            chkListFriends.DataBind();
                        }
                    }
                    else
                    {
                        chkListFriends.DataSource = null;
                        chkListFriends.DataBind();
                    }
                }
            }
        }
        public void UpdateMessageRead()
        {
            using (SqlCommand cmd=new SqlCommand("UPDATE T_COMMUNICATION SET READ_ON='"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"' WHERE READ_ON IS NULL AND SENT_TO='"+Convert.ToString(Session["USER_ID"])+"'",conn))
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                bool SendFlag = false;
                if (chkListFriends.Items.Count>0)
                {
                    for (int i = 0; i < chkListFriends.Items.Count; i++)
                    {
                        if (chkListFriends.Items[i].Selected)
                        {
                            using (SqlCommand cmd=new SqlCommand("INSERT INTO T_COMMUNICATION VALUES('"+Guid.NewGuid().ToString()+"','"+Convert.ToString(Session["USER_ID"])+"','"+chkListFriends.Items[i].Value+"','"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"',NULL,'"+txtMessage.Text.Replace("'","''")+"',0)",conn))
                            {
                                conn.Open();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                                SendFlag = true;
                            }
                        }
                    }
                    if (SendFlag)
                    {
                        txtMessage.Text = "";
                        lblError.Text = "Message sent";
                        BindFriendList();
                    }
                    else
                    {
                        lblError.Text = "Please select atleast one member.";
                    }
                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}