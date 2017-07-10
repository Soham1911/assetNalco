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
    public partial class AMC_Create : System.Web.UI.Page
    {
        //Create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //filling drp_amcParty
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select * from ast_vendorMaster";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();
                da.Fill(dt);
                drp_amcParty.DataSource = dt;
                drp_amcParty.DataValueField = "vendorCode";
                drp_amcParty.DataTextField = "vendorName";
                drp_amcParty.DataBind();
            }
            lbl_error.Text = "";
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "insert into ast_amcVendor values('" + drp_amcParty.SelectedValue + "' , '" + txt_fromDate.Text + "' , '" + txt_toDate.Text + "',  'Y')";
            int check1;
            conn_asset.Open();
            check1 = cmd.ExecuteNonQuery();
            conn_asset.Close();
            if(check1 == 1)
            {
                lbl_error.Text = "Added successfully";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Visible = true;
                txt_fromDate.Text = "";
                txt_toDate.Text = "";
            }
            else
            {
                lbl_error.Text = "Failed to add";
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Visible = true;
            }
        }
    }
}