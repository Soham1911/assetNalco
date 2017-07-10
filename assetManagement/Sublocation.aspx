<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="subLocation.aspx.cs" Inherits="assetManagement.subLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 230px;
        }

        .btn {
            width: 100px;
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
                        <legend>Sub-Location</legend>

                        <table>

                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Location :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_sec" runat="server" ToolTip="Select Location" Width="230px" AutoPostBack="true" OnSelectedIndexChanged="drp_sec_SelectedIndexChanged" DataValueField="locationCode" DataTextField="locationName">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center">
                                    <asp:Button ID="btn_add" CssClass="btn" runat="server" Text="ADD" Font-Bold="True" ForeColor="White" BackColor="#0066cc" OnClick="btn_add_Click" />
                                    <asp:Button ID="btn_remove" CssClass="btn" runat="server" Text="REMOVE" Font-Bold="True" ForeColor="White" BackColor="#33cc33" OnClick="btn_remove_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center">
                                    <asp:Label ID="lbl_addTitle" runat="server" Text="Add Sub-Location" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                                    <asp:Label ID="lbl_removeTitle" runat="server" Text="Select to remove" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_subLocCode" runat="server" Text="Sub-Location Code : " Font-Bold="true" Font-Size="Small" Visible="false"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_subLocCode" runat="server" Visible="false" AutoPostBack="true" OnTextChanged="txt_subLocCode_TextChanged"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_subLocCodeError" runat="server" Text="*Already Present" Font-Size="Small" Visible="false" ForeColor="Red"></asp:Label>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_subLocCode" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_subLocName" runat="server" Text="Sub-Location Name : " Font-Bold="true" Font-Size="Small" Visible="false"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_subLocName" runat="server" Visible="false" AutoPostBack="true" OnTextChanged="txt_subLocName_TextChanged"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_subLocNameError" runat="server" Text="*Already Present" Font-Size="Small" Visible="false" ForeColor="Red"></asp:Label>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_subLocName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center" class="auto-style1">
                                    <asp:Button ID="btn_submit" runat="server" Text="Add" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_submit_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center">

                                    <asp:Label ID="lbl_gridTitle" runat="server" Font-Size="Medium" Text="Sub-Locations : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                    <%--Display grid--%>
                                    <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                                        EditRowStyle-HorizontalAlign="Center" CellPadding="8" Visible="false"
                                        ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="230px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField DataField="subLocCode" HeaderText="Code" SortExpression="subLocCode" />
                                            <asp:BoundField DataField="subLocName" HeaderText="Name" SortExpression="subLocName" />
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
                                            <asp:BoundField DataField="subLocCode" HeaderText="Code" SortExpression="subLocCode" />
                                            <asp:BoundField DataField="subLocName" HeaderText="Name" SortExpression="subLocName" />
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
                                <td align="center">
                                    <asp:Button ID="btn_submitRemove" runat="server" Text="Remove" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_submitRemove_Click" Visible="false" />
                                </td>
                            </tr>
                        </table>

                        <asp:Label ID="lbl_error" runat="server" Text="Success" Font-Bold="true" Font-Size="Large" Visible="false" ForeColor="Green"></asp:Label>
                    </fieldset>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
</asp:Content>
