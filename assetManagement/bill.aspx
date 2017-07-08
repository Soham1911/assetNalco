<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="assetManagement.bill" %>

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
                        <legend>Bill</legend>

                        <table>
                            <tr>
                                <td>
<%--                                    <asp:Label ID="lbl_check" runat="server" Text="Default" Font-Bold="true" Font-Size="Large" Visible="true" />--%>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Select Quarter :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_quarter" runat="server" ToolTip="Select Quarter" Width="230px" DataValueField="quarterStartDate" AutoPostBack="true" OnSelectedIndexChanged="drp_quarter_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>

                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center">
                                    <asp:Label ID="lbl_gridTitle" runat="server" Font-Size="Medium" Text="Bill Details : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>

                                    <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                                        EditRowStyle-HorizontalAlign="Center" CellPadding="4" Visible="false"
                                        ForeColor="#333333" GridLines="None" Width="230px" HorizontalAlign="Center">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField DataField="amcParty" HeaderText="AMC Party" SortExpression="amcParty" />
                                            <asp:BoundField DataField="proposedBill" HeaderText="Proposed Bill" SortExpression="proposedBill" />
                                            <asp:BoundField DataField="pmPenalty" HeaderText="PM Penalty" SortExpression="pmPenalty" />
                                            <asp:BoundField DataField="downtimePenalty" HeaderText="Downtime Penalty" SortExpression="downtimePenalty" />
                                            <asp:BoundField DataField="finalBill" HeaderText="Final Bill" SortExpression="finalBill" />
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
                                    <asp:Button ID="btn_genBill" runat="server" Text="Generate Bill" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_genBill_Click" />

                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center">
                                    <asp:Button ID="btn_compBill" runat="server" Text="Complete Bill" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_compBill_Click" />
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
