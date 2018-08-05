using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AcademiaApp
{
    public partial class Home : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                if (!CheckProfileDataExist())
                {
                    Response.Redirect("StudentProfile.aspx");
                }
            }
            if (!string.IsNullOrEmpty(Request.QueryString["dp"]))
            {
                DeleteSelfPost(Request.QueryString["dp"]);   
            }
            if (!string.IsNullOrEmpty(Request.QueryString["lk"]))
            {
                DoLike(Request.QueryString["lk"]);
            }
        }
        public void DeleteSelfPost(string PostId)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM T_POSTS WHERE POST_ID='" + PostId + "'",conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Home.aspx", true);
                }
            }
            catch (Exception ex)
            {
                conn.Close();
                //Response.Redirect("Error.aspx",true);
            }
            finally
            {
                conn.Close();
            }
        }

        public void DoLike(string PostId)
        {
            try
            {
                bool Like = false;
                int LikeCount = 0;
                int Result = 0;
                string PostedBy = string.Empty;
                using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM T_LIKES WHERE POST_ID='"+PostId+"' AND LIKED_BY='"+Convert.ToString(Session["USER_ID"])+"'",conn))
                {
                    using (DataSet ds=new DataSet())
                    {
                        ad.Fill(ds);
                        if (ds.Tables.Count > 0)
                        {
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                Like = true;
                            }
                        }
                    }
                }
                if (!Like)
                {
                    //Increase like count
                    using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_POSTS WHERE POST_ID='" + PostId + "'", conn))
                    {
                        using (DataSet ds = new DataSet())
                        {
                            ad.Fill(ds);
                            if (ds.Tables.Count > 0)
                            {
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    PostedBy = ds.Tables[0].Rows[0]["POSTED_BY"].ToString();
                                    LikeCount = Convert.ToInt32(ds.Tables[0].Rows[0]["LIKE_COUNT"].ToString()) + 1;
                                }
                            }
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand("UPDATE T_POSTS SET LIKE_COUNT=" + LikeCount + " WHERE POST_ID='" + PostId + "'", conn))
                    {
                        conn.Open();
                        Result = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (Result > 0)
                    {
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO T_LIKES VALUES('" + Guid.NewGuid().ToString() + "','" + PostId + "','" + Convert.ToString(Session["USER_ID"]) + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)", conn))
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                        //Add to notifiaction
                        string Remark=string.Empty;
                        Remark =Common.UserDetails.GetFullNameByUserID(Convert.ToString(Session["USER_ID"]))+" likes "+ Common.UserDetails.GetFullNameByUserID(PostedBy)+"'s post.";
                        using (SqlCommand cmd=new SqlCommand("INSERT INTO T_NOTIFICATIONS VALUES('"+Guid.NewGuid().ToString()+"','"+Convert.ToString(Session["USER_ID"])+"','"+PostedBy+"','"+Remark.Replace("'","''")+"','"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"',0)",conn))
                        {
                            if (PostedBy != Convert.ToString(Session["USER_ID"]))
                            {
                                conn.Open();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                                Response.Redirect("Home.aspx");
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            catch (Exception ex)
            {

            }
        }

        public bool CheckProfileDataExist()
        {
            bool IsExist = false;
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_BASIC_DETAILS WHERE USER_ID='" + Convert.ToString(Session["USER_ID"]) + "'", conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            IsExist = true;
                        }
                    }
                }
            }
            return IsExist;
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                string fileType = string.Empty;
                string fileName = string.Empty;
                string filePath = string.Empty;
                if (fileUploader.HasFile)
                {
                    string[] splitName = new string[2];
                    fileName = fileUploader.FileName;
                    splitName = fileUploader.FileName.Split('.');
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
                    fileUploader.PostedFile.SaveAs(Server.MapPath(filePath));
                }
                using (SqlCommand cmd = new SqlCommand("INSERT INTO T_POSTS VALUES('" + Guid.NewGuid().ToString() + "','" + Convert.ToString(Session["USER_ID"]) + "',N'" + txtPost.Text.Replace("'", "''") + "','" + filePath + "','" + fileType + "','" + fileName + "',0,'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    txtPost.Text = "";
                    //Refresh listview with new post.
                    listPosts.DataSourceID = "SqlDataSourcePosts";
                    listPosts.DataBind();
                    lblError.Text = "Posted successfully.";
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

        protected void listPosts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}