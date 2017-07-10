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
    public partial class Spare_Parts : System.Web.UI.Page
    {
        private static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        private OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            ID_Show();
        }
        protected void ID_Show()
        {
            conn_asset.Open();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from master_spare_entry ";
           
            OdbcDataAdapter da = new OdbcDataAdapter();
            DataTable dt = new DataTable();
            DataRow newRow;
            OdbcDataReader dr = cmd.ExecuteReader();
            dt.Columns.Add(new System.Data.DataColumn("ID", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("description", typeof(String)));

           while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["ID"] = Convert.ToString(dr["ID"]);
                newRow["description"] = Convert.ToString(dr["description"]);
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
            conn_asset.Close();
        }
        protected void btn_reg_Click(object sender, EventArgs e)
        {
            int flag = 0;
            int i = -1;
            OdbcCommand cmdd = conn_asset.CreateCommand();
            cmdd.CommandText = "select * from master_spare_entry where ID ='" + txt_idnumber.Text.Trim() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmdd.ExecuteReader();
            if (dr.Read())
            {
                flag = 1;
            }
            conn_asset.Close();

            if (flag == 0)
            {
                //entering the Spare COmponent Description
                lbl_error.Visible = false;

                OdbcCommand cmdc = conn_asset.CreateCommand();
                cmdc.CommandText = "insert into master_spare_entry ( ID, description ) values ( '" + txt_idnumber.Text.Trim() + "', '" + txt_type.Text.Trim() + "') ";
                conn_asset.Open();

                i = cmdc.ExecuteNonQuery();

                conn_asset.Close();
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "ID Number Already Found";
                lbl_error.Visible = true;
            }

            if (i == -1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Entry Error";
                lbl_error.Visible = true;
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Spare Registered";
                lbl_error.Visible = true;
            }
        }
    }
}