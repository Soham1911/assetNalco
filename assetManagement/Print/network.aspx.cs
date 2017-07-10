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
    public partial class network : System.Web.UI.Page
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
            cmd.CommandText = "select p.net_clean,p.socket_tight,a.amcParty,d.deptName,a.category,a.custodian,e.name,a.make,a.model,a.ast_s_no,p.conn_check,p.line,p.EtoN,p.post_check,p.engRemark from ast_master a inner join ast_pm p on a.astCode=p.astCode inner join ast_deptMaster d on d.deptCode=a.dept inner join ast_empMaster e on e.p_no=a.custodian where p.astCode='" + astCode + "' and p.scheduledDate='" + txt_scheduledDate.Text + "'";
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

                txt_clean.Text = dr["net_clean"].ToString();
                txt_socket.Text = dr["socket_tight"].ToString();
                

                txt_volt.Text = dr["line"].ToString();
                txt_en.Text = dr["EtoN"].ToString();

                txt_conn.Text = dr["conn_check"].ToString();


                txt_post.Text = dr["post_check"].ToString();
                txt_rem.Text = dr["engRemark"].ToString();





            }
            conn_asset.Close();
        }
    }
}