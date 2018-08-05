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
    public partial class MyContents : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["ROLE"])))
            {
                if (Convert.ToString(Session["ROLE"]) == "Teacher")
                {
                    this.MasterPageFile = "~/Master/TeacherMaster.master";
                }
                if (Convert.ToString(Session["ROLE"]) == "ADMIN")
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["con"]))
            {
                DeleteContent();
            }
        }
        public void DeleteContent()
        {
            try
            {
                using (SqlCommand cmd=new SqlCommand("DELETE FROM T_CONTENTS WHERE CONTENT_ID='"+Request.QueryString["con"]+"' AND SHARED_BY='"+Convert.ToString(Session["USER_ID"])+"'",conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("MyContents.aspx");
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
        protected void btnShare_Click(object sender, EventArgs e)
        {
            try
            {
                string fileType = string.Empty;
                string fileName = string.Empty;
                string filePath = string.Empty;
                if (fileUpload.HasFile)
                {
                    string[] splitName = new string[2];
                    fileName = fileUpload.FileName;
                    splitName = fileUpload.FileName.Split('.');
                    filePath = "./Content/" + Guid.NewGuid().ToString() + "." + splitName[1];
                    if (splitName[1].ToLower() == "jpeg" || splitName[1].ToLower() == "png" || splitName[1].ToLower() == "gif" || splitName[1].ToLower() == "jpg")
                    {
                        fileType = "IMAGE";
                    }
                    else if (splitName[1].ToLower() == "pdf")
                    {
                        fileType = "PDF";
                    }
                    else if (splitName[1].ToLower() == "xls" || splitName[1].ToLower() == "xlsx")
                    {
                        fileType = "EXCEL";
                    }
                    else if (splitName[1].ToLower() == "doc" || splitName[1].ToLower() == "docx")
                    {
                        fileType = "DOCUMENT";
                    }
                    else if (splitName[1].ToLower() == "doc" || splitName[1].ToLower() == "PPT")
                    {
                        fileType = "PPT";
                    }
                    else if (splitName[1].ToLower() == "mp3" || splitName[1].ToLower() == "mp4" || splitName[1].ToLower() == "avi" || splitName[1].ToLower() == "exe" || splitName[1].ToLower() == "dll" || splitName[1].ToLower() == "zip" || splitName[1].ToLower() == "vob" || splitName[1].ToLower() == "mpeg" || splitName[1].ToLower() == "cs" || splitName[1].ToLower() == "aspx" || splitName[1].ToLower() == "html" || splitName[1].ToLower() == "css")
                    {
                        lblError.Text = "File type not supported";
                        return;
                    }
                    fileUpload.PostedFile.SaveAs(Server.MapPath(filePath));

                    using (SqlCommand cmd = new SqlCommand("INSERT INTO T_CONTENTS VALUES('" + Guid.NewGuid().ToString() + "','" + Convert.ToString(Session["USER_ID"]) + "','" + fileName + "','" + fileType + "','" + filePath + "',N'" + txtRemark.Text.Replace("'", "''") + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0,0)", conn))
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        txtRemark.Text = "";
                        //Refresh listview with new post.
                        listContents.DataSourceID = "SqlDataSourceContents";
                        listContents.DataBind();
                        lblError.Text = "Shared successfully.";
                    }
                }
                else
                {
                    lblError.Text = "Please select content to share.";
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