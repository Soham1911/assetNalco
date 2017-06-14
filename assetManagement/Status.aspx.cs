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

            p_no = Session["user"].ToString();

            conn_asset.Open();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_call where p_no='" + p_no + "'";

            OdbcDataAdapter da = new OdbcDataAdapter();
            DataTable dt = new DataTable();
            DataRow newRow;
            OdbcDataReader dr = cmd.ExecuteReader();
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
                newRow["astCode"] = Convert.ToString(dr["astCode"]);
                newRow["category"] = Convert.ToString(dr["category"]);
                newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                newRow["type"] = Convert.ToString(dr["type"]);
                newRow["callStat"] = Convert.ToString(dr["callStat"]);
                newRow["openingDate"] = Convert.ToString(dr["openingDate"]);
                newRow["closingDate"] = Convert.ToString(dr["closingDate"]);
                dt.Rows.Add(newRow);

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

        }
    }
}