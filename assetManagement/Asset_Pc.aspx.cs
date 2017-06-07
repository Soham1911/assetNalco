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

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            decimal poPrice=0;
            DateTime intallDate = DateTime.Parse(txt_intallDate.Text);
            DateTime issueDt = DateTime.Parse(txt_issueDt.Text);
            DateTime amcStart = DateTime.Parse(txt_amcStart.Text);
            DateTime amcEnd = DateTime.Parse(txt_amcEnd.Text);
            DateTime warStart = DateTime.Parse(txt_warStart.Text);
            DateTime warEnd = DateTime.Parse(txt_warEnd.Text);
            DateTime gatePDate = DateTime.Parse(txt_gatePDate.Text);
            try
            {
                poPrice = System.Convert.ToDecimal(txt_poPrice.Text);
            }
            catch (System.Exception)
            {
              
            }
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "insert into ast_pc values('" + txt_unitCode.Text + "','" + txt_astCode.Text + "','" + txt_desc.Text + "','" + txt_make.Text + "','" + txt_model.Text + "','" + txt_categ.Text + "','" + txt_s_no.Text + "','" + txt_part_no.Text + "','" + txt_cust.Text + "','" + issueDt + "','" + txt_dept.Text + "','" + txt_location.Text + "','" + txt_subLocation.Text + "','" + txt_monSize.Text + "','" + txt_monRes.Text + "','" + txt_os.Text + "','" + txt_processor.Text + "','" + txt_ram.Text + "','" + txt_hdd.Text + "','" + txt_smps.Text + "','" + txt_graphics.Text + "','" + txt_ip.Text + "','" + txt_webcam.Text + "','" + txt_po_no.Text + "','" + txt_poDate.Text + "','" + txt_vendorCode.Text + "','" + poPrice + "','" + intallDate + "','" + txt_amcParty.Text + "','" + "Y" + "','" + amcStart + "','" + amcEnd + "','" + "Y" + "','" + warStart + "','" + warEnd + "','" + "N" + "','" + "NULL" + "','" + txt_gatePReg_no.Text + "','" + gatePDate + "','" + txt_gateP_no + "','" + txt_remarks.Text + "','" + "Y" +"')";
            int check;
            conn_asset.Open();
            check = cmd.ExecuteNonQuery();
            if (check == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Registered successfully...";
                lbl_error.Visible = true;
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