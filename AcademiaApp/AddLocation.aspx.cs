using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace AcademiaApp
{
    public partial class AddLocation : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["eid"]))
                {
                    BindLocation(Request.QueryString["eid"]);
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
                using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM T_LOCATION_MASTER WHERE LOCATION='"+txtLocation.Text.Replace("'","''")+"'",conn))
                {
                    using (DataSet ds=new DataSet())
                    {
                        ad.Fill(ds);
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {

                            }
                            else
                            {
                                using (SqlCommand cmd = new SqlCommand("INSERT INTO T_LOCATION_MASTER VALUES('" + Guid.NewGuid().ToString() + "','" + txtLocation.Text.Replace("'", "''") + "','" + Convert.ToString(Session["USER_ID"]) + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,NULL,0)", conn))
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
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO T_LOCATION_MASTER VALUES('" + Guid.NewGuid().ToString() + "','" + txtLocation.Text.Replace("'", "''") + "','" + Convert.ToString(Session["USER_ID"]) + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,NULL,0)", conn))
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Masters.aspx");
        }

        public void BindLocation(string ID)
        {
            using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM T_LOCATION_MASTER WHERE LOCATION_ID='"+ID+"'",conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count>0)
                    {
                        if (ds.Tables[0].Rows.Count>0)
                        {
                            txtLocation.Text = ds.Tables[0].Rows[0]["LOCATION"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_LOCATION_MASTER WHERE LOCATION='" + txtLocation.Text.Replace("'", "''") + "'", conn))
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
                                using (SqlCommand cmd = new SqlCommand("UPDATE T_LOCATION_MASTER SET LOCATION='"+txtLocation.Text.Replace("'","''")+" WHERE LOCATION_ID='"+Request.QueryString["eid"]+"'')", conn))
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
                            using (SqlCommand cmd = new SqlCommand("UPDATE T_LOCATION_MASTER SET LOCATION='" + txtLocation.Text.Replace("'", "''") + " WHERE LOCATION_ID='" + Request.QueryString["eid"] + "'')", conn))
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
    }
}