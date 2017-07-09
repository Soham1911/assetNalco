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


    public partial class pm_rel : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "select count(*),amcParty from ast_master where amcStat = 'Y' group by amcParty order by count(*) desc";
                conn_asset.Open();
                OdbcDataReader dr = cmd.ExecuteReader();
                string amcMax = "default";
                while (dr.Read())
                {
                    amcMax = dr["amcParty"].ToString();
                    break;
                }
                conn_asset.Close();
                txt_amcparty.Text = amcMax;
                DateTime stDate = Convert.ToDateTime("1900-01-01");
                DateTime enDate = Convert.ToDateTime("1900-01-01");
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select amcStart,amcEnd from ast_master where amcParty = '" + amcMax + "'";
                conn_asset.Open();
                OdbcDataReader dr1 = cmda.ExecuteReader();
                while (dr1.Read())
                {
                    stDate = Convert.ToDateTime(dr1["amcStart"]);
                    enDate = Convert.ToDateTime(dr1["amcEnd"]);
                    break;
                }
                conn_asset.Close();
                txt_start.Text = stDate.ToString("yyyy/MM/dd");
                txt_endDate.Text = enDate.ToString("yyyy/MM/dd");

                DateTime sDate = Convert.ToDateTime(txt_start.Text);
                DateTime eDate = Convert.ToDateTime(txt_endDate.Text);

                DateTime dqsDate = sDate;
                DateTime dqeDate = sDate.AddMonths(3).AddDays(-1);
                drp_quart.Items.Insert(0, new ListItem("----Select Quarter----"));

                for (int i = 1; i <= 16; i++)
                {

                    
                    string qsDate = dqsDate.ToString("yyyy/MM/dd");
                    string qeDate = dqeDate.ToString("yyyy/MM/dd");
                    string b = qsDate + " to " + qeDate;

                    drp_quart.Items.Insert(i, new ListItem(b));
                    dqsDate = dqsDate.AddMonths(3);
                    dqeDate = dqsDate.AddMonths(3).AddDays(-1);
                    
                }

                
            }
        }

        protected void btn_lock_Click(object sender, EventArgs e)
        {
            int dr1 = 0;
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

            DateTime dsDate = Convert.ToDateTime(sDate);
            DateTime deDate = Convert.ToDateTime(eDate);
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "update ast_pm set lockStat='L' where scheduledDate>='" + sDate + "' and scheduledDate<='" + eDate + "'";
            conn_asset.Open();
            dr1 = cmd.ExecuteNonQuery();
            conn_asset.Close();

            if (dr1 >= 1)
            {
                lbl_no_recs.ForeColor = System.Drawing.Color.Green;
                lbl_no_recs.Text = "Assets have been Locked";
                lbl_no_recs.Visible = true;
            }
            else
            {
                lbl_no_recs.ForeColor = System.Drawing.Color.Red;
                lbl_no_recs.Text = "Assets have not been Released Yet";
                lbl_no_recs.Visible = true;
            }
            OdbcCommand cmde = conn_asset.CreateCommand();
            cmde.CommandText = "select count(*) as c,compStat from ast_pm where scheduledDate>='" + sDate + "' and scheduledDate<='" + eDate + "' group by compStat";
            conn_asset.Open();
            OdbcDataReader drr = cmde.ExecuteReader();
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

        protected void btn_release_Click(object sender, EventArgs e)
        {

            string m = drp_quart.SelectedItem.Text;
            string sDate = "";
            string eDate = "";
            int dr1 = 0;
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

            DateTime dsDate = Convert.ToDateTime(sDate);
            DateTime deDate = Convert.ToDateTime(eDate);
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "update ast_pm set lockStat='R' where scheduledDate>='" + sDate + "' and scheduledDate<='" + eDate + "'";
            conn_asset.Open();
            dr1 = cmd.ExecuteNonQuery();
            conn_asset.Close();

            if (dr1 >= 1)
            {
                lbl_no_recs.ForeColor = System.Drawing.Color.Green;
                lbl_no_recs.Text = "Assets have been Released";
                lbl_no_recs.Visible = true;
            }
            else
            {
                
                OdbcCommand cmdq = conn_asset.CreateCommand();
                cmdq.CommandText = "select astCode,amc_mon,unit,type from ast_master where amcParty='"+ txt_amcparty.Text.Trim() +"' ";
                conn_asset.Open();
                cmdq.CommandType = CommandType.Text;
                DataTable dt = new DataTable();
                

                DataRow newRow;
                OdbcDataReader dr = cmdq.ExecuteReader();
                
                dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("amc_mon", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("unit", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));
                while (dr.Read())
                {
                       
                    newRow = dt.NewRow();
                    newRow["astCode"] = Convert.ToString(dr["astCode"]);
                    newRow["amc_mon"] = Convert.ToString(dr["amc_mon"]);
                    newRow["unit"] = Convert.ToString(dr["unit"]);
                    newRow["type"] = Convert.ToString(dr["type"]);
                    dt.Rows.Add(newRow);
                }
                conn_asset.Close();
                foreach(DataRow it in dt.Rows)
                {
                    string mon = it["amc_mon"].ToString();
                    
                    if(mon=="1")
                    {
                        
                        OdbcCommand cmdw = conn_asset.CreateCommand();
                        cmdw.CommandText = "insert into ast_pm (astCode,unitCode,month,scheduledDate,lockStat,compStat,actualDate,quarterStartDate,quarterEndDate,billStat,type) values ('" + it["astCode"] + "','" + it["unit"] + "','" + mon + "','" + dsDate.ToString("yyyy/MM/dd") + "','R','N','1900-01-01','" + dsDate.ToString("yyyy/MM/dd") + "','" + deDate.ToString("yyyy/MM/dd") + "','N','" + it["type"] + "')";
                        conn_asset.Open();
                        cmdw.ExecuteNonQuery();
                        conn_asset.Close();
                        lbl_no_recs.ForeColor = System.Drawing.Color.Green;
                        lbl_no_recs.Text = "Assets have been Released";
                        lbl_no_recs.Visible = true;
                    }
                    else if (mon == "2")
                    {

                        OdbcCommand cmdw = conn_asset.CreateCommand();
                        cmdw.CommandText = "insert into ast_pm (astCode,unitCode,month,scheduledDate,lockStat,compStat,actualDate,quarterStartDate,quarterEndDate,billStat,type) values ('" + it["astCode"] + "','" + it["unit"] + "','" + mon + "','" + dsDate.ToString("yyyy/MM/dd") + "','R','N','1900-01-01','" + dsDate.ToString("yyyy/MM/dd") + "','" + deDate.ToString("yyyy/MM/dd") + "','N','" + it["type"] + "')";
                        conn_asset.Open();
                        cmdw.ExecuteNonQuery();
                        conn_asset.Close();
                        lbl_no_recs.ForeColor = System.Drawing.Color.Green;
                        lbl_no_recs.Text = "Assets have been Released";
                        lbl_no_recs.Visible = true;
                    }
                    else if (mon == "3")
                    {

                        OdbcCommand cmdw = conn_asset.CreateCommand();
                        cmdw.CommandText = "insert into ast_pm (astCode,unitCode,month,scheduledDate,lockStat,compStat,actualDate,quarterStartDate,quarterEndDate,billStat,type) values ('" + it["astCode"] + "','" + it["unit"] + "','" + mon + "','" + dsDate.ToString("yyyy/MM/dd") + "','R','N','1900-01-01','" + dsDate.ToString("yyyy/MM/dd") + "','" + deDate.ToString("yyyy/MM/dd") + "','N','" + it["type"] + "')";
                        conn_asset.Open();
                        cmdw.ExecuteNonQuery();
                        conn_asset.Close();
                        lbl_no_recs.ForeColor = System.Drawing.Color.Green;
                        lbl_no_recs.Text = "Assets have been Released";
                        lbl_no_recs.Visible = true;
                    }

                    
                }
 
                //lbl_no_recs.ForeColor = System.Drawing.Color.Red;
                //lbl_no_recs.Text = "No Assets Available";
                //lbl_no_recs.Visible = true;
            }

            OdbcCommand cmde = conn_asset.CreateCommand();
            cmde.CommandText = "select count(*) as c,compStat from ast_pm where scheduledDate>='" + sDate + "' and scheduledDate<='" + eDate + "' group by compStat";
            conn_asset.Open();
            OdbcDataReader drr = cmde.ExecuteReader();
            string pcnt = "0";
            string ccnt = "0";
            while(drr.Read())
            {
                if(drr["compStat"].ToString().Equals("N"))
                {
                     
                    pcnt = drr["c"].ToString();
                    
                }
                else if(drr["compStat"].ToString().Equals("F"))
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
    }
}