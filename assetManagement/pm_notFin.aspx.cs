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
    public partial class pm_sys : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        static DateTime dsDate;
        static DateTime deDate;
        static string category;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {


                DateTime sDate = Convert.ToDateTime("2017-01-01");
                DateTime eDate = Convert.ToDateTime("2019-12-31");

                DateTime dqsDate = sDate;
                DateTime dqeDate = sDate.AddMonths(3).AddDays(-1);
                drp_quart.Items.Insert(0, new ListItem("----Select Quarter----"));
                drp_quart.Items[0].Selected = true;
                drp_quart.Items[0].Attributes["disabled"] = "disabled";

                for (int i = 1; i <= 16; i++)
                {


                    string qsDate = dqsDate.ToString("yyyy/MM/dd");
                    string qeDate = dqeDate.ToString("yyyy/MM/dd");
                    string b = qsDate + " to " + qeDate;

                    drp_quart.Items.Insert(i, new ListItem(b));
                    dqsDate = dqsDate.AddMonths(3);
                    dqeDate = dqsDate.AddMonths(3).AddDays(-1);
                }
                drp_mon.Items.Insert(0, new ListItem("----Select Month----"));
                drp_mon.Items[0].Selected = true;
            }
        }

        protected void grid_display_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void drp_quart_SelectedIndexChanged(object sender, EventArgs e)
        {
            drp_quart.Items[0].Attributes["disabled"] = "disabled";
            string m = drp_quart.SelectedItem.Text;
            string sDate = "";
            string eDate = "";
            for (int i = 0; i <= 9; i++)
            {
                sDate += m[i];
                eDate += m[i + 14];

                //StringBuilder sd = new StringBuilder(sDate);
                //StringBuilder ed = new StringBuilder(eDate);
                //sd[i] = m[i];
                //ed[i] = m[i + 14];
                //sDate = sd.ToString();
                //eDate = ed.ToString();
            }

            dsDate = Convert.ToDateTime(sDate);
            deDate = Convert.ToDateTime(eDate);
            //OdbcCommand cmde = conn_asset.CreateCommand();
            //cmde.CommandText = "select lockStat from ast_pm where scheduledDate>='" + dsDate + "' and scheduledDate<='" + deDate + "'";

            //conn_asset.Open();
            //OdbcDataReader dre = cmde.ExecuteReader();

            //if (dre.Read())
            //{
            //    while (dre.Read())
            //    {
            //        if (dre["lockStat"].ToString().Equals("R") || dre["lockStat"].ToString().Equals("L"))
            //        {

            //            lbl_lock.Visible = false;
            //            lbl_month.Visible = true;
            //            drp_mon.Visible = true;
            //            btn_sub.Enabled = true;

            //            //drp_mon.Items.Insert(0, new ListItem("----Select Month----"));
            //            //drp_mon.Items[0].Selected = true;
            //            drp_mon.Items[0].Attributes["disabled"] = "disabled";


            //        }
            //        else
            //        {
            //            lbl_lock.Visible = true;
            //            lbl_month.Visible = false;
            //            drp_mon.Visible = false;
            //            btn_sub.Enabled = false;
            //        }
            //    }

            //}
            //else
            //{
            //    lbl_lock.Visible = true;
            //    lbl_month.Visible = false;
            //    drp_mon.Visible = false;
            //    btn_sub.Enabled = false;
            //}
            //conn_asset.Close();
            OdbcCommand cmdee = conn_asset.CreateCommand();
            cmdee.CommandText = "select count(*) as c,compStat from ast_pm where scheduledDate>='" + dsDate + "' and scheduledDate<='" + deDate + "' group by compStat";
            conn_asset.Open();
            OdbcDataReader drr = cmdee.ExecuteReader();
            string pcnt = "0";
            string ccnt = "0";
            while (drr.Read())
            {
                if (drr["compStat"].ToString().Equals("N"))
                {

                    pcnt = drr["c"].ToString();

                }
                else if (drr["compStat"].ToString().Equals("F"))
                {
                    ccnt = drr["c"].ToString();
                }


            }
            conn_asset.Close();
            lbl_1.Visible = true;
            lbl_2.Visible = true;
            l1.Visible = true;
            l2.Visible = true;
            l1.Text = pcnt;
            l2.Text = ccnt;

        }

        protected void btn_sub_Click(object sender, EventArgs e)
        {
            BindData();
        }

        private void BindData()
        {
            string mon = drp_mon.SelectedValue;

            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select p.astCode,p.scheduledDate,a.custodian,a.description,a.location,a.subLoc from ast_pm p inner join ast_pc a on a.astCode=p.astCode where month='" + mon + "' and scheduledDate>='" + dsDate + "' and scheduledDate<='" + deDate + "' and lockStat='N'";
            conn_asset.Open();
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();


            DataRow newRow;
            OdbcDataReader dr = cmd.ExecuteReader();

            dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(Int32)));
            dt.Columns.Add(new System.Data.DataColumn("description", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("scheduledDate", typeof(DateTime)));
            dt.Columns.Add(new System.Data.DataColumn("custodian", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("location", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("subLoc", typeof(String)));

            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["astCode"] = Convert.ToString(dr["astCode"]);
                newRow["description"] = Convert.ToString(dr["description"]);
                newRow["scheduledDate"] = Convert.ToDateTime(dr["scheduledDate"]);
                newRow["custodian"] = Convert.ToString(dr["custodian"]);
                newRow["location"] = Convert.ToString(dr["location"]);
                newRow["subLoc"] = Convert.ToString(dr["subLoc"]);

                dt.Rows.Add(newRow);
            }
            if (dt.Rows.Count > 0)
            {
                grid_display.Visible = true;
                grid_display.DataSource = dt;
                grid_display.DataBind();
                lbl_no_recs.Visible = false;

            }
            else
            {
                grid_display.Visible = false;
                lbl_no_recs.Visible = true;
            }
            conn_asset.Close();

            foreach (GridViewRow item in grid_display.Rows)
            {
                string astCode = item.Cells[2].Text.ToString();
                string sDate = item.Cells[4].Text.ToString();
                DateTime dDate = Convert.ToDateTime(sDate);

                DropDownList stat = (DropDownList)item.FindControl("stat");
                string status = stat.SelectedValue.ToString();

                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "update ast_pm set compStat='" + status + "' where astCode='" + astCode + "' and scheduledDate>='" + dsDate + "' and scheduledDate<='" + deDate + "'";
                conn_asset.Open();
                cmda.ExecuteNonQuery();
                conn_asset.Close();

            }

            
        }

        protected void btn_print_Click(object sender, EventArgs e)
        {
            if (category.Equals("PCS") || category.Equals("PCA") || category.Equals("PCW") || category.Equals("LAP"))
            {
                Response.Redirect("~/Print/pc.aspx");
            }
            else if (category.Equals("DMP") || category.Equals("MLJ") || category.Equals("CLJ") || category.Equals("CIJ") || category.Equals("MIJ") || category.Equals("MLM") || category.Equals("CLM") || category.Equals("MLH") || category.Equals("CLH") || category.Equals("LPR"))
            {
                Response.Redirect("~/Print/printer");
            }
            else if (category.Equals("SCS") || category.Equals("SCA"))
            {
                Response.Redirect("~/Print/scanner");
            }
            else if (category.Equals("SRV"))
            {
                Response.Redirect("~/Print/server");
            }
            else
            {
                Response.Redirect("~/Print/network");
            }
        }
    }
}