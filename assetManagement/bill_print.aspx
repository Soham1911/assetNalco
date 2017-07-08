<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bill_print.aspx.cs" Inherits="assetManagement.bill_print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .btn {
            width: 100px;
            height: 35px;
        }
    </style>
    <script language="javascript" type="text/javascript">

        function print_report() {
            window.print();
        }

   </script>
</head>
<body onload="print_report()">
    <form id="form1" runat="server">
        <div align="center">
            <div width="80%" text-align="center">
                <asp:Panel ID="pnl1" runat="server">
                    <font size="5em" style="font-weight: 700"> Bill</font>
                    <br />
                    <asp:Label ID="lbl_check" runat="server" Text="Default" Font-Size="Medium" Visible="false" />
                    <br />
                    <%--Payment Details details--%>
                    <table border="1">
                        <tr>
                            <td colspan="2" align="center">
                                <font size="4em" style="font-weight: 700"> Payment Details</font>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Proposed Bill :
                            </td>
                            <td align="right" width="200px">
                                <asp:Label ID="lbl_proposedBill" runat="server" Font-Size="Medium" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">PM Penalty :
                            </td>
                            <td align="right" width="200px">
                                <asp:Label ID="lbl_pmPenalty" runat="server" Font-Size="Medium" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Downtime Penalty :
                            </td>
                            <td align="right" width="200px">
                                <asp:Label ID="lbl_downtimePenalty" runat="server" Font-Size="Medium" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Total Penalty :
                            </td>
                            <td align="right" width="200px">
                                <asp:Label ID="lbl_totalPenalty" runat="server" Font-Size="Medium" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">10% of the Bill :
                            </td>
                            <td align="right" width="200px">
                                <asp:Label ID="lbl_10" runat="server" Font-Size="Medium" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><font size="3em" style="font-weight: 700"> Final Bill : </font>
                            </td>
                            <td align="right" width="200px">
                                <asp:Label ID="lbl_finalBill" runat="server" Font-Size="Medium" Style="font-weight: 700" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <%--PM penalty details--%>
                    <table border="1">
                        <tr>
                            <td colspan="2" align="center">
                                <font size="4em" style="font-weight: 700"> PM Penalty Report </font>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <font size="3em" style="font-weight: 700"> From Date : </font>
                                <asp:Label ID="lbl_fromDate" runat="server" Font-Size="Medium" />
                            </td>
                            <td align="right">
                                <font size="3em" style="font-weight: 700"> To Date : </font>
                                <asp:Label ID="lbl_toDate" runat="server" Font-Size="Medium" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">

                                <%--Display PM penalty details--%>
                                <asp:GridView ID="grid_pmPenalty" runat="server" AutoGenerateColumns="false"
                                    EditRowStyle-HorizontalAlign="Center" CellPadding="4" Visible="true"
                                    ForeColor="Black" GridLines="None" HorizontalAlign="Center" Width="230px" BorderWidth="1px">
                                    <Columns>
                                        <asp:BoundField DataField="astDesc" HeaderText="Asset Desc" SortExpression="astDesc" />
                                        <asp:BoundField DataField="type" HeaderText="Category" SortExpression="type" />
                                        <asp:BoundField DataField="pmSchCount" HeaderText="Sch Count" SortExpression="pmSchCount" />
                                        <asp:BoundField DataField="atndCount" HeaderText="Atnd Count" SortExpression="atndCount" />
                                        <asp:BoundField DataField="notAttended" HeaderText="Not Attended" SortExpression="notAttended" />
                                        <asp:BoundField DataField="pmPenalty" HeaderText="PM Penalty" SortExpression="pmPenalty" />
                                        <asp:BoundField DataField="pmTotalPenalty" HeaderText="Total PM Penalty" SortExpression="pmTotalPenalty" />
                                    </Columns>

                                    <EditRowStyle HorizontalAlign="Center" BackColor="White" BorderWidth="1px"></EditRowStyle>
                                    <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black"
                                        HorizontalAlign="Center" VerticalAlign="Middle" BorderWidth="1px" />
                                    <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" BorderWidth="1px" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" BorderWidth="1px" />
                                    <RowStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" BorderWidth="1px" />

                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />

                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
