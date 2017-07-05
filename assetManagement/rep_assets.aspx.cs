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
using System.IO;

namespace assetManagement
{
    public partial class rep_assets : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void BindData()
        {
            string by = drp_by.SelectedItem.Text;
            string val = txt_val.Text.Trim();

            if (by == "Asset Code")
            {

                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "select custodian_p_no,fromDate,toDate from ast_cust_history where astCode='" + val + "' order by fromDate desc";
                conn_asset.Open();
                cmd.CommandType = CommandType.Text;
                DataTable dt = new DataTable();

                DataRow newRow;
                OdbcDataReader dr = cmd.ExecuteReader();

                dt.Columns.Add(new System.Data.DataColumn("custodian_p_no", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("fromDate", typeof(DateTime)));
                dt.Columns.Add(new System.Data.DataColumn("toDate", typeof(String)));




                while (dr.Read())
                {

                    newRow = dt.NewRow();
                    newRow["custodian_p_no"] = Convert.ToString(dr["custodian_p_no"]);
                    newRow["fromDate"] = Convert.ToDateTime(dr["fromDate"]);
                    DateTime dat  = Convert.ToDateTime(dr["toDate"]);
                    newRow["toDate"] = dat.ToString("yyyy/MM/dd");
                    dt.Rows.Add(newRow);
                }
                if (dt.Rows.Count > 0)
                {
                    grid_astcode.Visible = true;
                    grid_pno.Visible = false;
                    grid_type.Visible = false;
                    grid_astcode.DataSource = dt;
                    grid_astcode.DataBind();
                    lbl_no_recs.Visible = false;

                }
                else
                {
                    grid_astcode.Visible = false;
                    grid_pno.Visible = false;
                    grid_type.Visible = false;
                    lbl_no_recs.Visible = true;
                }
                conn_asset.Close();
            }
            //****************************************
            if (by == "Personal No.")
            {

                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "select astCode,description,issueDate from ast_master where custodian='"+val+"' order by issueDate desc ";
                conn_asset.Open();
                cmd.CommandType = CommandType.Text;
                DataTable dt = new DataTable();

                DataRow newRow;
                OdbcDataReader dr = cmd.ExecuteReader();

                dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("description", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("issueDate", typeof(DateTime)));




                while (dr.Read())
                {

                    newRow = dt.NewRow();
                    newRow["astCode"] = Convert.ToString(dr["astCode"]);
                    newRow["description"] = Convert.ToString(dr["description"]);
                    newRow["issueDate"] = Convert.ToDateTime(dr["issueDate"]);
                    dt.Rows.Add(newRow);
                }
                if (dt.Rows.Count > 0)
                {
                    grid_pno.Visible = true;
                    grid_astcode.Visible = false;
                    grid_type.Visible = false;
                    grid_pno.DataSource = dt;
                    grid_pno.DataBind();
                    lbl_no_recs.Visible = false;

                }
                else
                {
                    grid_pno.Visible = false;
                    grid_astcode.Visible = false;
                    grid_type.Visible = false;
                    lbl_no_recs.Visible = true;
                }
                conn_asset.Close();
            }
            //****************************************

            if (by == "Type")
            {

                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "select astCode,description,custodian,issueDate from ast_master where category='"+val+"' order by issueDate desc";
                conn_asset.Open();
                cmd.CommandType = CommandType.Text;
                DataTable dt = new DataTable();

                DataRow newRow;
                OdbcDataReader dr = cmd.ExecuteReader();

                dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("description", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("custodian", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("issueDate", typeof(DateTime)));




                while (dr.Read())
                {

                    newRow = dt.NewRow();
                    newRow["astCode"] = Convert.ToString(dr["astCode"]);
                    newRow["description"] = Convert.ToString(dr["description"]);
                    newRow["custodian"] = Convert.ToString(dr["custodian"]);
                    newRow["issueDate"] = Convert.ToDateTime(dr["issueDate"]);
                    dt.Rows.Add(newRow);
                }
                if (dt.Rows.Count > 0)
                {
                    grid_type.Visible = true;
                    grid_astcode.Visible = false;
                    grid_pno.Visible = false;
                    grid_type.DataSource = dt;
                    grid_type.DataBind();
                    lbl_no_recs.Visible = false;

                }
                else
                {
                    grid_pno.Visible = false;
                    grid_astcode.Visible = false;
                    grid_type.Visible = false;
                    lbl_no_recs.Visible = true;
                }
                conn_asset.Close();
            }

            //*******************************

            

            

        }


        protected void btn_sub_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void btn_excel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        } 
        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            
            string date = DateTime.Now.ToString("yyyy/MM/dd");
            string FileName = "Ast_Rec_" + date + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            grid_pno.GridLines = GridLines.Both;
            grid_pno.HeaderStyle.Font.Bold = true;
            grid_pno.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }

        protected void drp_by_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(drp_by.SelectedValue=="type")
            {
                drp_type.Visible = true;
                txt_val.Visible = false;

            }

            else if (drp_by.SelectedValue=="all")
            {
                drp_type.Visible = false;
                lbl_2.Visible = false;
                txt_val.Visible = false;
                string by = drp_by.SelectedItem.Text;
                if (by == "All Assets")
                {

                    OdbcCommand cmd = conn_asset.CreateCommand();
                    cmd.CommandText = "select astCode,description,custodian,issueDate from ast_master order by issueDate desc";
                    conn_asset.Open();
                    cmd.CommandType = CommandType.Text;
                    DataTable dt = new DataTable();

                    DataRow newRow;
                    OdbcDataReader dr = cmd.ExecuteReader();

                    dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("description", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("custodian", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("issueDate", typeof(DateTime)));




                    while (dr.Read())
                    {

                        newRow = dt.NewRow();
                        newRow["astCode"] = Convert.ToString(dr["astCode"]);
                        newRow["description"] = Convert.ToString(dr["description"]);
                        newRow["custodian"] = Convert.ToString(dr["custodian"]);
                        newRow["issueDate"] = Convert.ToDateTime(dr["issueDate"]);
                        dt.Rows.Add(newRow);
                    }
                    if (dt.Rows.Count > 0)
                    {
                        grid_type.Visible = true;
                        grid_astcode.Visible = false;
                        grid_pno.Visible = false;
                        grid_type.DataSource = dt;
                        grid_type.DataBind();
                        lbl_no_recs.Visible = false;

                    }
                    else
                    {
                        grid_pno.Visible = false;
                        grid_astcode.Visible = false;
                        grid_type.Visible = false;
                        lbl_no_recs.Visible = true;
                    }
                    conn_asset.Close();
                }
            }
            else
            {
                drp_type.Visible = false;
                txt_val.Visible = true;
            }


        }

    }
}