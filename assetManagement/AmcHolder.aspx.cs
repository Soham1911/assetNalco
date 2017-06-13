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
    public partial class AmcHolder : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindData();
        }
        private void BindData()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select call_id,allotedTo,c.p_no as p_no,name,deptCode,location,subLoc,userDescription,contact_no from ast_call as c inner join ast_empMaster as e on c.p_no=e.p_no where callStat = 'o'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("call_id", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("name", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("deptCode", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("location", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("subLoc", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("userDescription", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("contact_no", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("allotedTo", typeof(String)));
            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["call_id"] = Convert.ToString(dr["call_id"]);
                newRow["name"] = Convert.ToString(dr["name"]);
                newRow["deptCode"] = Convert.ToString(dr["deptCode"]);
                newRow["location"] = Convert.ToString(dr["location"]);
                newRow["subLoc"] = Convert.ToString(dr["subLoc"]);
                newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                newRow["contact_no"] = Convert.ToString(dr["contact_no"]);
                newRow["allotedTo"] = Convert.ToString(dr["allotedTo"]);
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

        }

        int dr1 = 0;
        string call_id, IP, hostName;

        protected void chk_call_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkStatus = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chkStatus.NamingContainer;


            call_id = row.Cells[1].Text.Trim();
            bool status = chkStatus.Checked;
            string hostName = Dns.GetHostName(); // Retrive the Name of HOST
            // Get the IP
            string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();

            OdbcCommand cmd1 = conn_asset.CreateCommand();
            cmd1.CommandText = "update ast_call set callStat = 'd' , droppingIP = '"+myIP.Trim()+"' where call_id='" + call_id + "'";
            conn_asset.Open();
            dr1 = cmd1.ExecuteNonQuery();
            conn_asset.Close();
            BindData();
        }
    }
}