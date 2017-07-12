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
    public partial class PM_Month_Allot : System.Web.UI.Page
    {
        private static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        private OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void txt_astCode_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select astCode from ast_master where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            if (!dr.Read())
            {
                
                btn_submit.Enabled = false;
                btn_submit.BackColor = System.Drawing.Color.Gray;
                btn_submit.ForeColor = System.Drawing.Color.LightGray;

                btn_submit.ToolTip = "Can not find asset code";
            }
            else
            {
                
                btn_submit.Enabled = true;
                btn_submit.BackColor = System.Drawing.Color.LightSteelBlue;
                btn_submit.ForeColor = System.Drawing.Color.Black;
                lbl_error.Visible = false;
                btn_submit.ToolTip = "Click to register";
            }
            conn_asset.Close();
           
            

            
        } 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                DateTime date = DateTime.Now;
                int count;
                int i = 1;

                OdbcCommand cmdc = conn_asset.CreateCommand();
                cmdc.CommandText = "select count(*) from ast_master where warrantyEnd < '" + date + "' ";
                conn_asset.Open();
                //OdbcDataReader dr1 = cmdc.ExecuteReader();
                count = (int)cmdc.ExecuteScalar();
                conn_asset.Close();

                lbl_underWarranty.Text += Convert.ToString(count);
                count = 0;
                OdbcCommand cmdd = conn_asset.CreateCommand();
                cmdd.CommandText = "select count(*) from ast_master where pm_no = '" + i + "'";
                conn_asset.Open();
                // OdbcDataReader dr2 = cmdd.ExecuteReader();
                count = (int)cmdd.ExecuteScalar();
                conn_asset.Close();

                lbl_qrtr1.Text += Convert.ToString(count);
                count = 0;
                i = 2;

                OdbcCommand cmde = conn_asset.CreateCommand();
                cmde.CommandText = "select count(*) from ast_master where pm_no = '" + i + "'";
                conn_asset.Open();
                // OdbcDataReader dr3 = cmde.ExecuteReader();
                count = (int)cmde.ExecuteScalar();
                conn_asset.Close();

                lbl_qrtr2.Text += Convert.ToString(count);
                count = 0;

                i = 3;

                OdbcCommand cmdf = conn_asset.CreateCommand();
                cmdf.CommandText = "select count(*) from ast_master where pm_no = '" + i + "'";
                conn_asset.Open();
                //  OdbcDataReader dr4 = cmdf.ExecuteReader();
                count = (int)cmdf.ExecuteScalar();
                conn_asset.Close();

                lbl_qrtr3.Text += Convert.ToString(count);
                count = 0;
            }
            
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            int flag = 0;
            string zero = "0";
            OdbcCommand cmdd = conn_asset.CreateCommand();
            cmdd.CommandText = "select * from ast_master where astCode='" + txt_astCode.Text.Trim().ToUpper() + "' and pm_no = '" + zero + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmdd.ExecuteReader();
            if (dr.Read())
            {
                flag = 1;
            }
            conn_asset.Close();

            if (flag == 1)
            {
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = " update ast_master set pm_no = '" + Drp_1.SelectedValue + "' where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "'";
                conn_asset.Open();
                cmda.ExecuteNonQuery();
                conn_asset.Close();

                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "PM Month Registered";
                lbl_error.Visible = true;
            }
            else
            {
                lbl_error.Text = "PM Month already Allowted";
                lbl_error.Visible = true;
                 
            }

        }

    }
}