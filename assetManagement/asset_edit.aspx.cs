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
    public partial class asset_edit : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        int graphics = 0;
        int hdd = 0;
        int ram = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_astCode.Visible = false;
            lbl_astCodeLen.Visible = false;
        }
        protected void txt_astCode_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            if (txt_astCode.Text != null && txt_astCode.Text != "" && txt_astCode.Text.Length != 11)
            {
                //check : astCode should contain 11 characters
                btn_reg.Enabled = false;
                btn_reg.BackColor = System.Drawing.Color.Gray;
                btn_reg.ForeColor = System.Drawing.Color.LightGray;
                btn_reg.ToolTip = "Asset Code has 11 characters";
                lbl_astCodeLen.Visible = true;
                lbl_astCode.Visible = false;
            }
            else
            {
                lbl_astCodeLen.Visible = false;
                int flag = 0;
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select astCode from ast_master where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "'";
                conn_asset.Open();
                OdbcDataReader dr = cmda.ExecuteReader();
                if (dr.Read())
                {
                    conn_asset.Close();
                    OdbcCommand cmdb = conn_asset.CreateCommand();
                    cmdb.CommandText = "select * from ast_master where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "'";
                    conn_asset.Open();
                    OdbcDataReader dr1 = cmdb.ExecuteReader();
                    while(dr1.Read())
                    {
                        txt_desc.Text = Convert.ToString(dr1["description"]);
                        txt_make.Text = Convert.ToString(dr1["make"]);
                        txt_model.Text = Convert.ToString(dr1["model"]);
                        txt_s_no.Text = Convert.ToString(dr1["ast_s_no"]);
                        txt_part_no.Text = Convert.ToString(dr1["part_no"]);
                        txt_ip.Text = Convert.ToString(dr1["ip"]);
                        DateTime issdt = Convert.ToDateTime(dr1["issueDate"]);
                        txt_issueDate.Text = issdt.ToString("yyyy/MM/dd");
                        txt_monSize.Text = Convert.ToString(dr1["monitor_size"]);
                        txt_sizeOfPaper.Text = Convert.ToString(dr1["sizeOfPaper"]);
                        drp_monRes.ClearSelection();
                        drp_monRes.Items.FindByValue(Convert.ToString(dr1["monitor_res"])).Selected = true;
                        txt_speed.Text = Convert.ToString(dr1["speed"]);
                        txt_os.Text = Convert.ToString(dr1["os"]);
                        txt_sp.Text = Convert.ToString(dr1["service_pack"]);
                        txt_srvProc.Text = Convert.ToString(dr1["processor"]);
                        txt_cla.Text = Convert.ToString(dr1["cla"]);
                        txt_ram.Text = Convert.ToString(dr1["ram"]);
                        txt_hdd.Text = Convert.ToString(dr1["hdd"]);
                        txt_graphics.Text = Convert.ToString(dr1["graphics"]);
                        txt_keyboardMake.Text = Convert.ToString(dr1["keyboardMake"]);
                        txt_keyboard_s_no.Text = Convert.ToString(dr1["keyboard_s_no"]);
                        txt_mouseMake.Text = Convert.ToString(dr1["mouseMake"]);
                        txt_mouse_s_no.Text = Convert.ToString(dr1["mouse_s_no"]);
                        txt_ibmNotes.Text = Convert.ToString(dr1["ibmNotes"]);
                        rdbtn_antiVirus.ClearSelection();
                        rdbtn_antiVirus.Items.FindByValue(Convert.ToString(dr1["antiVirus"])).Selected = true;
                        rdbtn_webcam.ClearSelection();
                        rdbtn_webcam.Items.FindByValue(Convert.ToString(dr1["webcam"])).Selected = true;
                        rdbtn_lanStat.ClearSelection();
                        rdbtn_lanStat.Items.FindByValue(Convert.ToString(dr1["lanStat"])).Selected = true;
                        txt_domain.Text = Convert.ToString(dr1["domain"]);
                        txt_domainUser.Text = Convert.ToString(dr1["domainUser"]);
                        txt_hostName.Text = Convert.ToString(dr1["hostName"]);
                        txt_remarks.Text = Convert.ToString(dr1["remarks"]);
                        flag = 1;
                    }
                    if(flag == 1)
                    {
                        btn_reg.Enabled = true;
                        btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
                        btn_reg.ForeColor = System.Drawing.Color.Black;
                        lbl_error.ForeColor = System.Drawing.Color.Green;
                        conn_asset.Close();
                        lbl_error.Text = "Edited successfully...";
                        lbl_error.Visible = true;
                        txt_astCode.Text = "";
                    }
                    else
                    {
                        lbl_error.ForeColor = System.Drawing.Color.Red;
                        lbl_error.Text = "Failed to edit";
                        lbl_error.Visible = true;
                        conn_asset.Close();
                    }
                }
                else
                {
                    conn_asset.Close();
                    lbl_astCode.Visible = true;
                    btn_reg.Enabled = false;
                    btn_reg.BackColor = System.Drawing.Color.Gray;
                    btn_reg.ForeColor = System.Drawing.Color.LightGray;
                    btn_reg.ToolTip = "Check the asset code";
                }
                
            }

        }
        protected void btn_reg_Click(object sender, EventArgs e)
        {
            string processor = "NA";
            if(drp_proc.SelectedValue.Equals("Other"))
            {
                processor = txt_srvProc.Text.Trim().ToUpper();
            }
            else
            {
                processor = drp_proc.SelectedValue;
            }
            OdbcCommand cmd = conn_asset.CreateCommand();
            try
            {
                if (txt_graphics.Text.Trim() != null && txt_graphics.Text.Trim() != "")
                    graphics = Convert.ToInt32(txt_graphics.Text.Trim());
                if (txt_hdd.Text.Trim() != null && txt_hdd.Text.Trim() != "")
                    hdd = Convert.ToInt32(txt_hdd.Text.Trim());
                if (txt_ram.Text.Trim() != null && txt_ram.Text.Trim() != "")
                    ram = Convert.ToInt32(txt_ram.Text.Trim());
            }
            catch (System.FormatException excp)
            {
                lbl_error.Visible = true;
                lbl_error.Text = "Graphics card , HDD , RAM should be integer value.";
                lbl_error.ForeColor = System.Drawing.Color.Red;
            }
            
            cmd.CommandText = "update ast_master set description = '" + txt_desc.Text.Trim().ToUpper() + "' , make = '" + txt_make.Text.Trim().ToUpper() + "',model = '" + txt_model.Text.Trim().ToUpper() + "',part_no = '" + txt_part_no.Text.Trim().ToUpper() + "',ip = '" + txt_ip.Text.Trim() + "',monitor_size = '" + txt_monSize.Text.Trim() + "',monitor_res = '" + drp_monRes.SelectedValue + "',sizeOfPaper = '" + txt_sizeOfPaper.Text.Trim().ToUpper() + "',speed = '" + txt_speed.Text.Trim().ToUpper() + "',os = '" + txt_os.Text.Trim().ToUpper() + "',service_pack = '" + txt_sp.Text.Trim().ToUpper() + "',processor = '" + processor + "',cla = '" + txt_cla.Text.Trim().ToUpper() + "',ram = '" + ram + "',hdd = '" + hdd + "',graphics = '" + graphics + "',keyboardMake = '" + txt_keyboardMake.Text.Trim().ToUpper() + "',keyboard_s_no = '" + txt_keyboard_s_no.Text.Trim().ToUpper() + "',mouseMake = '" + txt_mouseMake.Text.Trim().ToUpper() + "',mouse_s_no = '" + txt_mouse_s_no.Text.Trim().ToUpper() + "',ibmNotes = '" + txt_ibmNotes.Text.Trim().ToUpper() + "',msOffice = '" + drp_msOffice.SelectedValue + "',antiVirus = '" + rdbtn_antiVirus.SelectedValue + "',webcam = '" + rdbtn_webcam.SelectedValue + "',lanStat = '" + rdbtn_lanStat.SelectedValue + "',domain = '" + txt_domain.Text.Trim().ToUpper() + "',domainUser = '" + txt_domainUser.Text.Trim().ToUpper() + "',hostName = '" + txt_hostName.Text.Trim().ToUpper() + "',remarks = '" + txt_remarks.Text.Trim().ToUpper() + "'   where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "'";
            int check1;
            conn_asset.Open();
            check1 = cmd.ExecuteNonQuery();
            conn_asset.Close();
            if (check1 == 1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                conn_asset.Close();
                lbl_error.Text = "Changes Saved successfully...";
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Failed to save changes";
                lbl_error.Visible = true;
            }
        }
    }
}