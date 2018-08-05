using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AcademiaApp
{
    public partial class TeacherProfile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEducation();
                BindLocation();
                if (!string.IsNullOrEmpty(Request.QueryString["ref"]))
                {
                    trProfilePhoto.Visible = false;
                    trProfilePhotoUpload.Visible = true;
                    BindProfileForEdit(Request.QueryString["ref"]);
                }
                else
                {
                    btnUpdate.Visible = false;
                    btnSave.Visible = true;
                    trProfilePhoto.Visible = true;
                    trProfilePhotoUpload.Visible = false;
                }
            }
        }
        public void BindEducation()
        {
            using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM T_EDUCATION_MASTER WHERE IS_DELETED=0",conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count>0)
                    {
                        if (ds.Tables[0].Rows.Count>0)
                        {
                            ddrEducation.Items.Clear();
                            ddrEducation.Items.Add("Select");
                            ddrEducation.AppendDataBoundItems = true;
                            ddrEducation.DataSource = ds;
                            ddrEducation.DataTextField = "Education";
                            ddrEducation.DataValueField = "Education_ID";
                            ddrEducation.DataBind();
                        }
                    }
                }                
            }
        }
        public void BindLocation()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_LOCATION_MASTER WHERE IS_DELETED=0", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ddrLocation.Items.Clear();
                            ddrLocation.Items.Add("Select");
                            ddrLocation.AppendDataBoundItems = true;
                            ddrLocation.DataSource = ds;
                            ddrLocation.DataTextField = "Location";
                            ddrLocation.DataValueField = "Location_ID";
                            ddrLocation.DataBind();
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string FilePath = string.Empty;
                string[] FileName = new string[2];
                if (fileProfilePhoto.HasFile)
                {
                    FileName = fileProfilePhoto.FileName.Split('.');
                    FilePath = "~/Content/" + Guid.NewGuid().ToString() + "." + FileName[1];
                    fileProfilePhoto.PostedFile.SaveAs(Server.MapPath(FilePath));
                    string DOB = txtYear.Text + "-" + ddrMonth.SelectedValue + "-" + ddrDate.Text;
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO T_BASIC_DETAILS VALUES('" + Guid.NewGuid().ToString() + "','" + Convert.ToString(Session["USER_ID"]) + "','" + DOB + "','" + ddrEducation.SelectedValue + "','" + ddrLocation.SelectedValue + "','" + FilePath + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',NULL,'"+DOB+"')", conn))
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {

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
        public void BindProfileForEdit(string UserID)
        {
            trPassword.Visible = true;
            btnSave.Visible = false;
            string DOB = string.Empty;
            using (SqlDataAdapter ad = new SqlDataAdapter("select * from T_USERS UD,T_BASIC_DETAILS BD WHERE UD.USER_ID=BD.USER_ID AND UD.USER_ID='" + UserID + "'", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            DOB = ds.Tables[0].Rows[0]["DOB_STR"].ToString();
                            string[] splitDateOfBirth = DOB.Split('-');
                            ddrDate.SelectedValue = splitDateOfBirth[2];
                            ddrMonth.SelectedValue = splitDateOfBirth[1];
                            txtYear.Text = splitDateOfBirth[0];
                            ddrEducation.SelectedValue = ds.Tables[0].Rows[0]["EDUCATION_ID"].ToString();
                            ddrLocation.SelectedValue = ds.Tables[0].Rows[0]["LOCATION_ID"].ToString();
                            txtPassword.Text = ds.Tables[0].Rows[0]["PASSWORD"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string FilePath = string.Empty;
                string[] FileName = new string[2];
                if (fileProfilePhotoUpload.HasFile)
                {
                    FileName = fileProfilePhotoUpload.FileName.Split('.');
                    FilePath = "~/Content/" + Guid.NewGuid().ToString() + "." + FileName[1];
                    fileProfilePhotoUpload.PostedFile.SaveAs(Server.MapPath(FilePath));
                    string DOB = txtYear.Text + "-" + ddrMonth.SelectedValue + "-" + ddrDate.Text;
                    using (SqlCommand cmd = new SqlCommand("UPDATE T_BASIC_DETAILS SET DOB='" + DOB + "',DOB_STR='" + DOB + "',EDUCATION_ID='" + ddrEducation.SelectedValue + "',LOCATION_ID='" + ddrLocation.SelectedValue + "',PROFILE_PHOTO_URL='" + FilePath + "',MODIFIED_ON='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE USER_ID='" + Request.QueryString["ref"] + "'", conn))
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("UPDATE T_USERS SET PASSWORD='" + txtPassword.Text.Replace("'", "''") + "' WHERE USER_ID='" + Request.QueryString["ref"] + "'", conn))
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    Response.Redirect("Home.aspx", false);
                }
                else
                {
                    string DOB = txtYear.Text + "-" + ddrMonth.SelectedValue + "-" + ddrDate.Text;
                    using (SqlCommand cmd = new SqlCommand("UPDATE T_BASIC_DETAILS SET DOB='" + DOB + "',DOB_STR='" + DOB + "',EDUCATION_ID='" + ddrEducation.SelectedValue + "',LOCATION_ID='" + ddrLocation.SelectedValue + "',MODIFIED_ON='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE USER_ID='" + Request.QueryString["ref"] + "'", conn))
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("UPDATE T_USERS SET PASSWORD='" + txtPassword.Text.Replace("'", "''") + "' WHERE USER_ID='" + Request.QueryString["ref"] + "'", conn))
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    Response.Redirect("Home.aspx", false);
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