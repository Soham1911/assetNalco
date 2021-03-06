﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Amc.Master" AutoEventWireup="true" CodeBehind="AmcHolder.aspx.cs" Inherits="assetManagement.AmcHolder" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <asp:ScriptManager runat="server" ></asp:ScriptManager>
        <div style="width: 60%;">
            <asp:Label ID="lbl_no_recs" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                Visible="false"
                Text="*No Record Available"></asp:Label>
            <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                EditRowStyle-HorizontalAlign="Center" CellPadding="4" Visible="false"
                ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="call_id" HeaderText="Call ID" SortExpression="call_id" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="deptCode" HeaderText="Department" SortExpression="deptCode" />
                    <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                    <asp:BoundField DataField="userDescription" HeaderText="Description" SortExpression="userDescription" />
                    <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_status" runat="server" Visible="True" />
                            <asp:DropDownList ID="callStat" runat="server" AutoPostBack="true" OnSelectedIndexChanged="callStat_SelectedIndexChanged">
                                <asp:ListItem Value="O" Text="Open" />
                                <asp:ListItem Value="D">Close</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date of Closing">
                        <ItemTemplate>
                            <asp:TextBox Width="100px" ID="txt_date" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                Enabled="True" TargetControlID="txt_date"></asp:CalendarExtender>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EditRowStyle HorizontalAlign="Center" BackColor="#999999"></EditRowStyle>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                    HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <br />

        </div>

        <br />
        <asp:Button ID="btn_save" runat="server" Text="Save Changes" Font-Bold="True" ForeColor="Black" OnClick="btn_save_Click" BackColor="LightSteelBlue" />
        <br />
        <br />
        <br />
        <asp:Label ID="lbl_error" runat="server" Text="Success" ForeColor="Green" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>

        <div align="left">
        </div>

    </div>

</asp:Content>
