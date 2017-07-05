using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.Configuration;
using System.Net;
using System.Text;

namespace assetManagement
{
    public partial class amc_pc : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        static string astCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            astCode = Session["astCode"].ToString();
            txt_astCode.Text = astCode;
        }

        protected void btn_sub_Click(object sender, EventArgs e)
        {
            
            string dvd = RadioButtonList0.SelectedValue;
            string mouse = RadioButtonList1.SelectedValue;
            string monitor = RadioButtonList2.SelectedValue;
            string key = RadioButtonList4.SelectedValue;
            string hdd = RadioButtonList5.SelectedValue;
            string os = RadioButtonList6.SelectedValue;
            string vir = RadioButtonList7.SelectedValue;
            string con = RadioButtonList8.SelectedValue;
            string ad = RadioButtonList9.SelectedValue;
            string pon = RadioButtonList10.SelectedValue;

            string line = TextBox1.Text;
            string en = TextBox2.Text;
            string remark = TextBox4.Text;
            string actDate = txt_actDate.Text;

            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "update ast_pm set ";
            conn_asset.Open();
            int dr1 = cmd.ExecuteNonQuery();
            conn_asset.Close();
        }
    }
}