<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="AMC_Change.aspx.cs" Inherits="assetManagement.AMC_Change" %>
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
                        <legend>Change AMC Party/Duration</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            
                            <tr>
                                <td align="right">
                                    <font size="2em"> Current AMC Party :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_oldAmcParty" runat="server" ToolTip="Select AMC Party's Name" Width="230px" AutoPostBack="true" OnSelectedIndexChanged="drp_oldAmcParty_SelectedIndexChanged">

                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em"> New AMC Party :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_newAmcParty" runat="server" ToolTip="Select AMC Party's Name" Width="230px" AutoPostBack="true" OnSelectedIndexChanged="drp_newAmcParty_SelectedIndexChanged">

                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      AMC Start Date :</font>
                                </td>
                                <td align="left">
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_amcEnd" ErrorMessage="*Select Endiing Date" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                    <asp:Button ID="btn_reg" runat="server" Text="Change" Font-Bold="True" ForeColor="Black"  BackColor="LightSteelBlue" OnClick="btn_reg_Click"/>
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
