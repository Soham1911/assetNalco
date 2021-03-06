﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.Configuration;

namespace assetManagement
{
    public partial class Default : System.Web.UI.Page
    {
        static string connStr_asset = ConfigurationManager.ConnectionStrings["asset"].ConnectionString;
        OdbcConnection conn_asset = new OdbcConnection(connStr_asset);
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            HttpCookie id = new HttpCookie("id");
            id.Value = txt_uid.Text.Trim();
            id.Expires = DateTime.Now.AddHours(1);
            OdbcCommand cmd_asset1=conn_asset.CreateCommand();
            cmd_asset1.CommandText="select pers_passwd from substr_log_access where pers_no='"+txt_uid.Text.Trim()+"' and pers_passwd='"+txt_pass.Text.Trim()+"'";
            conn_asset.Open();
            OdbcDataReader dr=cmd_asset1.ExecuteReader();
            if(dr.Read())
            {
                //conn_asset.Close();
                //OdbcCommand cmd_asset2=conn_asset.CreateCommand();
                //cmd_asset2.CommandText="select access_flg from substr_log_access sa join empMaster em on sa.pers_no = em.p_no where sa.pers_no = '"+txt_uid.Text.Trim()+"' and deptCode = '006'";
                //conn_asset.Open();
                //    OdbcDataReader dr1=cmd_asset2.ExecuteReader();
                //if(dr1.Read())
                //{
                //    conn_asset.Close();
                //    Response.Cookies.Add(id);
                //    Session["systems"] = txt_uid.Text.Trim();
                //    Response.Redirect("Systems.aspx");
                ////}
                //else
                //{
                Response.Cookies.Add(id);
                Session["user"] = txt_uid.Text.Trim();
                Response.Redirect("User.aspx");
                //}
            }
            else
            {
                conn_asset.Close();
                OdbcCommand cmd_asset3=conn_asset.CreateCommand();
                cmd_asset3.CommandText="select password from amclogin where user_id='"+txt_uid.Text.Trim()+"' and password='"+txt_pass.Text.Trim()+"'";
                conn_asset.Open();
                OdbcDataReader dr2=cmd_asset3.ExecuteReader();
                if(dr2.Read())
                {                  
                    Response.Cookies.Add(id);
                    Session["amc"] = txt_uid.Text.Trim();
                    Response.Redirect("Amcholder.aspx");
                }
                else
                {
                    //not working
                    conn_asset.Close();
                    OdbcCommand cmd_asset4= conn_asset.CreateCommand();
                    cmd_asset4.CommandText = "select password from ast_alliedUserLogin where username='" + txt_uid.Text.Trim() + "' and password='" + txt_pass.Text.Trim() + "'";
                    conn_asset.Open();
                    OdbcDataReader dr4 = cmd_asset4.ExecuteReader();
                    if (dr4.Read())
                    {
                        Response.Cookies.Add(id);
                        Session["user"] = txt_uid.Text.Trim();
                        Response.Redirect("User.aspx");
                    }
                    else
                    {
                        conn_asset.Close();
                        OdbcCommand cmd_asset2 = conn_asset.CreateCommand();
                        cmd_asset2.CommandText = "select * from app_login where p_no = '" + txt_uid.Text.Trim() + "' and password = '" + txt_pass.Text.Trim() + "' and app = 'AM' and access = 'A'";
                        conn_asset.Open();
                        OdbcDataReader dr1 = cmd_asset2.ExecuteReader();
                        if (dr1.Read())
                        {
                            conn_asset.Close();
                            Response.Cookies.Add(id);
                            Session["systems"] = txt_uid.Text.Trim();
                            Response.Redirect("Systems.aspx");
                        }
                        else
                        {
                            lbl_error.Visible = true;
                        }
                        
                    }
                    
                }
                conn_asset.Close();
            }
        }
    }
}

        