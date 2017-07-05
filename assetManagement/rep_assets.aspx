<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="rep_assets.aspx.cs" Inherits="assetManagement.rep_assets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="lbl_1" runat="server" align="right" Text="Search By"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="drp_by" align="left" AutoPostBack="true" OnSelectedIndexChanged="drp_by_SelectedIndexChanged" runat="server">
                        <asp:ListItem Value="0" Text="Select category" />
                        <asp:ListItem Value="p_no" Text="Personal No."/>
                        <asp:ListItem Value="astCode" Text="Asset Code"/>
                        <asp:ListItem Value="type" Text="Type"/>
                        <asp:ListItem Value="all" Text="All Assets"/>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_2" runat="server" align="left" Text="Enter value"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_val" align="left" runat="server"/>
                    <asp:DropDownList ID="drp_type" Visible="false" align="right" runat="server">
                        <asp:ListItem Value="-1" Text="Select type" />
                        
                    </asp:DropDownList>
                 </td>
            </tr>
            <tr>
                <td />
                <td />
            </tr>
            <tr>
                
                <td />
                <td>
                    <asp:Button ID="btn_sub" align="left" runat="server" Text="Submit" OnClick="btn_sub_Click"/>
                        
                </td>
            </tr>
            <tr>
                <td />
                <td />

            </tr>
            <tr>
                <td />
                <td>
                    <asp:Label ID="lbl_no_recs" runat="server" Font-Bold="true" aligForeColor="Red" Font-Size="Medium"
                            Visible="false"
                            Text="No Record available"></asp:Label>
                </td>
                
            </tr>
        </table>
                <div align="left">


                    <div style="width: 100%">



                        <br />
                        <div style="overflow-y: scroll">


                        </div>
                    </div>
                    
                </div>
    </div>
    <div align="center">
        <div class="page" align="center">

            <div class="main">
                


                <br />
                <br />
                <div align="left">


                    <div style="width: 100%">



                        <br />
                        <div style="overflow-y: scroll">


                            <asp:GridView ID="grid_astcode" Visible="false"  runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                Font-Size="1.11em" PageSize="7"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" HorizontalAlign="Left" style="margin-bottom: 0px">
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                    HorizontalAlign="Left" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>

                                     <asp:BoundField DataField="custodian_p_no" HeaderText="Personal No."
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Personal No." HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fromDate" HeaderText="Starting Date" DataFormatString="{0:yyyy/MM/dd}"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Starting Date" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    
                                    <asp:BoundField DataField="toDate" HeaderText="Ending Date"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Ending Date" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
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

                             <asp:GridView ID="grid_pno" Visible="false"  runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                Font-Size="1.11em" PageSize="7"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" HorizontalAlign="Left" style="margin-bottom: 0px">
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                    HorizontalAlign="Left" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>

                                     <asp:BoundField DataField="astCode" HeaderText="Asset Code"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Asset Code" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="description" HeaderText="Description"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Description" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    
                                    <asp:BoundField DataField="issueDate" HeaderText="Issue Date" DataFormatString="{0:yyyy/MM/dd}"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Issue Date" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
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

                            <asp:GridView ID="grid_type" Visible="false"  runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                Font-Size="1.11em" PageSize="7"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" HorizontalAlign="Left" style="margin-bottom: 0px">
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                    HorizontalAlign="Left" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>

                                    <asp:BoundField DataField="astCode" HeaderText="Asset Code"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Asset Code" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                    </asp:BoundField>

                                     <asp:BoundField DataField="description" HeaderText="Description"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Description" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="custodian" HeaderText="Custodian"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Custodian" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    
                                    <asp:BoundField DataField="issueDate" HeaderText="Issue Date" DataFormatString="{0:yyyy/MM/dd}"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Issue Date" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
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

                            <asp:GridView ID="grid_all" Visible="false" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                Font-Size="1.11em" PageSize="7"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" HorizontalAlign="Left" style="margin-bottom: 0px">
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                    HorizontalAlign="Left" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>

                                     <asp:BoundField DataField="astCode" HeaderText="Asset Code"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Asset Code" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="description" HeaderText="Description"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Description" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="custodian" HeaderText="Custodian"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Custodian" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    
                                    <asp:BoundField DataField="issueDate" HeaderText="Issue Date"  DataFormatString="{0:yyyy/MM/dd}"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Issue Date" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
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

                </div>
            </div>

     <asp:Button ID="btn_excel" runat="server" Text="Export to Excel" OnClick="btn_excel_Click" />

</asp:Content>
