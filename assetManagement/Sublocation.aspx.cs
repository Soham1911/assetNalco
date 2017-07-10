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
    public partial class subLocation : System.Web.UI.Page
    {
        //create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        int flg = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                drp_sec_add();
                BindData(drp_sec.SelectedValue);
                btn_submit_disable();
                home_visible();
            }
        }

        private void BindData(string location)
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_subLocMaster where location = '"+location+"'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("subLocCode", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("subLocName", typeof(String)));

            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["subLocCode"] = Convert.ToString(dr["subLocCode"]);
                newRow["subLocName"] = Convert.ToString(dr["subLocName"]);
                dt.Rows.Add(newRow);
            }

            if (dt.Rows.Count > 0)
            {
                grid_display.Visible = true;
                grid_display.DataSource = dt;
                grid_display.DataBind();
                grid_remove.DataSource = dt;
                grid_remove.DataBind();
                flg = 1;
            }
            else
            {
                grid_display.Visible = false;
                flg = 0;
            }
            conn_asset.Close();

        }

        public void drp_sec_add()
        {
            //adding values to drp_loction
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select * from ast_locationMaster";
            OdbcDataAdapter da = new OdbcDataAdapter(cmda);
            DataTable dt = new DataTable();

            da.Fill(dt);
            dt.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "locationCode + ' : ' + locationName"));

            drp_sec.DataSource = dt;
            drp_sec.DataValueField = "locationCode";
            drp_sec.DataTextField = "Title";
            drp_sec.DataBind();
        }

        public void home_visible()
        {
            grid_remove.Visible = false;
            btn_submitRemove.Visible = false;
            btn_submit.Visible = false;
            lbl_addTitle.Visible = false;
            lbl_removeTitle.Visible = false;
            lbl_subLocCode.Visible = false;
            lbl_subLocName.Visible = false;
            lbl_subLocCodeError.Visible = false;
            lbl_subLocNameError.Visible = false;
            lbl_error.Visible = false;
            txt_subLocName.Visible = false;
            txt_subLocCode.Visible = false;
        }

        public void btn_submit_disable()
        {
            //to Disable Button
            btn_submit.Enabled = false;
            btn_submit.BackColor = System.Drawing.Color.Gray;
            btn_submit.ForeColor = System.Drawing.Color.LightGray;
        }
        public void btn_submit_enable()
        {
            //to Enable Button
            btn_submit.Enabled = true;
            btn_submit.BackColor = System.Drawing.Color.LightSteelBlue;
            btn_submit.ForeColor = System.Drawing.Color.Black;
        }

        protected void txt_subLocCode_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            btn_submit_disable();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_subLocMaster where subLocCode = '" + txt_subLocCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lbl_subLocCodeError.Visible = true;
                btn_submit_disable();
            }
            else
            {
                lbl_subLocCodeError.Visible = false;
                btn_submit_enable();
            }
            conn_asset.Close();
        }

        protected void txt_subLocName_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            btn_submit_disable();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_subLocMaster where subLocName = '" + txt_subLocName.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lbl_subLocNameError.Visible = true;
                btn_submit_disable();
            }
            else
            {
                lbl_subLocNameError.Visible = false;
                btn_submit_enable();
            }
            conn_asset.Close();
        }

        protected void drp_sec_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData(drp_sec.SelectedValue);
            home_visible();
        }

        protected void btn_remove_Click(object sender, EventArgs e)
        {
            lbl_removeTitle.Visible = true;
            btn_submitRemove.Visible = true;
            BindData(drp_sec.SelectedValue);
            if (flg == 1)
                grid_remove.Visible = true;
            else
                grid_remove.Visible = false;
            grid_display.Visible = false;
            btn_submit.Visible = false;
            lbl_addTitle.Visible = false;
            lbl_subLocCode.Visible = false;
            lbl_subLocName.Visible = false;
            lbl_subLocCodeError.Visible = false;
            lbl_subLocNameError.Visible = false;
            lbl_error.Visible = false;
            txt_subLocName.Visible = false;
            txt_subLocCode.Visible = false;
        }

        protected void btn_submitRemove_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow item in grid_remove.Rows)
            {
                CheckBox chk = (CheckBox)item.FindControl("chk_select");
                if (chk.Checked == true)
                {
                    OdbcCommand cmdb = conn_asset.CreateCommand();
                    cmdb.CommandText = "delete from ast_subLocMaster where subLocName = '" + item.Cells[2].Text.Trim().ToUpper() + "'";
                    conn_asset.Open();
                    int check;
                    check = cmdb.ExecuteNonQuery();
                    conn_asset.Close();
                }
            }
            BindData(drp_sec.SelectedValue);
            home_visible();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            lbl_addTitle.Visible = true;
            lbl_subLocCode.Visible = true;
            lbl_subLocName.Visible = true;
            txt_subLocName.Visible = true;
            txt_subLocCode.Visible = true;
            btn_submit.Visible = true;
            BindData(drp_sec.SelectedValue);
            if (flg == 1)
                grid_display.Visible = true;
            else
                grid_display.Visible = false;
            grid_remove.Visible = false;
            btn_submitRemove.Visible = false;
            lbl_removeTitle.Visible = false;
            lbl_error.Visible = false;
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "insert into ast_subLocMaster values('" + drp_sec.SelectedValue + "','" + txt_subLocCode.Text.Trim().ToUpper() + "','" + txt_subLocName.Text.Trim().ToUpper() + "')";
            conn_asset.Open();
            int check = cmd.ExecuteNonQuery();
            conn_asset.Close();
            if (check == 1)
            {
                lbl_error.Visible = true;
                btn_submit_disable();
                BindData(drp_sec.SelectedValue);
                home_visible();
                txt_subLocCode.Text = "";
                txt_subLocName.Text = "";
            }
        }
    }
}