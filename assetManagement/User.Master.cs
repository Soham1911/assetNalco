using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assetManagement
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pers_no;
            if (!IsPostBack)
            {

                if (Session["user"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    pers_no = Session["user"].ToString();
                    Session["user"] = pers_no;
                }
            }
        }
    }
}