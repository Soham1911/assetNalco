<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Spare_Stock_Report.aspx.cs" Inherits="assetManagement.Spare_Stock" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="height: 819px">
        <div style="width: 70%; margin-left: 0px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>NALCO Systems Spare Management</legend>
                        <table style="height: 57px; width: 630px;">

                            <tr>
                                <td colspan="3" class="auto-style2">

                                    <asp:Label ID="Label" runat="server" Style="font-weight: 700; font-size: x-large" Text="Spare Report Generation"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="Label1" runat="server" Text="Search By"></asp:Label>
                                </td>
                                <td colspan="2" class="auto-style10">
                                    <asp:RadioButtonList ID="rdbtn_type" AutoPostBack=" true" OnSelectedIndexChanged="Page_Load" runat="server" Width="271px" Height="16px" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True" Value="1">Per Spare Report</asp:ListItem>
                                        <asp:ListItem Value="2">Spare Summary</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="auto-style10"></td>
                            </tr>

                            <tr>
                                <td class="auto-style11">Part Type</td>
                                <td colspan="2" class="auto-style11">

                                    <asp:DropDownList ID="Drp_1" runat="server" Height="22px" Width="307px">
                                        <asp:ListItem Value="0" Selected="False">-- pick one --</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Drp_1" ErrorMessage="*Select Part Type   " ForeColor="Red"></asp:RequiredFieldValidator>
                            <tr>
                                <td></td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                <td>
                                    <asp:Button ID="btn_submit" runat="server" Height="26px" Text="Generate Report" Width="122px" OnClick="btn_reg_Click" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_submit" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div>
        </div>
        <div>
        </div>

        <div align="left">
            <div style="width: 100%">
                
                    <asp:GridView ID="grid_display" runat="server"
                        AutoGenerateColumns="False" Width="78%"
                        Font-Size="1.11em" PageSize="7"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" HorizontalAlign="Center" Height="73px">
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"
                            HorizontalAlign="Left" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:BoundField DataField="type" HeaderText="Spare Type"
                                ItemStyle-HorizontalAlign="Center" SortExpression="type" HeaderStyle-HorizontalAlign="center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="make" HeaderText="Make"
                                ItemStyle-HorizontalAlign="Center" SortExpression="make" HeaderStyle-HorizontalAlign="center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="model" HeaderText="Description"
                                ItemStyle-HorizontalAlign="Center" SortExpression="model" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="currentStock" HeaderText="Current Stock"
                                ItemStyle-HorizontalAlign="Center" SortExpression="currentStock" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                    <table>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td>
                            <asp:Button ID="btn_excel" runat="server" align="center" Height="26px" Text="Generate Excel Report" Width="163px" OnClick="btn_excel_Click" />
                        </td>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    
                    <div align="left">
                        <div style="width: 100%">
                            
                                <asp:GridView ID="grid_display1" runat="server"
                                    AutoGenerateColumns="False" Width="93%"
                                    Font-Size="1.11em" PageSize="7"
                                    CellPadding="4" ForeColor="#333333"
                                    GridLines="None" HorizontalAlign="Center" Height="156px">
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"
                                        HorizontalAlign="Left" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>

                                        <asp:BoundField DataField="type" HeaderText="Spare Type"
                                            ItemStyle-HorizontalAlign="Center" SortExpression="type" HeaderStyle-HorizontalAlign="center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>

                                        <asp:BoundField DataField="currentStock" HeaderText="Current Stock"
                                            ItemStyle-HorizontalAlign="Center" SortExpression="currentStock" HeaderStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                    </Columns>
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>

                                <table>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btn_excel1" runat="server" align="center" Height="26px" Text="Generate Excel Report" Width="163px" OnClick="btn_excel_Click1" />
                                    </td>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            
                        </div>
                    </div>
                </div>
</asp:Content>