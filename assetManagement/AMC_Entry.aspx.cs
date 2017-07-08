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

    public partial class AMC_Entry : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            OdbcCommand cmda = conn_asset.CreateCommand();


            cmda.CommandText = "select vendorName,av.vendorCode as vendorCode from ast_vendorMaster av join ast_amcVendor aav on av.vendorCode=aav.amcParty";
            OdbcDataAdapter da = new OdbcDataAdapter(cmda);
            DataTable dt = new DataTable();

            da.Fill(dt);

            drp_amcParty.DataSource = dt;
            drp_amcParty.DataValueField = "vendorCode";
            drp_amcParty.DataTextField = "vendorName";
            drp_amcParty.DataBind();

            

            btn_reg.BackColor = System.Drawing.Color.Gray;
            btn_reg.ForeColor = System.Drawing.Color.LightGray;
            btn_reg.Enabled = false;

            lbl_no_recs.Visible = false;
            lbl_poDate.Text = "PO Date : ";
            lbl_poDate.Visible = false;

        }



        protected void btn_reg_Click(object sender, EventArgs e)
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "update ast_master set amcParty = '" + drp_amcParty.SelectedValue + "' , amcStart = '" + txt_amcStart.Text + "' , amcEnd = '" + txt_amcEnd.Text + "',  amcStat = 'Y' where po_no = '" + txt_po_no.Text.Trim() + "' or astCode = '" + txt_assetCode.Text.Trim().ToUpper() + "'";
            int check1;
            conn_asset.Open();
            check1 = cmd.ExecuteNonQuery();
            conn_asset.Close();

            if(drp_sel.SelectedValue.Equals("po_no"))
            {
                /////
                OdbcCommand cmd2 = conn_asset.CreateCommand();
                cmd2.CommandText = "select astCode from ast_master where po_no = '" + txt_po_no.Text.Trim().ToUpper() + "'";
                conn_asset.Open();
                OdbcDataReader dr = cmd2.ExecuteReader();

                DataTable dt = new DataTable();
                DataRow newRow;

                dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("po_no", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("amcParty", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("startDate", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("endDate", typeof(String)));

                while (dr.Read())
                {
                    newRow = dt.NewRow();
                    newRow["astCode"] = Convert.ToString(dr["astCode"]);
                    newRow["po_no"] = txt_po_no.Text.Trim().ToUpper();
                    newRow["amcParty"] = drp_amcParty.SelectedValue;
                    newRow["startDate"] = txt_amcStart.Text;
                    newRow["endDate"] = txt_amcEnd.Text;
                    dt.Rows.Add(newRow);
                }
                conn_asset.Close();

                foreach (DataRow it in dt.Rows)
                {
                    OdbcCommand cmd1 = conn_asset.CreateCommand();
                    cmd1.CommandText = "insert into ast_amcMaster values('" + it["astCode"] + "','" + it["po_no"] + "','" + it["amcParty"] + "','" + it["startDate"] + "','" + it["endDate"] + "','','1900-01-01')";
                    int check2;
                    conn_asset.Open();
                    check2 = cmd1.ExecuteNonQuery();
                    conn_asset.Close();
                }
                /////
            }
            else
            {
                OdbcCommand cmd3 = conn_asset.CreateCommand();
                cmd3.CommandText = "select po_no from ast_master where astCode = '" + txt_assetCode.Text.Trim().ToUpper() + "'";
                conn_asset.Open();
                OdbcDataReader dr3 = cmd3.ExecuteReader();
                string po_no = "default";
                if (dr3.Read())
                {
                    po_no = dr3["po_no"].ToString();  
                }

                OdbcCommand cmd2 = conn_asset.CreateCommand();
                cmd2.CommandText = "insert into ast_amcMaster values('" + txt_assetCode.Text.Trim().ToUpper() + "','" + po_no + "','" + drp_amcParty.SelectedValue + "','" + txt_amcStart.Text + "','" + txt_amcEnd.Text + "','','1900-01-01')";
                int check2;
                conn_asset.Open();
                check2 = cmd2.ExecuteNonQuery();
                conn_asset.Close();
            }
            
            if(check1 == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                conn_asset.Close();
                lbl_error.Text = "Registered successfully...";
                txt_assetCode.Text = "";
                txt_po_no.Text = "";
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Registration failed";
                lbl_error.Visible = true;
                txt_assetCode.Text = "";
                txt_po_no.Text = "";
            }

        }

        protected void txt_po_no_TextChanged(object sender, EventArgs e)
        {
           
           
            //searching by po no.
            txt_assetCode.Text = "";
            int total = 0;
            lbl_poDate.Text = "PO Date : ";
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select COUNT(*) as quantity from ast_master where po_no='" + txt_po_no.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr1 = cmda.ExecuteReader();
            while(dr1.Read())
            {
                total = Convert.ToInt32(dr1["quantity"]);
            }
            conn_asset.Close();
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select category,COUNT(*) as quantity from ast_master where po_no='" + txt_po_no.Text.Trim().ToUpper() + "' group by category";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            DataRow newRow;

            dt.Columns.Add(new System.Data.DataColumn("category", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("quantity", typeof(Int32)));
            while (dr.Read())
            {
                newRow = dt.NewRow();
                newRow["category"] = Convert.ToString(dr["category"]);
                newRow["quantity"] = Convert.ToInt32(dr["quantity"]);
                dt.Rows.Add(newRow);

            }
            
            if (dt.Rows.Count > 0)
            {
                conn_asset.Close();
                DateTime podt = DateTime.Now;
                OdbcCommand cmdb = conn_asset.CreateCommand();
                cmdb.CommandText = "select poDate from ast_master where po_no='" + txt_po_no.Text.Trim().ToUpper() + "'";
                conn_asset.Open();
                OdbcDataReader dr2 = cmdb.ExecuteReader();
                while (dr2.Read())
                {
                    podt = Convert.ToDateTime(dr2["poDate"]);
                    break;
                }
                lbl_poDate.Text += podt.ToString("yyyy/MM/dd");
                grid_display.Visible = true;
                grid_display.DataSource = dt;
                grid_display.DataBind();
                lbl_no_recs.ForeColor = System.Drawing.Color.Green;
                lbl_no_recs.Text = "Total Assets Found : " + total ;
                lbl_poDate.Visible = true;
                lbl_no_recs.Visible = true;
                btn_reg.Enabled = true;
                btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
                btn_reg.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                grid_display.Visible = false;
                lbl_no_recs.ForeColor = System.Drawing.Color.Red;
                lbl_no_recs.Text = "No Records Available";
                lbl_no_recs.Visible = true;
                btn_reg.BackColor = System.Drawing.Color.Gray;
                btn_reg.ForeColor = System.Drawing.Color.LightGray;
                btn_reg.Enabled = false;
            }
            conn_asset.Close();
        }

        protected void txt_assetCode_TextChanged(object sender, EventArgs e)
        {
            txt_po_no.Text = "";
            //searching for asset
            lbl_poDate.Text = "PO Date : ";
            lbl_poDate.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_master where astCode='" + txt_assetCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            string p_no = "default";
            int flg =0;
            lbl_astpo.Text = "PO Date : ";
            lbl_custPNo.Text = "Custodian's Personal No. : ";
            lbl_custName.Text = "Custodian's Name : ";
            lbl_dept.Text = "Department : ";
            while (dr.Read())
            {
                DateTime po_dt = Convert.ToDateTime(dr["poDate"]);
                lbl_astpo.Text += po_dt.ToString("yyyy/MM/dd");
                lbl_astpo.Visible = true;
                p_no = dr["custodian"].ToString();
                lbl_custPNo.Text += p_no;
                lbl_custPNo.Visible = true;

                lbl_dept.Text += dr["dept"].ToString();
                lbl_dept.Visible = true;

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
                }
                btn_reg.Enabled = true;
                btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
                btn_reg.ForeColor = System.Drawing.Color.Black;
                lbl_invalid.Visible = false ;
                conn_asset.Close();
            }
            else
            {
                lbl_invalid.Text = "Invalid Asset Code";
                lbl_invalid.Visible = true;
                btn_reg.BackColor = System.Drawing.Color.Gray;
                btn_reg.ForeColor = System.Drawing.Color.LightGray;
                btn_reg.Enabled = false;
                lbl_astpo.Visible = false;
                lbl_custName.Visible = false;
                lbl_custPNo.Visible = false;
                lbl_dept.Visible = false;
                img_p.Visible = false;
                lbl_astpo.Text = "PO Date : ";
                lbl_custPNo.Text = "Custodian's Personal No. : ";
                lbl_custName.Text = "Custodian's Name : ";
                lbl_dept.Text = "Department : ";
            }
        }

        protected void drp_sel_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selection = drp_sel.SelectedValue;
            if (selection.Equals("po_no"))
            {
                lbl_assetCode.Visible = false;
                txt_assetCode.Visible = false;
                lbl_po_no.Visible = true;
                txt_po_no.Visible = true;
                btn_reg.BackColor = System.Drawing.Color.Gray;
                btn_reg.ForeColor = System.Drawing.Color.LightGray;
                btn_reg.Enabled = false;
                lbl_astpo.Visible = false;
                lbl_custName.Visible = false;
                lbl_custPNo.Visible = false;
                lbl_dept.Visible = false;
                img_p.Visible = false;
                lbl_astpo.Text = "PO Date : ";
                lbl_custPNo.Text = "Custodian's Personal No. : ";
                lbl_custName.Text = "Custodian's Name : ";
                lbl_dept.Text = "Department : ";
            }
            else if (selection.Equals("assetCode"))
            {
                lbl_po_no.Visible = false;
                txt_po_no.Visible = false;
                lbl_assetCode.Visible = true;
                txt_assetCode.Visible = true;
                lbl_no_recs.Visible = false;
                grid_display.Visible = false;
            }
        }
    }
}