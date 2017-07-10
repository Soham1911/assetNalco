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
        //create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        //initialising variables
        string user_id = "default", unit_cd = "";
        int graphics = 0;
        int hdd = 0;
        int ram = 0;
        string issueDate = "1900-01-01", monSize = "NA", monRes = "NA", speed = "NA", sizeOfPaper = "NA", os = "NA", servicePack = "NA", proc = "NA", cla = "NA", kbMake = "NA", kb_s_no = "NA", mouMake = "NA", mou_s_no = "NA", ibmNote = "NA", msOffice = "NA", antivirus = "N", webcam = "N", lanStat = "N", domain = "NA", domainUser = "NA",hostName = "NA",msOfficeVer = "NA",type="NA";
        decimal poPrice = 0;

        public void disableButton()
        {
            //to Disable Button
            btn_reg.Enabled = false;
            btn_reg.BackColor = System.Drawing.Color.Gray;
            btn_reg.ForeColor = System.Drawing.Color.LightGray;
        }
        public void enableButton()
        {
            //to Enable Button
            btn_reg.Enabled = true;
            btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
            btn_reg.ForeColor = System.Drawing.Color.Black;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = Session["systems"].ToString();
            //adding unit code to ast_master
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
            

             if (!Page.IsPostBack)
             {
                 //adding values to drp_categ

                 OdbcCommand cmdb = conn_asset.CreateCommand();
                 cmdb.CommandText = "select * from ast_typeMaster";
                 OdbcDataAdapter da = new OdbcDataAdapter(cmdb);
                 DataTable dt = new DataTable();

                 da.Fill(dt);
                 dt.Columns.Add(new DataColumn("categoryDetail", System.Type.GetType("System.String"), "category + ' : ' + desc"));
                 drp_categ.DataSource = dt;
                 drp_categ.DataValueField = "category";
                 drp_categ.DataTextField = "categoryDetail";
                 drp_categ.DataBind();

                 //adding values to drp_monRes
                 OdbcCommand cmdc = conn_asset.CreateCommand();
                 cmdc.CommandText = "select * from ast_monRes";
                 OdbcDataAdapter db = new OdbcDataAdapter(cmdc);
                 DataTable dt1 = new DataTable();

                 db.Fill(dt1);
                 drp_monRes.DataSource = dt1;
                 drp_monRes.DataValueField = "Code";
                 drp_monRes.DataTextField = "Resolution";
                 drp_monRes.DataBind();

                 txt_msOfficeVer.Enabled = false;
                 txt_antiV.Enabled = false;

                 //adding values to drp_vendor
                 OdbcCommand cmds = conn_asset.CreateCommand();
                 cmds.CommandText = "select * from ast_vendorMaster";
                 OdbcDataAdapter ds = new OdbcDataAdapter(cmds);
                 DataTable dts = new DataTable();
                 ds.Fill(dts);
                 drp_vendor.DataSource = dts;
                 drp_vendor.DataValueField = "vendorCode";
                 drp_vendor.DataTextField = "vendorName";
                 drp_vendor.DataBind();

                 disableButton();
             }
            
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            string category = drp_categ.SelectedValue;
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select type from ast_typeMaster where category = '" + category + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            while (dr.Read())
            {
                type = dr["type"].ToString();
            }
            conn_asset.Close();
            if (category.Equals("PCS") || category.Equals("PCA") || category.Equals("PCW") || category.Equals("LAP"))
            {
                monRes = drp_monRes.SelectedValue;
                proc = drp_proc.SelectedValue.ToUpper();
                webcam = rdbtn_webcam.SelectedValue;
                lanStat = rdbtn_lanStat.SelectedValue;
                msOffice = drp_msOffice.SelectedValue;
                msOfficeVer = txt_msOfficeVer.Text.Trim().ToUpper();
                antivirus = txt_antiV.Text.Trim().ToUpper();
                issueDate = txt_issueDate.Text;
                monSize = txt_monSize.Text.Trim();
                os = txt_os.Text.Trim().ToUpper();
                servicePack = txt_sp.Text.Trim().ToUpper();
                kbMake = txt_keyboardMake.Text.Trim().ToUpper();
                kb_s_no = txt_keyboard_s_no.Text.Trim().ToUpper();
                mouMake = txt_mouseMake.Text.Trim().ToUpper();
                mou_s_no = txt_mouse_s_no.Text.Trim().ToUpper();
                ibmNote = txt_ibmNotes.Text.Trim().ToUpper();
                domain = txt_domain.Text.Trim().ToUpper();
                domainUser = txt_domainUser.Text.Trim().ToUpper();
                hostName = txt_hostName.Text.Trim().ToUpper();
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
            }
            else if (category.Equals("SRV"))
            {
                monRes = drp_monRes.SelectedValue;
                proc = txt_srvProc.Text.Trim().ToUpper();
                cla = txt_cla.Text.Trim();
                webcam = rdbtn_webcam.SelectedValue;
                lanStat = rdbtn_lanStat.SelectedValue;
                msOffice = drp_msOffice.SelectedValue;
                msOfficeVer = txt_msOfficeVer.Text.Trim().ToUpper();
                antivirus = txt_antiV.Text.Trim().ToUpper();
                monSize = txt_monSize.Text.Trim();
                os = txt_os.Text.Trim().ToUpper();
                servicePack = txt_sp.Text.Trim().ToUpper();
                kbMake = txt_keyboardMake.Text.Trim().ToUpper();
                kb_s_no = txt_keyboard_s_no.Text.Trim().ToUpper();
                mouMake = txt_mouseMake.Text.Trim().ToUpper();
                mou_s_no = txt_mouse_s_no.Text.Trim().ToUpper();
                ibmNote = txt_ibmNotes.Text.Trim().ToUpper();
                domain = txt_domain.Text.Trim().ToUpper();
                domainUser = txt_domainUser.Text.Trim().ToUpper();
                hostName = txt_hostName.Text.Trim().ToUpper();
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
            }
            else if (category.Equals("SCS") || category.Equals("SCA") || category.Equals("DMP") || category.Equals("MLJ") || category.Equals("CLJ") || category.Equals("CIJ") || category.Equals("MIJ") || category.Equals("MLM") || category.Equals("CLM") || category.Equals("MLH") || category.Equals("CLH") || category.Equals("LPR") || category.Equals("PLT"))
            {
                speed = txt_speed.Text.Trim();
                sizeOfPaper = txt_sizeOfPaper.Text.Trim();
            }
            string poDate = "1900-01-01",
                installDate = "1900-01-01",
                warStart = "1900-01-01",
                warEnd = "1900-01-01",
                warStat = "Y";
            if (txt_warStart.Text.Trim() != null && txt_warStart.Text.Trim() != "")
                warStart = txt_warStart.Text;
            if (txt_warEnd.Text.Trim() != null && txt_warEnd.Text.Trim() != "")
                warEnd = txt_warEnd.Text;
            if (txt_installDate.Text.Trim() != null && txt_installDate.Text.Trim() != "")
                installDate = txt_installDate.Text;
            if (txt_poDate.Text.Trim() != null && txt_poDate.Text.Trim() != "")
                poDate = txt_poDate.Text;
            try
            {
                if(txt_poPrice.Text.Trim() != null && txt_poPrice.Text.Trim() != "")
                    poPrice = System.Convert.ToDecimal(txt_poPrice.Text.Trim());
                DateTime today = DateTime.Now;
                DateTime warStart1 = Convert.ToDateTime(warStart);
                DateTime warEnd1 = Convert.ToDateTime(warEnd);
                string categ = drp_categ.SelectedValue;
                //checking warranty status
                if (today > warStart1 && today < warEnd1)
                {
                    warStat = "Y";
                }
                else
                {
                    warStat = "N";
                }
                //inserting into ast_master
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "insert into ast_master(unit,astCode,description,make,model,category,ast_s_no,part_no,custodian,issueDate,dept,location,subLoc1,subLoc12,monitor_size,monitor_res,os,service_pack,processor,cla,speed,sizeOfPaper,ram,hdd,graphics,ip,keyboardMake,keyboard_s_no,mouseMake,mouse_s_no,msOffice,ibmNotes,webcam,lanStat,domain,domainUser,hostName,po_no,poDate,vendorCode,poPrice,installation,warrantyStat,warrantyStart,warrantyEnd,remarks,availability,type,msOfficeVer,antiVirus,presentUser) values('" + unit_cd + "','" + txt_astCode.Text.Trim().ToUpper() + "','" + txt_desc.Text.Trim().ToUpper() + "','" + txt_make.Text.Trim().ToUpper() + "','" + txt_model.Text.Trim().ToUpper() + "','" + categ + "','" + txt_s_no.Text.Trim().ToUpper() + "','" + txt_part_no.Text.Trim().ToUpper() + "','" + "SYSTEMS" + "','" + issueDate + "','" + "SYSTEMS" + "','" + "SYSTEMS STORE" + "','" + "SYSTEMS STORE" + "','" + "SYSTEMS STORE" + "','" + monSize + "','" + monRes + "','" + os + "','" + servicePack + "','" + proc + "','" + cla + "','" + speed + "','" + sizeOfPaper + "','" + ram + "','" + hdd + "','" + graphics + "','" + txt_ip.Text.Trim() + "','" + kbMake + "','" + kb_s_no + "','" + mouMake + "','" + mou_s_no + "','" + msOffice + "','" + ibmNote + "','" + webcam + "','" + lanStat + "','" + domain + "','" + domainUser + "','" + hostName + "','" + txt_po_no.Text + "','" + poDate + "','" + drp_vendor.SelectedValue + "','" + poPrice + "','" + installDate + "','" + warStat + "','" + warStart + "','" + warEnd + "','" + txt_remarks.Text + "','Y','" + type + "','" + msOfficeVer + "','" + antivirus + "','" + "SYSTEMS" + "')";
                int check;
                conn_asset.Open();
                check = cmd.ExecuteNonQuery();
                if (check == 1)
                {
                    conn_asset.Close();
                    //inserting into ast_cust_history
                    OdbcCommand cmd1 = conn_asset.CreateCommand();
                    cmd1.CommandText = "insert into ast_cust_history values('" + txt_astCode.Text.Trim().ToUpper() + "','SYSTEMS','" + issueDate + "','','','" + unit_cd + "')";
                    conn_asset.Open();
                    check = cmd1.ExecuteNonQuery();
                    lbl_error.ForeColor = System.Drawing.Color.Green;
                    conn_asset.Close();
                    //inserting into ast_amcMaster
                    //OdbcCommand cmd2 = conn_asset.CreateCommand();
                    //cmd2.CommandText = "insert into ast_amcMaster(astCode,po_no) values('"+ txt_astCode.Text.Trim().ToUpper() +"','"+txt_po_no.Text.Trim().ToUpper()+"')";
                    //conn_asset.Open();
                    //int check2 = cmd2.ExecuteNonQuery();
                    //conn_asset.Close();
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
            catch (System.FormatException exc)
            {
                lbl_error.Visible = true;
                lbl_error.Text = "Wrong format is used ";
                lbl_error.ForeColor = System.Drawing.Color.Red;
            }


        }

        protected void txt_astCode_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            if(txt_astCode.Text != null && txt_astCode.Text != "" && txt_astCode.Text.Length != 11)
            {
                //check : astCode should contain 11 characters
                disableButton();
                btn_reg.ToolTip = "Asset Code has 11 characters";
                lbl_astCodeLen.Visible = true;

            }
            else
            {
                lbl_astCodeLen.Visible = false;
                //check : already registered or not
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select astCode from ast_master where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "'";
                conn_asset.Open();
                OdbcDataReader dr = cmda.ExecuteReader();
                if (dr.Read())
                {
                    lbl_astCode.Visible = true;
                    disableButton();
                    btn_reg.ToolTip = "Can not register with same asset code";
                }
                else
                {
                    lbl_astCode.Visible = false;
                    enableButton();
                    lbl_error.Visible = false;
                    btn_reg.ToolTip = "Click to register";
                }
                conn_asset.Close();
            }
            
        }

        protected void txt_s_no_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            //check : already registered serial no.
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select ast_s_no from ast_master where ast_s_no = '" + txt_s_no.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            if (dr.Read())
            {
                lbl_s_no.Visible = true;
                disableButton();
                btn_reg.ToolTip = "Can not register with this serial no.";
            }
            else
            {
                lbl_s_no.Visible = false;
                enableButton();
                lbl_error.Visible = false;
                btn_reg.ToolTip = "Click to register";
            }
            conn_asset.Close();
        }

        protected void drp_categ_SelectedIndexChanged(object sender, EventArgs e)
        {
            //To show related fields in the form
            string categ = drp_categ.SelectedValue;
            if (categ.Equals("PCS") || categ.Equals("PCA") || categ.Equals("PCW") || categ.Equals("LAP"))
            {
                //pc/laptop
                lbl_sizeOfPaper.Visible = false;
                txt_sizeOfPaper.Visible = false;
                lbl_speed.Visible = false;
                txt_speed.Visible = false;
                txt_srvProc.Visible = false;
                lbl_cla.Visible = false;
                txt_cla.Visible = false;
                lbl_isuueDate.Visible = true;
                txt_issueDate.Visible = true;
                lbl_monSize.Visible = true;
                txt_monSize.Visible = true;
                lbl_monRes.Visible = true;
                drp_monRes.Visible = true;
                lbl_os.Visible = true;
                txt_os.Visible = true;
                lbl_sp.Visible = true;
                txt_sp.Visible = true;
                lbl_proc.Visible = true;
                drp_proc.Visible = true;
                lbl_ram.Visible = true;
                txt_ram.Visible = true;
                lbl_hdd.Visible = true;
                txt_hdd.Visible = true;
                lbl_graphics.Visible = true;
                txt_graphics.Visible = true;
                lbl_ip.Visible = true;
                txt_ip.Visible = true;
                lbl_keyboardMake.Visible = true;
                txt_keyboardMake.Visible = true;
                lbl_keyboard_s_no.Visible = true;
                txt_keyboard_s_no.Visible = true;
                lbl_mouseMake.Visible = true;
                txt_mouseMake.Visible = true;
                lbl_mouse_s_no.Visible = true;
                txt_mouse_s_no.Visible = true;
                lbl_ibmNotes.Visible = true;
                txt_ibmNotes.Visible = true;
                lbl_msOffice.Visible = true;
                drp_msOffice.Visible = true;
                lbl_msOfficeVer.Visible = true;
                txt_msOfficeVer.Visible = true;
                lbl_antiVirus.Visible = true;
                rdbtn_antiVirus.Visible = true;
                lbl_antiV.Visible = true;
                txt_antiV.Visible = true;
                lbl_webcam.Visible = true;
                rdbtn_webcam.Visible = true;
                lbl_lanStat.Visible = true;
                rdbtn_lanStat.Visible = true;
                lbl_domain.Visible = true;
                txt_domain.Visible = true;
                lbl_domainUser.Visible = true;
                txt_domainUser.Visible = true;
                lbl_hostName.Visible = true;
                txt_hostName.Visible = true;
            }
            else if (categ.Equals("SRV"))
            {
                //server
                lbl_sizeOfPaper.Visible = false;
                txt_sizeOfPaper.Visible = false;
                lbl_speed.Visible = false;
                txt_speed.Visible = false;
                drp_proc.Visible = false;
                lbl_isuueDate.Visible = false;
                txt_issueDate.Visible = false;
                lbl_monSize.Visible = true;
                txt_monSize.Visible = true;
                lbl_monRes.Visible = true;
                drp_monRes.Visible = true;
                lbl_os.Visible = true;
                txt_os.Visible = true;
                lbl_sp.Visible = true;
                txt_sp.Visible = true;
                lbl_proc.Visible = true;
                txt_srvProc.Visible = true;
                lbl_cla.Visible = true;
                txt_cla.Visible = true;
                lbl_ram.Visible = true;
                txt_ram.Visible = true;
                lbl_hdd.Visible = true;
                txt_hdd.Visible = true;
                lbl_graphics.Visible = true;
                txt_graphics.Visible = true;
                lbl_ip.Visible = true;
                txt_ip.Visible = true;
                lbl_keyboardMake.Visible = true;
                txt_keyboardMake.Visible = true;
                lbl_keyboard_s_no.Visible = true;
                txt_keyboard_s_no.Visible = true;
                lbl_mouseMake.Visible = true;
                txt_mouseMake.Visible = true;
                lbl_mouse_s_no.Visible = true;
                txt_mouse_s_no.Visible = true;
                lbl_ibmNotes.Visible = true;
                txt_ibmNotes.Visible = true;
                lbl_msOffice.Visible = true;
                drp_msOffice.Visible = true;
                lbl_msOfficeVer.Visible = true;
                txt_msOfficeVer.Visible = true;
                lbl_antiVirus.Visible = true;
                rdbtn_antiVirus.Visible = true;
                lbl_antiV.Visible = true;
                txt_antiV.Visible = true;
                lbl_webcam.Visible = true;
                rdbtn_webcam.Visible = true;
                lbl_lanStat.Visible = true;
                rdbtn_lanStat.Visible = true;
                lbl_domain.Visible = true;
                txt_domain.Visible = true;
                lbl_domainUser.Visible = true;
                txt_domainUser.Visible = true;
                lbl_hostName.Visible = true;
                txt_hostName.Visible = true;
            }
            else if (categ.Equals("SCS") || categ.Equals("SCA") || categ.Equals("DMP") || categ.Equals("MLJ") || categ.Equals("CLJ") || categ.Equals("CIJ") || categ.Equals("MIJ") || categ.Equals("MLM") || categ.Equals("CLM") || categ.Equals("MLH") || categ.Equals("CLH") || categ.Equals("LPR") || categ.Equals("PLT"))
            {
                //printer/scanner
                lbl_isuueDate.Visible = true;
                txt_issueDate.Visible = true;
                lbl_monSize.Visible = false;
                txt_monSize.Visible = false;
                lbl_monRes.Visible = false;
                drp_monRes.Visible = false;
                lbl_os.Visible = false;
                txt_os.Visible = false;
                lbl_sp.Visible = false;
                txt_sp.Visible = false;
                lbl_proc.Visible = false;
                drp_proc.Visible = false;
                txt_srvProc.Visible = false;
                lbl_cla.Visible = false;
                txt_cla.Visible = false;
                lbl_ram.Visible = false;
                txt_ram.Visible = false;
                lbl_hdd.Visible = false;
                txt_hdd.Visible = false;
                lbl_graphics.Visible = false;
                txt_graphics.Visible = false;
                lbl_ip.Visible = false;
                txt_ip.Visible = false;
                lbl_keyboardMake.Visible = false;
                txt_keyboardMake.Visible = false;
                lbl_keyboard_s_no.Visible = false;
                txt_keyboard_s_no.Visible = false;
                lbl_mouseMake.Visible = false;
                txt_mouseMake.Visible = false;
                lbl_mouse_s_no.Visible = false;
                txt_mouse_s_no.Visible = false;
                lbl_ibmNotes.Visible = false;
                txt_ibmNotes.Visible = false;
                lbl_msOffice.Visible = false;
                drp_msOffice.Visible = false;
                lbl_msOfficeVer.Visible = false;
                txt_msOfficeVer.Visible = false;
                lbl_antiV.Visible = false;
                lbl_antiVirus.Visible = false;
                rdbtn_antiVirus.Visible = false;
                txt_antiV.Visible = false;
                lbl_webcam.Visible = false;
                rdbtn_webcam.Visible = false;
                lbl_lanStat.Visible = false;
                rdbtn_lanStat.Visible = false;
                lbl_domain.Visible = false;
                txt_domain.Visible = false;
                lbl_domainUser.Visible = false;
                txt_domainUser.Visible = false;
                lbl_sizeOfPaper.Visible = true;
                txt_sizeOfPaper.Visible = true;
                lbl_hostName.Visible = false;
                txt_hostName.Visible = false;
                lbl_speed.Visible = true;
                txt_speed.Visible = true;
            }
            else if (categ.Equals("CSW") || categ.Equals("RTR") || categ.Equals("FWL") || categ.Equals("SFS") || categ.Equals("DSW") || categ.Equals("ESW") || categ.Equals("WBR"))
            {
                //network items
                lbl_sizeOfPaper.Visible = false;
                txt_sizeOfPaper.Visible = false;
                lbl_speed.Visible = false;
                txt_speed.Visible = false;
                lbl_isuueDate.Visible = true;
                txt_issueDate.Visible = true;
                lbl_monSize.Visible = false;
                txt_monSize.Visible = false;
                lbl_monRes.Visible = false;
                drp_monRes.Visible = false;
                lbl_os.Visible = false;
                txt_os.Visible = false;
                lbl_sp.Visible = false;
                txt_sp.Visible = false;
                lbl_proc.Visible = false;
                drp_proc.Visible = false;
                txt_srvProc.Visible = false;
                lbl_cla.Visible = false;
                txt_cla.Visible = false;
                lbl_ram.Visible = false;
                txt_ram.Visible = false;
                lbl_hdd.Visible = false;
                txt_hdd.Visible = false;
                lbl_graphics.Visible = false;
                txt_graphics.Visible = false;
                lbl_ip.Visible = false;
                txt_ip.Visible = false;
                lbl_keyboardMake.Visible = false;
                txt_keyboardMake.Visible = false;
                lbl_keyboard_s_no.Visible = false;
                txt_keyboard_s_no.Visible = false;
                lbl_mouseMake.Visible = false;
                txt_mouseMake.Visible = false;
                lbl_mouse_s_no.Visible = false;
                txt_mouse_s_no.Visible = false;
                lbl_ibmNotes.Visible = false;
                txt_ibmNotes.Visible = false;
                lbl_msOffice.Visible = false;
                drp_msOffice.Visible = false;
                lbl_msOfficeVer.Visible = false;
                txt_msOfficeVer.Visible = false;
                lbl_antiV.Visible = false;
                lbl_antiVirus.Visible = false;
                rdbtn_antiVirus.Visible = false;
                txt_antiV.Visible = false;
                lbl_webcam.Visible = false;
                rdbtn_webcam.Visible = false;
                lbl_lanStat.Visible = false;
                rdbtn_lanStat.Visible = false;
                lbl_domain.Visible = false;
                txt_domain.Visible = false;
                lbl_domainUser.Visible = false;
                txt_domainUser.Visible = false;
                lbl_hostName.Visible = false;
                txt_hostName.Visible = false;
            }
            else
            {
                //others
                lbl_sizeOfPaper.Visible = false;
                txt_sizeOfPaper.Visible = false;
                lbl_speed.Visible = false;
                txt_speed.Visible = false;
                lbl_isuueDate.Visible = true;
                txt_issueDate.Visible = true;
                lbl_monSize.Visible = false;
                txt_monSize.Visible = false;
                lbl_monRes.Visible = false;
                drp_monRes.Visible = false;
                lbl_os.Visible = false;
                txt_os.Visible = false;
                lbl_sp.Visible = false;
                txt_sp.Visible = false;
                lbl_proc.Visible = false;
                drp_proc.Visible = false;
                txt_srvProc.Visible = false;
                lbl_cla.Visible = false;
                txt_cla.Visible = false;
                lbl_ram.Visible = false;
                txt_ram.Visible = false;
                lbl_hdd.Visible = false;
                txt_hdd.Visible = false;
                lbl_graphics.Visible = false;
                txt_graphics.Visible = false;
                lbl_ip.Visible = false;
                txt_ip.Visible = false;
                lbl_keyboardMake.Visible = false;
                txt_keyboardMake.Visible = false;
                lbl_keyboard_s_no.Visible = false;
                txt_keyboard_s_no.Visible = false;
                lbl_mouseMake.Visible = false;
                txt_mouseMake.Visible = false;
                lbl_mouse_s_no.Visible = false;
                txt_mouse_s_no.Visible = false;
                lbl_ibmNotes.Visible = false;
                txt_ibmNotes.Visible = false;
                lbl_msOffice.Visible = false;
                drp_msOffice.Visible = false;
                lbl_msOfficeVer.Visible = false;
                txt_msOfficeVer.Visible = false;
                lbl_antiV.Visible = false;
                lbl_antiVirus.Visible = false;
                rdbtn_antiVirus.Visible = false;
                txt_antiV.Visible = false;
                lbl_webcam.Visible = false;
                rdbtn_webcam.Visible = false;
                lbl_lanStat.Visible = false;
                rdbtn_lanStat.Visible = false;
                lbl_domain.Visible = false;
                txt_domain.Visible = false;
                lbl_domainUser.Visible = false;
                txt_domainUser.Visible = false;
                lbl_hostName.Visible = false;
                txt_hostName.Visible = false;
            }
        }

        protected void rdbtn_antiVirus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rdbtn_antiVirus.SelectedValue.Equals("Y"))
            {
                txt_antiV.Text = "";
                txt_antiV.Enabled = true;
            }
            else
            {
                txt_antiV.Text = "NA";
                txt_antiV.Enabled = false;
            }
        }

        protected void drp_msOffice_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!drp_msOffice.SelectedValue.Equals("NA"))
            {
                txt_msOfficeVer.Text = "";
                txt_msOfficeVer.Enabled = true;
            }
            else
            {
                txt_msOfficeVer.Text = "NA";
                txt_msOfficeVer.Enabled = false;
            }
        }
    }
}