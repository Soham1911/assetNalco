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
        string userID = "default";
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Session["amc"].ToString();
            lbl_error.Visible = false;

            if (!IsPostBack)
                BindData();
            
        }
        private void BindData()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select call_id,c.p_no as p_no,name,deptCode,location,subLoc1,userDescription,contact_no from ast_call as c inner join ast_empMaster as e on c.p_no=e.p_no where callStat = 'O' and allotedTo = '"+userID+"' order by openingDate";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("call_id", typeof(Int32)));
            dt.Columns.Add(new System.Data.DataColumn("name", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("deptCode", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("location", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("subLoc", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("userDescription", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("contact_no", typeof(String)));
            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["call_id"] = Convert.ToInt32(dr["call_id"]);
                newRow["name"] = Convert.ToString(dr["name"]);
                newRow["deptCode"] = Convert.ToString(dr["deptCode"]);
                newRow["location"] = Convert.ToString(dr["location"]);
                newRow["subLoc"] = Convert.ToString(dr["subLoc1"]);
                newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                newRow["contact_no"] = Convert.ToString(dr["contact_no"]);
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
        string call_id1, IP, hostName;

        protected void btn_save_Click(object sender, EventArgs e)
        {
            int dr1 = 0;
            foreach (GridViewRow item in grid_display.Rows)
            {
                string call_id1 = item.Cells[0].Text.ToString();
                int call_id = Convert.ToInt32(call_id1);

                DropDownList callStat = (DropDownList)item.FindControl("callStat");
                string status = callStat.SelectedValue.ToString();
               
                string hostName = Dns.GetHostName(); // Retrive the Name of HOST
                // Get the IP
                string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "update ast_call set callStat = '" + status +"' , droppingIP = '" + myIP.Trim() + "',droppedBy = '" + userID.Trim() + "' where call_id = '" + call_id + "'";
                conn_asset.Open();
                dr1 = cmd.ExecuteNonQuery();
                conn_asset.Close();
                BindData();
            }
            if (dr1 == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Success";
                lbl_error.Visible = true;
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed";
                lbl_error.Visible = true;
            }
        }
    }
}