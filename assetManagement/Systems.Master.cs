﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assetManagement
{
    public partial class Systems : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pers_no;
            if (!IsPostBack)
            {

                if (Session["systems"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    pers_no = Session["systems"].ToString();
                    Session["systems"] = pers_no;
                }
            }
        }
    }
}