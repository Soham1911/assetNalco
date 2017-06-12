<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Asset_Allot.aspx.cs" Inherits="assetManagement.Asset_Allot" %>

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
                        <legend>Asset Allotment</legend>

                        <table>
                            <tr>
                                <td align="right">
                                    <font size="2em"> Asset Code :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_astCode" runat="server" ToolTip="Asset Code" Width="230px"></asp:TextBox>
                                </td>


                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">       Custodian Personal No. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_custPNO" runat="server" ToolTip=" Custodian Personal No. " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">       Issue Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_date" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_date"></asp:CalendarExtender>
                                </td>
                            </tr>



                            <tr>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btn_reg" runat="server" Text="Allot" Font-Bold="True" ForeColor="#383E78" OnClick="btn_reg_Click" />
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
