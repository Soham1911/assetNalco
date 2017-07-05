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
    public partial class call_hist : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        string p_no = "default";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindData();
            p_no = Session["systems"].ToString();
        }

        protected void grid_display_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
        private void BindData()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select c.call_id,c.p_no,e.name,d.deptName,e.location,e.contact_no,c.openingDate,c.closingDate,c.attendedBy,c.userDescription,c.remarks from ast_call as c inner join ast_empMaster as e on c.p_no=e.p_no inner join ast_deptMaster d on d.deptCode=e.deptCode where callStat='c' ";
            conn_asset.Open();
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();


            DataRow newRow;
            OdbcDataReader dr = cmd.ExecuteReader();

            dt.Columns.Add(new System.Data.DataColumn("call_id", typeof(Int32)));
            dt.Columns.Add(new System.Data.DataColumn("p_no", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("name", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("deptName", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("location", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("contact_no", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("userDescription", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("openingDate", typeof(DateTime)));
            dt.Columns.Add(new System.Data.DataColumn("closingDate", typeof(DateTime)));
            dt.Columns.Add(new System.Data.DataColumn("attendedBy", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("remarks", typeof(String)));
            

            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["call_id"] = Convert.ToInt32(dr["call_id"]);
                newRow["p_no"] = Convert.ToString(dr["p_no"]);
                newRow["name"] = Convert.ToString(dr["name"]);
                newRow["deptName"] = Convert.ToString(dr["deptName"]);
                newRow["location"] = Convert.ToString(dr["location"]);
                newRow["contact_no"] = Convert.ToString(dr["contact_no"]);
                newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                newRow["openingDate"] = Convert.ToDateTime(dr["openingDate"]);
                newRow["closingDate"] = Convert.ToDateTime(dr["closingDate"]);
                newRow["attendedBy"] = Convert.ToString(dr["attendedBy"]);
                newRow["remarks"] = Convert.ToString(dr["remarks"]);
                
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

    }
}