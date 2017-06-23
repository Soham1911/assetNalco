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

    public partial class BuyBack : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_assetCode.Visible = false;
            txt_assetCode.Visible = false;

        }

        protected void drp_sel_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selection = drp_sel.SelectedValue;
            if (selection.Equals("po_no"))
            {
                lbl_assetCode.Visible = false;
                txt_assetCode.Visible = false;
                lbl_po_no.Visible = true;
                txt_po_no.Visible = true;
            }
            else if (selection.Equals("assetCode"))
            {
                lbl_po_no.Visible = false;
                txt_po_no.Visible = false;
                lbl_assetCode.Visible = true;
                txt_assetCode.Visible = true;
            }
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "update ast_master set buybackDate = '" + txt_buyback.Text + "' , buybackStat = 'Y' where po_no = '" + txt_po_no.Text.Trim() + "' or astCode = '" + txt_assetCode.Text.Trim().ToUpper() + "'";
            int check1;
            conn_asset.Open();
            check1 = cmd.ExecuteNonQuery();
            conn_asset.Close();
            if (check1 == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                conn_asset.Close();
                lbl_error.Text = "Registered successfully...";
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Registration failed";
                lbl_error.Visible = true;
            }
        }
    }
}