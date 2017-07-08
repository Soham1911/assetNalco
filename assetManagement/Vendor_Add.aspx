<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Vendor_Add.aspx.cs" Inherits="assetManagement.Vendor_Add" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .btn {
            width: 150px;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 60%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>Vendor</legend>
                          <table>

                                <td></td>
                            </tr>
                            <tr>
                                <td align="center"  colspan="2">
                                    <asp:Button ID="btn_add" CssClass="btn" runat="server" Text="ADD" Font-Bold="True" ForeColor="White" BackColor="#0066cc" OnClick="btn_add_Click" />
                                    <asp:Button ID="btn_remove" CssClass="btn" runat="server" Text="REMOVE" Font-Bold="True" ForeColor="White" BackColor="#33cc33" OnClick="btn_remove_Click" />
                                    <asp:Button ID="btn_view" CssClass="btn" runat="server" Text="VIEW" Font-Bold="True" ForeColor="White" BackColor="#ff6600" OnClick="btn_view_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center" class="auto-style1">
                                    <asp:Label ID="lbl_addTitle" runat="server" Text="Add Vendor" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                                    <asp:Label ID="lbl_removeTitle" runat="server" Text="Select to remove" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_sap_vendorCode" runat="server" Text="SAP Vendor Code" Font-Size="Medium" Visible="false" Style="font-size: small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_sap_vendorCode" runat="server" ToolTip="Enter SAP Vendor Code :" Width="230px" AutoPostBack="true" OnTextChanged="txt_sap_vendorCode_TextChanged"></asp:TextBox>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lbl_sap_vendorCodeError" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_sap_vendorCode" ErrorMessage="*Enter SAP Vendor Code" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_vendorCode" runat="server" Text="Vendor Code :" Font-Size="Medium" Visible="false" Style="font-size: small" ></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_vendorCode" runat="server" ToolTip="Enter Vendor Code" Width="230px" AutoPostBack="true" OnTextChanged="txt_vendorCode_TextChanged"></asp:TextBox>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lbl_vendorCodeError" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_vendorCode" ErrorMessage="*Enter Vendor Code" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_vendorName" runat="server" Text="Vendor Name :" Font-Size="Medium" Visible="false" Style="font-size: small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_vendorName" runat="server" ToolTip="Enter Vendor Name" Width="230px" AutoPostBack="true" OnTextChanged="txt_vendorName_TextChanged"></asp:TextBox>
                                </td>
                                <td align="left">
                                    <asp:Label ID="lbl_vendorNameError" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_vendorDesc" runat="server" Text="Vendor Description :" Font-Size="Medium" Visible="false" Style="font-size: small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_vendorDesc" runat="server" ToolTip="Enter Vendor Description" Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_date" runat="server" Text="Date :" Font-Size="Medium" Visible="false" Style="font-size: small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_date" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_date"></asp:CalendarExtender>
                                </td>
               
                            </tr>

                            <tr>
                                <td></td>
                            </tr>

                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="btn_submit" runat="server" Text="Add" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_submit_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center">

                                    <asp:Label ID="lbl_gridTitle" runat="server" Font-Size="Medium" Text="Vendors" Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                    <%--Display grid--%>
                                    <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                                        EditRowStyle-HorizontalAlign="Center" CellPadding="8" Visible="false"
                                        ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="230px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField DataField="sap_vendorCode" HeaderText="SAP Code" SortExpression="sap_vendorCode" />
                                            <asp:BoundField DataField="vendorCode" HeaderText="Code" SortExpression="vendorCode" />
                                            <asp:BoundField DataField="vendorName" HeaderText="Name" SortExpression="vendorName" />
                                        </Columns>

                                        <EditRowStyle HorizontalAlign="Center" BackColor="#999999"></EditRowStyle>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                            HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" HorizontalAlign="Center" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" HorizontalAlign="Center" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" HorizontalAlign="Center" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" HorizontalAlign="Center" />
                                    </asp:GridView>

                                    <%--Remove grid--%>
                                    <asp:GridView ID="grid_remove" runat="server" AutoGenerateColumns="false"
                                        EditRowStyle-HorizontalAlign="Center" CellPadding="8" Visible="false"
                                        ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="230px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk_select" runat="server"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="sap_vendorCode" HeaderText="SAP Code" SortExpression="sap_vendorCode" />
                                            <asp:BoundField DataField="vendorCode" HeaderText="Code" SortExpression="vendorCode" />
                                            <asp:BoundField DataField="vendorName" HeaderText="Name" SortExpression="vendorName" />
                                        </Columns>

                                        <EditRowStyle HorizontalAlign="Center" BackColor="#999999"></EditRowStyle>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                            HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" HorizontalAlign="Center" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" HorizontalAlign="Center" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" HorizontalAlign="Center" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td align="center" class="auto-style1">
                                    <asp:Button ID="btn_submitRemove" runat="server" Text="Remove" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_submitRemove_Click" Visible="false" />
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
