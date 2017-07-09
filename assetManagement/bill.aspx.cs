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

namespace assetManagement
{
    public partial class bill : System.Web.UI.Page
    {

        //create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        static DateTime fromDate,toDate;
        static string amcMax;
        //Initialize all variables
        public void initVar()
        {
            fromDate = Convert.ToDateTime("1900-01-01");
            toDate = Convert.ToDateTime("1900-01-01");
        }

        //PM Penalty calculation
        public decimal penaltyCalc()
        {
            string m = drp_quarter.SelectedItem.Text;
            string sDate = "";
            string eDate = "";
            for (int i = 0; i <= 9; i++)
            {
                sDate += m[i];
                eDate += m[i + 14];
            }

            fromDate = Convert.ToDateTime(sDate);
            toDate = Convert.ToDateTime(eDate);

            decimal pmPenalty = 0;
            OdbcCommand cmd = conn_asset.CreateCommand();
            //cmd.CommandText = "select count(*) as quantity,type from ast_pmPenalty where quarterStartDate = '"+fromDate.ToString("yyyy/MM/dd")+"' group by type";
            cmd.CommandText = "select type from ast_pmPenalty where quarterStartDate = '" + fromDate.ToString("yyyy/MM/dd") + "'";

            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            DataRow newRow;

            //dt.Columns.Add(new System.Data.DataColumn("quantity", typeof(Int32)));
            dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));
          
            while(dr.Read())
            {
                newRow = dt.NewRow();
                //newRow["quantity"] = Convert.ToInt32(dr["quantity"]);
                newRow["type"] = Convert.ToString(dr["type"]);            
                dt.Rows.Add(newRow);
            }
            conn_asset.Close();

