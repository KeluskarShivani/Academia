﻿using System;
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
    public partial class Students : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            BindAllStudents();
            if (!string.IsNullOrEmpty(Request.QueryString["del"]))
            {
                DeleteStudent();
            }
            if (!string.IsNullOrEmpty(Request.QueryString["rec"]))
            {
                RecoverStudent();
            }
        }
        public void RecoverStudent()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE T_USERS SET IS_DELETED=0 WHERE USER_ID='" + Request.QueryString["rec"] + "'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Students.aspx", false);
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
        public void DeleteStudent()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE T_USERS SET IS_DELETED=1 WHERE USER_ID='" + Request.QueryString["del"] + "'", conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Students.aspx", false);
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
        public void BindAllStudents()
        {
            using (SqlDataAdapter ad=new SqlDataAdapter("SELECT * FROM T_USERS WHERE ROLE='Student' ORDER BY CREATED_ON DESC",conn))
            {
                using (DataSet ds=new DataSet())
                {
                    ad.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            grdStudents.DataSource = ds;
                            grdStudents.DataBind();
                        }
                        else
                        {
                            grdStudents.DataSource = null;
                            grdStudents.DataBind();
                        }
                    }
                    else
                    {
                        grdStudents.DataSource = null;
                        grdStudents.DataBind();
                    }
                }
            }
        }
    }
}