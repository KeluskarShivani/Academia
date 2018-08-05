using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AcademiaApp
{
    public partial class Masters : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rdLocation.Checked = true;
                divLocation.Visible = true;
            }
            if (rdLocation.Checked)
            {
                divLocation.Visible = true;
                divEducation.Visible = false;
                divAdmin.Visible = false;
                GetLocations();
            }
            if (rdEducation.Checked)
            {
                divLocation.Visible = false;
                divEducation.Visible = true;
                divAdmin.Visible = false;
                GetEducations();
            }
            if (rdAdmin.Checked)
            {
                divLocation.Visible = false;
                divEducation.Visible = false;
                divAdmin.Visible = true;
                GetAdmin();
            }
        }

        protected void btnAddnewLocation_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddLocation.aspx");
        }

        protected void btnAddNewEducation_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEducation.aspx");
        }
        public void GetAdmin()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_USERS WHERE ROLE='ADMIN' AND IS_DELETED=0", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            gridAdminData.DataSource = ds;
                            gridAdminData.DataBind();
                        }
                        else
                        {
                            gridAdminData.DataSource = null;
                            gridAdminData.DataBind();
                        }
                    }
                    else
                    {
                        gridAdminData.DataSource = null;
                        gridAdminData.DataBind();
                    }
                }
            }
        }
        public void GetLocations()
        {
            using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM T_LOCATION_MASTER WHERE IS_DELETED=0",conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            gridLocation.DataSource = ds;
                            gridLocation.DataBind();
                        }
                        else
                        {
                            gridLocation.DataSource = null;
                            gridLocation.DataBind();
                        }
                    }
                    else
                    {
                        gridLocation.DataSource = null;
                        gridLocation.DataBind();
                    }
                }
            }
        }
        public void GetEducations()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_EDUCATION_MASTER WHERE IS_DELETED=0", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            gridEducation.DataSource = ds;
                            gridEducation.DataBind();
                        }
                        else
                        {
                            gridEducation.DataSource = null;
                            gridEducation.DataBind();
                        }
                    }
                    else
                    {
                        gridEducation.DataSource = null;
                        gridEducation.DataBind();
                    }
                }
            }
        }

        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAdmin.aspx");
        }
    }
}