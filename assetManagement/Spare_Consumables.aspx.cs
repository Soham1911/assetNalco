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
    public partial class Spare_Consumables : System.Web.UI.Page
    {
        private static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        private OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = " select * from master_spare_entry order by description asc";
                OdbcDataAdapter da1 = new OdbcDataAdapter(cmda);
                DataTable dt1 = new DataTable();

                da1.Fill(dt1);
                Drp_1.DataSource = dt1;
                Drp_1.DataTextField = "description";
                Drp_1.DataValueField = "ID";
                Drp_1.DataBind();

                OdbcCommand cmdc = conn_asset.CreateCommand();
                cmdc.CommandText = " select * from amclogin";
                OdbcDataAdapter da3 = new OdbcDataAdapter(cmdc);
                DataTable dt3 = new DataTable();
                dt3.Clear();
                da3.Fill(dt3);
                Drp_3.DataSource = dt3;
                Drp_3.DataTextField = "name";
                Drp_3.DataValueField = "user_id";
                Drp_3.DataBind();
            }
        }

        protected void SelectChanged (object sender, EventArgs e)
        {
            string check = Drp_1.SelectedValue.Trim();
            OdbcCommand cmdb = conn_asset.CreateCommand();
            cmdb.CommandText = " select * from spare_master where type = '" + check + "'";
            OdbcDataAdapter da2 = new OdbcDataAdapter(cmdb);
            DataTable dt2 = new DataTable();

            
            da2.Fill(dt2);
            dt2.Columns.Add(new DataColumn("Desc", System.Type.GetType("System.String"), "currentStock + ' - ' + make + ' - ' + model"));
            Drp_2.DataSource = dt2;
            Drp_2.AppendDataBoundItems = true;
            Drp_2.DataTextField = "Desc";
            Drp_2.DataValueField = "model";
            Drp_2.DataBind();
            Drp_2.Visible = true;
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            int quantity = Convert.ToInt32(txt_quantity.Text.Trim());
            int i = -1;

            string hostName = Dns.GetHostName(); // Retrive the Name of HOST
            // Get the IP
            string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();
            string date = txt_installationDate.Text;
            OdbcCommand cmdd = conn_asset.CreateCommand();
            cmdd.CommandText = "insert into spare_consumables values ('" + txt_astCode.Text.Trim() + "','" + Drp_1.SelectedValue.Trim() + "' , '" + Drp_2.SelectedValue.Trim() + "' , '" + quantity + "' , '" + date + "' , '" + Drp_3.SelectedValue.Trim() + "' , '" + hostName.Trim() + "') ";

            conn_asset.Open();
            i = cmdd.ExecuteNonQuery();
            conn_asset.Close();

            if (i == -1)
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Spare Allotment Failed";
                lbl_error.Visible = true;
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Spare Alloted";
                lbl_error.Visible = true;
            }
            conn_asset.Close();

            OdbcCommand cmde = conn_asset.CreateCommand();
            cmde.CommandText = "select currentStock from spare_master where model = '" + Drp_2.SelectedValue + "'";
            conn_asset.Open();
            OdbcDataReader dr3 = cmde.ExecuteReader();
            
            int qnty = 0;
            while (dr3.Read())
            {
                qnty =  Convert.ToInt32( dr3["currentStock"]);

            }
            conn_asset.Close();

            
            qnty = qnty - quantity;

            OdbcCommand cmdf = conn_asset.CreateCommand();
            cmdf.CommandText = "update spare_master set currentStock = '" + qnty + "'where model = '" + Drp_2.SelectedValue + "' ";
            conn_asset.Open();
            cmdf.ExecuteNonQuery();
            conn_asset.Close();
            
            

        }

        protected void txt_astCode_TextChanged(object sender, EventArgs e)
        {
            string astCode = txt_astCode.Text.Trim();

            OdbcCommand cmdz = conn_asset.CreateCommand();
            cmdz.CommandText = "select * from ast_master where astCode = '" + astCode.Trim().ToUpper() + "'";
            conn_asset.Open();
            OdbcDataReader dr1 = cmdz.ExecuteReader();
            int flag1 = 0;
            if (dr1.Read())
            {
                flag1 = 1;
            }
            conn_asset.Close();

            if (flag1 == 0)
            {
                lbl_astCode.Visible = true;
                btn_reg.Enabled = false;
                btn_reg.BackColor = System.Drawing.Color.Gray;
                btn_reg.ForeColor = System.Drawing.Color.LightGray;
                btn_reg.ToolTip = "Check Asset Code.";
                lbl_name.Visible = false;

                lbl_location.Visible = false;
                lbl_subLoc.Visible = false;
                lbl_model.Visible = false;
                lbl_desc.Visible = false;

                img_p.Visible = false;
            }
            else
            {
                string p_no = "";

                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select * from ast_master where astCode = '" + astCode.Trim().ToUpper() + "'";
                conn_asset.Open();
                OdbcDataReader dr = cmda.ExecuteReader();
                
                int flag = 0;
                while (dr.Read())
                {
                    lbl_desc.Text = Convert.ToString(dr["description"]);
                    
                    lbl_model.Text = Convert.ToString(dr["model"]);
                    p_no =  Convert.ToString(dr["custodian"]);
                    
                    flag = 2;
                }
                conn_asset.Close();

                OdbcCommand cmdb = conn_asset.CreateCommand();
                cmdb.CommandText = "select * from ast_empMaster where p_no = '" + p_no.Trim() + "'";
                conn_asset.Open();
                OdbcDataReader dr2 = cmdb.ExecuteReader();
                while (dr2.Read())
                {
                    lbl_name.Text = Convert.ToString(dr2["name"]);

                    lbl_location.Text = Convert.ToString(dr2["location"]);
                    lbl_subLoc.Text = Convert.ToString(dr2["subLoc"]);

                    if(flag==2)
                    flag = 1;
                }
                conn_asset.Close();

                if (flag == 1)
              
                {
                    lbl_name.Visible = true;
                    lbl_model.Visible = true;
                    lbl_subLoc.Visible = true;
                    lbl_location.Visible = true;
                    lbl_desc.Visible = true;
                    lbl_astCode.Visible = false;
                    btn_reg.Enabled = true;
                    btn_reg.BackColor = System.Drawing.Color.LightSteelBlue;
                    btn_reg.ForeColor = System.Drawing.Color.Black;
                    lbl_error.Visible = false;
                    img_p.ImageUrl = "~/Images/" + txt_astCode.Text.Trim() + ".jpg";
                    img_p.Visible = true;
                    btn_reg.ToolTip = "Click to Allot Spare";

                }
              /*  else
                      {

                    lbl_custPNO.Visible = true;
                    btn_reg.Enabled = false;
                    btn_reg.BackColor = System.Drawing.Color.Gray;
                    btn_reg.ForeColor = System.Drawing.Color.LightGray;
                    btn_reg.ToolTip = "Check personal no.";
                    lbl_name.Visible = false;
                    lbl_gender.Visible = false;
                    lbl_dept.Visible = false;
                    lbl_location.Visible = false;
                    lbl_contact.Visible = false;
                    btn_reg.Enabled = false;
                    img_p.Visible = false;
                    lbl_name.Text = "Name : ";
                    lbl_gender.Text = "Gender : ";
                    lbl_dept.Text = "Department : ";
                    lbl_location.Text = "Location : ";
                    lbl_contact.Text = "Contact No. : ";
                }
                */
                
            }
        }
    }
}