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
    public partial class Allied_AddUser : System.Web.UI.Page
    {
        //create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        public void disableButton()
        {
            //to Disable Button
            btn_reg.Enabled = false;
            btn_reg.BackColor = System.Drawing.Color.Gray;
            btn_reg.ForeColor = System.Drawing.Color.LightGray;
        }
        public void enableButton()
        {
            //to Enable Button
            btn_reg.Enabled = true;
            btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
            btn_reg.ForeColor = System.Drawing.Color.Black;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            disableButton();

            if(!IsPostBack)
            {
                //adding values to drp_sec
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select * from ast_alliedMaster";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();

                da.Fill(dt);

                drp_sec.DataSource = dt;
                drp_sec.DataValueField = "sectionCode";
                drp_sec.DataTextField = "sectionName";
                drp_sec.DataBind();

                //adding values to drp_loction
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "select * from ast_locationMaster";
                OdbcDataAdapter da1 = new OdbcDataAdapter(cmd);
                DataTable dt1 = new DataTable();

                da1.Fill(dt1);
                dt1.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "locationCode + ' : ' + locationName"));

                drp_loc.DataSource = dt1;
                drp_loc.DataValueField = "locationCode";
                drp_loc.DataTextField = "Title";
                drp_loc.DataBind();

                //adding values to drp_Subloction
                OdbcCommand cmdb = conn_asset.CreateCommand();
                cmdb.CommandText = "select * from ast_subLocMaster where location = '" + drp_loc.SelectedValue + "'";
                OdbcDataAdapter da11 = new OdbcDataAdapter(cmdb);
                DataTable dt11 = new DataTable();

                da11.Fill(dt11);
                dt11.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "subLocCode + ' : ' + subLocName"));

                drp_subLoc.DataSource = dt11;
                drp_subLoc.DataValueField = "subLocCode";
                drp_subLoc.DataTextField = "Title";
                drp_subLoc.DataBind();
            }
            
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            OdbcCommand cmdf = conn_asset.CreateCommand();
            //subLoc......
            cmdf.CommandText = "insert into ast_alliedUserLogin values('" + drp_sec.SelectedValue + "','" + txt_uname.Text.Trim() + "','password','" + txt_name.Text.Trim().ToUpper() + "','" + drp_loc.SelectedValue + "','"+drp_subLoc.SelectedValue+"','" + txt_contact.Text.Trim().ToUpper() + "','" + txt_desc.Text.Trim().ToUpper() + "')";
            conn_asset.Open();
            int dr = cmdf.ExecuteNonQuery();
            conn_asset.Close();
            if (dr == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Registered successfully...";
                lbl_error.Visible = true;
                txt_uname.Text = "";
                txt_name.Text = "";
                txt_desc.Text = "";
                txt_contact.Text = "";
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to register";
                lbl_error.Visible = true;
            }
        }

        protected void txt_uname_TextChanged(object sender, EventArgs e)
        {
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select username from ast_alliedUserLogin where username = '" + txt_uname.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            if (dr.Read())
            {
                lbl_uname.Visible = true;
                disableButton();
                btn_reg.ToolTip = "Can not register with same user id code";
            }
            else
            {
                lbl_uname.Visible = false;
                enableButton();
                lbl_error.Visible = false;
                btn_reg.ToolTip = "Click to register";
            }
            conn_asset.Close();
        }

        protected void drp_loc_SelectedIndexChanged(object sender, EventArgs e)
        {
            //adding values to drp_Subloction
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_subLocMaster where location = '"+drp_loc.SelectedValue+"'";
            OdbcDataAdapter da1 = new OdbcDataAdapter(cmd);
            DataTable dt1 = new DataTable();

            da1.Fill(dt1);
            dt1.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "subLocCode + ' : ' + subLocName"));

            drp_subLoc.DataSource = dt1;
            drp_subLoc.DataValueField = "subLocCode";
            drp_subLoc.DataTextField = "Title";
            drp_subLoc.DataBind();
        }
    }
}