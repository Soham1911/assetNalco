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
    public partial class rep__bback : System.Web.UI.Page
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
                cmd.CommandText = "select p_no,openingDate,closingDate,userDescription,systemDescription,partRepaired from ast_call where astCode='" + val + "' order by openingDate desc";
                conn_asset.Open();
                cmd.CommandType = CommandType.Text;
                DataTable dt = new DataTable();

                DataRow newRow;
                OdbcDataReader dr = cmd.ExecuteReader();

                
                dt.Columns.Add(new System.Data.DataColumn("p_no", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("openingDate", typeof(DateTime)));
                dt.Columns.Add(new System.Data.DataColumn("closingDate", typeof(DateTime)));
                dt.Columns.Add(new System.Data.DataColumn("userDescription", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("systemDescription", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("partRepaired", typeof(String)));
                




                while (dr.Read())
                {

                    newRow = dt.NewRow();
                    
                    newRow["p_no"] = Convert.ToString(dr["p_no"]);
                    newRow["openingDate"] = Convert.ToDateTime(dr["openingDate"]);
                    newRow["closingDate"] = Convert.ToDateTime(dr["closingDate"]);
                    newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                    newRow["systemDescription"] = Convert.ToString(dr["systemDescription"]);
                    newRow["partRepaired"] = Convert.ToString(dr["partRepaired"]);
                    dt.Rows.Add(newRow);
                }
                if (dt.Rows.Count > 0)
                {
                    grid_astcode.Visible = true;
                    grid_pno.Visible = false;
                    grid_all.Visible = false;
                    grid_astcode.DataSource = dt;
                    grid_astcode.DataBind();
                    lbl_no_recs.Visible = false;

                }
                else
                {
                    grid_astcode.Visible = false;
                    grid_pno.Visible = false;
                    grid_all.Visible = false;
                    lbl_no_recs.Visible = true;
                }
                conn_asset.Close();
            }
            //****************************************
            if (by == "Personal No.")
            {

                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "select astCode,openingDate,closingDate,userDescription,systemDescription,partRepaired from ast_call where p_no='" + val + "' order by openingDate desc ";
                conn_asset.Open();
                cmd.CommandType = CommandType.Text;
                DataTable dt = new DataTable();

                DataRow newRow;
                OdbcDataReader dr = cmd.ExecuteReader();

                
                dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("openingDate", typeof(DateTime)));
                dt.Columns.Add(new System.Data.DataColumn("closingDate", typeof(DateTime)));
                dt.Columns.Add(new System.Data.DataColumn("userDescription", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("systemDescription", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("partRepaired", typeof(String)));




                while (dr.Read())
                {

                    newRow = dt.NewRow();
                    newRow["astCode"] = Convert.ToString(dr["astCode"]);
                    newRow["openingDate"] = Convert.ToDateTime(dr["openingDate"]);
                    newRow["closingDate"] = Convert.ToDateTime(dr["closingDate"]);
                    newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                    newRow["systemDescription"] = Convert.ToString(dr["systemDescription"]);
                    newRow["partRepaired"] = Convert.ToString(dr["partRepaired"]);
                    dt.Rows.Add(newRow);
                }
                if (dt.Rows.Count > 0)
                {
                    grid_pno.Visible = true;
                    grid_astcode.Visible = false;
                    grid_all.Visible = false;
                    grid_pno.DataSource = dt;
                    grid_pno.DataBind();
                    lbl_no_recs.Visible = false;

                }
                else
                {
                    grid_pno.Visible = false;
                    grid_astcode.Visible = false;
                    grid_all.Visible = false;
                    lbl_no_recs.Visible = true;
                }
                conn_asset.Close();
            }
            //****************************************

           

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
            if(grid_pno.Visible == true)
            {
                grid_pno.GridLines = GridLines.Both;
                grid_pno.HeaderStyle.Font.Bold = true;
                grid_pno.RenderControl(htmltextwrtter);
            }
            else if(grid_astcode.Visible == true)
            {
                grid_astcode.GridLines = GridLines.Both;
                grid_astcode.HeaderStyle.Font.Bold = true;
                grid_astcode.RenderControl(htmltextwrtter);
            }
            else if(grid_all.Visible == true)
            {
                grid_all.GridLines = GridLines.Both;
                grid_all.HeaderStyle.Font.Bold = true;
                grid_all.RenderControl(htmltextwrtter);
            }
            
            Response.Write(strwritter.ToString());
            Response.End();

        }

        protected void drp_by_SelectedIndexChanged(object sender, EventArgs e)
        {
            string by = drp_by.SelectedItem.Text;
            if(by=="All Complaints")
            {
                lbl_2.Visible = false;
                txt_val.Visible = false;

                

                    OdbcCommand cmd = conn_asset.CreateCommand();
                    cmd.CommandText = "select p_no,astCode,openingDate,closingDate,userDescription,systemDescription,partRepaired from ast_call order by openingDate desc";
                    conn_asset.Open();
                    cmd.CommandType = CommandType.Text;
                    DataTable dt = new DataTable();

                    DataRow newRow;
                    OdbcDataReader dr = cmd.ExecuteReader();

                    dt.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("p_no", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("openingDate", typeof(DateTime)));
                    dt.Columns.Add(new System.Data.DataColumn("closingDate", typeof(DateTime)));
                    dt.Columns.Add(new System.Data.DataColumn("userDescription", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("systemDescription", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("partRepaired", typeof(String)));




                    while (dr.Read())
                    {

                        newRow = dt.NewRow();

                        newRow["astCode"] = Convert.ToString(dr["astCode"]);
                        newRow["p_no"] = Convert.ToString(dr["p_no"]);
                        newRow["openingDate"] = Convert.ToDateTime(dr["openingDate"]);
                        newRow["closingDate"] = Convert.ToDateTime(dr["closingDate"]);
                        newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                        newRow["systemDescription"] = Convert.ToString(dr["systemDescription"]);
                        newRow["partRepaired"] = Convert.ToString(dr["partRepaired"]);
                        dt.Rows.Add(newRow);
                    }
                    if (dt.Rows.Count > 0)
                    {
                        grid_all.Visible = true;
                        grid_astcode.Visible = false;
                        grid_pno.Visible = false;
                        grid_all.DataSource = dt;
                        grid_all.DataBind();
                        lbl_no_recs.Visible = false;

                    }
                    else
                    {
                        grid_pno.Visible = false;
                        grid_astcode.Visible = false;
                        grid_all.Visible = false;
                        lbl_no_recs.Visible = true;
                    }
                    conn_asset.Close();
                }



            
        }

        

    }
}