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
    public partial class Complaints : System.Web.UI.Page
    {
        private static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        private OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void typeChanged(object sender, EventArgs e)
        {
            string chk = rdbtn_type.SelectedValue;
            string p_no;

            p_no = Session["user"].ToString();

            OdbcCommand cmde = conn_asset.CreateCommand();
            cmde.CommandText = "select category from ast_master where custodian ='" + p_no.Trim() + "'";
            conn_asset.Open();

            OdbcDataReader cat = cmde.ExecuteReader();
            string typeAsset;
            typeAsset = "";
            while (cat.Read())
            {
                typeAsset = cat["category"].ToString();
            }

            conn_asset.Close();

            OdbcCommand cmdf = conn_asset.CreateCommand();
            if (chk == "SOFTWARE")
                cmdf.CommandText = "select * from error_selection where (Type ='SOFTWARE' or Type = 'BOTH') ";
            else
                if( chk == "HARDWARE")
                cmdf.CommandText = "select * from error_selection where (Type ='HARDWARE' or Type = 'BOTH') ";
                else
                    cmdf.CommandText = "select * from error_selection where (Type ='OTHER' or Type = 'BOTH') ";
               
            OdbcDataAdapter df = new OdbcDataAdapter(cmdf);
            DataTable dt1 = new DataTable();
            df.Fill(dt1);

            Drp_2.DataSource = dt1;
            Drp_2.DataValueField = "Problem";
            Drp_2.DataTextField = "Problem";
            Drp_2.DataBind();

            Drp_2.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string p_no;

            p_no = Session["user"].ToString();

            if (!Page.IsPostBack)
            {
                Drp_2.Visible = false;
                OdbcCommand cmda = conn_asset.CreateCommand();

                cmda.CommandText = "select * from ast_master where custodian='" + p_no.Trim() + "'";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();

                da.Fill(dt);

                dt.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "astCode + ' - ' + description"));
                Drp_1.DataSource = dt;
                Drp_1.DataValueField = "astCode";
                Drp_1.DataTextField = "Title";
                Drp_1.DataBind();
            }
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            string p_no;
            p_no = Session["user"].ToString();

            string astCode = Drp_1.SelectedValue;
            string type = rdbtn_type.SelectedValue;
            DateTime date = DateTime.Now;
            DateTime date1 = DateTime.Now;
            int i = -1;

            int flag = 0;
            string amcVendor = "";
            string hostName = Dns.GetHostName(); // Retrive the Name of HOST
            // Get the IP
            string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();
            //Geting Persnoal Number from session
            p_no = Session["user"].ToString();
            //checking for duplicate
            OdbcCommand cmdd = conn_asset.CreateCommand();
            cmdd.CommandText = "select * from ast_call where astCode='" + astCode + "' and callStat = 'o' and openingDate = '" + date + "' ";
            conn_asset.Open();
            OdbcDataReader dr = cmdd.ExecuteReader();
            if (dr.Read())
            {
                flag = 1;
            }
            conn_asset.Close();

            OdbcCommand cmdf = conn_asset.CreateCommand();
            cmdf.CommandText = "select * from ast_master where astCode='" + astCode + "'";
            conn_asset.Open();
            OdbcDataReader dr1 = cmdf.ExecuteReader();
            while (dr1.Read())
            {
                amcVendor = Convert.ToString(dr1["amcParty"]);
                date1 = Convert.ToDateTime(dr1["warrantyEnd"]); 
            }
            conn_asset.Close();

            OdbcCommand cmde = conn_asset.CreateCommand();
            cmde.CommandText = "select category from ast_master where custodian ='" + p_no.Trim() + "'";
            conn_asset.Open();

            OdbcDataReader cat = cmde.ExecuteReader();
            string typeAsset;
            typeAsset = "PR";
            while (cat.Read())
            {
                typeAsset = cat["category"].ToString();
            }

            conn_asset.Close();

            if (flag == 0)
            {
                //entering the complaint
                lbl_error.Visible = false;

                OdbcCommand cmdc = conn_asset.CreateCommand();
                if(date1 > date)
                    cmdc.CommandText = "insert into ast_call( p_no, astCode, category, userDescription, systemDescription, openingDate, type, callStat, openingIP, amcParty) values ( '" + p_no.Trim() + "', '" + astCode + "','" + typeAsset.Trim() + "', '" + txt_desc.Text.Trim() + "','" + Drp_2.SelectedValue + "' , '" + date + " ','" + type.Trim() + "','o', '" + myIP.Trim() + "', 'NONE') ";
                else
                    cmdc.CommandText = "insert into ast_call( p_no, astCode, category, userDescription, systemDescription, openingDate, type, callStat, openingIP, amcParty) values ( '" + p_no.Trim() + "', '" + astCode + "','" + typeAsset.Trim() + "', '" + txt_desc.Text.Trim() + "','" + Drp_2.SelectedValue + "' , '" + date + " ','" + type.Trim() + "','o', '" + myIP.Trim() + "', '" + amcVendor.Trim() + "') ";
                
                conn_asset.Open();

                i = cmdc.ExecuteNonQuery();

                conn_asset.Close();
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Complaint already found";
                lbl_error.Visible = true;
            }

            if (i == -1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Complaint Already Registered";
                lbl_error.Visible = true;
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Complaint Registered";
                lbl_error.Visible = true;
            }
        }

        protected void Drp_1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}