            foreach (DataRow it in dt.Rows)
            {
                OdbcCommand cmd1 = conn_asset.CreateCommand();
                cmd1.CommandText = "select pmPenalty from ast_penaltyMaster where type = '" + it["type"]+"'";
                conn_asset.Open();
                OdbcDataReader dr1 = cmd1.ExecuteReader();
                while(dr1.Read())
                {
                    //pmPenalty += Convert.ToDecimal(it["quantity"]) * Convert.ToDecimal(dr1["pmPenalty"]);
                    pmPenalty += Convert.ToDecimal(dr1["pmPenalty"]);

                }
                conn_asset.Close();
            }
            return pmPenalty;
        }

        //Proposed Bill calculation
        public decimal proposedBillCalc()
        {
            string m = drp_quarter.SelectedItem.Text;
            string sDate = "";
            string eDate = "";
            for (int i = 0; i <= 9; i++)
            {
                sDate += m[i];
                eDate += m[i + 14];
            }

            fromDate = Convert.ToDateTime(sDate);
            toDate = Convert.ToDateTime(eDate);

            decimal proposedBill = 0;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select sum(poPrice) as total from ast_pm pm join ast_master am on pm.astCode = am.astCode where pm.quarterStartDate = '" + fromDate.ToString("yyyy/MM/dd") + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                    proposedBill = Convert.ToDecimal(dr["total"]) * Convert.ToDecimal(0.0319);
            }
            conn_asset.Close();
            return proposedBill;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                initVar();
                fill_drp_quarter();
                btn_compBill.Visible = false;
                btn_genBill.Visible = false;
            }
        }

        //Add values to drp_quarter
        public void fill_drp_quarter()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select count(*),amcParty from ast_master where amcStat = 'Y' group by amcParty order by count(*) desc";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            
            while(dr.Read())
            {
                amcMax = dr["amcParty"].ToString();
                break;
            }
            conn_asset.Close();
            DateTime sDate = Convert.ToDateTime("1900-01-01");
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select amcStart from ast_master where amcParty = '"+amcMax+"'";
            conn_asset.Open();
            OdbcDataReader dr1 = cmda.ExecuteReader();
            while (dr1.Read())
            {
                sDate = Convert.ToDateTime(dr1["amcStart"]);
                break;
            }
            conn_asset.Close();
            DateTime dqsDate = sDate ;
            DateTime dqeDate = sDate.AddMonths(3).AddDays(-1);
            drp_quarter.Items.Insert(0, new ListItem("----Select Quarter----"));

            for (int i = 1; i <= 16; i++)
            {


                string qsDate = dqsDate.ToString("yyyy/MM/dd");
                string qeDate = dqeDate.ToString("yyyy/MM/dd");
                string b = qsDate + " to " + qeDate;

                drp_quarter.Items.Insert(i, new ListItem(b));
                dqsDate = dqsDate.AddMonths(3);
                dqeDate = dqsDate.AddMonths(3).AddDays(-1);
            }
        }

        //Getting Quarter Start Date and Quarter End Date
        public void qDates()
        {
            string m = drp_quarter.SelectedItem.Text;
            string sDate = "";
            string eDate = "";
            for (int i = 0; i <= 9; i++)
            {
                sDate += m[i];
                eDate += m[i + 14];
            }

            fromDate = Convert.ToDateTime(sDate);
            toDate = Convert.ToDateTime(eDate);
        }

        //Grid_display
        private void BindData()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_bill where quarterStartDate = '" + fromDate + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("amcParty", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("proposedBill", typeof(String)));
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
            conn_asset.Close();
            if (dt.Rows.Count > 0)
            {
                grid_display.DataSource = dt;
                grid_display.DataBind();
            }
            else
            {
                grid_display.Visible = false;
            }
           

        }


        protected void drp_quarter_SelectedIndexChanged(object sender, EventArgs e)
        {
            qDates();
            lbl_error.Text = "";
            lbl_error.Visible = false;
            string m = drp_quarter.SelectedItem.Text;
            string sDate = "";
            string eDate = "";
            for (int i = 0; i <= 9; i++)
            {
                sDate += m[i];
                eDate += m[i + 14];
            }

            fromDate = Convert.ToDateTime(sDate);
            toDate = Convert.ToDateTime(eDate);
            //////Delete Existing entries
            OdbcCommand cmd2 = conn_asset.CreateCommand();
            cmd2.CommandText = "delete from ast_pmPenalty where quarterStartDate = '"+fromDate.ToString("yyyy/MM/dd")+"' ";
            int check1;
            conn_asset.Open();
            check1 = cmd2.ExecuteNonQuery();
            conn_asset.Close();
            //////Add new Entries
            OdbcCommand cmd3 = conn_asset.CreateCommand();
            cmd3.CommandText = "select ap.astCode as astCode1,am.type,amcParty from ast_pm ap join ast_master am on ap.astCode = am.astCode where quarterStartDate = '" + fromDate.ToString("yyyy/MM/dd") + "' and compStat = 'N'";
            conn_asset.Open();
            OdbcDataReader dr3 = cmd3.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("amcParty", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("quarterStartDate", typeof(DateTime)));
            dt.Columns.Add(new System.Data.DataColumn("quarterEndDate", typeof(DateTime)));

            while (dr3.Read())
            {
                newRow = dt.NewRow();
                newRow["astCode"] = Convert.ToString(dr3["astCode1"]);
                newRow["type"] = Convert.ToString(dr3["type"]);
                newRow["amcParty"] = Convert.ToString(dr3["amcParty"]);
                newRow["quarterStartDate"] = fromDate;
                newRow["quarterEndDate"] = toDate;
                dt.Rows.Add(newRow);
            }
            conn_asset.Close();

            foreach (DataRow it in dt.Rows)
            {
                OdbcCommand cmd1 = conn_asset.CreateCommand();
                cmd1.CommandText = "insert into ast_pmPenalty values('" + it["quarterStartDate"] + "','" + it["quarterEndDate"] + "','" + it["astCode"] + "','" + it["type"] + "','" + it["amcParty"] + "')";
                int check2;
                conn_asset.Open();
                check2 = cmd1.ExecuteNonQuery();
                conn_asset.Close();
            }
            //////
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_pm where billStat = 'Y' and quarterStartDate = '" + fromDate.ToString("yyyy/MM/dd") + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                btn_compBill.Visible = true;
                btn_genBill.Visible = false;
                conn_asset.Close();
                BindData();
                grid_display.Visible = true;
            }
            else
            {
                conn_asset.Close();
                OdbcCommand cmd1 = conn_asset.CreateCommand();
                cmd1.CommandText = "select * from ast_pm where lockStat = 'R' and quarterStartDate = '" + fromDate.ToString("yyyy/MM/dd") + "'";
                conn_asset.Open();
                OdbcDataReader dr1 = cmd1.ExecuteReader();
                if(dr1.Read())
                {
                    lbl_error.ForeColor = System.Drawing.Color.Red;
                    lbl_error.Text = "Quarter is not locked yet";
                    lbl_error.Visible = true;
                }
                else
                {
                    lbl_error.Visible = false;
                    btn_genBill.Visible = true;
                    btn_compBill.Visible = false;
                    grid_display.Visible = false;
                }         
            }
            
        }

        protected void btn_genBill_Click(object sender, EventArgs e)
        {
            decimal pmPenalty = penaltyCalc();
            decimal proposedBill = proposedBillCalc();
            decimal downtimePenalty = 0;
            decimal finalBill = 0;
            
            decimal totalPenalty = (pmPenalty + downtimePenalty) < (Convert.ToDecimal(0.1) * proposedBill) ? (pmPenalty + downtimePenalty) : (Convert.ToDecimal(0.1) * proposedBill);
            
            finalBill = proposedBill - totalPenalty;
            //////Delete Existing entries
            OdbcCommand cmd2 = conn_asset.CreateCommand();
            cmd2.CommandText = "delete from ast_bill where quarterStartDate = '" + fromDate.ToString("yyyy/MM/dd") + "' ";
            int check1;
            conn_asset.Open();
            check1 = cmd2.ExecuteNonQuery();
            conn_asset.Close();
            //////Add new Entries
            OdbcCommand cmd3 = conn_asset.CreateCommand();
            cmd3.CommandText = "insert into ast_bill values('" + fromDate.ToString("yyyy/MM/dd") + "','" + toDate.ToString("yyyy/MM/dd") + "','" + proposedBill + "' ,'" + pmPenalty + "','" + downtimePenalty + "' ,'" + finalBill + "','" + amcMax + "'   )";
            int check3;
            conn_asset.Open();
            check3 = cmd3.ExecuteNonQuery();
            conn_asset.Close();

            string m = drp_quarter.SelectedItem.Text;
            string sDate = "";
            string eDate = "";
            for (int i = 0; i <= 9; i++)
            {
                sDate += m[i];
                eDate += m[i + 14];
            }

            fromDate = Convert.ToDateTime(sDate);
            toDate = Convert.ToDateTime(eDate);
            Session["qStart"] = fromDate.ToString("yyyy/MM/dd");
            Response.Redirect("~/bill_print.aspx");
        }

        protected void btn_compBill_Click(object sender, EventArgs e)
        {
            string m = drp_quarter.SelectedItem.Text;
            string sDate = "";
            string eDate = "";
            for (int i = 0; i <= 9; i++)
            {
                sDate += m[i];
                eDate += m[i + 14];
            }

            fromDate = Convert.ToDateTime(sDate);
            toDate = Convert.ToDateTime(eDate);
            Session["qStart"] = fromDate.ToString("yyyy/MM/dd");
            Response.Redirect("~/bill_print.aspx");
        }
    }
}