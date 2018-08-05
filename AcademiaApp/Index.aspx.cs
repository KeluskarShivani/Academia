using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AcademiaApp
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection conn=new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            txtLoginEmail.Focus();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string PrimaryID = Guid.NewGuid().ToString();
                using (SqlCommand cmd=new SqlCommand("INSERT INTO T_USERS VALUES('"+PrimaryID+"',N'"+txtFirstName.Text.Replace("'","''")+"',N'"+txtLastName.Text.Replace("'","''")+"','"+ddrGender.SelectedValue+"','"+txtEmail.Text.Replace("'","''")+"',N'"+txtPassword.Text.Replace("'","''")+"','"+ddrRegisterAs.SelectedValue+"','"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"',NULL,0)",conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["USER_ID"] = PrimaryID;
                    Session["ROLE"] = ddrRegisterAs.SelectedValue;
                    if (ddrRegisterAs.SelectedValue=="Student")
                    {
                        Response.Redirect("StudentProfile.aspx", false);        
                    }
                    else if (ddrRegisterAs.SelectedValue=="Teacher")
                    {
                        Response.Redirect("TeacherProfile.aspx", false);        
                    }
                    else
                    {
                        Response.Redirect("AdminProfile.aspx", false);        
                    }
                }
            }
            catch (Exception ex)
            {
                conn.Close();
                Response.Redirect("Error.aspx",false);
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM T_USERS WHERE EMAIL_ID='"+txtLoginEmail.Text.Replace("'","''")+"' AND PASSWORD='"+txtLoginPassword.Text.Replace("'","''")+"' AND IS_DELETED=0",conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Session["USER_ID"] = ds.Tables[0].Rows[0]["USER_ID"].ToString();
                            Session["ROLE"] = ds.Tables[0].Rows[0]["ROLE"].ToString();
                            if (ds.Tables[0].Rows[0]["ROLE"].ToString().ToUpper() == "STUDENT" || ds.Tables[0].Rows[0]["ROLE"].ToString().ToUpper() == "TEACHER")
                            {
                                using (SqlDataAdapter adChk=new SqlDataAdapter("SELECT * FROM T_REPORT_ABUSE WHERE SENT_TO='"+Convert.ToString(Session["USER_ID"])+"' AND READ_ON IS NULL",conn))
                                {
                                    using (DataSet dsChk=new DataSet())
                                    {
                                        adChk.Fill(dsChk);
                                        if (dsChk.Tables.Count > 0)
                                        {
                                            if (dsChk.Tables[0].Rows.Count > 0)
                                            {
                                                Response.Redirect("WarningMessage.aspx");
                                            }
                                            else
                                            {
                                                Response.Redirect("Home.aspx");
                                            }
                                        }
                                        else
                                        {
                                            Response.Redirect("Home.aspx");
                                        }
                                    }   
                                }
                            }
                            else if (ds.Tables[0].Rows[0]["ROLE"].ToString().ToUpper() == "ADMIN")
                            {
                                Response.Redirect("AdminHome.aspx");
                            }
                            else
                            {
                                Response.Redirect("Error.aspx", false);
                            }
                        }
                        else
                        {
                            lblLoginError.Text = "Invalid login";
                        }
                    }
                    else
                    {
                        lblLoginError.Text = "Invalid login";
                    }
                }
            }
        }
    }
}