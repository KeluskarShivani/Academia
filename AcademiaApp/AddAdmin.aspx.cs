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
    public partial class AddAdmin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["eid"]))
                {
                    BindAdmin(Request.QueryString["eid"]);
                }
            }
            if (!string.IsNullOrEmpty(Request.QueryString["eid"]))
            {
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            else
            {
                btnSave.Visible = true;
                btnUpdate.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string PrimaryID = Guid.NewGuid().ToString();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO T_USERS VALUES('" + PrimaryID + "',N'" + txtFirstName.Text.Replace("'", "''") + "',N'" + txtLastName.Text.Replace("'", "''") + "','" + ddrGender.SelectedValue + "','" + txtEmail.Text.Replace("'", "''") + "',N'" + txtPassword.Text.Replace("'", "''") + "','Admin','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,0)", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["USER_ID"] = PrimaryID;
                    Session["ROLE"] = "Admin";
                    Response.Redirect("Masters.aspx", false);
                }
            }
            catch (Exception ex)
            {
                conn.Close();
                Response.Redirect("Error.aspx", false);
            }
        }
        public void BindAdmin(string ID)
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_USERS WHERE USER_ID='" + ID + "'", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            txtFirstName.Text = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString();
                            txtLastName.Text = ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                            txtEmail.Text = ds.Tables[0].Rows[0]["EMAIL_ID"].ToString();
                            txtPassword.Text = ds.Tables[0].Rows[0]["PASSWORD"].ToString();
                            txtConfirmPassword.Text = ds.Tables[0].Rows[0]["PASSWORD"].ToString();
                            ddrGender.SelectedValue = ds.Tables[0].Rows[0]["GENDER"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
               using (SqlCommand cmd = new SqlCommand("UPDATE T_USERS SET FIRST_NAME='" + txtFirstName.Text.Replace("'", "''") + "',LAST_NAME='" + txtLastName.Text.Replace("'", "''") + "',EMAIL_ID='" + txtEmail.Text.Replace("'", "''") + "',PASSWORD='" + txtConfirmPassword.Text.Replace("'", "''") + "',GENDER='" + ddrGender.SelectedValue + "' WHERE USER_ID='" + Request.QueryString["eid"] + "'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Masters.aspx", false);
                }

            }
            catch (Exception ex)
            {
                conn.Close();
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }
    }
}