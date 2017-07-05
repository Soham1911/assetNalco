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
    public partial class Allied_UserReg : System.Web.UI.Page
    {

        //create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                drp_user_add(drp_sec.SelectedValue);
            }
        }

        public void drp_user_add(String section)
        {
            
            //adding values to drp_uname
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select * from ast_alliedUserLogin where sectionCode = '" + section + "' order by username";
            OdbcDataAdapter da = new OdbcDataAdapter(cmda);
            DataTable dt = new DataTable();

            da.Fill(dt);
            dt.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "username + ' : ' + name"));

            drp_uname.DataSource = dt;
            drp_uname.DataValueField = "username";
            drp_uname.DataTextField = "Title";
            drp_uname.DataBind();
            drp_uname.Items.Insert(0, new ListItem("Select Username"));
        }

        public void display_info(string username,string name,string loc,string contact)
        {
            lbl_name.Visible = true;
            lbl_location.Visible = true;
            lbl_contact.Visible = true;
            img_p.Visible = true;

            lbl_name.Text = "Name : "+name;
            lbl_location.Text = "Locatiion : "+loc;
            lbl_contact.Text = "Contact : "+contact;
            img_p.ImageUrl = "~/Images/" + username + ".jpg";
        }

        public void hide_info()
        {
            lbl_name.Visible = false;
            lbl_location.Visible = false;
            lbl_contact.Visible = false;
            lbl_gridTitle.Visible = false;
            img_p.Visible = false;
        }

        protected void btn_rem_Click(object sender, EventArgs e)
        {
            lbl_error.Text = "";
            OdbcCommand cmdb = conn_asset.CreateCommand();
            lbl_error.Text = drp_uname.SelectedItem.Text + " is removed successfully";
            cmdb.CommandText = "delete from ast_alliedUserLogin where username = '" + drp_uname.SelectedValue + "'";
            conn_asset.Open();
            int check;
            check = cmdb.ExecuteNonQuery();
            conn_asset.Close();
            if (check == 1)
            {
                drp_user_add(drp_sec.SelectedValue);
                lbl_error.Visible = true;
                lbl_error.ForeColor = System.Drawing.Color.Green;
                
            }
            else
            {
                lbl_error.Visible = true;
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to remove";
            }
        }

        protected void drp_sec_SelectedIndexChanged(object sender, EventArgs e)
        {
            hide_info();
            drp_user_add(drp_sec.SelectedValue);
            lbl_error.Visible = false;
        }

        protected void drp_uname_SelectedIndexChanged(object sender, EventArgs e)
        {
            hide_info();
            lbl_error.Visible = false;
            grid_display.Visible = false;
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select * from ast_alliedUserLogin where username='" + drp_uname.SelectedValue + "'";
            conn_asset.Open();
            OdbcDataReader dr1 = cmda.ExecuteReader();
            while(dr1.Read())
            {
                display_info(dr1["username"].ToString(),dr1["name"].ToString(),dr1["location"].ToString(),dr1["contact"].ToString());
            }
            conn_asset.Close();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select astCode from ast_master where custodian='" + drp_uname.SelectedValue + "' order by category";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["astCode"] = Convert.ToString(dr["astCode"]);
                dt.Rows.Add(newRow);

            }
            if (dt.Rows.Count > 0)
            {
                grid_display.Visible = true;
                grid_display.DataSource = dt;
                grid_display.DataBind();
                lbl_gridTitle.Visible = true;

            }
            else
            {
                grid_display.Visible = false;
                lbl_gridTitle.Visible = false;

            }
        }
    }
}