<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="PM_Report.aspx.cs" Inherits="assetManagement.PM_Report" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 49px;
        }
        .auto-style5 {
            height: 39px;
            width: 120px;
        }
        .auto-style6 {
            width: 104px;
            height: 37px;
        }
        .auto-style7 {
            width: 103px;
            height: 37px;
        }
        .auto-style8 {
            height: 38px;
            width: 120px;
        }
        .auto-style9 {
            height: 38px;
            width: 395px;
        }
        .auto-style10 {
            height: 37px;
            width: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 66%; margin-left: 0px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>NALCO Systems PM Management</legend>
                        <table style="height: 100px; width: 601px;">

                            <tr>
                                <td colspan="3" class="auto-style1">

                                    <asp:Label ID="lbl_PM" runat="server" Style="font-weight: 700; font-size: x-large" Text="PM Report Generation"></asp:Label>
                                </td>
                            </tr>

                            
                             <tr>
                                <td class="auto-style8">
                                    Select Department</td>
                                <td colspan="2" class="auto-style9">

                                    <asp:DropDownList ID="Drp_1" runat="server" Height="20px" Width="250px" AutoPostBack="true" OnSelectedIndexChanged="dept_changed">
                                        <asp:ListItem Value="0" Selected="False">-- pick one --</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Drp_1" ErrorMessage="*Select Department   " ForeColor="Red"></asp:RequiredFieldValidator>
                            
                            <tr>
                                <td class="auto-style8">
                                    Select Location</td>
                                <td colspan="2" class="auto-style9">

                                    <asp:DropDownList ID="Drp_2" runat="server" Height="20px" Width="250px">
                                        <asp:ListItem Value="0" Selected="False">-- pick one --</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Drp_2" ErrorMessage="*Select Location   " ForeColor="Red"></asp:RequiredFieldValidator>
                            
                             <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lbl_date" runat="server" Text="From - To Date"></asp:Label>
                                </td>
                                <td align="left" class="auto-style7">
                                    <asp:TextBox Width="150px" ID="txt_entryDate" runat="server" Height="20px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_entryDate"></asp:CalendarExtender>
                                </td>

                                <td align="left" class="auto-style6">
                                    <asp:TextBox Width="150px" ID="txt_exitDate" runat="server" Height="20px" Style="margin-left: 43px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_exitDate"></asp:CalendarExtender>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_entryDate" ErrorMessage="*Enter From Date   " ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_exitDate" ErrorMessage="*Enter To Date   " ForeColor="Red"></asp:RequiredFieldValidator>
                            
                        
                        </table>

                        <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>

                        <asp:Button ID="btn_submit" runat="server" Height="26px" Text="Generate Report" Width="122px" OnClick="btn_reg_Click" />
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
                <div style="width: 100%; height: 300px; overflow: scroll">
                    <asp:GridView ID="grid_display" runat="server"
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
                            <%--<asp:BoundField DataField="spare_type" HeaderText="Spare Code"
                                   ItemStyle-HorizontalAlign="Center" SortExpression="spare" HeaderStyle-HorizontalAlign="center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>--%>

                            <asp:BoundField DataField="unitCode" HeaderText="Unit Code"
                                ItemStyle-HorizontalAlign="Center" SortExpression="unitCode" HeaderStyle-HorizontalAlign="center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="astCode" HeaderText="Asset Code"
                                ItemStyle-HorizontalAlign="Center" SortExpression="astCode" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="scheduledDate" HeaderText="Scheduled Date"
                                ItemStyle-HorizontalAlign="Center" SortExpression="scheduledDate" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="actualDate" HeaderText="Actual Date"
                                ItemStyle-HorizontalAlign="Center" SortExpression="actualDate" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="lockStat" HeaderText="Lock Status"
                                ItemStyle-HorizontalAlign="Center" SortExpression="lockStat" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="compStat" HeaderText="Complete Status"
                                ItemStyle-HorizontalAlign="Center" SortExpression="compStat" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="month" HeaderText="Month"
                                ItemStyle-HorizontalAlign="Center" SortExpression="month" HeaderStyle-HorizontalAlign="Center">
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
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td><td>
                    <asp:Button ID="btn_excel"  runat="server" align=center Height="27px" Text="Generate Excel Report" Width="155px" OnClick="btn_excel_Click" />
                    </td>
                            <tr>
                        <td>&nbsp;</td><td>
                                &nbsp;</td>
                            </tr>
                            </table>
                        </div>
            </div>
</asp:Content>
