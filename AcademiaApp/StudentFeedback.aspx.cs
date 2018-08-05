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
    public partial class StudentFeedback : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateFeedbackRead();
            }
        }

        public void UpdateFeedbackRead()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE T_FEEDBACKS SET READ_ON='"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"' WHERE SENT_TO='"+Convert.ToString(Session["USER_ID"])+"'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
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