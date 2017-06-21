<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Asset_Return.aspx.cs" Inherits="assetManagement.Asset_Return" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 60%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>Asset Return</legend>

                        <table>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Enter Asset Code :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_astCode" runat="server" ToolTip="Asset Code" Width="230px" TextMode="Search" AutoPostBack="true" OnTextChanged="txt_astCode_TextChanged"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_astCode" ErrorMessage="*Enter asset code" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: left"><asp:Label ID="lbl_invalid" runat="server" Font-Bold="True" Font-Size="Large" Visible="False" style="font-size: medium; text-align: left;" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>

                           <tr>
                                <td rowspan="5">
                                    <asp:Image ID="img_p" runat="server" Visible="false" Width="150px" ToolTip="Custodian's Photo"/>
                                </td>
                                <td colspan="2" style="text-align: left">
                                   <asp:Label ID="lbl_astType" runat="server" Font-Size="Medium" Text="Asset Type : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                                                        <tr>
                                <td colspan="2"  style="text-align: left">
                                    <asp:Label ID="lbl_custPNo" runat="server" Font-Size="Medium" Text="Custodian Personal No. : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_custName" runat="server" Font-Size="Medium" Text="Custodian Name : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2"  style="text-align: left">
                                    <asp:Label ID="lbl_dept" runat="server" Font-Size="Medium" Text="Department : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"  style="text-align: left">
                                    <asp:Label ID="lbl_location" runat="server" Font-Size="Medium" Text="Location : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            

                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right" style="font-weight: 700">
                                    <font size="2em">       Return Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_retDate" runat="server" AutoPostBack="true" OnTextChanged="txt_retDate_TextChanged"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_retDate"></asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_retDate" runat="server" Text="*Issued Date : " Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center"  colspan="3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_retDate" ErrorMessage="*Select Return Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btn_ret" runat="server" Text="Return" Font-Bold="True" ForeColor="Black"  BackColor="LightSteelBlue" OnClick="btn_ret_Click" />
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lbl_error" runat="server" Text="" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>
                    </fieldset>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>


        <div align="left">
        </div>

    </div>
</asp:Content>
