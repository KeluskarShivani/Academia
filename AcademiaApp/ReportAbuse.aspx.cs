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
    public partial class ReportAbuse : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                BindUserList();
            }
        }
        public void BindUserList()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT *,(FIRST_NAME+' '+LAST_NAME)AS FULL_NAME FROM T_USERS WHERE ROLE!='ADMIN' AND IS_DELETED=0 ORDER BY FIRST_NAME,LAST_NAME", conn))
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
                            chkListFriends.DataValueField = "USER_ID";
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
                bool SendFlag = false;
                if (chkListFriends.Items.Count > 0)
                {
                    for (int i = 0; i < chkListFriends.Items.Count; i++)
                    {
                        if (chkListFriends.Items[i].Selected)
                        {
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO T_REPORT_ABUSE VALUES('" + Guid.NewGuid().ToString() + "','" + Convert.ToString(Session["USER_ID"]) + "','" + chkListFriends.Items[i].Value + "','" + txtMessage.Text.Replace("'", "''") + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,0)", conn))
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
                        lblError.Text = "Warning sent.";
                        BindUserList();
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