<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Allied_RemoveUser.aspx.cs" Inherits="assetManagement.Allied_UserReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <style type="text/css">
        .auto-style1 {
            width: 344px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 60%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>Remove User</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Section :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_sec" runat="server" ToolTip="Select Section" Width="230px" AutoPostBack="true" OnSelectedIndexChanged="drp_sec_SelectedIndexChanged" DataValueField="sectionCode" DataTextField="sectionName">
                                        <asp:ListItem Value="-1" Text="Select Section" />
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Username :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_uname" runat="server" ToolTip="Select Username" Width="230px" DataValueField = "username" AutoPostBack="true" OnSelectedIndexChanged="drp_uname_SelectedIndexChanged">
                                        <asp:ListItem Value="-1">Select username</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
        
                           <tr>
                                <td rowspan="5">
                                    <asp:Image ID="img_p" runat="server"  Visible="false" Width="100px" />
                                </td>
                                <td colspan="2" style="text-align: left">
                                   <asp:Label ID="lbl_name" runat="server" Font-Size="Medium" Text="Name : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>


                            <tr>
                                <td colspan="2"  style="text-align: left">
                                    <asp:Label ID="lbl_location" runat="server" Font-Size="Medium" Text="Location : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"  style="text-align: left">
                                    <asp:Label ID="lbl_contact" runat="server" Font-Size="Medium" Text="Contact No. : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left">

                                    <asp:Label ID="lbl_gridTitle" runat="server" Font-Size="Medium" Text="Alloted assets : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                    <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                                        EditRowStyle-HorizontalAlign="Center" CellPadding="4" Visible="false"
                                        ForeColor="#333333" GridLines="None" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" />
                                        <Columns>
                                            <asp:BoundField DataField="astCode" HeaderText="Asset Code" SortExpression="astCode" />
                                        </Columns>

                                        <EditRowStyle HorizontalAlign="Center" BackColor="#999999"></EditRowStyle>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                            HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" />
                                        <HeaderStyle BackColor="#5D7BD9" Font-Bold="True" ForeColor="White" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center" class="auto-style1">
                                    <asp:Button ID="btn_rem" runat="server" Text="Remove" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_rem_Click" />
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
