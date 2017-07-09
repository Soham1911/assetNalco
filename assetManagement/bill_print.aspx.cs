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
            BindDataPm();
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

            cmd.CommandText = "select distinct pma.type as typ,pma.pmPenalty as pnlt,x.total as ttl,x.nCount as nc,x.fCount as fc,(x.nCount * pma.pmPenalty) as totalPenalty from ast_penaltyMaster pma,(select p.type tp,count(*) total,sum(case when compStat = 'N' then 1 else 0 end) nCount,sum(case when compStat = 'F' then 1 else 0 end) fCount from ast_pm p join ast_penaltyMaster pm on pm.type=p.type where p.quarterStartDate = '" + lbl_fromDate.Text + "' group by p.type) x where pma.type = x.tp";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("typ", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("pnlt", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("ttl", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("nc", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("fc", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("totalPenalty", typeof(String)));

            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["typ"] = Convert.ToString(dr["typ"]);
                newRow["pnlt"] = Convert.ToString(dr["pnlt"]);
                newRow["ttl"] = Convert.ToString(dr["ttl"]);
                newRow["nc"] = Convert.ToString(dr["nc"]);
                newRow["fc"] = Convert.ToString(dr["fc"]);
                newRow["totalPenalty"] = Convert.ToString(dr["totalPenalty"]);
                dt.Rows.Add(newRow);
            }

            if (dt.Rows.Count > 0)
            {
                grid_pmPenalty.DataSource = dt;
                grid_pmPenalty.DataBind();
                grid_pmPenalty.Visible = true;
            }
            else
            {
                grid_pmPenalty.Visible = false;
            }
            conn_asset.Close();
        }
    }
}