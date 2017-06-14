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
                                    <asp:TextBox ID="txt_astCode" runat="server" ToolTip="Asset Code" Width="230px" TextMode="Search"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:Button ID="btn_search" runat="server" Text="Search" Font-Bold="True" ForeColor="#383E78" OnClick="btn_search_Click" />
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
                                <td align="right">
                                    <font size="2em" style="font-weight: 700">       Asset Type :</font>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lbl_astType" runat="server" Text="" Font-Bold="true" Font-Size="Large" Visible="false" style="font-size: medium"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700">       Custodian Personal No. :</font>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lbl_custPNo" runat="server" Text="" Font-Bold="true" Font-Size="Large" Visible="false" style="font-size: medium"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700">      Custodian Name :</font>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lbl_custName" runat="server" Text="" Font-Bold="true" Font-Size="Large" Visible="false" style="font-size: medium"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700">      Department :</font>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lbl_dept" runat="server" Text="" Font-Bold="true" Font-Size="Large" Visible="false" style="font-size: medium"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700">      Location :</font>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lbl_location" runat="server" Text="" Font-Bold="true" Font-Size="Large" Visible="false" style="font-size: medium"></asp:Label>
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
                                    <asp:TextBox Width="230px" ID="txt_retDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_retDate"></asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btn_ret" runat="server" Text="Return" Font-Bold="True" ForeColor="#383E78" OnClick="btn_ret_Click" />
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
