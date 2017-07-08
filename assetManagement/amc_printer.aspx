<%@ Page Title="" Language="C#" MasterPageFile="~/Amc.Master" AutoEventWireup="true" CodeBehind="amc_printer.aspx.cs" Inherits="assetManagement.amc_prsc" %>

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

        .auto-style6 {
            width: 205px;
        }

        .auto-style14 {
            height: 34px;
            width: 240px;
        }

        .auto-style15 {
            height: 34px;
            width: 151px;
        }

        .auto-style17 {
            height: 34px;
            width: 132px;
        }

        .auto-style18 {
            width: 132px;
            height: 26px;
        }

        .auto-style21 {
            height: 34px;
            width: 174px;
        }

        .auto-style23 {
            width: 240px;
        }

        .auto-style24 {
            width: 97px;
        }

        .auto-style25 {
            height: 34px;
            width: 97px;
        }

        .auto-style26 {
            width: 174px;
        }

        .auto-style30 {
            width: 126px;
            height: 42px;
        }
        .auto-style31 {
            width: 208px;
            height: 42px;
        }
        .auto-style32 {
            width: 273px;
            height: 42px;
        }
        .auto-style34 {
            width: 97px;
            height: 26px;
        }
        .auto-style35 {
            width: 240px;
            height: 26px;
        }
        .auto-style36 {
            height: 26px;
        }
        .auto-style37 {
            width: 174px;
            height: 26px;
        }
        .auto-style38 {
            width: 183px;
        }
        </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div>
        <font size="6em" color="indigo"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PRINTER</strong></font></div>
    <table>
        <tr>
            <td />
            <td />
            <td />
        </tr>
        <tr>
            <td class="auto-style25">
                <asp:Label ID="lbl_amcparty" runat="server" Text="AMC Party" align="right" />
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txt_amcparty" runat="server" align="left" Enabled="false" />
            </td>
            <td class="auto-style15">
                <asp:Label ID="lbl_dept" runat="server" Text="Department" align="right" />
            </td>
            <td class="auto-style21">
                <asp:TextBox ID="txt_dept" runat="server" Enabled="false"></asp:TextBox>
        </tr>
        <tr>
            <td class="auto-style25">
                <asp:Label ID="lbl_astCode" runat="server" Text="Asset Code" align="right" />
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txt_astCode" runat="server" align="left" />
            </td>

            <td class="auto-style15">
                <asp:Label ID="lbl_scheduledDate" runat="server" Text="Scheduled Date" align="right" />
            </td>
            <td class="auto-style21">
                <asp:TextBox Width="117px" ID="txt_scheduledDate" runat="server" Enabled="false"></asp:TextBox>


            </td>
            <td class="auto-style17">
                <asp:Label ID="lbl_prevDate" runat="server" Text="Previous PM Date" align="right" />
            </td>
            <td class="auto-style17">
                <asp:TextBox ID="txt_prevDate" runat="server" Enabled="false"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td class="auto-style34">
                <asp:Label ID="lbl_category" runat="server" Text="Category" align="right" />
            <td class="auto-style35" />
            <asp:TextBox ID="txt_category" runat="server" align="left" Enabled="false" />
            <td class="auto-style36">
                &nbsp;</td>
            <td class="auto-style37">

                &nbsp;</td>
            <td class="auto-style18">

                <asp:Label ID="lbl_actDate" runat="server" Text="Actual Date" align="right" />
            </td>
            <td class="auto-style18">
                <asp:TextBox ID="txt_actDate" runat="server" Style="margin-left: 0px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender2" runat="server"
                    Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_actDate"></asp:CalendarExtender>
            </td>
            <td class="auto-style36"></td>

        </tr>

        <tr>
            <td class="auto-style24">
                <asp:Label ID="lbl_custodian" runat="server" Text="Custodian Name" align="right" />
            <td class="auto-style23" />
            <asp:TextBox ID="txt_name" runat="server" align="left" Enabled="false" />
            <td>
                <asp:Label ID="lbl_pno" runat="server" Text="Personal No." align="right" />
            </td>
            <td class="auto-style26">

                <asp:TextBox ID="txt_pno" runat="server" align="left" Enabled="false" />
            </td>
            <td />
            <td />
        </tr>

        <tr>
            <td class="auto-style25">
                <asp:Label ID="lbl_make" runat="server" Text="Make" align="right" />
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="txt_make" runat="server" align="left" Enabled="false" />
            </td>

            <td class="auto-style15">
                <asp:Label ID="lbl_model" runat="server" Text="Model" align="right" />
            </td>
            <td class="auto-style21">
                <asp:TextBox ID="txt_model" runat="server" Enabled="false"></asp:TextBox>


            </td>
            <td class="auto-style17">
                <asp:Label ID="lbl_sno" runat="server" Text="S. No." align="right" />
            </td>
            <td class="auto-style17">
                <asp:TextBox ID="txt_sno" runat="server" Enabled="false"></asp:TextBox>

            </td>
        </tr>

       

        <tr>
            <td class="auto-style24">
                <asp:Label ID="lbl_desc" runat="server" Text="Description" align="right" />
            <td class="auto-style23" />
            <asp:TextBox ID="txt_desc" runat="server" align="left" />
            
            <td />
            <td />
        </tr>
    </table>

    <div>
        <font size="4em" color="indigo"><strong>PM Activities</strong></font>
    </div>
    <table>
        <tr>
            <td class="auto-style38">
                <asp:Label ID="Label1" runat="server" Text="Printer Cleaning" align="right" />
                <asp:RadioButtonList ID="RadioButtonList0" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y" />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style4">
                <asp:Label ID="Label2" runat="server" Text="Printer Shaft Oiling" align="right" />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y" />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style38">
                <asp:Label ID="Label3" runat="server" Text="Printer Head Cleaning" align="right" />
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y" />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label4" runat="server" Text="Connectivity Checking" align="right" />
                <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y" />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style38">
                <asp:Label ID="Label5" runat="server" Text="Generating Self Test Report" align="right" />
                <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y" />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label6" runat="server" Text="Self Test Report Checking" align="right" />
                <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                    <asp:ListItem Text="Yes" Value="Y" />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    &nbsp;<div>
        <font size="4em" color="indigo"><strong>Power Supply Checking</strong></font>
    </div>
    <table>
        <tr>
            <td class="auto-style30">
                <asp:Label ID="Label9" runat="server" Text="Line Volt" align="right" />
            </td>
            <td class="auto-style31">
                <asp:TextBox ID="TextBox1" runat="server" align="left" />
            </td>

            <td class="auto-style32">
                <asp:Label ID="Label10" runat="server" Text="E to N" align="right" />
                <asp:TextBox ID="TextBox2" runat="server" align="left" />

            </td>
        </tr>

        


    </table>

    <div>
    </div>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="Post Functionality Check" align="right" />
            </td>
            <td class="auto-style6">
                <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b" OnSelectedIndexChanged="RadioButtonList10_SelectedIndexChanged" style="margin-left: 8px">
                    <asp:ListItem Text="Yes" Value="Y" />
                    <asp:ListItem Text="No" Value="N" Selected="True" />
                </asp:RadioButtonList>
            </td>
            <td class="auto-style4">
                &nbsp;</td>

            <td class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Engineer's Remarks" align="right" />
                <asp:TextBox ID="TextBox4" runat="server" align="left" />

            </td>
        </tr>
        <tr>
            <td />
            <td>
                <asp:Button ID="btn_sub" Text="Submit" OnClick="btn_sub_Click" runat="server" align="right" Height="38px" Width="91px" />
            </td>
        </tr>
    </table>
</asp:Content>
