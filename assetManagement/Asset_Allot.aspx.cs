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
    public partial class Asset_Allot : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_reg_Click(object sender, EventArgs e)
        {
            //searching for Asset
            lbl_error.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select astCode from ast_pc where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_server where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_nwitem where astCode='" + txt_astCode.Text.Trim() + "'  UNION select astCode from ast_printer where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_other where astCode='" + txt_astCode.Text.Trim() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                conn_asset.Close();
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select availability from ast_pc where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y' UNION select availability from ast_server where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y' UNION select availability from ast_nwitem where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y' UNION select availability from ast_printer where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y' UNION select availability from ast_other where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y'";
                conn_asset.Open();
                OdbcDataReader dr1 = cmda.ExecuteReader();
                if (dr1.Read())
                {
                    conn_asset.Close();
                    //Update values
                }
                else
                {
                    lbl_error.ForeColor = System.Drawing.Color.Crimson;
                    lbl_error.Text = "Asset is not available";
                    lbl_error.Visible = true;
                }
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Invalid Asset Code";
                lbl_error.Visible = true;
            }
        }
    }
}