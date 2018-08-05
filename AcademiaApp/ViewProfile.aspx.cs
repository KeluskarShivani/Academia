using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcademiaApp
{
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["ROLE"])))
            {
                if (Convert.ToString(Session["ROLE"]) == "Teacher")
                {
                    this.MasterPageFile = "~/Master/Teacher.master";
                }
                if (Convert.ToString(Session["ROLE"]) == "ADMIN")
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}