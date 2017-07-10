<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Spare_Entry.aspx.cs" Inherits="assetManagement.Spare_Entry" %>
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

                <ContentTemplate>
                    <fieldset>
                        <legend>Spare Parts Registration</legend>
                        <table>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Item Type :</font>
                                </td>

                                <td>
                                    <asp:DropDownList ID="Drp_1" runat="server" DataTextField="Content" DataValueField="ID" Height="21px" Width="250px">
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Make :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_make" runat="server" ToolTip=" Make " Width="250px" Height="16px" style="margin-right: 0px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Model :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_model" runat="server" ToolTip=" Model " Width="250px" Height="20px"></asp:TextBox>
                                </td>
                            </tr>
                            <asp:FilteredTextBoxExtender ID="TextBox1_FilteredTextBoxExtender" runat="server"
Enabled="True" TargetControlID="txt_quantity" FilterType="Numbers">
</asp:FilteredTextBoxExtender>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Quantity :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_quantity" runat="server" ToolTip=" Model " Width="250px" Height="21px" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Entry Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="250px" ID="txt_entryDate" runat="server" Height="22px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_entryDate"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Gate Pass No. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_gate_pass_no" runat="server" ToolTip=" Gate Pass No. " Width="250px" Height="21px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Gate Pass Registration No. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_gate_pass_reg_no" runat="server" ToolTip=" Gate Pass Rwgistration No. " Width="250px" Height="24px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btn_reg" runat="server" Text="Register" Font-Bold="True" ForeColor="Black" OnClick="btn_reg_Click" BackColor="LightSteelBlue" />
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lbl_error" runat="server" Text="" Font-Bold="true" Font-Size="Large" Visible="false">
                        </asp:Label>
                    </fieldset>
                </ContentTemplate>
        </div>
        <div align="left">
    </div>
    </div>
</asp:Content>