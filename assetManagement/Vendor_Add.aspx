<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Vendor_Add.aspx.cs" Inherits="assetManagement.Vendor_Add" %>

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
                        <legend>Register Vendor</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>

                            <tr>
                                <td align="right">SAP Vendor Code :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_sap_vendorCode" runat="server" ToolTip="Enter SAP Vendor Code" Width="230px" AutoPostBack="true" OnTextChanged="txt_sap_vendorCode_TextChanged"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lbl_sap_vendorCode" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_sap_vendorCode" ErrorMessage="*Enter SAP Vendor Code" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">Vendor Code :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_vendorCode" runat="server" ToolTip="Enter Vendor Code" Width="230px" AutoPostBack="true" OnTextChanged="txt_vendorCode_TextChanged"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lbl_vendorCode" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_vendorCode" ErrorMessage="*Enter Vendor Code" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Vendor Name :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_vendorName" runat="server" ToolTip="Enter Vendor Name" Width="230px" AutoPostBack="true" OnTextChanged="txt_vendorName_TextChanged"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lbl_vendorName" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_vendorName" ErrorMessage="*Enter Vendor Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Vendor Description :
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_vendorDesc" runat="server" ToolTip="Enter Vendor Description" Width="230px"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_vendorDesc" ErrorMessage="*Enter Vendor Description" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_date" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender7" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_date"></asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_date" ErrorMessage="*Select Date" ForeColor="Red"></asp:RequiredFieldValidator>
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
