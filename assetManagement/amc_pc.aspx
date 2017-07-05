<%@ Page Title="" Language="C#" MasterPageFile="~/Amc.Master" AutoEventWireup="true" CodeBehind="amc_pc.aspx.cs" Inherits="assetManagement.amc_pc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%@ Register
        Assembly="AjaxControlToolkit"
        Namespace="AjaxControlToolkit"
        TagPrefix="asp" %>


    <style type="text/css">
        .auto-style1 {
            width: 152px;
        }

        .auto-style4 {
            width: 304px;
        }

        .auto-style5 {
            width: 30px;
        }

        .auto-style6 {
            width: 205px;
        }
        .auto-style7 {
            width: 93px;
        }
        .auto-style8 {
            width: 247px;
        }
        .auto-style9 {
            width: 64px;
        }
        .auto-style10 {
            width: 267px;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <h1 align="center" aria-setsize="80"><strong>PC/LAPTOP</strong></h1>
    </div>
    <table>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lbl_astCode" runat="server" Text="Asset Code" align="right" />
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txt_astCode" runat="server" align="left" />
            </td>

            <td>
                <asp:Label ID="lbl_actDate" runat="server" Text="Actual Date" align="right" />
                <asp:TextBox Width="230px" ID="txt_actDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_actDate"></asp:CalendarExtender>

            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lbl_ip" runat="server" Text="IP Address" align="right" />
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="txt_ip" runat="server" align="left" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

    <div>
        <h3 align="left"><strong>PM Activities</strong></h3>
    </div>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="DVD/FDD Cleaning" align="right" />
                <asp:RadioButtonList ID="RadioButtonList0" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style4">
                <asp:Label ID="Label2" runat="server" Text="Mouse Checking and Cleaning" align="right" />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Monitor Checking and Cleaning" align="right" />
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style1">t</td>
            <td class="auto-style4">
                <asp:Label ID="Label4" runat="server" Text="Keyboard Checking and Cleaning" align="right" />
                <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <h3 align="left"><strong>System General Health Cleaning</strong></h3>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="H.D.D." align="right" />
                <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label6" runat="server" Text="O.S." align="right" />
                <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>

            <td class="auto-style4">
                <asp:Label ID="Label7" runat="server" Text="Virus" align="right" />
                <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>

            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label8" runat="server" Text="Connectivity" align="right" />
                <asp:RadioButtonList ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>

    <div>
        <h2 align="left"><strong>Power Supply Checking</strong></h2>
    </div>
    <table>
        <tr>
            <td class="auto-style9">
                <asp:Label ID="Label9" runat="server" Text="Line Volt" align="right" />
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="TextBox1" runat="server" align="left" />
            </td>

            <td>
                <asp:Label ID="Label10" runat="server" Text="E to N" align="right" />
                <asp:TextBox ID="TextBox2" runat="server" align="left" />

            </td>
        </tr>
    </table>

    <div>
        <h2 align="left"><strong>Security Checking</strong></h2>
    </div>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="A.D. Member" align="right" />
                <asp:RadioButtonList ID="RadioButtonList8" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label13" runat="server" Text="Power-ON Password" align="right" />
                <asp:RadioButtonList ID="RadioButtonList9" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>

            <td class="auto-style4">
                <asp:Label ID="Label14" runat="server" Text="Post Functionality Check" align="right" />
                <asp:RadioButtonList ID="RadioButtonList10" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y"  />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Engineer's Remarks" align="right" />
                <asp:TextBox ID="TextBox4" runat="server" align="left" />

            </td>
        </tr>
        <tr>
            <td/>
            <td>
                <asp:Button ID="btn_sub" Text="Submit" OnClick="btn_sub_Click" runat="server" align="right" Height="38px" Width="91px" />
            </td>
        </tr>
    </table>
</asp:Content>
