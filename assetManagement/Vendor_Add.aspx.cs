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

    public partial class Vendor_Add : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindData();
                home_visible();
            }
        }

        private void BindData()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_vendorMaster";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("sap_vendorCode", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("vendorCode", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("vendorName", typeof(String)));
            
            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["sap_vendorCode"] = Convert.ToString(dr["sap_vendorCode"]);
                newRow["vendorCode"] = Convert.ToString(dr["vendorCode"]);
                newRow["vendorName"] = Convert.ToString(dr["vendorName"]);
                dt.Rows.Add(newRow);
            }

            if (dt.Rows.Count > 0)
            {
                grid_display.Visible = true;
                grid_display.DataSource = dt;
                grid_display.DataBind();
                grid_remove.DataSource = dt;
                grid_remove.DataBind();
            }
            else
            {
                grid_display.Visible = false;
            }
            conn_asset.Close();
        }

        public void clear()
        {
            txt_date.Text = "";
            txt_sap_vendorCode.Text = "";
            txt_vendorDesc.Text = "";
            txt_vendorName.Text = "";
            txt_vendorCode.Text = "";
        }

        protected void txt_sap_vendorCode_TextChanged(object sender, EventArgs e)
        {
            lbl_sap_vendorCodeError.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_vendorMaster where sap_vendorCode = '"+txt_sap_vendorCode.Text.Trim().ToUpper()+"'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            lbl_sap_vendorCodeError.Text = "";
            while (dr.Read())
            {
                lbl_sap_vendorCodeError.Text = "Already Registered for " + Convert.ToString(dr["vendorName"]);
                lbl_sap_vendorCodeError.Visible = true;
            }
            conn_asset.Close();
        }

        protected void txt_vendorCode_TextChanged(object sender, EventArgs e)
        {
            lbl_vendorCodeError.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_vendorMaster where vendorCode = '" + txt_vendorCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            lbl_vendorCodeError.Text = "";
            while (dr.Read())
            {
                lbl_vendorCodeError.Text = "Already Registered for " + Convert.ToString(dr["vendorName"]);
                lbl_vendorCodeError.Visible = true;
            }
            conn_asset.Close();
        }

        protected void txt_vendorName_TextChanged(object sender, EventArgs e)
        {
            lbl_vendorNameError.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_vendorMaster where vendorName = '" + txt_vendorName.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            lbl_vendorNameError.Text = "";
            while (dr.Read())
            {
                lbl_vendorNameError.Text = "Already Registered for " + Convert.ToString(dr["vendorCode"]);
                lbl_vendorNameError.Visible = true;
            }
            conn_asset.Close();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            lbl_addTitle.Visible = true;
            lbl_sap_vendorCode.Visible = true;
            lbl_vendorCode.Visible = true;
            lbl_vendorName.Visible = true;
            lbl_vendorDesc.Visible = true;
            lbl_date.Visible = true;
            btn_submit.Visible = true;
            txt_sap_vendorCode.Visible = true;
            txt_vendorCode.Visible = true;
            txt_vendorName.Visible = true;
            txt_vendorDesc.Visible = true;
            txt_date.Visible = true;

            grid_display.Visible = false;
            lbl_error.Visible = false;
            lbl_removeTitle.Visible = false;
            lbl_sap_vendorCodeError.Visible = false;
            lbl_vendorCodeError.Visible = false;
            lbl_vendorNameError.Visible = false;
            grid_remove.Visible = false;
            btn_submitRemove.Visible = false;
        }

        protected void btn_remove_Click(object sender, EventArgs e)
        {
            lbl_addTitle.Visible = false;
            lbl_sap_vendorCode.Visible = false;
            lbl_vendorCode.Visible = false;
            lbl_vendorName.Visible = false;
            lbl_vendorDesc.Visible = false;
            lbl_date.Visible = false;
            btn_submit.Visible = false;
            txt_sap_vendorCode.Visible = false;
            txt_vendorCode.Visible = false;
            txt_vendorName.Visible = false;
            txt_vendorDesc.Visible = false;
            txt_date.Visible = false;
            grid_display.Visible = false;
            lbl_sap_vendorCodeError.Visible = false;
            lbl_vendorCodeError.Visible = false;
            lbl_vendorNameError.Visible = false;
            lbl_error.Visible = false;

            lbl_removeTitle.Visible = true;   
            grid_remove.Visible = true;
            btn_submitRemove.Visible = true;
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "insert into ast_vendorMaster values('" + txt_sap_vendorCode.Text.Trim().ToUpper() + "','" + txt_vendorCode.Text.Trim().ToUpper() + "','" + txt_vendorName.Text.Trim().ToUpper() + "','" + txt_vendorDesc.Text.Trim().ToUpper() + "','" + txt_date.Text + "')";
            int check1;
            conn_asset.Open();
            check1 = cmd.ExecuteNonQuery();
            conn_asset.Close();
            BindData();
            home_visible();
            if (check1 == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                conn_asset.Close();
                lbl_error.Text = "Added successfully...";
                lbl_error.Visible = true;
                clear();
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to Add";
                lbl_error.Visible = true;
            }
        }

        protected void btn_submitRemove_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow item in grid_remove.Rows)
            {
                CheckBox chk = (CheckBox)item.FindControl("chk_select");
                if (chk.Checked == true)
                {
                    OdbcCommand cmdb = conn_asset.CreateCommand();
                    cmdb.CommandText = "delete from ast_vendorMaster where vendorCode = '" + item.Cells[2].Text.Trim().ToUpper() + "'";
                    conn_asset.Open();
                    int check;
                    check = cmdb.ExecuteNonQuery();
                    conn_asset.Close();
                }
            }
            BindData();
            home_visible();
        }

        public void home_visible()
        {
            lbl_addTitle.Visible = false;
            lbl_sap_vendorCode.Visible = false;
            lbl_vendorCode.Visible = false;
            lbl_vendorName.Visible = false;
            lbl_vendorDesc.Visible = false;
            lbl_date.Visible = false;
            btn_submit.Visible = false;
            txt_sap_vendorCode.Visible = false;
            txt_vendorCode.Visible = false;
            txt_vendorName.Visible = false;
            txt_vendorDesc.Visible = false;
            txt_date.Visible = false;
            lbl_sap_vendorCodeError.Visible = false;
            lbl_vendorCodeError.Visible = false;
            lbl_vendorNameError.Visible = false;
            lbl_error.Visible = false;
            lbl_removeTitle.Visible = false;
            grid_remove.Visible = false;
            btn_submitRemove.Visible = false;
            grid_display.Visible = true;
        }

        protected void btn_view_Click(object sender, EventArgs e)
        {
            home_visible();
        }
    }
}