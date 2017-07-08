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

            lbl_astCode.Visible = false;
            disableButton();
            btn_reg.ToolTip = "Enter the asset code";
            lbl_custPNO.Visible = false;
            lbl_name.Visible = false;
            lbl_dept.Visible = false;
            lbl_location.Visible = false;
            lbl_contact.Visible = false;
            lbl_oldName.Visible = false;
            lbl_oldDept.Visible = false;
            lbl_oldLoc.Visible = false;
            lbl_oldContact.Visible = false;
            lbl_custPNO.Visible = false;
            lbl_name.Text = "Name : ";
            lbl_dept.Text = "Department : ";
            lbl_location.Text = "Location : ";
            lbl_contact.Text = "Contact No. : ";
            lbl_oldName.Text = "Name : ";
            lbl_oldDept.Text = "Department : ";
            lbl_oldLoc.Text = "Location : ";
            lbl_oldContact.Text = "Contact No. : ";
            lbl_alreadyAllotted.Text = "! WARNING : ASSET IS ALREADY ALLOTTED TO ";
            lbl_alreadyAllotted.Visible = false;
            img_p.Visible = false;
            img_old.Visible = false;
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            //searching for Asset
            lbl_error.Visible = false;
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select * from ast_master where astCode='" + txt_astCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            string unitCode = "default", cust = "default";
            while (dr.Read())
            {
                unitCode = dr["unit"].ToString();
                cust = dr["custodian"].ToString();
            }
            if (unitCode != "default")
            {


                conn_asset.Close();

                //check : availability of asset
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select availability from ast_master where astCode='" + txt_astCode.Text.Trim().ToUpper() + "' and availability='Y'";
                conn_asset.Open();
                OdbcDataReader dr1 = cmda.ExecuteReader();

                if (dr1.Read())
                {
                    conn_asset.Close();

                    //updating ast_cust_history
                    string date = txt_date.Text;
                    OdbcCommand cmdv = conn_asset.CreateCommand();
                    cmdv.CommandText = "update ast_cust_history set toDate ='" + date + "' where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "' and toDate = '1900-01-01'";
                    int check1;
                    conn_asset.Open();
                    check1 = cmdv.ExecuteNonQuery();
                    conn_asset.Close();
                    //inserting into ast_cust_history

                    OdbcCommand cmdb = conn_asset.CreateCommand();
                    cmdb.CommandText = "insert into ast_cust_history values('" + txt_astCode.Text.Trim().ToUpper() + "','" + txt_custPNO.Text.Trim().ToUpper() + "','" + date + "' , '','','" + unitCode + "')";
                    int check;
                    conn_asset.Open();
                    check = cmdb.ExecuteNonQuery();

                    if (check == 1)
                    {

                        conn_asset.Close();
                    }
                    else
                    {
                        lbl_error.ForeColor = System.Drawing.Color.Red;
                        lbl_error.Text = "Failed";
                        lbl_error.Visible = true;
                        txt_date.Text = "";
                    }
                    //get values from ast_empMaster
                    string Location = "default";
                    string Department = "default";
                    string issueDate = txt_date.Text;
                    OdbcCommand cmdc = conn_asset.CreateCommand();

                    cmdc.CommandText = "select * from ast_empMaster where p_no ='" + txt_custPNO.Text.Trim().ToUpper() + "'";

                    conn_asset.Open();
                    OdbcDataReader dr5 = cmdc.ExecuteReader();

                    while (dr5.Read())
                    {
                        Location = dr5["location"].ToString();

                        Department = dr5["deptCode"].ToString();
                        break;
                    }
                    conn_asset.Close();
                    //update ast_master
                    OdbcCommand cmdd = conn_asset.CreateCommand();
                    cmdd.CommandText = "update ast_master set dept='" + Department.Trim().ToUpper() + "', location='" + Location.Trim().ToUpper() + "',custodian='" + txt_custPNO.Text.Trim().ToUpper() + "',presentUser ='" + txt_custPNO.Text.Trim().ToUpper() + "', issueDate = '" + issueDate + "' where astCode='" + txt_astCode.Text.Trim().ToUpper() + "'";
                    conn_asset.Open();
                    int dr4 = cmdd.ExecuteNonQuery();
                    conn_asset.Close();
                    if (dr4 == 1)
                    {
                        lbl_error.ForeColor = System.Drawing.Color.Green;
                        lbl_error.Text = "Alloted successfully...";
                        lbl_error.Visible = true;
                        txt_date.Text = "";
                        txt_astCode.Text = "";
                        txt_custPNO.Text = "";
                    }
                    else
                    {
                        lbl_error.ForeColor = System.Drawing.Color.Red;
                        lbl_error.Text = "Failed to allot";
                        lbl_error.Visible = true;
                        txt_astCode.Text = "";
                        txt_custPNO.Text = "";

                    }

                }
                else
                {
                    lbl_error.ForeColor = System.Drawing.Color.Orange;
                    lbl_error.Text = "Asset is not available";
                    lbl_error.Visible = true;
                    txt_astCode.Text = "";
                }
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Invalid Asset Code";
                lbl_error.Visible = true;
                txt_astCode.Text = "";
            }
        }

        protected void txt_astCode_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            lbl_alreadyAllotted.Visible = false;
            lbl_alreadyAllotted.Text = "! WARNING : ASSET IS ALREADY ALLOTTED TO ";
            lbl_oldName.Text = "Name : ";
            lbl_oldDept.Text = "Department : ";
            lbl_oldLoc.Text = "Location : ";
            lbl_oldContact.Text = "Contact No. : ";
            lbl_oldName.Visible = false;
            lbl_oldDept.Visible = false;
            lbl_oldLoc.Visible = false;
            lbl_oldContact.Visible = false;
            img_old.Visible = false;
            
            string check = "default", custodian = "default";
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select availability,custodian from ast_master where astCode = '" + txt_astCode.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            while (dr.Read())
            {
                check = Convert.ToString(dr["availability"]);
                custodian = Convert.ToString(dr["custodian"]);
            }
            if (check.Equals("default"))
            {
                lbl_astCode.Text = "*Invalid asset code";
                lbl_astCode.Visible = true;
                disableButton();
                btn_reg.ToolTip = "No asset to allot";
                txt_astCode.Text = "";
            }
            else if (check.Equals("N"))
            {
                lbl_astCode.Text = "*Not Available";
                lbl_astCode.Visible = true;
                disableButton();
                btn_reg.ToolTip = "Can not register with same asset code";
                txt_astCode.Text = "";
            }
            else
            {
                // showing details of current custodian
                if(!custodian.Equals("SYSTEMS"))
                {
                    conn_asset.Close();
                    lbl_alreadyAllotted.Text += custodian;
                    lbl_alreadyAllotted.Visible = true;
                    OdbcCommand cmdg = conn_asset.CreateCommand();
                    cmdg.CommandText = "select * from ast_empMaster where p_no = '" + custodian + "'";
                    conn_asset.Open();
                    OdbcDataReader drg = cmdg.ExecuteReader();
                    int flag = 0;
                    while (drg.Read())
                    {
                        lbl_oldName.Text += Convert.ToString(drg["name"]);
                        lbl_oldDept.Text += Convert.ToString(drg["deptCode"]);
                        lbl_oldLoc.Text += Convert.ToString(drg["location"]);
                        lbl_oldContact.Text += Convert.ToString(drg["contact_no"]);
                        flag = 1;
                    }
                    if (flag == 0)
                    {
                        conn_asset.Close();
                        OdbcCommand cmdh = conn_asset.CreateCommand();
                        cmdh.CommandText = "select * from ast_alliedUserLogin au join ast_alliedMaster am on au.sectionCode = am.sectionCode where username = '" + custodian + "'";
                        conn_asset.Open();
                        OdbcDataReader drh = cmdh.ExecuteReader();
                        int flag1 = 0;
                        while (drh.Read())
                        {
                            lbl_oldName.Text += drh["name"].ToString();
                            lbl_oldLoc.Text += drh["location"].ToString();
                            lbl_oldContact.Text += drh["contact"].ToString();
                            lbl_oldDept.Text += drh["sectionName"];
                            img_old.ImageUrl = "~/Images/" + custodian + ".jpg";

                            flag1 = 1;
                        }
                        if (flag1 == 0)
                        {
                            lbl_name.Visible = false;
                            lbl_dept.Visible = false;
                            lbl_location.Visible = false;
                            lbl_contact.Visible = false;
                            img_p.Visible = false;
                            lbl_oldName.Text = "Name : ";
                            lbl_oldDept.Text = "Department : ";
                            lbl_oldLoc.Text = "Location : ";
                            lbl_oldContact.Text = "Contact No. : ";
                        }
                        else
                        {
                            lbl_oldName.Visible = true;
                            lbl_oldDept.Visible = true;
                            lbl_oldLoc.Visible = true;
                            lbl_oldContact.Visible = true;
                            img_old.ImageUrl = "~/Images/" + custodian + ".jpg";
                            img_old.Visible = true;
                        }
                        
                    }
                    else
                    {
                        lbl_oldName.Visible = true;
                        lbl_oldDept.Visible = true;
                        lbl_oldLoc.Visible = true;
                        lbl_oldContact.Visible = true;
                        img_old.ImageUrl = "~/Images/" + custodian+ ".jpg";
                        img_old.Visible = true;
                    }
                    conn_asset.Close();
                }
                lbl_astCode.Visible = false;
                enableButton();
                lbl_error.Visible = false;
            }
            conn_asset.Close();
        }

        protected void txt_custPNO_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select * from ast_empMaster where p_no = '" + txt_custPNO.Text.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            int flag = 0;
            while (dr.Read())
            {
                lbl_name.Text += Convert.ToString(dr["name"]);
                lbl_dept.Text += Convert.ToString(dr["deptCode"]);
                lbl_location.Text += Convert.ToString(dr["location"]);
                lbl_contact.Text += Convert.ToString(dr["contact_no"]);
                flag = 1;
            }
            if (flag == 0)
            {

                lbl_custPNO.Visible = true;
                disableButton();
                btn_reg.ToolTip = "Check personal no.";
                lbl_name.Visible = false;
                lbl_dept.Visible = false;
                lbl_location.Visible = false;
                lbl_contact.Visible = false;
                img_p.Visible = false;
                lbl_name.Text = "Name : ";
                lbl_dept.Text = "Department : ";
                lbl_location.Text = "Location : ";
                lbl_contact.Text = "Contact No. : ";
                txt_custPNO.Text = "";
            }
            else
            {
                lbl_name.Visible = true;
                lbl_dept.Visible = true;
                lbl_location.Visible = true;
                lbl_contact.Visible = true;
                lbl_custPNO.Visible = false;
                enableButton();
                lbl_error.Visible = false;
                img_p.ImageUrl = "~/Images/" + txt_custPNO.Text.Trim() + ".jpg";
                img_p.Visible = true;
                btn_reg.ToolTip = "Click to Allot";

            }
            conn_asset.Close();
        }

        protected void txt_date_TextChanged(object sender, EventArgs e)
        {
            enableButton();
        }
    }
}