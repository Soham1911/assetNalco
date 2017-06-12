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
    public partial class Asset_Allot : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_reg_Click(object sender, EventArgs e)
        {
            //searching for Asset
            lbl_error.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            //cmd.CommandText = "select * from ast_pc where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_server where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_nwitem where astCode='" + txt_astCode.Text.Trim() + "'  UNION select astCode from ast_printer where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_other where astCode='" + txt_astCode.Text.Trim() + "'";
            cmd.CommandText = "select * from ast_pc where astCode='" + txt_astCode.Text.Trim() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            string unitCode = "default";
            while (dr.Read())
            {
                unitCode = dr[0].ToString();
            }
            if (unitCode != "default")
            {
                
               
               conn_asset.Close();   
                
                
                OdbcCommand cmda = conn_asset.CreateCommand();
               // cmda.CommandText = "select availability from ast_pc where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y' UNION select availability from ast_server where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y' UNION select availability from ast_nwitem where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y' UNION select availability from ast_printer where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y' UNION select availability from ast_other where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y'";
                cmda.CommandText = "select availability from ast_pc where astCode='" + txt_astCode.Text.Trim() + "' and availability='Y'";
                conn_asset.Open();
                OdbcDataReader dr1 = cmda.ExecuteReader();
                
                if (dr1.Read())
                {
                    conn_asset.Close();
                    //inserting into ast_history
                    string date = txt_date.Text;
                    OdbcCommand cmdb = conn_asset.CreateCommand();
                    cmdb.CommandText = "insert into ast_history values('" + txt_astCode.Text + "','" + txt_custPNO.Text + "','" + date + "' , '" + DBNull.Value + "', '" + DBNull.Value + "', '" + unitCode + "')";
                    int check;
                    conn_asset.Open();
                    check = cmdb.ExecuteNonQuery();
                    if (check == 1)
                    {
                        conn_asset.Close();
                        lbl_error.ForeColor = System.Drawing.Color.Green;
                        lbl_error.Text ="Alloted successfully...";
                        lbl_error.Visible = true;
                    }
                    else
                    {
                        lbl_error.ForeColor = System.Drawing.Color.Red;
                        lbl_error.Text = "Failed";
                        lbl_error.Visible = true;
                    }
                    //get values from ast_empMaster
                    string Location = "default";
                    string Sublocation = "default";
                    string Department = "default";
                
                    OdbcCommand cmdc = conn_asset.CreateCommand();
                    OdbcCommand cmdd = conn_asset.CreateCommand();
                    cmdc.CommandText = "select * from ast_empMaster where p_no ='" + txt_custPNO.Text.Trim() + "'";

                    conn_asset.Open();
                    OdbcDataReader dr5 = cmdc.ExecuteReader();
                   
                    while (dr5.Read())
                    {
                        Location = dr5["location"].ToString();
                        Sublocation = dr5["subLoc"].ToString();
                        Department = dr5["deptCode"].ToString();
                        break;
                    }
                    conn_asset.Close();
                    //update ast_pc
                    cmdd.CommandText = "update ast_pc set dept='" + Department + "', location='" + Location + "', subLoc='" + Sublocation + "'  where astCode='" + txt_astCode.Text.Trim() + "'";
                    conn_asset.Open();
                    int dr4 = cmdd.ExecuteNonQuery();
                    conn_asset.Close();       
                }
                else
                {
                    lbl_error.ForeColor = System.Drawing.Color.Orange;
                    lbl_error.Text = "Asset is not available";
                    lbl_error.Visible = true;
                }
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Invalid Asset Code";
                lbl_error.Visible = true;
            }
        }
    }
}