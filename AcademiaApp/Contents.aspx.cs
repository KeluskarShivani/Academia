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
    public partial class Contents : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(Request.QueryString["lk"]))
            {
                DoLike(Request.QueryString["lk"]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["con"]))
            {
                DeleteContent();
            }
        }
        public void DeleteContent()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM T_CONTENTS WHERE CONTENT_ID='" + Request.QueryString["con"] + "' AND SHARED_BY='" + Convert.ToString(Session["USER_ID"]) + "'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Contents.aspx");
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
        public void DoLike(string ContentID)
        {
            try
            {
                bool Like = false;
                int LikeCount = 0;
                int Result = 0;
                string PostedBy = string.Empty;
                using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_LIKES WHERE POST_ID='" + ContentID + "' AND LIKED_BY='" + Convert.ToString(Session["USER_ID"]) + "'", conn))
                {
                    using (DataSet ds = new DataSet())
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
                    using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_CONTENTS WHERE CONTENT_ID='" + ContentID + "'", conn))
                    {
                        using (DataSet ds = new DataSet())
                        {
                            ad.Fill(ds);
                            if (ds.Tables.Count > 0)
                            {
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    PostedBy = ds.Tables[0].Rows[0]["SHARED_BY"].ToString();
                                    LikeCount = Convert.ToInt32(ds.Tables[0].Rows[0]["LIKE_COUNT"].ToString()) + 1;
                                }
                            }
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand("UPDATE T_CONTENTS SET LIKE_COUNT=" + LikeCount + " WHERE CONTENT_ID='" + ContentID + "'", conn))
                    {
                        conn.Open();
                        Result = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (Result > 0)
                    {
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO T_LIKES VALUES('" + Guid.NewGuid().ToString() + "','" + ContentID + "','" + Convert.ToString(Session["USER_ID"]) + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)", conn))
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                        //Add to notifiaction
                        string Remark = string.Empty;
                        Remark = Common.UserDetails.GetFullNameByUserID(Convert.ToString(Session["USER_ID"])) + " likes " + Common.UserDetails.GetFullNameByUserID(PostedBy) + "'s content.";
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO T_NOTIFICATIONS VALUES('" + Guid.NewGuid().ToString() + "','" + Convert.ToString(Session["USER_ID"]) + "','" + PostedBy + "','" + Remark.Replace("'", "''") + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)", conn))
                        {
                            if (PostedBy != Convert.ToString(Session["USER_ID"]))
                            {
                                conn.Open();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                                Response.Redirect("Contents.aspx");
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("Contents.aspx");
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void listContents_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}