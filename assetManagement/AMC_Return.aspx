<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="AMC_Return.aspx.cs" Inherits="assetManagement.AMC_Return" %>

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
                        <legend>AMC Return</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right">Return By :
                                </td>
                                <td align="left">
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
                                <td align="left">
                                    <asp:TextBox ID="txt_po_no" runat="server" ToolTip="Enter PO No." Width="230px"></asp:TextBox>
                                    <asp:TextBox ID="txt_assetCode" runat="server" ToolTip="Enter Asset Code" Width="230px" Visible="false"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_po_no" ErrorMessage="*Enter PO No." ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_assetCode" ErrorMessage="*Enter Asset Code" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">AMC Party :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_amcParty" runat="server" ToolTip="Enter AMC Party's Name" Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      AMC End Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_amcEnd" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_amcEnd">
                                    </asp:CalendarExtender>
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
                                <td align="center">
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
