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
    public partial class Receipt_Report : System.Web.UI.Page
    {
        private static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        private OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        

        protected void Page_Load(object sender, EventArgs e)
        {
            string selected = rdbtn_type.SelectedValue;

            
            if (!Page.IsPostBack)
            {
                
                grid_display.Visible = true;
                
                txt_entryDate.Visible = false;
                txt_exitDate.Visible = false;
                Drp_1.Visible = false;
                
                lbl_partno.Visible = false;
                lbl_type.Visible = false;

                RequiredFieldValidator2.Enabled = false;
                RequiredFieldValidator3.Enabled = false;
                RequiredFieldValidator4.Enabled = false;

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

            

        }


        protected void typeChanged(object sender, EventArgs e)
        {
            
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            grid_display.Visible = true;
            
            txt_entryDate.Visible = false;
            txt_exitDate.Visible = false;
            Drp_1.Visible = false;
            
            lbl_partno.Visible = false;
            lbl_type.Visible = false;

            string selected = rdbtn_type.SelectedValue;
            

            if (selected == "1")
            {
                txt_entryDate.Visible = true;
                lbl_type.Visible = true;
                txt_exitDate.Visible = true;
                RequiredFieldValidator2.Enabled = true;
                RequiredFieldValidator3.Enabled = true;
            }

            if (selected == "2")
            {
                Drp_1.Visible = true;
                lbl_partno.Visible = true;
                RequiredFieldValidator4.Enabled = true;
            }

        }


        protected void btn_reg_Click(object sender, EventArgs e)
        {

            int selected;

            selected = Convert.ToInt32(rdbtn_type.SelectedValue);
             if (selected == 1)
                {
                    
                    DateTime fdate, tdate;
                    /// check conversion
                    fdate = Convert.ToDateTime(txt_entryDate.Text.Trim());
                    tdate = Convert.ToDateTime(txt_exitDate.Text.Trim());


                    conn_asset.Open();
                    OdbcCommand cmda = conn_asset.CreateCommand();
                    cmda.CommandText = "select * from spare_master where entryDate >= '" + fdate + "' and entryDate <= '" + tdate + "'";
                    OdbcDataAdapter da = new OdbcDataAdapter();
                    DataTable dt = new DataTable();
                    DataRow newRow;
                    OdbcDataReader dr = cmda.ExecuteReader();
                    dt.Columns.Add(new System.Data.DataColumn("quantity", typeof(Int32)));
                    dt.Columns.Add(new System.Data.DataColumn("type", typeof(Int32)));
                    dt.Columns.Add(new System.Data.DataColumn("make", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("model", typeof(String)));
                    dt.Columns.Add(new System.Data.DataColumn("entryDate", typeof(DateTime)));
                    dt.Columns.Add(new System.Data.DataColumn("gatePassNo", typeof(String)));
                    /// Problem with geting spare code and spre type ka description and mc guy ka name

                    while (dr.Read())
                    {
                        newRow = dt.NewRow();
                        newRow["quantity"] = Convert.ToInt32(dr["quantity"]);
                        newRow["type"] = Convert.ToInt32(dr["type"]);
                        newRow["make"] = Convert.ToString(dr["make"]);
                        newRow["model"] = Convert.ToString(dr["model"]);
                        newRow["entryDate"] = Convert.ToDateTime(dr["entryDate"]);
                        newRow["gatePassNo"] = Convert.ToString(dr["gatePassNo"]);

                        dt.Rows.Add(newRow);
                    }

                    if (dt.Rows.Count > 0)
                    {

                        grid_display.Visible = true;
                        grid_display.DataSource = dt;
                        grid_display.DataBind();
                        lbl_error.Text = "Report Generated";
                        lbl_error.Visible = true;
                    }


                    conn_asset.Close();
                }
                else
                    if (selected == 2)
                    {

                        /// check conversion
                        string value;
                        value = Drp_1.SelectedValue;



                        conn_asset.Open();
                        OdbcCommand cmda = conn_asset.CreateCommand();
                        cmda.CommandText = "select * from spare_master where type = '" + value.Trim() + "' order by type desc";
                        OdbcDataAdapter da = new OdbcDataAdapter();
                        DataTable dt = new DataTable();
                        DataRow newRow;
                        OdbcDataReader dr = cmda.ExecuteReader();
                        dt.Columns.Add(new System.Data.DataColumn("quantity", typeof(Int32)));
                        dt.Columns.Add(new System.Data.DataColumn("type", typeof(Int32)));
                        dt.Columns.Add(new System.Data.DataColumn("make", typeof(String)));
                        dt.Columns.Add(new System.Data.DataColumn("model", typeof(String)));
                        dt.Columns.Add(new System.Data.DataColumn("entryDate", typeof(DateTime)));
                        dt.Columns.Add(new System.Data.DataColumn("gatePassNo", typeof(String)));
                        /// Problem with geting spare code and spre type ka description and amc guy ka name

                        while (dr.Read())
                        {
                            newRow = dt.NewRow();
                            newRow["quantity"] = Convert.ToInt32(dr["quantity"]);
                            newRow["type"] = Convert.ToInt32(dr["type"]);
                            newRow["make"] = Convert.ToString(dr["make"]);
                            newRow["model"] = Convert.ToString(dr["model"]);
                            newRow["entryDate"] = Convert.ToDateTime(dr["entryDate"]);
                            newRow["gatePassNo"] = Convert.ToString(dr["gatePassNo"]);

                            dt.Rows.Add(newRow);
                        }

                        if (dt.Rows.Count > 0)
                        {

                            grid_display.Visible = true;
                            grid_display.DataSource = dt;
                            grid_display.DataBind();
                            lbl_error.Text = "Report Generated";
                            lbl_error.Visible = true;

                        }
                        conn_asset.Close();
                    }
                    else
                    {
                        lbl_error.Text = "Generation Error";
                        lbl_error.Visible = true;

                    }
            grid_display.Visible = true;



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
            string FileName = "Spare_Receipt_Report_" + date + ".xls";
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
    }
}