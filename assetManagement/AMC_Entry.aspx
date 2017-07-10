<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="AMC_Entry.aspx.cs" Inherits="assetManagement.AMC_Entry" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
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
                        <legend>Add Asset(s) To AMC</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right">Register By :
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:DropDownList ID="drp_sel" runat="server" Width="230px" AutoPostBack="true" OnSelectedIndexChanged="drp_sel_SelectedIndexChanged">
                                        <asp:ListItem Value="po_no">PO Number</asp:ListItem>
                                        <asp:ListItem Value="assetCode"> Asset Code</asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_po_no" runat="server" Text="PO No. :" Font-Size="small"></asp:Label>
                                    <asp:Label ID="lbl_assetCode" runat="server" Text="Asset Code :" Font-Size="small" Visible="false"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_po_no" runat="server" ToolTip="Enter PO No." Width="230px" AutoPostBack="true" OnTextChanged="txt_po_no_TextChanged"></asp:TextBox>
                                    <asp:TextBox ID="txt_assetCode" runat="server" ToolTip="Enter Asset Code" Width="230px" Visible="false" AutoPostBack="true" OnTextChanged="txt_assetCode_TextChanged"></asp:TextBox>
                                </td>
                                <td align="right">
                                 </td>
                            </tr>

                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Label ID="lbl_invalid" runat="server" Font-Size="small" Text="*Invalid Asset Code" Visible="False" Style="font-size: small;" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td rowspan="5">
                                    <asp:Image ID="img_p" runat="server" Visible="false" Width="100px" ToolTip="Custodian's Photo" />
                                </td>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_astpo" runat="server" Font-Size="Medium" Text="PO Date : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_custPNo" runat="server" Font-Size="Medium" Text="Custodian Personal No. : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_custName" runat="server" Font-Size="Medium" Text="Custodian Name : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                    <asp:Label ID="lbl_poDate" runat="server" Font-Bold="true" ForeColor="Black" Font-Size="Medium"
                                        Visible="false"
                                        Text="PO Date : "></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_dept" runat="server" Font-Size="Medium" Text="Department : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                    <asp:Label ID="lbl_no_recs" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                                        Visible="false"
                                        Text="*No Record Available"></asp:Label></td>
                            </tr>

                            <tr>
                                <td class="auto-style1">



                                    <asp:GridView ID="grid_display" runat="server" AutoGenerateColumns="false"
                                        EditRowStyle-HorizontalAlign="Center" CellPadding="4" Visible="false"
                                        ForeColor="#333333" GridLines="None" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" />
                                        <Columns>
                                            <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                                            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
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
                                <td align="right">AMC Party :
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:DropDownList ID="drp_amcParty" runat="server" ToolTip="Select AMC Party's Name" Width="230px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      AMC Start Date :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_amcStart" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender7" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_amcStart"></asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_amcStart" ErrorMessage="*Select Starting Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      AMC End Date :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_amcEnd" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_amcEnd"></asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_amcEnd" ErrorMessage="*Select Ending Date" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                    <asp:Button ID="btn_reg" runat="server" Text="Register" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_reg_Click" />
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
