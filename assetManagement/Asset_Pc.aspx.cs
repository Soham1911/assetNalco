using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.Configuration;

namespace assetManagement
{
    public partial class Asset_Pc : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Buttonreg_Click(object sender, EventArgs e)
        {
            string a, b;
            a = TextBoxunit_cd.Text;
            b = TextBoxrem.Text;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "insert into amclogin values('" + a + "','" + b + "')";
            int check;
            conn_asset.Open();
            check = cmd.ExecuteNonQuery();
            if(check ==1)
            {
                lbl_error.Text = "success";
                lbl_error.Visible = true;
            }
            else
            {
                lbl_error.Text = "fail";
                lbl_error.Visible = true;
            }

        }
    }
}