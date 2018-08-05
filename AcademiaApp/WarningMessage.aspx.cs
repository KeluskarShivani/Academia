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
    public partial class WarningMessage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            BindWarningMessage();
        }
        public void BindWarningMessage()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_REPORT_ABUSE WHERE SENT_TO='" + Convert.ToString(Session["USER_ID"]) + "' AND READ_ON IS NULL AND IS_DELETED=0", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                if (string.IsNullOrEmpty(lblWarningMessage.Text))
                                {
                                    lblWarningMessage.Text = ds.Tables[0].Rows[i]["WARNING_MSG"].ToString();
                                }
                                else
                                {
                                    lblWarningMessage.Text = ", " + ds.Tables[0].Rows[i]["WARNING_MSG"].ToString();
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE T_REPORT_ABUSE SET READ_ON='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE SENT_TO='" + Convert.ToString(Session["USER_ID"]) + "'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Home.aspx");
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