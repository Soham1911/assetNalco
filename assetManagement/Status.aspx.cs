﻿using System;
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
    public partial class Status : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            StatusShow();
        }

        private void StatusShow()
        {
            string p_no;
            DateTime date = DateTime.Now.AddYears(-1);
            
            p_no = Session["user"].ToString();

            conn_asset.Open();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_call where  p_no='" + p_no + "' order by callStat desc";
            DateTime.Now.AddYears(-1);
            OdbcDataAdapter da = new OdbcDataAdapter();
            DataTable dt = new DataTable();
            DataRow newRow;
            OdbcDataReader dr = cmd.ExecuteReader();
            dt.Columns.Add(new System.Data.DataColumn("call_id", typeof(Int32)));
            dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("category", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("userDescription", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("callStat", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("openingDate", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("closingDate", typeof(String)));

            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["call_id"] = Convert.ToInt32(dr["call_id"]);
                newRow["astCode"] = Convert.ToString(dr["astCode"]);
                newRow["category"] = Convert.ToString(dr["category"]);
                newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                newRow["type"] = Convert.ToString(dr["type"]);
                newRow["callStat"] = Convert.ToString(dr["callStat"]);
                newRow["openingDate"] = Convert.ToString(dr["openingDate"]);
                newRow["closingDate"] = Convert.ToString(dr["closingDate"]);
                dt.Rows.Add(newRow);

            }

            
            OdbcCommand cmd1 = conn_asset.CreateCommand();
            cmd1.CommandText = "select category from ast_master where custodian ='" + p_no + "'";
            
            
            DataRow newRow1;
            OdbcDataReader dr1 = cmd1.ExecuteReader();
            dt.Columns.Add(new System.Data.DataColumn("cat", typeof(String)));

            while (dr.Read())
            {
                newRow1 = dt.NewRow();
                newRow1["cat"] = Convert.ToString(dr1["category"]);
                dt.Rows.Add(newRow1);
            }

            if (dt.Rows.Count > 0)
            {
                grid_display.Visible = true;
                grid_display.DataSource = dt;
                grid_display.DataBind();
                
            }
            else
            {
                grid_display.Visible = false;
            }
            conn_asset.Close();
        }
    }
}