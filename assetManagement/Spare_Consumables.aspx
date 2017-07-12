<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Spare_Consumables.aspx.cs" Inherits="assetManagement.Spare_Consumables" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 249px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 60%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <contenttemplate>
                    <fieldset>
                        <legend>Spare Parts Allotment</legend>
                        <table>
                            <tr>
                                <td align="right" class="auto-style1">
                                    <font size="2em">      Asset Code :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_astCode" runat="server" ToolTip=" Make " Width="250px" Height="20px" AutoPostBack="true"  OnTextChanged="txt_astCode_TextChanged" style="margin-right: 0px"></asp:TextBox>
                                </td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_astCode" ErrorMessage="*Enter Asset Code   " ForeColor="Red"></asp:RequiredFieldValidator>
                                <td>
                                    <asp:Label ID="lbl_astCode" runat="server" Text="*Invalid asset code" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td rowspan="4">
                                    <asp:Image ID="img_p" runat="server"  Visible="false" Width="150px" />
                                </td>
                                <td colspan="2" style="text-align: left">
                                   <asp:Label ID="lbl_name" runat="server" Font-Size="Medium" Text="Name : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_location" runat="server" Font-Size="Medium" Text="Location : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_model" runat="server" Font-Size="Medium" Text="Model : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: left">
                                    <asp:Label ID="lbl_desc" runat="server" Font-Size="Medium" Text="Description : " Visible="false" Style="font-size: small; font-weight: 700;" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="right" class="auto-style1">
                                    <font size="2em">      Item Type :</font>
                                </td>

                                <td>
                                    <asp:DropDownList ID="Drp_1" runat="server" AppendDataBoundItems="true"  AutoPostBack="true"  OnSelectedIndexChanged="SelectChanged" DataTextField="description" DataValueField="ID" Height="20px" Width="250px" style="margin-left: 0px">
                                    <asp:ListItem>-- pick one --</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td align="right" class="auto-style1">
                                    <font size="2em">      Select Item  :</font>
                                </td>

                                <td>
                                    <asp:DropDownList ID="Drp_2" runat="server" AppendDataBoundItems="true" DataTextField="Desc" DataValueField="model" Height="20px" Width="250px">
                                        
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <asp:FilteredTextBoxExtender ID="TextBox1_FilteredTextBoxExtender" runat="server" Enabled="True" TargetControlID="txt_quantity" FilterType="Numbers"> 
                            </asp:FilteredTextBoxExtender>
                            <tr>
                                <td align="right" class="auto-style1">
                                    <font size="2em">      Quantity :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_quantity" runat="server" ToolTip=" Model " Width="250px" Height="20px" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:TextBox>
                                </td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_quantity" ErrorMessage="*Enter Quantity   " ForeColor="Red"></asp:RequiredFieldValidator>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Date of Allotment :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="250px" ID="txt_installationDate" runat="server" Height="22px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_installationDate"></asp:CalendarExtender>
                                </td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_installationDate" ErrorMessage="*Select Date   " ForeColor="Red"></asp:RequiredFieldValidator>
                            </tr>
                            <tr>
                                <td align="right" class="auto-style1">
                                    <font size="2em">      AMC Guy Assigned :</font>
                                </td>

                                <td>
                                    <asp:DropDownList ID="Drp_3" runat="server" DataTextField="name" DataValueField="user_id" Height="20px" Width="250px" style="margin-left: 0px">
                                    </asp:DropDownList>
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
                </contenttemplate>
        </div>
        <div align="left">
        </div>
    </div>
</asp:Content>