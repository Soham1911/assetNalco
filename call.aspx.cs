using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Odbc;
using System.Data.SqlClient;




namespace assetManagement
{
    public partial class call : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();

        }

        protected void grid_display_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
        private void BindData()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select call_id,p_no,astCode,openingDate,type from ast_call";
            conn_asset.Open();
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            DataRow newRow;
            OdbcDataReader dr = cmd.ExecuteReader();


            dt.Columns.Add(new System.Data.DataColumn("call_id", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("p_no", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("openingDate", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));

            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["call_id"] = Convert.ToString(dr["call_id"]);
                newRow["p_no"] = Convert.ToString(dr["p_no"]);
                newRow["astCode"] = Convert.ToString(dr["astCode"]);
                newRow["openingDate"] = Convert.ToString(dr["openingDate"]);
                newRow["type"] = Convert.ToString(dr["type"]);
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

        protected void btn_cal(object sender, EventArgs e)
        {



        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "select name,user_id from amclogin";
                cmd.CommandType = CommandType.Text;
                OdbcDataAdapter da = new OdbcDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    DropDownList DropDownList1 =
                    (DropDownList)e.Row.FindControl("allottedto");
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "user_id";
                    DropDownList1.DataBind();
                }

                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select name,user_id from amclogin";
                cmda.CommandType = CommandType.Text;
                OdbcDataAdapter da1 = new OdbcDataAdapter(cmda);
                DataTable dt1 = new DataTable();
                da.Fill(dt1);

                if (dt1.Rows.Count > 0)
                {
                    DropDownList DropDownList1 =
                    (DropDownList)e.Row.FindControl("attendedby");
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "user_id";
                    DropDownList1.DataBind();
                }
                
            }
            
        }

    }
}
