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
    public partial class amc_server : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        static string astCode;
        static string schDate;
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
            cmd.CommandText = "select a.amcParty,d.deptName,a.category,a.ip,a.custodian,e.name,a.make,a.model,a.ast_s_no,a.os,a.msOffice from ast_master a inner join ast_pm p on a.astCode=p.astCode inner join ast_deptMaster d on d.deptCode=a.dept inner join ast_empMaster e on e.p_no=a.custodian where p.astCode='" + txt_astCode.Text.Trim() + "' and p.scheduledDate='" + txt_scheduledDate.Text + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {




                txt_category.Text = dr["category"].ToString(); ;
                txt_ip.Text = dr["ip"].ToString();
                txt_name.Text = dr["name"].ToString();
                txt_pno.Text = dr["custodian"].ToString();
                txt_make.Text = dr["make"].ToString();
                txt_model.Text = dr["model"].ToString();
                txt_office.Text = dr["msOffice"].ToString();
                txt_os.Text = dr["os"].ToString();
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

            string dvd = RadioButtonList0.SelectedValue;
            string mouse = RadioButtonList1.SelectedValue;
            string monitor = RadioButtonList2.SelectedValue;
            string key = RadioButtonList3.SelectedValue;
            string hdd = RadioButtonList4.SelectedValue;
            string os = RadioButtonList5.SelectedValue;
            string vir = RadioButtonList6.SelectedValue;
            string conn = RadioButtonList7.SelectedValue;
            string ad = RadioButtonList8.SelectedValue;
            string pon = RadioButtonList9.SelectedValue;
            string postpm = RadioButtonList10.SelectedValue;
            string mail = RadioButtonList11.SelectedValue;
            string line = TextBox1.Text;
            string en = TextBox2.Text;
            string remark = TextBox4.Text;
            string actDate = Convert.ToDateTime(txt_actDate.Text).ToString("yyyy/MM/dd");
            if (mail == "Y")
            {
                txt_mail.Visible = true;
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "update ast_pm set compStat='D' ,dvd_check='" + dvd + "',mouse_check='" + mouse + "',monitor_check='" + monitor + "', keyboard_check='" + key + "', hdd_check='" + hdd + "', virus_check='" + vir + "',os_check='" + os + "',conn_check='" + conn + "',line='" + line + "', EtoN='" + en + "',ADmember='" + ad + "', powerOn='" + pon + "', post_check='" + postpm + "',engRemark='" + remark + "',mail_check='" + mail + "',mail_sw='" + txt_mail.Text + "', actualDate='" + actDate + "' where astCode='" + txt_astCode.Text + "' and scheduledDate='" + txt_scheduledDate.Text + "' ";
                conn_asset.Open();
                cmd.ExecuteNonQuery();
                conn_asset.Close();

            }
            else
            {
                txt_mail.Visible = false;
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "update ast_pm set compStat='D' ,dvd_check='" + dvd + "',mouse_check='" + mouse + "',monitor_check='" + monitor + "', keyboard_check='" + key + "', hdd_check='" + hdd + "', virus_check='" + vir + "',os_check='" + os + "',conn_check='" + conn + "',line='" + line + "', EtoN='" + en + "',ADmember='" + ad + "', powerOn='" + pon + "', post_check='" + postpm + "',engRemark='" + remark + "',mail_check='" + mail + "', actualDate='" + actDate + "' where astCode='" + txt_astCode.Text + "' and scheduledDate='" + txt_scheduledDate.Text + "' ";
                conn_asset.Open();
                cmd.ExecuteNonQuery();
                conn_asset.Close();
            }

            Response.Redirect("~/amc_pm.aspx");



        }
    }
}