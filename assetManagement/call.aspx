<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="call.aspx.cs" Inherits="assetManagement.call" %>


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
                        <asp:Label ID="lbl_no_recs" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                            Visible="false"
                            Text="No Record available"></asp:Label>
                        <asp:GridView ID="grid_display" runat="server" OnRowDataBound="GridView1_RowDataBound"
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
                                <asp:BoundField DataField="astCode" HeaderText="Asset Code"
                                    ItemStyle-HorizontalAlign="Left" SortExpression="Asset Code" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="openingDate" HeaderText="Date of Opening"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="Date of Opening" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="type" HeaderText="Call Type"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="Call Type" HeaderStyle-HorizontalAlign="Left">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_status" runat="server" Visible="True" />
                                        <asp:DropDownList ID="callStat" runat="server">
                                            <asp:ListItem Value="o" Text="O" />
                                            <asp:ListItem Value="d">D</asp:ListItem>
                                            <asp:ListItem Value="c">C</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Closing">
                                    <ItemTemplate>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Allotted To">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_allottedto" runat="server" Visible="True" />
                                        <asp:DropDownList ID="allottedto" runat="server" AppendDataBoundItems="True" AutoPostBack="false" DataTextField="id" DataValueField="id" Height="16px">

                                            <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Attended By">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_attendedby" runat="server" Visible="True" />
                                        <asp:DropDownList ID="attendedby" runat="server" AppendDataBoundItems="True" AutoPostBack="false" DataTextField="id" DataValueField="id" Height="16px">

                                            <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_remark" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>


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

            </div>
            <br />
            <asp:Button ID="btn_save" runat="server" Text="Save Changes" Font-Bold="True" ForeColor="#383E78" OnClick="btn_save_Click" />
            <br />
            <br />
            <br />

        </div>

    </div>




</asp:Content>
