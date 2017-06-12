<%@ Page Title="" Language="C#" MasterPageFile="~/Amc.Master" AutoEventWireup="true" CodeBehind="AmcHolder.aspx.cs" Inherits="assetManagement.AmcHolder" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 60%;">
            <asp:Label ID="lbl_no_recs" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                Visible="false"
                Text="No Record available"></asp:Label>
            <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                EditRowStyle-HorizontalAlign="Center" CellPadding="4" Visible="false"
                ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                   
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" id="chk_call" AutoPostBack="true" OnCheckedChanged="chk_call_CheckedChanged"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="call_id" HeaderText="Call ID" SortExpression="call_id" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="deptCode" HeaderText="Department" SortExpression="deptCode" />
                    <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                    <asp:BoundField DataField="subLoc" HeaderText="Sub-Location" SortExpression="subLoc" />
                    <asp:BoundField DataField="userDescription" HeaderText="Description" SortExpression="userDescription" />
                    <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                    <asp:BoundField DataField="allotedTo" HeaderText="Alloted To" SortExpression="contact_no" />
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
            <br />
            <br />
            <div>

                <asp:ScriptManager ID="ScriptManager2" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <fieldset>

                            <div align="left">
                                &nbsp; &nbsp; &nbsp;
                                    <table>

                                        <tr>
                                            <td>
                                                <asp:Button ID="btn_submit" runat="server" Text="Submit" Visible="true" Font-Bold="true"
                                                    Width="129px" />
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>


                                <asp:Label ID="lbl_success" runat="server" Text="Submitted Successfully" Visible="false" ForeColor="Green" Font-Size="Medium"></asp:Label>
                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>


        <div align="left">
        </div>

    </div>
  
</asp:Content>
