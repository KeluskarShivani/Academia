using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Net;
namespace AcademiaApp
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetPassword_Click(object sender, EventArgs e)
        {
            try
            {
                string Name = string.Empty;
                string Password = string.Empty;
                
                using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM T_USERS WHERE EMAIL_ID='"+txtLoginEmail.Text+"'",conn))
                {
                    using (DataSet ds=new DataSet())
                    {
                        ad.Fill(ds);
                        if (ds.Tables.Count>0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Name = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                                Password =ds.Tables[0].Rows[0]["PASSWORD"].ToString();
                                var fromAddress = new MailAddress("ruiacs2017@gmail.com", "ruia, cs");
                                var toAddress = new MailAddress(txtLoginEmail.Text, Name);
                                const string fromPassword = "sem6project";
                                const string subject = "Academia - Your password";
                                string body = "<html><body style='margin:0px'><style>.link {text-decoration:none;color:navy;font-weight:bold;}.link:hover {text-decoration:none;color:#c22143;}";
                                body = body + "</style><table style='width:800px;height:300px;border-collapse:collapse;'>";
                                body = body + " <tr><td><p style='font-family:'Trebuchet MS''>Dear <b>" + Name + "</b>,<br /><br />Your assword for <b>'Academia'</b> is: <b>" + Password + "</b>";
                                body = body + "<br/><br/>Support,<br/>Academia.<br></p></td></tr><tr><td></td></tr></table></body></html>";

                                var smtp = new SmtpClient
                                {
                                    Host = "smtp.gmail.com",
                                    Port = 587,
                                    EnableSsl = true,
                                    DeliveryMethod = SmtpDeliveryMethod.Network,
                                    UseDefaultCredentials = false,
                                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                                };
                                using (var message = new MailMessage(fromAddress, toAddress)
                                {
                                    Subject = subject,
                                    Body = body,
                                    IsBodyHtml = true
                                })
                                {
                                    smtp.Send(message);

                                    txtLoginEmail.Text = "";

                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Redirecting..",
                                    "alert('Password sent to your registered E-mail.');window.location ='Index.aspx';", true);
                                }
                            }
                            else
                            {
                                lblError.Text = "No accound found";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: "+ex.Message;
            }
        }
    }
}