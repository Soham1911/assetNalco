<%@ Page Title="" Language="C#" MasterPageFile="~/Amc.Master" AutoEventWireup="true" CodeBehind="amc_pm.aspx.cs" Inherits="assetManagement.amc_pm" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table align="center">
            <tr>
                <td>
                    <asp:Label ID="lbl_quart" runat="server" Text="Select Quarter" align="right" />
                </td>
                <td>
                    <asp:DropDownList ID="drp_quart" align="left" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drp_quart_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_month" runat="server" Text="Select Month" Visible="false" align="right" />
                </td>
                <td>
                    <asp:DropDownList ID="drp_mon" align="left" Visible="false" runat="server">
                        
                        <asp:ListItem Value="1" Text="First Month" />
                        <asp:ListItem Value="2" Text="Second Month" />
                        <asp:ListItem Value="3" Text="Third Month" />
                        <asp:ListItem Value="4" Text="All" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td />
                <td />
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btn_sub" runat="server" Text="Submit" align="left" OnClick="btn_sub_Click" Width="79px" Height="30px" />
                </td>
            </tr>
        </table>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lbl_lock" align="center" Font-Size="Larger" runat="server" Font-Bold="True" ForeColor="Red" Text="The Quarter is Locked" Visible="False" Width="600px" />
    
    <div align="center">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbl_1" runat="server" Text="Assets Pending in the Quarter:" Visible="False" align="right" Font-Bold="True" />
                </td>
                <td>
                    <asp:Label ID="l1" runat="server" Font-Bold="true" Visible="false" align="right" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_2" runat="server" Text="Assets Completed in the Quarter:" Visible="False" align="right" Font-Bold="True" />
                </td>
                <td>
                    <asp:Label ID="l2" runat="server" Font-Bold="true" Visible="false" align="right" />
                </td>
            </tr>
        </table>

    </div>

    <div align="center">
        <div class="page" align="center">

            <div class="main">
                <asp:ScriptManager runat="server"></asp:ScriptManager>


                <br />
                <br />
                <div align="left">


                    <div style="width: 100%">


                        <br />
                        <asp:Label ID="lbl_no_recs" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Larger"
                            Visible="false"
                            Text=""></asp:Label>
                        <asp:GridView ID="grid_display" runat="server" OnRowCommand="grid_display_RowCommand"
                            AutoGenerateColumns="False" Width="100%" Font-Size="1.11em" PageSize="7"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" HorizontalAlign="Left">
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <%--<asp:CommandField SelectText="Go to PM" ShowSelectButton="true" ButtonType="button" />--%>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_print" Text="Print " runat="server" OnClick="btn_print_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Select Asset">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_sel" Text="Go to PM" runat="server" CommandName="Select" OnClick="btn_sel_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                
                                    
                                <asp:BoundField DataField="astCode" HeaderText="Asset Code"
                                    ItemStyle-HorizontalAlign="Left" SortExpression="Asset Code" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="description" HeaderText="Description"
                                    ItemStyle-HorizontalAlign="Left" SortExpression="Description" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="scheduledDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Scheduled Date"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="Scheduled Date" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="custodian" HeaderText="Custodian"
                                    ItemStyle-HorizontalAlign="Left" SortExpression="Custodian" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="location" HeaderText="Location"
                                    ItemStyle-HorizontalAlign="Left" SortExpression="Location" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="subLoc" HeaderText="Sub Location"
                                    ItemStyle-HorizontalAlign="Left" SortExpression="contact" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>


                            </Columns>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
