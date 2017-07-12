using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.Configuration;
using System.IO;

namespace assetManagement
{
    public partial class Spare_Stock : System.Web.UI.Page
    {
        private static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        private OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!Page.IsPostBack)
            {
                grid_display.Visible = false;
                grid_display1.Visible = false;
                btn_excel.Visible = false;
                btn_excel1.Visible = false;
                Drp_1.Visible = false;
                RequiredFieldValidator1.Enabled = false;

                OdbcCommand cmdb = conn_asset.CreateCommand();
                conn_asset.Open();
                cmdb.CommandText = "select * from master_spare_entry ";
                OdbcDataAdapter da1 = new OdbcDataAdapter(cmdb);
                DataTable dt1 = new DataTable();

                da1.Fill(dt1);

                dt1.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "ID + ' - ' + description"));
                Drp_1.DataSource = dt1;
                Drp_1.DataValueField = "ID";
                Drp_1.DataTextField = "Title";
                Drp_1.DataBind();
                conn_asset.Close();
            }

            string selected = rdbtn_type.SelectedValue;

            if (selected == "1")
            {

                Drp_1.Visible = true;
                RequiredFieldValidator1.Enabled = true;
            }
            else
            {
                Drp_1.Visible = false;
                RequiredFieldValidator1.Enabled = false;
            }

        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            string selected = rdbtn_type.SelectedValue;

            if(selected == "1")
            {
                grid_display1.Visible = false;
                btn_excel1.Visible = false;
                int desc = Convert.ToInt32(Drp_1.SelectedValue);
                

                conn_asset.Open();
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select s.type, s.currentStock, s.make, s.model, m.ID, m.description from spare_master s inner join master_spare_entry m on m.ID = s.type where type = '" + Drp_1.SelectedValue + "' and currentStock != '0' ";
                OdbcDataAdapter da = new OdbcDataAdapter();
                DataTable dt = new DataTable();
                DataRow newRow;
                OdbcDataReader dr = cmda.ExecuteReader();
                
                dt.Columns.Add(new System.Data.DataColumn("currentStock", typeof(Int32)));
                dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("make", typeof(String)));
                dt.Columns.Add(new System.Data.DataColumn("model", typeof(String)));
                
                
                /// Problem with geting spare code and spre type ka description and mc guy ka name

                while (dr.Read())
                {
                    
                    newRow = dt.NewRow();
                    newRow["currentStock"] = Convert.ToInt32(dr["currentStock"]);
                    newRow["type"] = Convert.ToString(dr["description"]);
                    newRow["make"] = Convert.ToString(dr["make"]);
                    newRow["model"] = Convert.ToString(dr["model"]);
                    

                   
                    dt.Rows.Add(newRow);
                }

                if (dt.Rows.Count > 0)
                {

                    grid_display.Visible = true;
                    grid_display.DataSource = dt;
                    grid_display.DataBind();
                    btn_excel.Visible = true;
                }


                conn_asset.Close();


            }
            else
            {
                grid_display.Visible = false;
                btn_excel.Visible = false;

                int desc = 1;
                string type = "";
                Int64 quantity = 0;
                int j=0;
                int count = 0;
                int flag = 0;
                
                OdbcCommand cmd = conn_asset.CreateCommand();
                conn_asset.Open();
                cmd.CommandText = "select * from spare_master s inner join master_spare_entry m on m.ID = s.type order by type asc ";
                OdbcDataReader cat = cmd.ExecuteReader();
                while(cat.Read())
                {
                    count++;
                }
                
                conn_asset.Close();

                conn_asset.Open();
                OdbcCommand cmda = conn_asset.CreateCommand();
                cmda.CommandText = "select s.currentStock, s.type, m.description from spare_master s inner join master_spare_entry m on m.ID = s.type order by type desc";
                OdbcDataAdapter da = new OdbcDataAdapter();
                DataTable dt = new DataTable();
                DataRow newRow;
                OdbcDataReader dr = cmda.ExecuteReader();
                dt.Columns.Add(new System.Data.DataColumn("currentStock", typeof(Int32)));
                dt.Columns.Add(new System.Data.DataColumn("type", typeof(String)));
                
                /// Problem with geting spare code and spre type ka description and mc guy ka name

                while (dr.Read())
                {

                    if (j == 0)
                        desc = Convert.ToInt32(dr["type"]);

                    if (Convert.ToInt32(dr["type"]) == desc)
                    {
                        quantity = quantity + Convert.ToInt32(dr["currentStock"]);
                        type = Convert.ToString(dr["description"]);
                        flag = 1;

                    }
                    else
                    {
                        desc = Convert.ToInt32(dr["type"]);
                        newRow = dt.NewRow();
                        newRow["currentStock"] = quantity;
                        quantity = 0;
                        newRow["type"] = type;

                        flag = 0;

                        dt.Rows.Add(newRow);
                    }

                    j++;

                    if(j == count)
                    {
                        if(flag == 0)
                        quantity = quantity + Convert.ToInt32(dr["currentStock"]);
                        type = Convert.ToString(dr["description"]);

                        newRow = dt.NewRow();
                        newRow["currentStock"] = quantity;
                        newRow["type"] = type;
                        dt.Rows.Add(newRow);
                    }
                    
                }

                if (dt.Rows.Count > 0)
                {

                    grid_display1.Visible = true;
                    grid_display1.DataSource = dt;
                    grid_display1.DataBind();
                    btn_excel1.Visible = true;

                    
                }


                conn_asset.Close();


            }
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
            string FileName = "Spare_Item_Report_" + date + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            grid_display.GridLines = GridLines.Both;
            grid_display.HeaderStyle.Font.Bold = true;
            grid_display.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }


        protected void btn_excel_Click1(object sender, EventArgs e)
        {
            ExportGridToExcel1();
        }

        
        private void ExportGridToExcel1()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";

            string date = DateTime.Now.ToString("yyyy/MM/dd");
            string FileName = "Spare_Stock_Report_" + date + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            grid_display1.GridLines = GridLines.Both;
            grid_display1.HeaderStyle.Font.Bold = true;
            grid_display1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }

    }
}