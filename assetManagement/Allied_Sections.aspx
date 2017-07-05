<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Allied_Sections.aspx.cs" Inherits="assetManagement.Allied_Sections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .btn {
            width: 150px;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 60%;">
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_add" CssClass="btn" runat="server" Text="ADD" Font-Bold="True" ForeColor="White" BackColor="#0066cc" OnClick="btn_add_Click" />
                        <asp:Button ID="btn_remove" CssClass="btn" runat="server" Text="REMOVE" Font-Bold="True" ForeColor="White" BackColor="#33cc33" OnClick="btn_remove_Click" />
                        <asp:Button ID="btn_edit" CssClass="btn" runat="server" Text="EDIT" Font-Bold="True" ForeColor="White" BackColor="#ff6600" OnClick="btn_edit_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" aign="center">
                        <asp:Label ID="lbl_addTitle" runat="server" Text="Enter Details Of Section " Font-Bold="true" Font-Size="Medium" Visible="false"></asp:Label>
                        <asp:Label ID="lbl_removeTitle" runat="server" Text="Select To Remove " Font-Bold="true" Font-Size="Medium" Visible="false"></asp:Label>
                        <asp:Label ID="lbl_editTitle" runat="server" Text="Edit " Font-Bold="true" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td align="right">
                        <asp:Label ID="lbl_sectionName" runat="server" Text="Section Name : " Font-Bold="true" Font-Size="Small" Visible="false"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox Width="230px" ID="txt_sectionName" runat="server" Visible="false" AutoPostBack="true" OnTextChanged="txt_sectionName_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lbl_secNameError" runat="server" Text="*Already Present" Font-Bold="true" Font-Size="Small" Visible="false" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="left">
                        <asp:Button ID="btn_submit" runat="server" Text="Add" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_submit_Click" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lbl_no_recsAdd" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                            Visible="false"
                            Text="*No Record Available"></asp:Label>
                        <asp:Label ID="lbl_no_recsRemove" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                            Visible="false"
                            Text="*No Record Available"></asp:Label>
                        <asp:Label ID="lbl_no_recsEdit" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                            Visible="false"
                            Text="*No Record Available"></asp:Label>
                        <%--Main page--%>
                        <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                            EditRowStyle-HorizontalAlign="Center" CellPadding="8" Visible="false"
                            ForeColor="#333333" GridLines="None" Width="500px" HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="sectionCode" HeaderText="Section Code" SortExpression="sectionCode" />
                                <asp:BoundField DataField="sectionName" HeaderText="Secion Name" SortExpression="sectionName" />
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

                        <%--Remove page--%>
                        <asp:GridView ID="grid_remove" runat="server" AutoGenerateColumns="false"
                            EditRowStyle-HorizontalAlign="Center" CellPadding="8" Visible="false"
                            ForeColor="#333333" GridLines="None" Width="500px" HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                            <Columns>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_select" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="sectionCode" HeaderText="Section Code" SortExpression="sectionCode" />
                                <asp:BoundField DataField="sectionName" HeaderText="Secion Name" SortExpression="sectionName" />
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

                        <%--Edit page--%>
                        <asp:GridView ID="grid_edit" runat="server" AutoGenerateColumns="false"
                            EditRowStyle-HorizontalAlign="Center" CellPadding="8" Visible="false"
                            ForeColor="#333333" GridLines="None" Width="500px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                            <Columns>
                                <asp:TemplateField HeaderText="Section Code">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_secCode" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Section Name">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_secName" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="btn_submitRemove" runat="server" Text="Remove" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_submitRemove_Click" Visible="false" />
                        <asp:Button ID="btn_submitEdit" runat="server" Text="Save Changes" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_submitEdit_Click" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="lbl_error" runat="server" Text="Success" ForeColor="Green" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>

        </div>


        <div align="left">
        </div>

    </div>
</asp:Content>
