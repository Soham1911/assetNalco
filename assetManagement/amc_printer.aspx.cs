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
using System.Text;

namespace assetManagement
{
    public partial class amc_prsc : System.Web.UI.Page
    {
        static string astCode;
        static string schDate;
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            astCode = Session["astCode"].ToString();
            txt_astCode.Text = astCode;
            schDate = Convert.ToDateTime(Session["scheduledDate"]).ToString("yyyy/MM/dd");
            DateTime scheduledDate = Convert.ToDateTime(schDate);
            txt_scheduledDate.Text = schDate;

            OdbcCommand cmdq = conn_asset.CreateCommand();
            cmdq.CommandText = "select actualDate from ast_pm where astCode='" + astCode + "' order by actualDate desc";
            conn_asset.Open();
            OdbcDataReader drq = cmdq.ExecuteReader();
            string pDate = "";
            while (drq.Read())
            {
                pDate = drq["actualDate"].ToString();
                break;
            }
            conn_asset.Close();


            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select a.amcParty,d.deptName,a.category,a.custodian,e.name,a.make,a.model,a.ast_s_no from ast_master a inner join ast_pm p on a.astCode=p.astCode inner join ast_deptMaster d on d.deptCode=a.dept inner join ast_empMaster e on e.p_no=a.custodian where p.astCode='" + astCode + "' and p.scheduledDate='" + txt_scheduledDate.Text + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {



                txt_scheduledDate.Text = schDate;
                txt_category.Text = dr["category"].ToString(); ;
                
                txt_name.Text = dr["name"].ToString();
                txt_pno.Text = dr["custodian"].ToString();
                txt_make.Text = dr["make"].ToString();
                txt_model.Text = dr["model"].ToString();
                
                txt_amcparty.Text = dr["amcParty"].ToString();
                txt_sno.Text = dr["ast_s_no"].ToString();
                txt_dept.Text = dr["deptName"].ToString();
                txt_prevDate.Text = Convert.ToDateTime(pDate).ToString("yyyy/MM/dd");





            }
            conn_asset.Close();
        }

        protected void btn_sub_Click(object sender, EventArgs e)
        {


            if (txt_actDate.Text == null)
            {
                txt_actDate.Text = "1900-01-01";
            }


            string clean = RadioButtonList0.SelectedValue;
            string oil = RadioButtonList1.SelectedValue;
            string head = RadioButtonList2.SelectedValue;
            string conn = RadioButtonList3.SelectedValue;
            string genself = RadioButtonList4.SelectedValue;
            string selftest = RadioButtonList5.SelectedValue;
            string postpm = RadioButtonList6.SelectedValue;
           
            string line = TextBox1.Text;
            string en = TextBox2.Text;
            string remark = TextBox4.Text;
            string actDate = Convert.ToDateTime(txt_actDate.Text).ToString("yyyy/MM/dd");
            
                
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "update ast_pm set compStat='D', set line='" + line + "',set EtoN='" + en + "',post_check='" + postpm + "',engRemark='" + remark + "',actualDate='" + actDate + "', conn_check='" + conn + "', pr_clean='" + clean + "', shaft_oil='" + oil + "',head_clean='" + head + "', genSelf_rep='" + genself + "',rep_check='"+selftest+"' where astCode='" + astCode + "' and scheduledDate='" + txt_scheduledDate.Text + "' ";
                conn_asset.Open();
                cmd.ExecuteNonQuery();
                conn_asset.Close();

                Response.Redirect("~/amc_pm.aspx");
        }

        
    }
}