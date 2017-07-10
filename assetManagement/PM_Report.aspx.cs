using System;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assetManagement
{
    public partial class PM_Report : System.Web.UI.Page
    {
        private static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        private OdbcConnection conn_asset = new OdbcConnection(connStr_asset);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                OdbcCommand cmda = conn_asset.CreateCommand();
                conn_asset.Open();
                cmda.CommandText = "select * from ast_deptMaster";
                OdbcDataAdapter da = new OdbcDataAdapter(cmda);
                DataTable dt = new DataTable();

                da.Fill(dt);

                dt.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "deptCode + ' - ' + deptName"));

                Drp_1.DataSource = dt;
                Drp_1.DataValueField = "deptCode";
                Drp_1.DataTextField = "Title";
                Drp_1.DataBind();
                conn_asset.Close();
            }
        }

        protected void dept_changed(object sender, EventArgs e)
        {
            OdbcCommand cmdb = conn_asset.CreateCommand();
            conn_asset.Open();
            cmdb.CommandText = "select * from ast_locationMaster where deptcode = '" + Drp_1.SelectedValue + "'";
            OdbcDataAdapter da1 = new OdbcDataAdapter(cmdb);
            DataTable dt1 = new DataTable();

            da1.Fill(dt1);

            dt1.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String"), "locationCode + ' - ' + locationName"));

            Drp_2.DataSource = dt1;
            Drp_2.DataValueField = "locationCode";
            Drp_2.DataTextField = "Title";
            Drp_2.DataBind();
            conn_asset.Close();
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            DateTime fdate, tdate;
            /// check conversion
            fdate = Convert.ToDateTime(txt_entryDate.Text.Trim());
            tdate = Convert.ToDateTime(txt_exitDate.Text.Trim());

            conn_asset.Open();
            OdbcCommand cmdd = conn_asset.CreateCommand();
            cmdd.CommandText = "select * from ast_pm pm join ast_master pc on pm.astCode = pc.astCode where pm.actualDate >= '" + fdate + "' and pm.actualDate <= '" + tdate + "' and pc.dept = '" + Drp_1.SelectedValue + "' and pc.location = '" + Drp_2.SelectedValue + "' ";
            OdbcDataAdapter da2 = new OdbcDataAdapter();
            DataTable dt2 = new DataTable();
            DataRow newRow;
            OdbcDataReader dr2 = cmdd.ExecuteReader();
            dt2.Columns.Add(new System.Data.DataColumn("unitCode", typeof(Int32)));
            dt2.Columns.Add(new System.Data.DataColumn("astCode", typeof(String)));
            dt2.Columns.Add(new System.Data.DataColumn("scheduledDate", typeof(String)));
            dt2.Columns.Add(new System.Data.DataColumn("actualDate", typeof(String)));
            dt2.Columns.Add(new System.Data.DataColumn("lockStat", typeof(String)));
            dt2.Columns.Add(new System.Data.DataColumn("compStat", typeof(String)));
            dt2.Columns.Add(new System.Data.DataColumn("month", typeof(String)));
            /// Problem with geting spare code and spre type ka description and mc guy ka name

            while (dr2.Read())
            {
                newRow = dt2.NewRow();
                newRow["unitCode"] = Convert.ToInt32(dr2["unitCode"]);
                newRow["astCode"] = Convert.ToString(dr2["astCode"]);
                newRow["scheduledDate"] = Convert.ToString(dr2["scheduledDate"]);
                newRow["actualDate"] = Convert.ToString(dr2["actualDate"]);
                newRow["lockStat"] = Convert.ToString(dr2["loockStat"]);
                newRow["compStat"] = Convert.ToString(dr2["compStat"]);
                newRow["month"] = Convert.ToString(dr2["month"]);

                dt2.Rows.Add(newRow);
            }
            if (dt2.Rows.Count > 0)
            {
                grid_display.Visible = true;
                grid_display.DataSource = dt2;
                grid_display.DataBind();
                lbl_error.Text = "Report Generated Successfully";
                lbl_error.Visible = true;
            }
            else
            {
                grid_display.Visible = false;
                lbl_error.Text = "No PM found in that time period";
                lbl_error.Visible = true;
            }
            conn_asset.Close();
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
            string FileName = "PM_Report_" + date + ".xls";
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