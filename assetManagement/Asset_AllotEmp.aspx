<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Asset_AllotEmp.aspx.cs" Inherits="assetManagement.Asset_Allot" %>

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
                        <legend>Asset Allotment</legend>

                        <table>
                           
                            <tr>
                                <td align="right" >
                                    <font size="2em"> Asset Code :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_astCode" runat="server" ToolTip="Asset Code" Width="230px" AutoPostBack="true" OnTextChanged="txt_astCode_TextChanged"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_astCode" runat="server" Text="*Invalid asset code" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td align="right"  colspan="3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_astCode" ErrorMessage="*Enter asset code" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>

                            </tr>
                             <tr>
                                <td colspan="3" align="center">
                                    <asp:Label ID="lbl_alreadyAllotted" runat="server" Text="! WARNING : ASSET IS ALREADY ALLOTTED TO " Font-Bold="true" Font-Size="Large" Visible="false" Style="font-size: small" ForeColor="#ff3300"></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td rowspan="5">
                                    <asp:Image ID="img_old" runat="server"  Visible="false" Width="100px" />
                                </td>
                                <td colspan="2" style="text-align: left">
                                   <asp:Label ID="lbl_oldName" runat="server" Font-Size="Medium" Text="Name : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2"  style="text-align: left">
                                    <asp:Label ID="lbl_oldDept" runat="server" Font-Size="Medium" Text="Department : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"  style="text-align: left">
                                    <asp:Label ID="lbl_oldLoc" runat="server" Font-Size="Medium" Text="Location : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"  style="text-align: left">
                                    <asp:Label ID="lbl_oldContact" runat="server" Font-Size="Medium" Text="Contact No. : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">       Custodian Personal No. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_custPNO" runat="server" ToolTip=" Custodian Personal No. " Width="230px" AutoPostBack="true" OnTextChanged="txt_custPNO_TextChanged"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_custPNO" runat="server" Text="*Invalid Personal No." Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td align="right"  colspan="3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_custPNO" ErrorMessage="*Enter personal no." ForeColor="Red"></asp:RequiredFieldValidator>
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
                                    <asp:Label ID="lbl_dept" runat="server" Font-Size="Medium" Text="Department : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
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
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">       Issue Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_date" runat="server" AutoPostBack="true" OnTextChanged="txt_date_TextChanged"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_date"></asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_date" ErrorMessage="*Enter Issue Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>



                            <tr>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btn_reg" runat="server" Text="Allot" Font-Bold="True" ForeColor="Black" OnClick="btn_reg_Click" BackColor="LightSteelBlue" />
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
