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

    public partial class Vendor_Add : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_sap_vendorCode.Visible = false;
            lbl_vendorCode.Visible = false;
            lbl_vendorName.Visible = false;
            lbl_error.Visible = false;
            enableButton();
        }

        public void clear()
        {
            txt_date.Text = "";
            txt_sap_vendorCode.Text = "";
            txt_vendorDesc.Text = "";
            txt_vendorName.Text = "";
            txt_vendorCode.Text = "";
        }
        public void disableButton()
        {
            //to Disable Button
            btn_reg.Enabled = false;
            btn_reg.BackColor = System.Drawing.Color.Gray;
            btn_reg.ForeColor = System.Drawing.Color.LightGray;
        }
        public void enableButton()
        {
            //to Enable Button
            btn_reg.Enabled = true;
            btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
            btn_reg.ForeColor = System.Drawing.Color.Black;
        }
        protected void btn_reg_Click(object sender, EventArgs e)
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "insert into ast_vendorMaster values('" + txt_sap_vendorCode.Text.Trim().ToUpper() + "','" + txt_vendorCode.Text.Trim().ToUpper() + "','" + txt_vendorName.Text.Trim().ToUpper() + "','" + txt_vendorDesc.Text.Trim().ToUpper() + "','" + txt_date.Text + "')";
            int check1;
            conn_asset.Open();
            check1 = cmd.ExecuteNonQuery();
            conn_asset.Close();
            if (check1 == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                conn_asset.Close();
                lbl_error.Text = "Added successfully...";
                lbl_error.Visible = true;
                clear();
                disableButton();
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to Add";
                lbl_error.Visible = true;
            }
        }

        protected void txt_sap_vendorCode_TextChanged(object sender, EventArgs e)
        {
            lbl_sap_vendorCode.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_vendorMaster where sap_vendorCode = '"+txt_sap_vendorCode.Text.Trim().ToUpper()+"'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            lbl_sap_vendorCode.Text = "";
            while (dr.Read())
            {
                lbl_sap_vendorCode.Text = "Already Registered for " + Convert.ToString(dr["vendorName"]);
                lbl_sap_vendorCode.Visible = true;
            }
            conn_asset.Close();
        }

        protected void txt_vendorCode_TextChanged(object sender, EventArgs e)
        {
            lbl_vendorCode.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_vendorMaster where vendorCode = '" + txt_vendorCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            lbl_vendorCode.Text = "";
            while (dr.Read())
            {
                lbl_vendorCode.Text = "Already Registered for " + Convert.ToString(dr["vendorName"]);
                lbl_vendorCode.Visible = true;
            }
            conn_asset.Close();
        }

        protected void txt_vendorName_TextChanged(object sender, EventArgs e)
        {
            lbl_vendorName.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_vendorMaster where vendorName = '" + txt_vendorName.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            lbl_vendorName.Text = "";
            while (dr.Read())
            {
                lbl_vendorName.Text = "Already Registered for " + Convert.ToString(dr["vendorCode"]);
                lbl_vendorName.Visible = true;
            }
            conn_asset.Close();
        }
    }
}