<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="AMC_Create.aspx.cs" Inherits="assetManagement.AMC_Create" %>
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
                        <legend>Create AMC</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em"> AMC Party :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_amcParty" runat="server" ToolTip="Select Section" Width="230px" DataValueField="vendorCode" DataTextField="vendorName">

                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      From Date :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_fromDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender7" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_fromDate"></asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_fromDate" ErrorMessage="*Select Ending Date" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      To Date :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_toDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_toDate"></asp:CalendarExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_toDate" ErrorMessage="*Select Ending Date" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                <td align =" "center">
                                    <asp:Button ID="btn_reg" runat="server" Text="Register" Font-Bold="True" ForeColor="Black"  BackColor="LightSteelBlue" OnClick="btn_reg_Click"/>
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
