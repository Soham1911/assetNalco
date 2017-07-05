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
    public partial class User1 : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            AssetShow();
        }
     

        private void AssetShow()
        {
            string pers_no ;

            pers_no = Session["user"].ToString();
           
            
            conn_asset.Open();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_master where custodian='" + pers_no.Trim() + "'";

            OdbcDataAdapter da = new OdbcDataAdapter();
            DataTable dt = new DataTable();
            DataRow newRow;
            OdbcDataReader dr = cmd.ExecuteReader();

            dt.Columns.Add(new System.Data.DataColumn("asset", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("desc", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("doa", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("model", typeof(String)));


            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["asset"] = Convert.ToString(dr["astCode"]);
                newRow["type"] = Convert.ToString(dr["category"]);
                newRow["desc"] = Convert.ToString(dr["description"]);
                DateTime issdt = Convert.ToDateTime(dr["issueDate"]);
                newRow["doa"] = issdt.ToString("yyyy/MM/dd");
                newRow["model"] = Convert.ToString(dr["model"]);
                dt.Rows.Add(newRow);

            }

            if (dt.Rows.Count > 0)
            {
                grid_display1.Visible = true;
                grid_display1.DataSource = dt;
                grid_display1.DataBind();
                
            }
            else
            {
                grid_display1.Visible = false;
                


            }
            conn_asset.Close();
        }
    }
}