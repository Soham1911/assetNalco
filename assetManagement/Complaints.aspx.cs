﻿using System;
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
    public partial class Complaints : System.Web.UI.Page
    {

        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

          protected void Page_Load(object sender, EventArgs e)
          {

              string p_no;

              p_no = Session["user"].ToString();
            
            
                OdbcCommand cmda = conn_asset.CreateCommand();
               
                cmda.CommandText = "select astCode from ast_pc where custodian='" + p_no.Trim() + "'";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Drp_1.DataSource = dt;
                Drp_1.DataBind();
                
              


          }
    
        protected void btn_reg_Click(object sender, EventArgs e)
        {
            string p_no;
            string astCode = Drp_1.SelectedItem.Value;
            string type = rdbtn_type.SelectedValue;
            string date = DateTime.Now.ToString("yyyy/MM/dd");
            p_no = Session["user"].ToString();

            //searching for Asset
            lbl_error.Visible = false;

                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "insert into ast_call( p_no, astCode ,userDescription,openingDate,type,callStat) values ('" + p_no.Trim() + "', '" + astCode + "', '" + txt_desc.Text.Trim() + "','" + date + "','" + type + "','o')";
                conn_asset.Open();
                
                cmda.ExecuteNonQuery();

                conn_asset.Close();
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Complaint Registered";
                lbl_error.Visible = true;

        }

       

      
    }
}