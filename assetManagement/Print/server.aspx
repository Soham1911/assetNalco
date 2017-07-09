<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="server.aspx.cs" Inherits="assetManagement.Print.server" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 230px;
        }
        .auto-style2 {
            width: 101px;
        }
        .auto-style3 {
            width: 69px;
        }
        .auto-style4 {
            width: 85px;
        }
        .auto-style5 {
            width: 118px;
        }
        .auto-style6 {
            width: 84px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <font size="5em"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NATIONAL ALUMINIUM COMPANY</strong></font>
        <font size="4em"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;UNIT:1200</strong></font>
        <br />
        <font size="4em"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SYSTEMS DEPARTMENT</strong></font>
        <br />
        <br />
        <font size="4em"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PREVENTIVE MAINTENANCE OF EQUIPMENT:&nbsp;&nbsp;&nbsp;&nbsp; SERVER</strong></font>

        <div align="center">

            <table>
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
                    <td class="auto-style15" align="right">
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
                        <asp:Label ID="lbl_type" runat="server" Text="Type" align="right" />
                        <td class="auto-style1" />
                        <asp:Label ID="txt_type" runat="server" align="left" Enabled="false" />
                        <td>
                            <asp:Label ID="lbl_ip" runat="server" Text="IP Address" align="right" />
                        </td>
                        <td class="auto-style26">

                            <asp:Label ID="txt_ip" runat="server" align="left" />
                        </td>
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
                        <asp:Label ID="lbl_custodian" runat="server" Text="Custodian" align="right" />
                        <td class="auto-style1" />
                        <asp:Label ID="txt_custodian" runat="server" align="left" Enabled="false" />
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
                        <asp:Label ID="lbl_make" runat="server" Text="CPU Make" align="right" />
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="txt_make" runat="server" align="left" Enabled="false" />
                    </td>

                    <td class="auto-style15">
                        <asp:Label ID="lbl_model" runat="server" Text="CPU Model" align="right" />
                    </td>
                    <td class="auto-style21">
                        <asp:Label ID="txt_model" runat="server" Enabled="false"></asp:Label>


                    </td>
                    <td class="auto-style17">
                        <asp:Label ID="lbl_sno" runat="server" Text="CPU S. No." align="right" />
                    </td>
                    <td class="auto-style17">
                        <asp:Label ID="txt_sno" runat="server" Enabled="false"></asp:Label>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style24">
                        <asp:Label ID="lbl_mmake" runat="server" Text="Monitor Make" align="right" /></td>
                        <td class="auto-style1" />
                        <asp:Label ID="txt_mmake" runat="server" align="left" Enabled="false" />
                        <td>
                            <asp:Label ID="lbl_mmodel" runat="server" Text="Monitor Model" align="right" />
                        </td>
                        <td class="auto-style26">

                            <asp:Label ID="txt_mmodel" runat="server" align="left" Enabled="false" />
                        </td>
                        <td class="auto-style17">
                            <asp:Label ID="lbl_msno" runat="server" Text="Monitor S. No." align="right" />
                        </td>
                        <td class="auto-style17">
                            <asp:Label ID="txt_msno" runat="server" Enabled="false"></asp:Label>

                        </td>
                </tr>

                <tr>
                    <td class="auto-style24">
                        <asp:Label ID="lbl_os" runat="server" Text="O.S." align="right" /></td>

                        <td class="auto-style1" />
                        <asp:Label ID="txt_os" runat="server" align="left" />
                        <td>
                            <asp:Label ID="lbl_office" runat="server" Text="MS Office" align="right" />
                        </td>
                        <td class="auto-style26">

                            <asp:Label ID="txt_office" runat="server" align="left" />
                        </td>
                        <td />
                        <td />
                </tr>
            </table>

        </div>
    <p>
        <strong>PREVENTIVE MAINTENANCE ACTIVITIES</strong>
    </p>
    <table>
        <tr>
            <td class="auto-style4">CD/DVD Cleaning</td>
            <td class="auto-style2">Mouse Cleaning and Checking</td>
            <td class="auto-style3">Monitor Checking</td>
            <td class="auto-style5">Keyboard Cleaning and Checking</td>
            <td>Line Volt</td>
            <td>E to N</td>
            <td>HDD</td>
            <td>O.S.</td>
            <td>Anti-Virus</td>
            <td>Connectivity</td>
            <td>AD Member</td>
            <td class="auto-style6">Power ON Password</td>



        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="txt_cd" runat="server" align="center" Enabled="false" Width="60px" />
            </td>
            <td align="center">
                <asp:Label ID="txt_mouse" runat="server" align="center" Enabled="false" Width="60px" />
            </td>
            <td align="center">
                <asp:Label ID="txt_mon" runat="server" align="center" Enabled="false" Width="60px" />
            </td>
            <td align="center" class="auto-style5">
                <asp:Label ID="txt_key" runat="server" align="center" Enabled="false" Width="60px"/>
            </td>
            <td align="center">
                <asp:Label ID="txt_volt" runat="server" align="center" Enabled="false" Width="60px"/>
            </td>
            <td align="center">
                <asp:Label ID="txt_en" runat="server" align="center" Enabled="false" Width="60px" />
            </td>
            <td align="center">
                <asp:Label ID="txt_hdd" runat="server" align="center" Enabled="false" Width="60px" />
            </td>
            <td align="center">
                <asp:Label ID="txt_ops" runat="server" align="center" Enabled="false" Width="60px"/>
            </td>
            <td align="center">
                <asp:Label ID="txt_antiv" runat="server" align="center" Enabled="false" Width="60px" />
            </td>
            <td align="center">
                <asp:Label ID="txt_conn" runat="server" align="center" Enabled="false" Width="60px"/>
            </td>
            <td align="center">
                <asp:Label ID="txt_ad" runat="server" align="center" Enabled="false" Width="60px"/>
            </td>
            <td align="center" class="auto-style6">
                <asp:Label ID="txt_power" runat="server" align="center" Enabled="false" Width="60px"/>
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

