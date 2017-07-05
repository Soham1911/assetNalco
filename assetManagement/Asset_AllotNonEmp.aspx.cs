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
    public partial class Asset_AllotNonEmp : System.Web.UI.Page
    {
        //create connection
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //adding values to drp_sec
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select * from ast_alliedMaster";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();

                da.Fill(dt);

                drp_sec.DataSource = dt;
                drp_sec.DataValueField = "sectionCode";
                drp_sec.DataTextField = "sectionName";
                drp_sec.DataBind();
                drp_user_add(drp_sec.SelectedValue);
            }
            disableButton();
        }

        protected void btn_allot_Click(object sender, EventArgs e)
        {
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
                cmdb.CommandText = "insert into ast_cust_history values('" + txt_astCode.Text.Trim().ToUpper() + "','" + drp_uname.SelectedValue + "','" + date + "' , '','','" + unitCode + "')";
                int check;
                conn_asset.Open();
                check = cmdb.ExecuteNonQuery();
                conn_asset.Close();
                if (check != 1)
                {
                    lbl_error.ForeColor = System.Drawing.Color.Red;
                    lbl_error.Text = "Failed";
                    lbl_error.Visible = true;
                    txt_date.Text = "";                    
                }

                //get values from ast_alliedUserLogin
                string Location = "default";
                string issueDate = txt_date.Text;
                OdbcCommand cmdc = conn_asset.CreateCommand();

                cmdc.CommandText = "select * from ast_alliedUserLogin where username ='" + drp_uname.SelectedValue + "'";

                conn_asset.Open();
                OdbcDataReader dr5 = cmdc.ExecuteReader();

                while (dr5.Read())
                {
                    Location = dr5["location"].ToString();
                    break;
                }
                conn_asset.Close();

                //update ast_master
                OdbcCommand cmdd = conn_asset.CreateCommand();
                cmdd.CommandText = "update ast_master set dept='non employee', location='" + Location.Trim().ToUpper() + "',custodian='" + drp_uname.SelectedValue + "',issueDate = '" + issueDate + "' where astCode='" + txt_astCode.Text.Trim().ToUpper() + "'";
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
                    disableButton();
                    hide_oldInfo();
                    hide_info();
                }
                else
                {
                    lbl_error.ForeColor = System.Drawing.Color.Red;
                    lbl_error.Text = "Failed to allot";
                    lbl_error.Visible = true;
                    txt_astCode.Text = "";
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

        protected void drp_sec_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Add values in drp_uname
            hide_info();
            drp_user_add(drp_sec.SelectedValue);
            lbl_error.Visible = false;
        }

        protected void drp_uname_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Show new custodian's details
            hide_info();
            hide_oldInfo();
            disableButton();
            lbl_error.Visible = false;
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select * from ast_alliedUserLogin where username='" + drp_uname.SelectedValue + "'";
            conn_asset.Open();
            OdbcDataReader dr1 = cmda.ExecuteReader();
            while (dr1.Read())
            {
                lbl_name.Text += dr1["name"].ToString();
                lbl_location.Text += dr1["location"].ToString();
                lbl_contact.Text += dr1["contact"].ToString();
                img_p.ImageUrl = "~/Images/" + drp_uname.SelectedValue + ".jpg"; 
                display_info();
                enableButton();
            }
            conn_asset.Close();
        }

        public void disableButton()
        {
            //to Disable Button
            btn_allot.Enabled = false;
            btn_allot.BackColor = System.Drawing.Color.Gray;
            btn_allot.ForeColor = System.Drawing.Color.LightGray;
        }
        public void enableButton()
        {
            //to Enable Button
            if (!drp_uname.SelectedItem.Text.ToString().Equals("Select Username"))
            {
                btn_allot.Enabled = true;
                btn_allot.BackColor = System.Drawing.Color.LightSteelBlue;
                btn_allot.ForeColor = System.Drawing.Color.Black;
            }           
        }
        public void display_oldInfo()
        {
            //to show old custodian's info
            lbl_oldName.Visible = true;
            lbl_oldLoc.Visible = true;
            lbl_oldContact.Visible = true;
            lbl_alreadyAllotted.Visible = true;
            img_old.Visible = true;
        }
        public void hide_oldInfo()
        {
            // to hide old custodian's info
            lbl_oldName.Visible = false;
            lbl_oldLoc.Visible = false;
            lbl_oldContact.Visible = false;
            lbl_oldName.Text = "Name : ";
            lbl_oldLoc.Text = "Location : ";
            lbl_oldContact.Text = "Contact No. : ";
            lbl_alreadyAllotted.Text = "! WARNING : ASSET IS ALREADY ALLOTTED TO ";
            lbl_alreadyAllotted.Visible = false;
            img_old.Visible = false;
        }
        public void display_info()
        {
            //to show new custodian's info
            lbl_name.Visible = true;
            lbl_location.Visible = true;
            lbl_contact.Visible = true;
            img_p.Visible = true;
        }

        public void hide_info()
        {
            //to hide new custodian's info
            lbl_name.Text = "Name : ";
            lbl_location.Text = "Location : ";
            lbl_contact.Text = "Contact No. : ";

            lbl_name.Visible = false;
            lbl_location.Visible = false;
            lbl_contact.Visible = false;
            img_p.Visible = false;
        }

        public void drp_user_add(String section)
        {
            //adding values to drp_uname
            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select * from ast_alliedUserLogin where sectionCode = '" + section + "' order by username";
            OdbcDataAdapter da = new OdbcDataAdapter(cmda);
            DataTable dt = new DataTable();

            da.Fill(dt);
            dt.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "username + ' : ' + name"));

            drp_uname.DataSource = dt;
            drp_uname.DataValueField = "username";
            drp_uname.DataTextField = "Title";
            drp_uname.DataBind();
            drp_uname.Items.Insert(0, new ListItem("Select Username"));
        }
        protected void txt_astCode_TextChanged(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            hide_info();
            hide_oldInfo();
            disableButton();
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
                btn_allot.ToolTip = "No asset to allot";
                txt_astCode.Text = "";
            }
            else if (check.Equals("N"))
            {
                lbl_astCode.Text = "*Not Available";
                lbl_astCode.Visible = true;
                disableButton();
                btn_allot.ToolTip = "Can not register with same asset code";
                txt_astCode.Text = "";
            }
            else
            {
                // showing details of old custodian
                if (!custodian.Equals("SYSTEMS"))
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
                        lbl_oldName.Text += drg["name"].ToString();
                        lbl_oldLoc.Text += drg["location"].ToString();
                        lbl_oldContact.Text += drg["contact_no"].ToString();
                        img_old.ImageUrl = "~/Images/" + custodian + ".jpg";
             
                        flag = 1;
                    }
                    if (flag == 0)
                    {
                        hide_oldInfo();
                    }
                    else
                    {
                        display_oldInfo();
                    }
                    conn_asset.Close();
                }
                lbl_astCode.Visible = false;
                enableButton();
                lbl_error.Visible = false;
            }
            conn_asset.Close();
        }
        protected void txt_date_TextChanged(object sender, EventArgs e)
        {
            enableButton();
            hide_info();
            hide_oldInfo();
        }
    }
}