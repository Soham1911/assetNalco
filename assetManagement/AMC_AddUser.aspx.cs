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
    public partial class AMC_AddUser : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            btn_reg.Enabled = false;
            btn_reg.BackColor = System.Drawing.Color.Gray;
            btn_reg.ForeColor = System.Drawing.Color.LightGray;
            OdbcCommand cmda = conn_asset.CreateCommand();


            cmda.CommandText = "select * from ast_vendorMaster";
            OdbcDataAdapter da = new OdbcDataAdapter(cmda);
            DataTable dt = new DataTable();

            da.Fill(dt);

            drp_amcParty.DataSource = dt;
            drp_amcParty.DataValueField = "vendorCode";
            drp_amcParty.DataTextField = "vendorName";
            drp_amcParty.DataBind();
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            OdbcCommand cmdf = conn_asset.CreateCommand();
            cmdf.CommandText = "insert into amclogin values('" + txt_uid.Text.Trim() + "','" + txt_name.Text.Trim().ToUpper() + "','" + txt_pwd.Text + "','" + txt_designation.Text.Trim().ToUpper() + "','" + drp_amcParty.SelectedValue + "')";
            conn_asset.Open();
            int dr = cmdf.ExecuteNonQuery();
            conn_asset.Close();
            if(dr == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Registered successfully...";
                lbl_error.Visible = true;
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to register";
                lbl_error.Visible = true;
            }
        }

        protected void txt_uid_TextChanged(object sender, EventArgs e)
        {
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select user_id from amclogin where user_id = '" + txt_uid.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            if (dr.Read())
            {
                lbl_uid.Visible = true;
                btn_reg.Enabled = false;
                btn_reg.BackColor = System.Drawing.Color.Gray;
                btn_reg.ForeColor = System.Drawing.Color.LightGray;
                btn_reg.ToolTip = "Can not register with same user id code";
            }
            else
            {
                lbl_uid.Visible = false;
                btn_reg.Enabled = true;
                btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
                btn_reg.ForeColor = System.Drawing.Color.Black;
                lbl_error.Visible = false;
                btn_reg.ToolTip = "Click to register";
            }
            conn_asset.Close();
        }
    }
}