<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="call_hist.aspx.cs" Inherits="assetManagement.call_hist" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div align="center">
        <div class="page" align="center">

            <div class="main">



                <br />
                <br />
                <div align="left">


                    <div style="width: 100%">



                        <br />
                        <div style="overflow-y: scroll">


                            <asp:GridView ID="grid_display" runat="server"
                                AutoGenerateColumns="False" Width="100%"
                                Font-Size="1.11em" PageSize="7"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" HorizontalAlign="Left">
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                    HorizontalAlign="Left" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>

                                     <asp:BoundField DataField="call_id" HeaderText="Call ID"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Call ID" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_no" HeaderText="Personal No."
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Personal No." HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="name" HeaderText="Name"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Name" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="deptName" HeaderText="Department Name"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Department Name" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="location" HeaderText="Location"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Location" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="contact_no" HeaderText="Mobile No."
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Mobile No." HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="userDescription" HeaderText="Call Detail"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Call Detail" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="openingDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date of Opening"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Date of Opening" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="closingDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date of Closing"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Date of Closing" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="attendedBy" HeaderText="Attended By"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Attended By" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="remarks" HeaderText="Remarks"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Remarks  " HeaderStyle-HorizontalAlign="Left">
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

                </div>


                 <asp:Label ID="lbl_no_recs" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                            Visible="false"
                            Text="No Record available"></asp:Label>
                       
                <br />
                <br />

            </div>
           
            
        </div>

    </div>




</asp:Content>

