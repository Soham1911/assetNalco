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
    public partial class Allied_Sections : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
                
                if(!IsPostBack)
                {
                    BindData();
                    btn_submit_disable();
                    home_visible();
                }
                
        }
        private void BindData()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_alliedMaster";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("sectionCode", typeof(Int32)));
            dt.Columns.Add(new System.Data.DataColumn("sectionName", typeof(String)));
           
            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["sectionCode"] = Convert.ToInt32(dr["sectionCode"]);
                newRow["sectionName"] = Convert.ToString(dr["sectionName"]);  
                dt.Rows.Add(newRow);
            }

            if (dt.Rows.Count > 0)
            {
                grid_display.Visible = true;
                grid_display.DataSource = dt;
                grid_display.DataBind();
                grid_remove.DataSource = dt;
                grid_remove.DataBind();
                lbl_no_recsAdd.Visible = false;
          
            }
            else
            {
                grid_display.Visible = false;
                lbl_no_recsAdd.Visible = true;

            }
            conn_asset.Close();

        }

        public void home_visible()
        {
            grid_display.Visible = true;

            grid_remove.Visible = false;
            grid_edit.Visible = false;
            btn_submitRemove.Visible = false;
            btn_submitEdit.Visible = false;
            lbl_editTitle.Visible = false;
            lbl_no_recsEdit.Visible = false;
            btn_submit.Visible = false;
            lbl_addTitle.Visible = false;
            lbl_removeTitle.Visible = false;
            lbl_sectionName.Visible = false;
            lbl_error.Visible = false;
            txt_sectionName.Visible = false;
            lbl_no_recsAdd.Visible = false;
            lbl_no_recsRemove.Visible = false;
            lbl_secNameError.Visible = false;
        }
        public void btn_add_visible()
        {
            lbl_addTitle.Visible = true;
            lbl_sectionName.Visible = true;
            txt_sectionName.Visible = true;
            btn_submit.Visible = true;
            grid_display.Visible = true;
            
            grid_remove.Visible = false;
            grid_edit.Visible = false;
            btn_submitRemove.Visible = false;
            btn_submitEdit.Visible = false;
            lbl_removeTitle.Visible = false;
            lbl_editTitle.Visible = false;
            lbl_error.Visible = false;
            lbl_no_recsRemove.Visible = false;
            lbl_no_recsEdit.Visible = false;
            lbl_no_recsAdd.Visible = false;
            lbl_secNameError.Visible = false;

        }

        public void btn_remove_visible()
        {
            lbl_removeTitle.Visible = true;
            grid_remove.Visible = true;
            btn_submitRemove.Visible = true;

            grid_display.Visible = false;
            grid_edit.Visible = false;
            btn_submit.Visible = false;
            btn_submitEdit.Visible = false;
            lbl_addTitle.Visible = false;
            lbl_editTitle.Visible = false;
            lbl_sectionName.Visible = false;
            lbl_error.Visible = false;
            txt_sectionName.Visible = false;
            lbl_no_recsAdd.Visible = false;
            lbl_no_recsEdit.Visible = false;
            lbl_secNameError.Visible = false;

        }

        public void btn_edit_visible()
        {
            lbl_editTitle.Visible = true;
            grid_edit.Visible = true;
            btn_submitEdit.Visible = true;

            grid_display.Visible = false;
            grid_remove.Visible = false;
            btn_submit.Visible = false;
            btn_submitRemove.Visible = false;
            lbl_addTitle.Visible = false;
            lbl_removeTitle.Visible = false;
            lbl_sectionName.Visible = false;
            lbl_error.Visible = false;
            txt_sectionName.Visible = false;
            lbl_no_recsAdd.Visible = false;
            lbl_no_recsRemove.Visible = false;
            lbl_secNameError.Visible = false;

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

        protected void btn_add_Click(object sender, EventArgs e)
        {
            btn_add_visible();
        }

        protected void btn_remove_Click(object sender, EventArgs e)
        {
            btn_remove_visible();
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            btn_edit_visible();
        }

        protected void txt_sectionName_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            btn_submit_disable();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_alliedMaster where sectionName = '" + txt_sectionName.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                lbl_secNameError.Visible = true;
                btn_submit_disable();
            }
            else
            {
                lbl_secNameError.Visible = false;
                btn_submit_enable();
            }
            conn_asset.Close();
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "insert into ast_alliedMaster(sectionName) values('" + txt_sectionName.Text.Trim().ToUpper() + "')";
            conn_asset.Open();
            int check = cmd.ExecuteNonQuery();
            conn_asset.Close();
            if(check == 1)
            {
                lbl_error.Visible = true;
                btn_submit_disable();
                BindData();
                home_visible();
                txt_sectionName.Text = "";
            }
        }

        protected void btn_submitRemove_Click(object sender, EventArgs e)
        {
            foreach(GridViewRow item in grid_remove.Rows)
            {
                CheckBox chk = (CheckBox)item.FindControl("chk_select");
                if(chk.Checked == true)
                {
                    OdbcCommand cmdb = conn_asset.CreateCommand();
                    cmdb.CommandText = "delete from ast_alliedMaster where sectionName = '" + item.Cells[2].Text.Trim().ToUpper() + "'";
                    conn_asset.Open();
                    int check;
                    check = cmdb.ExecuteNonQuery();
                    conn_asset.Close();
                }
            }
            BindData();
            home_visible();
        }

        protected void btn_submitEdit_Click(object sender, EventArgs e)
        {

        }
    }
}