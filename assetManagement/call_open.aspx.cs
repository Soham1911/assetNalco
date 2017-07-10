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


namespace assetManagement
{
    public partial class call_open : System.Web.UI.Page
    {
        
        
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        string p_no = "default";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindData();
            p_no = Session["systems"].ToString();
        }

        protected void grid_display_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
        private void BindData()
        {
            OdbcCommand cmd = conn_asset.CreateCommand();
            cmd.CommandText = "select c.call_id,c.p_no,e.name,d.deptName,e.location,e.contact_no,c.openingDate,c.userDescription from ast_call as c inner join ast_empMaster as e on c.p_no=e.p_no inner join ast_deptMaster d on d.deptCode=e.deptCode where callStat='o' or callStat='ro' ";
            conn_asset.Open();
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();


            DataRow newRow;
            OdbcDataReader dr = cmd.ExecuteReader();
            
            dt.Columns.Add(new System.Data.DataColumn("call_id", typeof(Int32)));    
            dt.Columns.Add(new System.Data.DataColumn("p_no", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("url", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("name", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("deptName", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("location", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("contact_no", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("openingDate", typeof(DateTime)));
            dt.Columns.Add(new System.Data.DataColumn("userDescription", typeof(String)));


            while (dr.Read())
            {
                string pno = Convert.ToString(dr["p_no"]);
                string url = "~/Images/" + pno + ".jpg";
                
                newRow = dt.NewRow();
                newRow["call_id"] = Convert.ToInt32(dr["call_id"]);
                newRow["p_no"] = Convert.ToString(dr["p_no"]);
                newRow["url"] = ResolveUrl(url);
                newRow["name"] = Convert.ToString(dr["name"]);
                newRow["deptName"] = Convert.ToString(dr["deptName"]);
                newRow["location"] = Convert.ToString(dr["location"]);
                newRow["contact_no"] = Convert.ToString(dr["contact_no"]);
                newRow["openingDate"] = Convert.ToDateTime(dr["openingDate"]);
                newRow["userDescription"] = Convert.ToString(dr["userDescription"]);
                dt.Rows.Add(newRow);
            }
            if (dt.Rows.Count > 0)
            {
                grid_display.Visible = true;
                grid_display.DataSource = dt;
                grid_display.DataBind();
                lbl_no_recs.Visible = false;

            }
            else
            {
                grid_display.Visible = false;
                lbl_no_recs.Visible = true;
            }
            conn_asset.Close();





        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "select name,user_id from amclogin";
                cmd.CommandType = CommandType.Text;
                OdbcDataAdapter da = new OdbcDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    DropDownList DropDownList1 =
                    (DropDownList)e.Row.FindControl("allottedto");
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "user_id";
                    DropDownList1.DataBind();
                }
            }
            
            

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            int dr1 = 0;
            foreach (GridViewRow item in grid_display.Rows)
            {
                string call_id1 = item.Cells[0].Text.ToString();
                int call_id = Convert.ToInt32(call_id1);
                //DropDownList attendedBy = (DropDownList)item.FindControl("attendedby");
                //string attendedby = attendedBy.SelectedValue.ToString();
                
                DropDownList allotedTo = (DropDownList)item.FindControl("allottedto");
                string allotedto = allotedTo.SelectedValue.ToString();

                //DropDownList callStat = (DropDownList)item.FindControl("callStat");
                //string status = callStat.SelectedValue.ToString();
                //TextBox remarks = item.FindControl("txt_remark") as TextBox;
                //string date = DateTime.Now.ToString("yyyy/MM/dd");
                //string hostName = Dns.GetHostName(); // Retrive the Name of HOST
                // Get the IP
                //string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();

                OdbcCommand cmd = conn_asset.CreateCommand();
                cmd.CommandText = "update ast_call set allotedTo = '" + allotedto.Trim() + "' where call_id = '" + call_id + "'";
                //cmd.CommandText = "update ast_call set allotedTo = '" + allotedto.Trim() + "' , callStat = '" + status.Trim() + "' , remarks = '" + remarks.Text.Trim() + "', closingIP = '" + myIP.Trim() + "',closedBy='" + p_no.Trim() + "',closingDate = '" + date + "' where call_id = '" + call_id + "'";
                // cmd.CommandText = "update ast_call set remarks = '" + remarks.Text.Trim() + "' where call_id = '" + call_id + "'";
                conn_asset.Open();
                dr1 = cmd.ExecuteNonQuery();
                conn_asset.Close();
                BindData();
            }
            if (dr1 == 1)
            {
                lbl_no_recs.ForeColor = System.Drawing.Color.Green;
                lbl_no_recs.Text = "Success";
                lbl_no_recs.Visible = true;
            }
            else
            {
                lbl_no_recs.Text = "Failed";
                lbl_no_recs.Visible = true;
            }
        }

    }
}