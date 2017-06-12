<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="assetManagement.User1" %>

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
                        <legend>Asset List</legend>

                        <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                            EditRowStyle-HorizontalAlign="Center" CellPadding="4" Visible="false"
                            ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="astCode" HeaderText="Asset Code" SortExpression="astCode" />
                                <asp:BoundField DataField="category" HeaderText="Type" SortExpression="category" />
                                <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
                            </Columns>

                            <EditRowStyle HorizontalAlign="Center" BackColor="#999999"></EditRowStyle>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>


        <div align="left">
        </div>

    </div>

</asp:Content>
