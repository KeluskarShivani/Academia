using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcademiaApp
{
    public partial class TeacherFeedback : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFriendList();
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

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkListFriends.Items.Count > 0)
                {
                    for (int i = 0; i < chkListFriends.Items.Count; i++)
                    {
                        if (chkListFriends.Items[i].Selected)
                        {
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO T_FEEDBACKS VALUES('" + Guid.NewGuid().ToString() + "','" + Convert.ToString(Session["USER_ID"]) + "','" + chkListFriends.Items[i].Value + "',N'"+txtMessage.Text.Replace("'","''")+"','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,0)", conn))
                            {
                                conn.Open();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
                    }
                    txtMessage.Text = "";
                    lblError.Text = "Feedback sent.";
                    BindFriendList();
                    //Refresh List
                    listFeedback.DataSourceID = "SqlDataSourceFeedback";
                    listFeedback.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}