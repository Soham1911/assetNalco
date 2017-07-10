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
    public partial class subLoc1ation : System.Web.UI.Page
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
            cmd.CommandText = "select * from ast_subLoc1Master where location = '"+location+"'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("subLoc1Code", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("subLoc1Name", typeof(String)));

            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["subLoc1Code"] = Convert.ToString(dr["subLoc1Code"]);
                newRow["subLoc1Name"] = Convert.ToString(dr["subLoc1Name"]);
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
            lbl_subLoc1Code.Visible = false;
            lbl_subLoc1Name.Visible = false;
            lbl_subLoc1CodeError.Visible = false;
            lbl_subLoc1NameError.Visible = false;
            lbl_error.Visible = false;
            txt_subLoc1Name.Visible = false;
            txt_subLoc1Code.Visible = false;
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

        protected void txt_subLoc1Code_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            btn_submit_disable();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_subLoc1Master where subLoc1Code = '" + txt_subLoc1Code.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lbl_subLoc1CodeError.Visible = true;
                btn_submit_disable();
            }
            else
            {
                lbl_subLoc1CodeError.Visible = false;
                btn_submit_enable();
            }
            conn_asset.Close();
        }

        protected void txt_subLoc1Name_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            btn_submit_disable();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_subLoc1Master where subLoc1Name = '" + txt_subLoc1Name.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lbl_subLoc1NameError.Visible = true;
                btn_submit_disable();
            }
            else
            {
                lbl_subLoc1NameError.Visible = false;
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
            lbl_subLoc1Code.Visible = false;
            lbl_subLoc1Name.Visible = false;
            lbl_subLoc1CodeError.Visible = false;
            lbl_subLoc1NameError.Visible = false;
            lbl_error.Visible = false;
            txt_subLoc1Name.Visible = false;
            txt_subLoc1Code.Visible = false;
        }

        protected void btn_submitRemove_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow item in grid_remove.Rows)
            {
                CheckBox chk = (CheckBox)item.FindControl("chk_select");
                if (chk.Checked == true)
                {
                    OdbcCommand cmdb = conn_asset.CreateCommand();
                    cmdb.CommandText = "delete from ast_subLoc1Master where subLoc1Name = '" + item.Cells[2].Text.Trim().ToUpper() + "'";
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
            lbl_subLoc1Code.Visible = true;
            lbl_subLoc1Name.Visible = true;
            txt_subLoc1Name.Visible = true;
            txt_subLoc1Code.Visible = true;
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
            cmd.CommandText = "insert into ast_subLoc1Master values('" + drp_sec.SelectedValue + "','" + txt_subLoc1Code.Text.Trim().ToUpper() + "','" + txt_subLoc1Name.Text.Trim().ToUpper() + "')";
            conn_asset.Open();
            int check = cmd.ExecuteNonQuery();
            conn_asset.Close();
            if (check == 1)
            {
                lbl_error.Visible = true;
                btn_submit_disable();
                BindData(drp_sec.SelectedValue);
                home_visible();
                txt_subLoc1Code.Text = "";
                txt_subLoc1Name.Text = "";
            }
        }
    }
}