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
            schDate = Session["scheduleDate"].ToString();
            DateTime scheduledDate = Convert.ToDateTime(schDate);

            OdbcCommand cmdq = conn_asset.CreateCommand();
            cmdq.CommandText = "select actualDate from ast_pm where astCode='" + astCode + "' order by actDate desc";
            conn_asset.Open();
            OdbcDataReader drq = cmdq.ExecuteReader();
            string pDate = "";
            while (drq.Read())
            {
                pDate = drq["actDate"].ToString();
                break;
            }
            conn_asset.Close();


            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select a.amcParty,d.deptName,a.category,a.custodian,e.name,a.make,a.model,a.ast_s_no from ast_master a inner join ast_pm p on a.astCode=p.astCode inner join ast_deptMaster d on d.deptCode=a.dept inner join ast_empMaster e on e.p_no=a.custodian where astCode='" + astCode + "' and scheduledDate='" + scheduledDate + "'";
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
                txt_prevDate.Text = pDate;





            }
            conn_asset.Close();
        }

        protected void btn_sub_Click(object sender, EventArgs e)
        {

            astCode = Session["astCode"].ToString();
            txt_astCode.Text = astCode;
            schDate = Session["scheduleDate"].ToString();
            DateTime scheduledDate = Convert.ToDateTime(schDate);



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
            string actDate = txt_actDate.Text;
            
                
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "update ast_pm set compStat='D', set line='" + line + "',set EtoN='" + en + "',post_check='" + postpm + "',set engRemark='" + remark + "',set actualDate='" + actDate + "',set conn_check='" + conn + "',set pr_clean='" + clean + "',set shaft_oil='" + oil + "',set head_clean='" + head + "',set genSelf_rep='" + genself + "',set rep_check='"+selftest+"' where astCode='" + astCode + "' and scheduledDate='" + scheduledDate + "' ";
                conn_asset.Open();
                cmd.ExecuteNonQuery();
                conn_asset.Close();

            
        }

        
    }
}