<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="assetManagement.Status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page" align="center">

                <div align="left">


                    <div style="width: 100%">               
                        <asp:GridView ID="grid_display" runat="server" 
                            AutoGenerateColumns="False" Width="100%" 
                             Font-Size="1.11em" PageSize="7"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" HorizontalAlign="Left" >
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"
                                HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="call_id" HeaderText="Call Id"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="call_id" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="astCode" HeaderText="Asset No."
                                    ItemStyle-HorizontalAlign="Center" SortExpression="asset" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
  
                                <asp:BoundField DataField="cat" HeaderText="Type of Asset"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="type" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="userDescription" HeaderText="Problem Description"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="desc" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="category" HeaderText="Problem Type"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="desc" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="callStat" HeaderText="Call Status"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="doa" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="openingDate" HeaderText="Opening Date" 
                                    ItemStyle-HorizontalAlign="Center" SortExpression="doa" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="closingDate" HeaderText="Closing Date" 
                                    ItemStyle-HorizontalAlign="Center" SortExpression="doa" HeaderStyle-HorizontalAlign="Center">
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
                    </div>

                </div>

                

                <br />
                <br />
                <div>

                    <asp:ScriptManager ID="ScriptManager2" runat="server">
                    </asp:ScriptManager>
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <fieldset>

                                <div align="left">
                                    &nbsp; &nbsp; &nbsp;
                                    <table>
                                        <tr>
                                            <%--<td align="right">
                                                <font size="4em" >       Exit Date :-</font>
                                            </td>
                                            <td align="left">

                                                <asp:TextBox placeholder="Enter Exit Date" ID="txt_exitdate" runat="server" ToolTip=" User ID " Width="137px" Visible="false"></asp:TextBox>
                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_exitdate" Text="*Reqiured"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        </table>
                                        <asp:Label ID="lbl_success" runat="server" Text="Account Deleted Successfully!" Visible="false" ForeColor="Green" Font-Size="Medium"></asp:Label>
                                        <asp:Label ID="lbl_error" runat="server" Text="Account Not Deleted" Visible="false" ForeColor="Red" Font-Size="Medium"></asp:Label>
                                        <asp:Button ID="btn_deregister" runat="server" Text="Delete Account" Visible="false" Font-Bold="true"
                                            Width="129px" OnClick="deregister_Click" />
                                </div>
                            </fieldset>
                        </ContentTemplate>
                    </asp:UpdatePanel>--%>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />

</asp:Content>
