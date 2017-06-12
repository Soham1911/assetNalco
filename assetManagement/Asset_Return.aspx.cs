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
    public partial class Asset_Return : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        string p_no = "default";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            lbl_invalid.Visible = false;
            int flg = 0;
            //searching for asset
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_pc where astCode='" + txt_astCode.Text.Trim() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            
            while (dr.Read())
            {
                lbl_astCode.Text = dr["astCode"].ToString();
                lbl_astCode.Visible = true;
                lbl_astType.Text = dr["category"].ToString();
                lbl_astType.Visible = true;
                p_no = dr["custodian"].ToString();
                lbl_custPNo.Text = p_no;
                lbl_custPNo.Visible = true;
                
                lbl_dept.Text = dr["dept"].ToString();
                lbl_dept.Visible = true;
                lbl_location.Text = dr["location"].ToString();
                lbl_location.Visible = true;
                flg = 1;
            }
            if(flg == 1)
            {
                conn_asset.Close();
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select * from ast_empMaster where p_no='" + p_no + "'";
                conn_asset.Open();
                OdbcDataReader dr1 = cmda.ExecuteReader();
                while (dr1.Read())
                {
                    lbl_custName.Text = dr1["name"].ToString();
                    lbl_custName.Visible = true;
                    lbl_error.Text = "Success";
                    lbl_error.Visible = true;
                }
                conn_asset.Close();
                if(lbl_dept.Text == "systems")
                {
                    lbl_error.ForeColor = System.Drawing.Color.Orange;
                    lbl_error.Text = "Already in Systems";
                    lbl_error.Visible = true;
                }
            }
            else
            {
                lbl_invalid.Text = "Invalid Asset Code";
                lbl_invalid.Visible = true;
            }
        }

        protected void btn_ret_Click(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            //update ast_pc
            OdbcCommand cmdd = conn_asset.CreateCommand();
            cmdd.CommandText = "update ast_pc set dept='" + "systems" + "', location='" + "systems" + "', subLoc='" + "store" + "'  where astCode='" + txt_astCode.Text.Trim() + "'";
            conn_asset.Open();
            int dr4 = cmdd.ExecuteNonQuery();
            conn_asset.Close();
            //Update History
            OdbcCommand cmde = conn_asset.CreateCommand();
            cmde.CommandText = "update ast_history set toDate='" + txt_retDate.Text + "' where astCode='" + txt_astCode.Text.Trim() + "' and custodian_p_no ='" + lbl_custPNo.Text.Trim() + "' and toDate = '1900-01-01'";
            conn_asset.Open();
            int dr5 = cmde.ExecuteNonQuery();
            conn_asset.Close();
            if(dr4 == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Returned successfully...";
                lbl_error.Visible = true;
                lbl_astCode.Visible = false;
                lbl_astType.Visible = false;
                lbl_custPNo.Visible = false;
                lbl_dept.Visible = false;
                lbl_location.Visible = false;
                lbl_custName.Visible = false;
            }
            else 
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to return";
                lbl_error.Visible = true;
            }
        }
    }
}