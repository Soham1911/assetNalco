<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" Inherits="assetManagement.Complaints" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %><asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 30%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>Enter Your Complaint</legend>
                        <table >
                        <tr>
                <td>
                    <asp:Label ID="Label" runat="server" style="font-weight: 700; font-size: x-large" Text="NALCO Systems Call Log"></asp:Label>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="lbl_astCode" runat="server" Text="Asset Code"></asp:Label>
                </td>
                         <td >
                             
                                 
                             <asp:DropDownList ID="Drp_1" DataTextField="astCode" DataValueField ="astCode" runat="server">

                             </asp:DropDownList>
                             
                                 
                </td>
              
            </tr>
            <tr>
                <td >
                    <asp:Label ID="lbl_desc" runat="server" Text="Description"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txt_desc" runat="server" Width="357px" Height="61px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="lbl_type" runat="server" Text="Type"></asp:Label>
                </td>
                <td >
                    <asp:RadioButtonList ID="rdbtn_type" runat="server" Width="167px">
                        <asp:ListItem Value="Hardware">Hardware</asp:ListItem>
                        <asp:ListItem Value="Software" Selected="True">Software</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>&nbsp;</td>
            </tr>
             
            <tr>
                <td>
                   &nbsp;
                </td>
                
                <td>&nbsp;</td>
            </tr>
        </table>

                        <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>

                        <asp:Button ID="btn_submit" runat="server" Height="26px" Text="Register" Width="106px" OnClick="btn_reg_Click" />

                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>


        <div align="left">
        </div>

    </div>
</asp:Content>
