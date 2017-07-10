<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" Inherits="assetManagement.Complaints" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>

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

                    <asp:Label ID="Label" runat="server" style="font-weight: 700; font-size: x-large" Text="Enter Your Complaint"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" >
                    <asp:Label ID="lbl_astCode" runat="server" Text="Asset Code"></asp:Label>
                </td>
                         <td >
                             
                                 
                             <asp:DropDownList ID="Drp_1" DataTextField="description" DataValueField ="astCode" runat="server" Height="22px" Width="361px">

                             </asp:DropDownList>
                             
                                 
                </td>
              
            </tr>

            <tr>
                <td class="auto-style3" >
                    <asp:Label ID="lbl_type" runat="server" Text="Type"></asp:Label>
                </td>
                <td >
                    <asp:RadioButtonList ID="rdbtn_type" AutoPostBack =" true" OnSelectedIndexChanged = "typeChanged" runat="server" Width="271px" Height="16px" RepeatDirection="Horizontal">
                        <asp:ListItem Value="HARDWARE">Hardware</asp:ListItem>
                        <asp:ListItem Value="SOFTWARE">Software</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Problem Type" ControlToValidate="rdbtn_type"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Problem Type"></asp:Label>
                </td>
                
                <td>
                    <asp:DropDownList ID="Drp_2" runat="server" DataTextField="Problem" DataValueField="Problem" Height="22px" Width="361px">
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style3" >
                    <asp:Label ID="lbl_desc" runat="server" Text="Description"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txt_desc" runat="server" Width="357px" Height="61px"></asp:TextBox>
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
