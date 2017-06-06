using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assetManagement
{
    public partial class Amc : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pers_no;
            if (!IsPostBack)
            {

                if (Session["amc"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    pers_no = Session["amc"].ToString();
                    Session["amc"] = pers_no;
                }
            }
        }
    }
}