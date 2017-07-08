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
using System.IO;

namespace assetManagement
{
    public partial class bill_print : System.Web.UI.Page
    {
        //create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        DateTime date = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            date = Convert.ToDateTime(Session["qStart"].ToString());
            lbl_check.Text = date.ToString("yyyy/MM/dd");
            show_billDetails();      
        }

        //Show Bill Details
        public void show_billDetails()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_bill where quarterStartDate = '"+date.ToString("yyyy/MM/dd")+"'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                lbl_proposedBill.Text = dr["proposedBill"].ToString();
                lbl_pmPenalty.Text = dr["pmPenalty"].ToString();
                lbl_downtimePenalty.Text = dr["downtimePenalty"].ToString();
                lbl_totalPenalty.Text = (Convert.ToDecimal(dr["pmPenalty"]) + Convert.ToDecimal(dr["downtimePenalty"])).ToString();
                lbl_finalBill.Text = dr["finalBill"].ToString();
                lbl_10.Text = (Convert.ToDecimal(dr["proposedBill"]) * Convert.ToDecimal(0.1)).ToString();
                lbl_fromDate.Text =Convert.ToDateTime( dr["quarterStartDate"]).ToString("yyyy/MM/dd");
                lbl_toDate.Text = Convert.ToDateTime(dr["quarterEndDate"]).ToString("yyyy/MM/dd");
            }
            conn_asset.Close();
        }

        public void BindDataPm()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_pmPenalty pm join ast_master am on am.astCode = pm.astCode where quarterStartDate = '" + lbl_fromDate.Text + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("category", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("pmPenalty", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("downtimePenalty", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("finalBill", typeof(String)));

            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["amcParty"] = Convert.ToString(dr["amcParty"]);
                newRow["proposedBill"] = Convert.ToString(dr["proposedBill"]);
                newRow["pmPenalty"] = Convert.ToString(dr["pmPenalty"]);
                newRow["downtimePenalty"] = Convert.ToString(dr["downtimePenalty"]);
                newRow["finalBill"] = Convert.ToString(dr["finalBill"]);
                dt.Rows.Add(newRow);
            }

            if (dt.Rows.Count > 0)
            {
                grid_pmPenalty.DataSource = dt;
                grid_pmPenalty.DataBind();
            }
            else
            {
                grid_pmPenalty.Visible = false;
            }
            conn_asset.Close();
        }

        protected void btn_pdf_Click(object sender, EventArgs e)
        {

        }
    }
}