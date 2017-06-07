<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Asset_Allot.aspx.cs" Inherits="assetManagement.Asset_Allot" %>
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
                                    <asp:TextBox ID="txt_issueDate" runat="server" ToolTip=" Issue Date " Width="230px" TextMode="date"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Asset Type :</font>
                                </td>
                                <td align="left">
                                    
                                    <asp:DropDownList ID="DropDownList1" runat="server"  Width="230px">
                                        <asp:ListItem>PC/Laptop</asp:ListItem>
                                        <asp:ListItem>Server</asp:ListItem>
                                        <asp:ListItem>Network Item</asp:ListItem>
                                        <asp:ListItem>Printer/Scanner</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
                                    
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
