using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace AcademiaApp
{
    public partial class AddEducation : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["eid"]))
                {
                    BindEducation(Request.QueryString["eid"]);
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
                using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_EDUCATION_MASTER WHERE EDUCATION='" + txtEducation.Text.Replace("'", "''") + "'", conn))
                {
                    using (DataSet ds = new DataSet())
                    {
                        ad.Fill(ds);
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {

                            }
                            else
                            {
                                using (SqlCommand cmd = new SqlCommand("INSERT INTO T_EDUCATION_MASTER VALUES('" + Guid.NewGuid().ToString() + "','" + txtEducation.Text.Replace("'", "''") + "','" + Convert.ToString(Session["USER_ID"]) + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,NULL,0)", conn))
                                {
                                    conn.Open();
                                    cmd.ExecuteNonQuery();
                                    conn.Close();
                                    Response.Redirect("Masters.aspx", false);
                                }
                            }
                        }
                        else
                        {
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO T_EDUCATION_MASTER VALUES('" + Guid.NewGuid().ToString() + "','" + txtEducation.Text.Replace("'", "''") + "','" + Convert.ToString(Session["USER_ID"]) + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,NULL,0)", conn))
                            {
                                conn.Open();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                                Response.Redirect("Masters.aspx", false);
                            }
                        }
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_EDUCATION_MASTER WHERE EDUCATION='" + txtEducation.Text.Replace("'", "''") + "'", conn))
                {
                    using (DataSet ds = new DataSet())
                    {
                        ad.Fill(ds);
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {

                            }
                            else
                            {
                                using (SqlCommand cmd = new SqlCommand("UPDATE T_EDUCATION_MASTER SET EDUCATION='" + txtEducation.Text.Replace("'", "''") + " WHERE EDUCATION_ID='" + Request.QueryString["eid"] + "'')", conn))
                                {
                                    conn.Open();
                                    cmd.ExecuteNonQuery();
                                    conn.Close();
                                    Response.Redirect("Masters.aspx", false);
                                }
                            }
                        }
                        else
                        {
                            using (SqlCommand cmd = new SqlCommand("UPDATE T_EDUCATION_MASTER SET EDUCATION='" + txtEducation.Text.Replace("'", "''") + " WHERE EDUCATION_ID='" + Request.QueryString["eid"] + "'')", conn))
                            {
                                conn.Open();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                                Response.Redirect("Masters.aspx", false);
                            }
                        }
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
        public void BindEducation(string ID)
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_EDUCATION_MASTER WHERE EDUCATION_ID='" + ID + "'", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            txtEducation.Text = ds.Tables[0].Rows[0]["EDUCATION"].ToString();
                        }
                    }
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }
    }
}