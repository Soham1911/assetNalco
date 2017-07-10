using System;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Web.UI;

namespace assetManagement
{
    public partial class Spare_Entry : System.Web.UI.Page
    {
        private static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        private OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            string p_no;

            p_no = Session["systems"].ToString();

            if (!Page.IsPostBack)
            {
                Drp_1.Visible = true;
                lbl_error.Visible = false;
                OdbcCommand cmda = conn_asset.CreateCommand();

                cmda.CommandText = "select * from master_spare_entry ";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();

                da.Fill(dt);

                dt.Columns.Add(new DataColumn("Content", System.Type.GetType("System.String"), "ID + ' - ' + description"));
                Drp_1.DataSource = dt;
                Drp_1.DataValueField = "ID";
                Drp_1.DataTextField = "Content";
                Drp_1.DataBind();
            }
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            string p_no;
            p_no = Session["systems"].ToString();
            int i;
            string unit_cd = "";
            string selection = Drp_1.SelectedValue.ToString();
            int quantity = Convert.ToInt32(txt_quantity.Text.Trim());

            string date = txt_entryDate.Text;
            lbl_error.Visible = false;

            OdbcCommand cmda = conn_asset.CreateCommand();
            cmda.CommandText = "select unit from ast_empMaster where p_no = '" + p_no + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmda.ExecuteReader();
            while (dr.Read())
            {
                unit_cd = Convert.ToString(dr["unit"]);
            }
            conn_asset.Close();

            OdbcCommand cmdc = conn_asset.CreateCommand();
            cmdc.CommandText = "insert into spare_master( unitCode, type, make, model, quantity, currentStock, entryDate, gatePassNo, gatePassRegNo) values ( '" + unit_cd + "' , '" + selection.Trim() + "', '" + txt_make.Text.Trim() + "','" + txt_model.Text.Trim() + "', '" + quantity + "', '" + quantity + "','" + date + "' , '" + txt_gate_pass_no.Text.Trim() + " ','" + txt_gate_pass_reg_no.Text.Trim() + "') ";
            conn_asset.Open();

            i = cmdc.ExecuteNonQuery();

            conn_asset.Close();

            if (i == 0)
            {
                lbl_error.ForeColor = System.Drawing.Color.Red;
                lbl_error.Text = "Spare Registration Failed";
                lbl_error.Visible = true;
            }
            else
            {
                lbl_error.ForeColor = System.Drawing.Color.Green;
                lbl_error.Text = "Spare Part Registered";
                lbl_error.Visible = true;
            }
        }
    }
}