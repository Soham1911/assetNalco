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
    public partial class Vendor_Remove : System.Web.UI.Page
    {
        string drpVal = "";
        //create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lbl_error.Visible = false;
                add_drp();
            }
            
        }
        public void add_drp()
        {
            //adding values to drp_ven
            OdbcCommand cmdb = conn_asset.CreateCommand();
            cmdb.CommandText = "select * from ast_vendorMaster";
            OdbcDataAdapter da = new OdbcDataAdapter(cmdb);
            DataTable dt = new DataTable();

            da.Fill(dt);
            drp_ven.DataSource = dt;
            drp_ven.DataValueField = "vendorCode";
            drp_ven.DataTextField = "vendorName";
            drp_ven.DataBind();
        }
        protected void btn_rem_Click(object sender, EventArgs e)
        {
            OdbcCommand cmdb = conn_asset.CreateCommand();
            cmdb.CommandText = "delete from ast_vendorMaster where vendorCode = '"+drp_ven.SelectedValue+"'";
            lbl_error.Text = drp_ven.SelectedItem.Text;
            conn_asset.Open();
            int check;
            check = cmdb.ExecuteNonQuery();
            if(check == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text += " is Removed successfully...";
                lbl_error.Visible = true;
                add_drp();
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to remove";
                lbl_error.Visible = true;
            }
            conn_asset.Close();
        }

    }
}