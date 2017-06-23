<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="assetManagement.User1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <div class="page" align="center">

                <div align="left">


                    <div style="width: 100%">               
                        <asp:GridView ID="grid_display1" runat="server" 
                            AutoGenerateColumns="False" Width="100%" 
                             Font-Size="1.11em" PageSize="7"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" HorizontalAlign="Left" >
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>

                                <asp:BoundField DataField="asset" HeaderText="Asset No."
                                    ItemStyle-HorizontalAlign="Center" SortExpression="asset" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundField>
  
                                <asp:BoundField DataField="type" HeaderText="Type of Asset"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="type" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="model" HeaderText="Model"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="type" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="desc" HeaderText="Description"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="desc" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="doa" HeaderText="Date of Allotment"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="doa" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundField>
                               
                            </Columns>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
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
