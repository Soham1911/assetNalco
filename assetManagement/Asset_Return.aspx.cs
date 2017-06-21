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
        string ast = "default";
        //string retDate2 = Convert.ToString(DateTime.Now);
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_astType.Visible = false;
            lbl_custName.Visible = false;
            lbl_custPNo.Visible = false;
            lbl_dept.Visible = false;
            lbl_error.Visible = false;
            lbl_invalid.Visible = false;
            lbl_location.Visible = false;
            lbl_retDate.Visible = false;
            img_p.Visible = false;
            txt_retDate.Enabled = false;
            btn_ret.Enabled = false;
            btn_ret.BackColor = System.Drawing.Color.Gray;
            btn_ret.ForeColor = System.Drawing.Color.LightGray;
            
        }
 
        protected void btn_ret_Click(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
           
            //update ast_master
            OdbcCommand cmd = conn_asset.CreateCommand();
            //cmd.CommandText = "select * from ast_pc where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_server where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_nwitem where astCode='" + txt_astCode.Text.Trim() + "'  UNION select astCode from ast_printer where astCode='" + txt_astCode.Text.Trim() + "' UNION select astCode from ast_other where astCode='" + txt_astCode.Text.Trim() + "'";
            cmd.CommandText = "select * from ast_master where astCode='" + txt_astCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            string unitCode = "default";
            while (dr.Read())
            {
                unitCode = dr["unit"].ToString();
            }
            conn_asset.Close();
            OdbcCommand cmdd = conn_asset.CreateCommand();
            cmdd.CommandText = "update ast_master set dept='" + "SYSTEMS" + "', location='" + "SYSTEMS" + "', subLoc1='" + "SYSTEMS STORE" + "', subLoc2='" + "SYSTEMS STORE" + "',custodian='" + "SYSTEMS" + "'  where astCode='" + txt_astCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            int dr4 = cmdd.ExecuteNonQuery();
            conn_asset.Close();
            OdbcCommand cmdf = conn_asset.CreateCommand();
            cmdf.CommandText = "insert into ast_cust_history values('" + txt_astCode.Text.Trim().ToUpper() + "','" + p_no + "','" + txt_retDate.Text + "' , '','','" + unitCode + "')";
            conn_asset.Open();
            int dr6 = cmdf.ExecuteNonQuery();
            conn_asset.Close();
            if(dr4 == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Returned successfully...";
                lbl_error.Visible = true;
                lbl_astType.Visible = false;
                lbl_custName.Visible = false;
                lbl_custPNo.Visible = false;
                lbl_dept.Visible = false;
                lbl_invalid.Visible = false;
                lbl_location.Visible = false;
                txt_retDate.Enabled = false;
                btn_ret.Enabled = false;
                btn_ret.BackColor = System.Drawing.Color.Gray;
                btn_ret.ForeColor = System.Drawing.Color.LightGray;
                img_p.Visible = false;
                txt_astCode.Text = "";
                txt_retDate.Text = "";
                lbl_astType.Text = "Asset Type : ";
                lbl_custPNo.Text = "Custodian's Personal No. : ";
                lbl_custName.Text = "Custodian's Name : ";
                lbl_dept.Text = "Department : ";
                lbl_location.Text = "Location : ";
            }
            else 
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to return";
                lbl_error.Visible = true;
            }
        }

        protected void txt_astCode_TextChanged(object sender, EventArgs e)
        {
            ast = txt_astCode.Text.Trim().ToUpper();
            lbl_astType.Text = "Asset Type : ";
            lbl_custPNo.Text = "Custodian's Personal No. : ";
            lbl_custName.Text = "Custodian's Name : ";
            lbl_dept.Text = "Department : ";
            lbl_location.Text = "Location : ";
            int flg = 0;
            //searching for asset
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_master where astCode='" + txt_astCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {

                lbl_astType.Text += dr["category"].ToString();
                lbl_astType.Visible = true;
                p_no = dr["custodian"].ToString();
                lbl_custPNo.Text += p_no;
                lbl_custPNo.Visible = true;

                lbl_dept.Text += dr["dept"].ToString();
                lbl_dept.Visible = true;
                lbl_location.Text += dr["location"].ToString();
                lbl_location.Visible = true;
                flg = 1;
                img_p.ImageUrl = "~/Images/" + p_no + ".jpg";
                img_p.Visible = true;
            }
            if (flg == 1)
            {
                conn_asset.Close();
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select * from ast_empMaster where p_no='" + p_no.Trim().ToUpper() + "'";
                conn_asset.Open();
                OdbcDataReader dr1 = cmda.ExecuteReader();
                while (dr1.Read())
                {
                    lbl_custName.Text += dr1["name"].ToString();
                    lbl_custName.Visible = true;
                    txt_retDate.Enabled = true;
                    btn_ret.Enabled = true;
                    btn_ret.BackColor = System.Drawing.Color.LightSteelBlue;
                    btn_ret.ForeColor = System.Drawing.Color.Black;
                }
                conn_asset.Close();
                if (lbl_dept.Text == "SYSTEMS")
                {
                    lbl_error.ForeColor = System.Drawing.Color.Orange;
                    lbl_error.Text = "Already in Systems";
                    lbl_error.Visible = true;
                    txt_retDate.Enabled = false;
                    btn_ret.Enabled = false;
                    btn_ret.BackColor = System.Drawing.Color.Gray;
                    btn_ret.ForeColor = System.Drawing.Color.LightGray;
                }
            }
            else
            {
                lbl_invalid.Text = "Invalid Asset Code";
                lbl_invalid.Visible = true;
                txt_retDate.Enabled = false;
                btn_ret.Enabled = false;
                btn_ret.BackColor = System.Drawing.Color.Gray;
                btn_ret.ForeColor = System.Drawing.Color.LightGray;
            }
        }

        protected void txt_retDate_TextChanged(object sender, EventArgs e)
        {
             //checking fro return date
            lbl_retDate.Visible = false;
            lbl_astType.Visible = true;
            lbl_custName.Visible = true;
            lbl_custPNo.Visible = true;
            lbl_dept.Visible = true;
            lbl_location.Visible = true;
            img_p.Visible = true;
            string retDate = Convert.ToString(DateTime.Now);
            retDate = txt_retDate.Text;
            DateTime retDate1 = Convert.ToDateTime(retDate);
            OdbcCommand cmdch = conn_asset.CreateCommand();
            cmdch.CommandText = "select fromDate from ast_cust_history where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "' and custodian_p_no = '"+p_no+"' and toDate = '1900-01-01' ";
            conn_asset.Open();
            OdbcDataReader dr = cmdch.ExecuteReader();
            DateTime fromDate = DateTime.Now;
            while(dr.Read())
            {
                fromDate = Convert.ToDateTime(dr["fromDate"]);
            }
            conn_asset.Close();
            if(fromDate > retDate1)
            {
                lbl_retDate.Text += Convert.ToString(fromDate);
                lbl_retDate.Visible = true;
                txt_retDate.Text = "";
                txt_retDate.Enabled = true;
                
            }
            else
            {
                btn_ret.Enabled = true;
                txt_retDate.Enabled = true;
                btn_ret.BackColor = System.Drawing.Color.LightSteelBlue;
                btn_ret.ForeColor = System.Drawing.Color.Black;
                //retDate2 = txt_retDate.Text;
                //Update custHistory
                OdbcCommand cmde = conn_asset.CreateCommand();
                cmde.CommandText = "update ast_cust_history set toDate='" + txt_retDate.Text + "' where astCode='" + txt_astCode.Text.Trim().ToUpper() + "' and toDate = '1900-01-01'";
                conn_asset.Open();
                int dr5 = cmde.ExecuteNonQuery();
                conn_asset.Close();

                lbl_error.Visible = true;
            }
        }
    }
}