using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AcademiaApp.Master
{
    public partial class StudentMaster : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["USER_ID"])))
            {
                Response.Redirect("Index.aspx");
            }
            else
            {
                BindProfileDetails();
                BindUnreadMessageCount();
                BindTotalNoFriends();
                GetContentCount();
                GetHeaderRequestCount();
                GetFeedbackCount();
            }
        }
        public void BindProfileDetails()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_USERS UD,T_BASIC_DETAILS BD WHERE UD.USER_ID=BD.USER_ID AND UD.USER_ID='" + Convert.ToString(Session["USER_ID"]) + "'", conn))
            {
                using (DataSet ds = new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            linkProfileName.Text = ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
                            imgProfilePhoto.ImageUrl = ds.Tables[0].Rows[0]["PROFILE_PHOTO_URL"].ToString();
                        }
                    }
                }
            }
        }

        protected void linkProfileName_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentProfile.aspx?ref=" + Convert.ToString(Session["USER_ID"]));
        }

        protected void linkFriends_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyFriends.aspx");
        }

        protected void linkConternts_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyContents.aspx");
        }

        protected void linkMessages_Click(object sender, EventArgs e)
        {
            Response.Redirect("Messages.aspx");
        }

        public void BindUnreadMessageCount()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_COMMUNICATION WHERE SENT_TO='"+Convert.ToString(Session["USER_ID"])+"' AND READ_ON IS NULL", conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            lblUnreadMessageCount.Text ="("+ ds.Tables[0].Rows.Count.ToString()+")";
                        }
                        else
                        {
                            lblUnreadMessageCount.Text = "(0)";
                        }
                    }
                    else
                    {
                        lblUnreadMessageCount.Text = "(0)";
                    }
                }
            }
        }

        public void BindTotalNoFriends()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM( SELECT FR.FRND_REQ_ID,FR.REQ_TO,FR.STATUS,FR.REQUESTED_ON,FR.ACTION_TAKEN_ON,FR.IS_DELETED,  UD.FIRST_NAME,UD.LAST_NAME,UD.GENDER,UD.ROLE,UD.CREATED_ON, BD.DOB,BD.PROFILE_PHOTO_URL,EM.EDUCATION,LM.LOCATION,UD.USER_ID,BD.BASIC_DET_ID FROM T_FRIEND_REQUESTS FR,T_USERS UD,T_BASIC_DETAILS BD,T_EDUCATION_MASTER EM,T_LOCATION_MASTER LM WHERE FR.REQ_FROM='" + Convert.ToString(Session["USER_ID"]) + "' AND FR.REQ_TO=UD.USER_ID AND BD.USER_ID=UD.USER_ID AND BD.EDUCATION_ID=EM.EDUCATION_ID AND BD.LOCATION_ID=LM.LOCATION_ID UNION SELECT FR.FRND_REQ_ID,FR.REQ_FROM,FR.STATUS,FR.REQUESTED_ON,FR.ACTION_TAKEN_ON,FR.IS_DELETED,  UD.FIRST_NAME,UD.LAST_NAME,UD.GENDER,UD.ROLE,UD.CREATED_ON, BD.DOB,BD.PROFILE_PHOTO_URL,EM.EDUCATION,LM.LOCATION,UD.USER_ID,BD.BASIC_DET_ID FROM T_FRIEND_REQUESTS FR,T_USERS UD,T_BASIC_DETAILS BD,T_EDUCATION_MASTER EM,T_LOCATION_MASTER LM WHERE FR.REQ_TO='" + Convert.ToString(Session["USER_ID"]) + "' AND FR.REQ_FROM=UD.USER_ID AND BD.USER_ID=UD.USER_ID AND BD.EDUCATION_ID=EM.EDUCATION_ID AND BD.LOCATION_ID=LM.LOCATION_ID )FRIEND_REQUEST WHERE STATUS!='Pending'", conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            lblFriendsCount.Text ="(" +ds.Tables[0].Rows.Count.ToString()+")";
                        }
                        else
                        {
                            lblFriendsCount.Text = "(0)";
                        }
                    }
                    else
                    {
                        lblFriendsCount.Text = "(0)";
                    }
                }
            }
        }

        protected void linkDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteAccountConfirm.aspx");
        }

        public void GetContentCount()
        {
            using (SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM T_CONTENTS WHERE SHARED_BY='" + Convert.ToString(Session["USER_ID"]) + "'", conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count>0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            linkContentCount.Text = "(" + ds.Tables[0].Rows.Count + ")";
                        }
                        else
                        {
                            linkContentCount.Text = "(0)";
                        }
                    }
                    else
                    {
                        linkContentCount.Text = "(0)";
                    }
                }
            }
        }

        public void GetHeaderRequestCount()
        {
            using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM( SELECT FR.FRND_REQ_ID,FR.REQ_FROM,FR.REQ_TO,FR.STATUS,FR.REQUESTED_ON,FR.ACTION_TAKEN_ON,FR.IS_DELETED,  UD.FIRST_NAME,UD.LAST_NAME,UD.GENDER,UD.ROLE,UD.CREATED_ON, BD.DOB,BD.PROFILE_PHOTO_URL,EM.EDUCATION,LM.LOCATION,UD.USER_ID,BD.BASIC_DET_ID FROM T_FRIEND_REQUESTS FR,T_USERS UD,T_BASIC_DETAILS BD,T_EDUCATION_MASTER EM,T_LOCATION_MASTER LM WHERE FR.REQ_FROM='"+Convert.ToString(Session["USER_ID"])+"' AND FR.REQ_TO=UD.USER_ID AND BD.USER_ID=UD.USER_ID AND BD.EDUCATION_ID=EM.EDUCATION_ID AND BD.LOCATION_ID=LM.LOCATION_ID UNION SELECT FR.FRND_REQ_ID,FR.REQ_FROM,FR.REQ_TO,FR.STATUS,FR.REQUESTED_ON,FR.ACTION_TAKEN_ON,FR.IS_DELETED,  UD.FIRST_NAME,UD.LAST_NAME,UD.GENDER,UD.ROLE,UD.CREATED_ON, BD.DOB,BD.PROFILE_PHOTO_URL,EM.EDUCATION,LM.LOCATION,UD.USER_ID,BD.BASIC_DET_ID FROM T_FRIEND_REQUESTS FR,T_USERS UD,T_BASIC_DETAILS BD,T_EDUCATION_MASTER EM,T_LOCATION_MASTER LM WHERE FR.REQ_TO='"+Convert.ToString(Session["USER_ID"])+"' AND FR.REQ_FROM=UD.USER_ID AND BD.USER_ID=UD.USER_ID AND BD.EDUCATION_ID=EM.EDUCATION_ID AND BD.LOCATION_ID=LM.LOCATION_ID )FRIEND_REQUEST WHERE STATUS='Pending'",conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            lblRequestCount.Text = "(" + ds.Tables[0].Rows.Count + ")";
                        }
                        else
                        {
                            lblRequestCount.Text = "";
                        }
                    }
                    else
                    {
                        lblRequestCount.Text = "";
                    }
                }       
            }
        }

        public void GetFeedbackCount()
        {
            using (SqlDataAdapter ad =new SqlDataAdapter("SELECT * FROM T_FEEDBACKS WHERE READ_ON IS NULL AND SENT_TO='"+Convert.ToString(Session["USER_ID"])+"'",conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            lblFeedbackCount.Text = "(" + ds.Tables[0].Rows.Count.ToString() + ")";
                        }
                        else
                        {
                            lblFeedbackCount.Text = "";
                        }
                    }
                    else
                    {
                        lblFeedbackCount.Text = "";
                    }
                }
            }
        }
    }
}