<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Spare_Parts.aspx.cs" Inherits="assetManagement.Spare_Parts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page" align="center">

                <div align="left">


                    <div style="width: 100%">  
                        <div  style="width: 100%; height: 300px; overflow: scroll">             
                        <asp:GridView ID="grid_display" runat="server" 
                            AutoGenerateColumns="False" Width="78%" 
                             Font-Size="1.11em" PageSize="7"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" HorizontalAlign="Center" Height="187px" >
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"
                                HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID Number"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="spare_ID" HeaderStyle-HorizontalAlign="center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="description" HeaderText="Description"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="desc" HeaderStyle-HorizontalAlign="Center">
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

                </div>

                

                <br />
                <br />
                <div>
                </div>
            </div>
            <br />
            

    <div align="center">
        <div style="width: 30%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>NALCO Systems Spare Management</legend>
                          <table>
                            
                             <tr>
                                <td colspan="2">

                                    <asp:Label ID="Label" runat="server" Style="font-weight: 700; font-size: x-large" Text="Enter Spare Part Description"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                    <asp:Label ID="lbl_idnumber" runat="server" Text="ID Number"></asp:Label>
                                </td>
                                <td>

                                    <asp:TextBox ID="txt_idnumber"  runat="server" Height="18px" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_idnumber" ErrorMessage="*Enter Spare Code   " ForeColor="Red"></asp:RequiredFieldValidator>
                       
                            <tr>
                                <td class="auto-style3">
                                    <asp:Label ID="lbl_type" runat="server" Text="Type of Spare"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_type" runat="server" Width="297px" Height="38px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_type" ErrorMessage="*Enter Spare Description" ForeColor="Red"></asp:RequiredFieldValidator>
                       
                        </table>

                        <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>

                        <asp:Button ID="btn_submit" runat="server" Height="26px" Text="Register" Width="106px" OnClick="btn_reg_Click" />
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div align="left">
        </div>
    </div>
</asp:Content>