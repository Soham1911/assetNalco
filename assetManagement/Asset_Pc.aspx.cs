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
    public partial class Asset_Pc : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        string user_id = "default", unit_cd = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = Session["systems"].ToString();
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select unit_cd from substr_log_access where pers_no = '" + user_id + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            while (dr.Read())
            {
                unit_cd = Convert.ToString(dr["unit_cd"]);
            }
            conn_asset.Close();
            lbl_astCode.Visible = false;
            btn_reg.Enabled = false;
            btn_reg.BackColor = System.Drawing.Color.Gray;
            btn_reg.ForeColor = System.Drawing.Color.LightGray;
            btn_reg.ToolTip = "Enter the asset code";
            txt_categ.ToolTip = "PCS : Standard PC" + "\n" + "PCA : All in one" + "\n" + "PCW : Work Station" + "\n" + "LAP : Laptop";
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            decimal poPrice = 0;
            int graphics = 0;
            int hdd = 0;
            int ram = 0;
            string monRes = drp_monRes.SelectedValue;
            string processor = drp_proc.SelectedValue;
            string webcam = rdbtn_webcam.SelectedValue;
            string lanStat = rdbtn_lanStat.SelectedValue;
            string msOffice = drp_msOffice.SelectedValue;
            string antiVirus = rdbtn_antiVirus.SelectedValue;
            string issueDate = txt_issueDate.Text,
                poDate = txt_poDate.Text,
                installDate = txt_installDate.Text,
                warStart = Convert.ToString(DateTime.Now),
                warEnd = Convert.ToString(DateTime.Now),
                warStat = "Y";
            warStart = txt_warStart.Text;
            warEnd = txt_warEnd.Text;
            try
            {
                poPrice = System.Convert.ToDecimal(txt_poPrice.Text);
                graphics = Convert.ToInt32(txt_graphics.Text);
                hdd = Convert.ToInt32(txt_hdd.Text);
                ram = Convert.ToInt32(txt_ram.Text);
                DateTime today = DateTime.Now;
                DateTime warStart1 = Convert.ToDateTime(warStart);
                DateTime warEnd1 = Convert.ToDateTime(warEnd);
                if (today > warStart1 && today < warEnd1)
                {
                    warStat = "Y";
                }
                else
                {
                    warStat = "N";
                }
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "insert into ast_master(unit,astCode,description,make,model,category,ast_s_no,part_no,custodian,issueDate,dept,location,subLoc1,subLoc2,monitor_size,monitor_res,os,service_pack,processor,ram,hdd,graphics,ip,keyboardMake,keyboard_s_no,mouseMake,mouse_s_no,msOffice,antiVirus,ibmNotes,webcam,lanStat,domain,domainUser,po_no,poDate,vendorCode,poPrice,installation,warrantyStat,warrantyStart,warrantyEnd,remarks,availability) values('" + unit_cd + "','" + txt_astCode.Text.Trim().ToUpper() + "','" + txt_desc.Text.Trim().ToUpper() + "','" + txt_make.Text.Trim().ToUpper() + "','" + txt_model.Text.Trim().ToUpper() + "','" + txt_categ.Text.Trim() + "','" + txt_s_no.Text.Trim().ToUpper() + "','" + txt_part_no.Text.Trim().ToUpper() + "','" + "SYSTEMS" + "','" + issueDate + "','" + "SYSTEMS" + "','" + "SYSTEMS STORE" + "','" + "SYSTEMS STORE" + "','" + "SYSTEMS STORE" + "','" + txt_monSize.Text + "','" + monRes + "','" + txt_os.Text.Trim().ToUpper() + "','" + txt_sp.Text.Trim().ToUpper() + "','" + processor + "','" + ram + "','" + hdd + "','" + graphics + "','" + txt_ip.Text.Trim() + "','" + txt_keyboardMake.Text.Trim().ToUpper() + "','" + txt_keyboard_s_no.Text.Trim().ToUpper() + "','" + txt_mouseMake.Text.Trim().ToUpper() + "','" + txt_mouse_s_no.Text.Trim().ToUpper() + "','" + msOffice + "','" + antiVirus + "','" + txt_ibmNotes.Text.Trim() + "','" + webcam + "','" + lanStat + "','" + txt_domain.Text.Trim().ToUpper() + "','" + txt_domainUser.Text.Trim().ToUpper() + "','" + txt_po_no.Text + "','" + poDate + "','" + txt_vendorCode.Text.Trim().ToUpper() + "','" + poPrice + "','" + installDate + "','" + warStat + "','" + warStart + "','" + warEnd + "','" + txt_remarks.Text + "','Y')";
                int check;
                conn_asset.Open();
                check = cmd.ExecuteNonQuery();
                if (check == 1)
                {
                    conn_asset.Close();
                    OdbcCommand cmd1 = conn_asset.CreateCommand();
                    cmd1.CommandText = "insert into ast_cust_history values('" + txt_astCode.Text.Trim().ToUpper() + "','SYSTEMS','" + issueDate + "','','','" + unit_cd + "')";
                    conn_asset.Open();
                    check = cmd1.ExecuteNonQuery();
                    lbl_error.ForeColor = System.Drawing.Color.Green;
                    conn_asset.Close();
                    lbl_error.Text = "Registered successfully...";
                    lbl_error.Visible = true;
                    txt_astCode.Text = "";
                    txt_s_no.Text = "";
                    txt_keyboard_s_no.Text = "";
                    txt_mouse_s_no.Text = "";
                }
                else
                {
                    lbl_error.ForeColor = System.Drawing.Color.Red;
                    lbl_error.Text = "Registration failed";
                    lbl_error.Visible = true;
                }
            }
            catch(System.FormatException exc)
            {
                lbl_error.Visible = true;
                lbl_error.Text = "Graphics card , HDD , RAM should be integer value.";
                lbl_error.ForeColor = System.Drawing.Color.Red;
            }
            
            
        }

        protected void txt_astCode_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select astCode from ast_master where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            if (dr.Read())
            {
                lbl_astCode.Visible = true;
                btn_reg.Enabled = false;
                btn_reg.BackColor = System.Drawing.Color.Gray;
                btn_reg.ForeColor = System.Drawing.Color.LightGray;
                btn_reg.ToolTip = "Can not register with same asset code";
            }
            else
            {
                lbl_astCode.Visible = false;
                btn_reg.Enabled = true;
                btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
                btn_reg.ForeColor = System.Drawing.Color.Black;
                lbl_error.Visible = false;
                btn_reg.ToolTip = "Click to register";
            }
            conn_asset.Close();
        }

        protected void txt_s_no_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select ast_s_no from ast_master where ast_s_no = '" + txt_s_no.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            if (dr.Read())
            {
                lbl_s_no.Visible = true;
                btn_reg.Enabled = false;
                btn_reg.BackColor = System.Drawing.Color.Gray;
                btn_reg.ForeColor = System.Drawing.Color.LightGray;
                btn_reg.ToolTip = "Can not register with this serial no.";
            }
            else
            {
                lbl_s_no.Visible = false;
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