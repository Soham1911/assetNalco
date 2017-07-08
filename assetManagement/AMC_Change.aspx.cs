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
    public partial class AMC_Change : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //current amc
                OdbcCommand cmdb = conn_asset.CreateCommand();
                cmdb.CommandText = "select distinct amcParty,vendorName from ast_master am join ast_vendorMaster vm on am.amcParty = vm.vendorCode";
                OdbcDataAdapter db = new OdbcDataAdapter(cmdb);
                DataTable dt1 = new DataTable();
                db.Fill(dt1);
                drp_oldAmcParty.DataSource = dt1;
                drp_oldAmcParty.DataValueField = "amcParty";
                drp_oldAmcParty.DataTextField = "vendorName";
                drp_oldAmcParty.DataBind();

                //new amc
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select * from ast_vendorMaster";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();
                da.Fill(dt);
                drp_newAmcParty.DataSource = dt;
                drp_newAmcParty.DataValueField = "vendorCode";
                drp_newAmcParty.DataTextField = "vendorName";
                drp_newAmcParty.DataBind();
            }
           
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            OdbcCommand cmdf = conn_asset.CreateCommand();
            cmdf.CommandText = "update ast_master set amcParty = '" + drp_newAmcParty.SelectedValue + "',amcStart = '" + txt_amcStart.Text + "',amcEnd = '" + txt_amcEnd.Text + "' where amcParty = '" + drp_oldAmcParty.SelectedValue + "'";
            conn_asset.Open();
            int dr = cmdf.ExecuteNonQuery();
            conn_asset.Close();
        }

        protected void drp_oldAmcParty_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drp_oldAmcParty.SelectedValue == drp_newAmcParty.SelectedValue)
            {
                txt_amcStart.Enabled = false;
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select amcStart from ast_master where amcParty = '" + drp_oldAmcParty.SelectedValue + "'";
                conn_asset.Open();
                OdbcDataReader dr = cmda.ExecuteReader();
                while(dr.Read())
                {
                    txt_amcStart.Text = Convert.ToDateTime(dr["amcStart"]).ToString("yyyy/MM/dd");
                    break;
                }
                conn_asset.Close();
            }
            else
            {
                txt_amcStart.Text = "";
                txt_amcStart.Enabled = true;
            }
        }

        protected void drp_newAmcParty_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drp_oldAmcParty.SelectedValue == drp_newAmcParty.SelectedValue)
            {
                txt_amcStart.Enabled = false;
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select amcStart from ast_master where amcParty = '" + drp_oldAmcParty.SelectedValue + "'";
                conn_asset.Open();
                OdbcDataReader dr = cmda.ExecuteReader();
                while (dr.Read())
                {
                    txt_amcStart.Text = Convert.ToDateTime(dr["amcStart"]).ToString("yyyy/MM/dd");
                    break;
                }
                conn_asset.Close();
            }
            else
            {
                txt_amcStart.Text = "";
                txt_amcStart.Enabled = true;
            }
        }
    }
}