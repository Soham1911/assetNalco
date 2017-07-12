<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Issue_Report.aspx.cs" Inherits="assetManagement.Issue_Report" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 29px;
        }
        .auto-style12 {
            width: 136px;
            height: 30px;
        }
        .auto-style13 {
            height: 30px;
        }
        .auto-style14 {
            width: 136px;
            height: 29px;
        }
        .auto-style16 {
            width: 136px;
            height: 2px;
        }
        .auto-style17 {
            height: 2px;
        }
        .auto-style18 {
            width: 136px;
            height: 26px;
        }
        .auto-style19 {
            height: 26px;
        }
        .auto-style20 {
            width: 136px;
            height: 24px;
        }
        .auto-style21 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 70%; margin-left: 0px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>NALCO Systems Spare Management</legend>
                        <table style="height: 178px; width: 622px;">

                            <tr>
                                <td colspan="3" class="auto-style5">

                                    <asp:Label ID="Label" runat="server" Style="font-weight: 700; font-size: x-large" Text="Issue Report Generation"></asp:Label>
                                </td>
                            </tr>

                            
                            <tr>
                                <td class="auto-style20">
                                    <asp:Label ID="Label1" runat="server" Text="Search By"></asp:Label>
                                </td>
                                <td colspan="2" class="auto-style21">
                                    <asp:RadioButtonList ID="rdbtn_type" AutoPostBack=" true" OnSelectedIndexChanged="typeChanged" runat="server" Width="271px" Height="16px" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1">By Asset Code</asp:ListItem>
                                        <asp:ListItem Value="2">By From - To Date</asp:ListItem>
                                        <asp:ListItem Value="3">By Spare Part Number</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Search Type" ControlToValidate="rdbtn_type"></asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style21"></td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    <asp:Label ID="lbl_astCode" runat="server" Text="Asset Code"></asp:Label>
                                </td>
                                <td colspan="2" class="auto-style17">

                                    <asp:TextBox ID="txt_astCode" runat="server" Height="18px" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_astCode" ErrorMessage="*Enter Asset Code " ForeColor="Red"></asp:RequiredFieldValidator>

                            <tr>
                                <td class="auto-style18">
                                    <asp:Label ID="lbl_type" runat="server" Text="From - To Date"></asp:Label>
                                </td>
                                <td align="left" class="auto-style19">
                                    <asp:TextBox Width="200px" ID="txt_entryDate" runat="server" Height="20px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_entryDate"></asp:CalendarExtender>
                                </td>

                                <td align="left" class="auto-style19">
                                    <asp:TextBox Width="200px" ID="txt_exitDate" runat="server" Height="20px" Style="margin-left: 43px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_exitDate"></asp:CalendarExtender>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_entryDate" ErrorMessage="*Enter From Date   " ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_exitDate" ErrorMessage="*Enter To Date   " ForeColor="Red"></asp:RequiredFieldValidator>
                            <tr>
                                <td class="auto-style12">
                                    <asp:Label ID="lbl_partno" runat="server" Text="Part Number"></asp:Label>
                                </td>
                                <td colspan="2" class="auto-style13">

                                    <asp:DropDownList ID="Drp_1" runat="server" Height="22px" Width="307px">
                                        <asp:ListItem Value="0" Selected="False">-- pick one --</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Drp_1" ErrorMessage="*Enter Part Number   " ForeColor="Red"></asp:RequiredFieldValidator>
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

                            <asp:BoundField DataField="type" HeaderText="Spare Type"
                                ItemStyle-HorizontalAlign="Center" SortExpression="spare_type" HeaderStyle-HorizontalAlign="center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="description" HeaderText="Description"
                                ItemStyle-HorizontalAlign="Center" SortExpression="desc" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="quantity" HeaderText="Quantity"
                                ItemStyle-HorizontalAlign="Center" SortExpression="quantity" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="entryDate" HeaderText="Entry Date"
                                ItemStyle-HorizontalAlign="Center" SortExpression="doe" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="amcID" HeaderText="AMC Person"
                                ItemStyle-HorizontalAlign="Center" SortExpression="amcPerson" HeaderStyle-HorizontalAlign="Center">
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