<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printer.aspx.cs" Inherits="assetManagement.Print.printer" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 230px;
        }
        .auto-style4 {
            width: 85px;
        }
        .auto-style7 {
            width: 87px;
        }
        .auto-style8 {
            width: 68px;
        }
        .auto-style9 {
            width: 81px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="Image1" runat="server" align="center" ImageAlign="Middle" ImageUrl="~/Images/nalcologo.gif" Height="49px" style="margin-left: 0px" Width="309px"/>
        <br />
        <br />
        <font size="5em"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NATIONAL ALUMINIUM COMPANY</strong></font>
        <font size="4em"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;UNIT:1200</strong></font>
        <br />
        <font size="4em"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SYSTEMS DEPARTMENT</strong></font>
        <br />
        <br />
        <font size="4em"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PREVENTIVE MAINTENANCE OF EQUIPMENT:&nbsp;&nbsp;&nbsp;&nbsp; PRINTER</strong></font><div align="center">

            <table border="1">
                <tr>
                    <td />
                    <td class="auto-style1" />
                    <td />
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lbl_amcparty" runat="server" Text="AMC Party" align="right" />
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="txt_amcparty" runat="server" align="left" Enabled="false" />
                    </td>
                    <td class="auto-style15">
                        <asp:Label ID="lbl_dept" runat="server" Text="Department" />
                    </td>
                    <td class="auto-style21">
                        <asp:Label ID="txt_dept" runat="server" Enabled="false"></asp:Label>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lbl_astCode" runat="server" Text="Asset Code" align="right" />
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="txt_astCode" runat="server" align="left" />
                    </td>

                    <td class="auto-style15">
                        <asp:Label ID="lbl_scheduledDate" runat="server" Text="Scheduled Date" align="right" />
                    </td>
                    <td class="auto-style21">
                        <asp:Label Width="117px" ID="txt_scheduledDate" runat="server" Enabled="false"></asp:Label>


                    </td>
                    <td class="auto-style17">
                        <asp:Label ID="lbl_prevDate" runat="server" Text="Previous PM Date" align="right" />
                    </td>
                    <td class="auto-style17">
                        <asp:Label ID="txt_prevDate" runat="server" Enabled="false"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">
                        <asp:Label ID="lbl_type" runat="server" Text="Category" align="right" />
                        <td class="auto-style1" />
                        <asp:Label ID="txt_category" runat="server" align="left" Enabled="False" />
                        <td>
                            &nbsp;</td>
                        <td class="auto-style26">

                            &nbsp;</td>
                        <td class="auto-style18">

                            <asp:Label ID="lbl_actDate" runat="server" Text="Actual Date" align="right" />
                        </td>
                        <td class="auto-style18">
                            <asp:Label ID="txt_actDate" runat="server" Style="margin-left: 0px"></asp:Label>

                        </td>
                        <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style24">
                        <asp:Label ID="lbl_custodian" runat="server" Text="Custodian Name" align="right" />
                        <td class="auto-style1" />
                        <asp:Label ID="txt_name" runat="server" align="left" Enabled="False" />
                        <td>
                            <asp:Label ID="lbl_pno" runat="server" Text="Personal No." align="right" />
                        </td>
                        <td class="auto-style26">

                            <asp:Label ID="txt_pno" runat="server" align="left" Enabled="false" />
                        </td>
                        <td />
                        <td />
                </tr>

                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lbl_make" runat="server" Text="Make" align="right" />
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="txt_make" runat="server" align="left" Enabled="false" />
                    </td>

                    <td class="auto-style15">
                        <asp:Label ID="lbl_model" runat="server" Text="Model" align="right" />
                    </td>
                    <td class="auto-style21">
                        <asp:Label ID="txt_model" runat="server" Enabled="false"></asp:Label>


                    </td>
                    <td class="auto-style17">
                        <asp:Label ID="lbl_sno" runat="server" Text="S. No." align="right" />
                    </td>
                    <td class="auto-style17">
                        <asp:Label ID="txt_sno" runat="server" Enabled="false"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lbl_desc" runat="server" Text="Description" align="right" />
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="txt_desc" runat="server" align="left" Enabled="false" />
                    </td>
                </tr>
                
            </table>

        </div>
    <p>
        <strong>PREVENTIVE MAINTENANCE ACTIVITIES</strong>
    </p>
    <table align="center"   border="1">
        <tr>
            <td class="auto-style4">Printer Cleaning</td>
            <td class="auto-style4">&nbsp;Shaft Oiling</td>
            <td class="auto-style4">Head Cleaning</td>
            
            <td class="auto-style4">Line Volt</td>
            <td class="auto-style4">E to N</td>
            <td class="auto-style4">Generating Self&nbsp; Test Report</td>
            <td class="auto-style4">Self Test Report Check</td>
            
            <td class="auto-style4">Connectivity Checking</td>
            
            



        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="txt_clean" runat="server" align="center" Enabled="False" Width="60px" />
            </td>
            <td align="center">
                <asp:Label ID="txt_oil" runat="server" align="center" Enabled="False" Width="60px" />
            </td>
            <td align="center">
                <asp:Label ID="txt_head" runat="server" align="center" Enabled="False" Width="60px" />
            </td>
            
                <asp:Label ID="txt_volt" runat="server" align="center" Enabled="false" Width="60px"/>
            </td>
            <td align="center">
                <asp:Label ID="txt_line" runat="server" align="center" Enabled="False" Width="60px" />
            </td>
            <td align="center" class="auto-style7">
                <asp:Label ID="txt_en" runat="server" align="center" Enabled="False" Width="60px" />
            </td>
            <td align="center" class="auto-style8">
                <asp:Label ID="txt_genself" runat="server" align="center" Enabled="False" Width="60px"/>
            </td>
                <td align="center">
                <asp:Label ID="txt_selfrep" runat="server" align="center" Enabled="False" Width="60px" />
            </td>
            <td align="center" class="auto-style9">
                <asp:Label ID="txt_conn" runat="server" align="center" Enabled="false" Width="60px" Height="16px" />
                
                </td>
            
        </tr>
    </table>

    <p>
        Post PM Functionality Check
        <asp:Label ID="txt_post" runat="server" align="center" Enabled="false" Width="60px"/>
    </p>
        <p>
            Engineer Remark
            <asp:Label ID="txt_rem" runat="server" align="center" Enabled="false" Width="200px"/>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            (Sign of F.E.)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Sign of User)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            (Sign of System Dept)</p>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>


</body>
</html>
