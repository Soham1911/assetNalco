<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="PM_Month_Allot.aspx.cs" Inherits="assetManagement.PM_Month_Allot" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        .auto-style4 {
            width: 357px;
            height: 26px;
        }

        .auto-style6 {
            height: 26px;
        }

        .auto-style8 {
            width: 110px;
            height: 26px;
        }

        .auto-style10 {
            width: 357px;
        }
        .auto-style11 {
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 30%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>NALCO Systems PM Management</legend>
                        <table style="height: 233px; width: 368px">
                            
                            <tr>
                                <td colspan="2">

                                    <asp:Label ID="Label" runat="server" Style="font-weight: 700; font-size: x-large" Text="Enter PM Details"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_underWarranty" runat="server" Font-Size="Medium" Text="Under Warranty :  " Visible="true" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_qrtr1" runat="server" Font-Size="Medium" Text="Quarter 1 :  " Visible="true" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_qrtr2" runat="server" Font-Size="Medium" Text="Quarter 2 :  " Visible="true" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_qrtr3" runat="server" Font-Size="Medium" Text="Quarter 3 :  " Visible="true" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <asp:Label ID="lbl_astCode" runat="server" Text="Asset Code"></asp:Label>
                                </td>
                                <td class="auto-style8">

                                    <asp:TextBox ID="txt_astCode" runat="server" Height="16px" Width="183px" AutoPostBack="true" OnTextChanged="txt_astCode_TextChanged"></asp:TextBox>
                                </td>
                                <td class="auto-style6">
                                    <asp:Label ID="lbl_astCode1" runat="server" Text="*Enter Correct Asset Code" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Select Quarter</td>

                                <td class="auto-style11">
                                    <asp:DropDownList ID="Drp_1" runat="server" Height="21px" Style="margin-left: 0px" Width="198px">
                                        <asp:ListItem Value="0">0</asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td class="auto-style11">&nbsp;</td>
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