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
    public partial class Fdbck : System.Web.UI.Page
    {
        static string connStr1_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr1_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            string p_no = null;

            p_no = Session["user"].ToString();

            if (!Page.IsPostBack)
            {
                string null_txt = null;
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select astCode, userDescription, call_id from ast_call where ( p_no ='" + p_no.Trim() + "' and userRemark is NULL and callStat = 'C' )";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();

                da.Fill(dt);
                dt.Columns.Add(new DataColumn("Desc", System.Type.GetType("System.String"), "astCode + ' - ' + userDescription"));
                dt.Columns.Add(new DataColumn("callid1", System.Type.GetType("System.Int64" ), "call_id"));
                Drp_1.DataSource = dt;
                Drp_1.DataValueField = "callid1";
                Drp_1.DataTextField = "Desc";
                Drp_1.DataBind();

            }
        }
            protected void btn_reg_Click1(object sender, EventArgs e)
            {
                string p_no;
                p_no = Session["user"].ToString();

                string remark = Drp_1.SelectedValue;
                int i;
                Int32 callid = Convert.ToInt32(Drp_1.SelectedValue);
                

                //int callid1 = Drp_1.DataValueField.Trim();
                //entering the feedback
                lbl_error.Visible = false;

                OdbcCommand cmdc = conn_asset.CreateCommand();

                cmdc.CommandText = "Update ast_call SET userRemark = '" + txt_desc.Text.Trim() + "' where call_id = '" + callid + "' ";
                conn_asset.Open(); 
                //cmdc.CommandText = "update ast_call set userRemark = '" + txt_desc.Text.Trim() + "' where call_id = '" + callid.Trim() + "'";

                i = cmdc.ExecuteNonQuery();

                conn_asset.Close();

                if (i == 0)
                {
                    lbl_error.ForeColor = System.Drawing.Color.Red;
                    lbl_error.Text = "Feedback Registration Error";
                    lbl_error.Visible = true;
                }
                else
                {
                    lbl_error.ForeColor = System.Drawing.Color.Green;
                    lbl_error.Text = "Feedback Registered";
                    lbl_error.Visible = true;
                }

            }
        
        
    }
}