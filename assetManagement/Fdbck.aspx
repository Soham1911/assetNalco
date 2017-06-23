<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Fdbck.aspx.cs" Inherits="assetManagement.Fdbck" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        
        <div style="width: 30%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>NALCO Systems Call Log</legend>
                        <table >
                        <tr>
                <td colspan="2">

                    <asp:Label ID="Label" runat="server" style="font-weight: 700; font-size: x-large" Text="Enter Your Feedback"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" >
                    <asp:Label ID="lbl_callid" runat="server" Text="Call ID"></asp:Label>
                </td>
                         <td >
                             
                                 
                             <asp:DropDownList ID="Drp_1" runat="server" Height="23px" DataTextField ="call_id" DataValueField ="Desc" Width="366px" style="margin-left: 0px">

                             </asp:DropDownList>
                             
                                 
                </td>
              
            </tr>
                            
            <tr>
                <td class="auto-style3" >
                    <asp:Label ID="lbl_remark" runat="server" Text="Feedback"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txt_desc" runat="server" Width="357px" Height="61px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             
        </table>

                        <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>

                        <asp:Button ID="btn_submit" runat="server" Height="26px" Text="Register" Width="106px" OnClick="btn_reg_Click1" />
                        
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>


        <div align="left">
        </div>

    </div>
</asp:Content>
