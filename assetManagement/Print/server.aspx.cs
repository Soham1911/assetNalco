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

namespace assetManagement.Print
{
    public partial class server : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        static string astCode;
        static string schDate;
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
            cmd.CommandText = "select a.amcParty,d.deptName,a.category,a.ip,a.custodian,e.name,a.make,a.model,a.ast_s_no,a.os,a.msOffice,p.dvd_check,p.mouse_check,p.monitor_check,p.keyboard_check,p.hdd_check,p.os_check,p.virus_check,p.conn_check,p.line,p.EtoN,p.ADmember,p.powerOn,p.post_check,p.engRemark,p.mail_check,p.mail_sw from ast_master a inner join ast_pm p on a.astCode=p.astCode inner join ast_deptMaster d on d.deptCode=a.dept inner join ast_empMaster e on e.p_no=a.custodian where astCode='" + astCode + "' and scheduledDate='" + scheduledDate + "'";
            conn_asset.Open();
            OdbcDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {



                txt_scheduledDate.Text = schDate;
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
                txt_prevDate.Text = pDate;

                txt_cd.Text = dr["dvd_check"].ToString();
                txt_mouse.Text = dr["mouse_check"].ToString();
                txt_mon.Text = dr["monitor_check"].ToString();
                txt_key.Text = dr["keyboard_check"].ToString();
                txt_volt.Text = dr["line"].ToString();
                txt_en.Text = dr["EtoN"].ToString();
                txt_hdd.Text = dr["hdd_check"].ToString();
                txt_ops.Text = dr["os_check"].ToString();
                txt_antiv.Text = dr["virus_check"].ToString();
                txt_conn.Text = dr["conn_check"].ToString();
                txt_ad.Text = dr["ADmember"].ToString();
                txt_power.Text = dr["powerOn"].ToString();

                txt_post.Text = dr["post_check"].ToString();
                txt_rem.Text = dr["engRemark"].ToString();





            }
            conn_asset.Close();
        }
    }
}