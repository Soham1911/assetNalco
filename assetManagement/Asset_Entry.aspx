<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Asset_Entry.aspx.cs" Inherits="assetManagement.Asset_Pc" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 230px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 60%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>Asset Registration</legend>


                        <table>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Category :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:DropDownList ID="drp_categ" runat="server" Width="230px" AutoPostBack="true" OnSelectedIndexChanged="drp_categ_SelectedIndexChanged">
                                        
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_astCode" ErrorMessage="*Enter asset code" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">       Asset Code :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_astCode" runat="server" ToolTip=" Asset Code " Width="230px" AutoPostBack="true" OnTextChanged="txt_astCode_TextChanged"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_astCode" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                    <asp:Label ID="lbl_astCodeLen" runat="server" Text="*Asset code must has 11 characters" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                               </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">       Description :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_desc" runat="server" ToolTip=" Description " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Make :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_make" runat="server" ToolTip=" Make " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Model :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_model" runat="server" ToolTip=" Model " Width="230px"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">
                                    <font size="2em">      Serial no. :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_s_no" runat="server" ToolTip=" Serial no. " Width="230px" AutoPostBack="true" OnTextChanged="txt_s_no_TextChanged"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_s_no" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Part no. :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_part_no" runat="server" ToolTip=" Part No. " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      PO no. :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_po_no" runat="server" ToolTip=" PO number " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      PO Date :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_poDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_poDate"></asp:CalendarExtender>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">
                                    <font size="2em">      PO Price :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_poPrice" runat="server" ToolTip=" PO Price " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Vendor Code :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_vendorCode" runat="server" ToolTip=" Vendor Code " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Installation Date :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_installDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender3" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_installDate"></asp:CalendarExtender>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">
                                    <font size="2em">      Warranty Start Date :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_warStart" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender6" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_warStart"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Warranty End Date :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_warEnd" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender7" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_warEnd"></asp:CalendarExtender>
                                </td>
                            </tr>



                            <tr>
                                <td align="right">
                                    <font size="2em">      Remarks :</font>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_remarks" runat="server" ToolTip=" Remarks " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_ip" runat="server" Text="IP Address :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_ip" runat="server" ToolTip=" IP Address " Width="230px" Text="10.20."></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_isuueDate" runat="server" Text="Issue Date :" Font-Size="small"></asp:Label>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox Width="230px" ID="txt_issueDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_issueDate"></asp:CalendarExtender>
                                </td>
                            </tr>



                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_monSize" runat="server" Text="Monitor Size :" Font-Size="small"></asp:Label>
                                    <asp:Label ID="lbl_sizeOfPaper" runat="server" Text="Size of Paper :" Font-Size="small" Visible="false"></asp:Label>

                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_monSize" runat="server" ToolTip=" Monitor Size(in inches) " Width="230px"></asp:TextBox>
                                    <asp:TextBox ID="txt_sizeOfPaper" runat="server" ToolTip=" Size of Paper " Width="230px" Visible="false"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_monRes" runat="server" Text="Monitor Resolution :" Font-Size="small"></asp:Label>
                                    <asp:Label ID="lbl_speed" runat="server" Text="Speed :" Font-Size="small" Visible="false"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:DropDownList ID="drp_monRes" runat="server" Width="230px">
                                     
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txt_speed" runat="server" ToolTip=" Speed of Printing " Width="230px" Visible="false"></asp:TextBox>
                               </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_os" runat="server" Text="Operating System :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_os" runat="server" ToolTip=" Operating System " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_sp" runat="server" Text="Service Pack :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_sp" runat="server" ToolTip=" Service Pack " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_proc" runat="server" Text="Processor :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:DropDownList ID="drp_proc" runat="server" Width="230px">
                                        <asp:ListItem Value="Intel Core i3">Intel Core i3</asp:ListItem>
                                        <asp:ListItem Value="Intel Core i5">Intel Core i5</asp:ListItem>
                                        <asp:ListItem Value="Intel Core i7">Intel Core i7</asp:ListItem>
                                        <asp:ListItem Value="Intel Platium">Intel Platium</asp:ListItem>
                                        <asp:ListItem Value="Intel Celeron">Intel Celeron</asp:ListItem>
                                        <asp:ListItem Value="Intel Itom">Intel Itom</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txt_srvProc" runat="server" ToolTip=" Server Processor " Width="230px" Visible="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_cla" runat="server" Text="Client Access No.:" Font-Size="small" Visible="false"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_cla" runat="server" ToolTip=" Client Access Number " Width="230px" TextMode="Number" Visible="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_ram" runat="server" Text="RAM (in GB) :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_ram" runat="server" ToolTip=" RAM(in GB) " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_hdd" runat="server" Text="HDD (in GB) :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_hdd" runat="server" ToolTip=" Hard Disk Drive " Width="230px"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_graphics" runat="server" Text="Graphics Card (in GB) :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_graphics" runat="server" ToolTip=" Graphic Card " Width="230px" Text="0"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_keyboardMake" runat="server" Text="Keyboard Make :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_keyboardMake" runat="server" ToolTip=" Keyboard Make " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_keyboard_s_no" runat="server" Text="Keyboard Serial No. :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_keyboard_s_no" runat="server" ToolTip=" Keyboard Serial No. " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_mouseMake" runat="server" Text="Mouse Make :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_mouseMake" runat="server" ToolTip=" Mouse Make " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_mouse_s_no" runat="server" Text="Mouse Serial No. :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_mouse_s_no" runat="server" ToolTip=" Mouse Serial No. " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_ibmNotes" runat="server" Text="IBM Notes Version :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_ibmNotes" runat="server" ToolTip=" IBM Notes Version" Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_msOffice" runat="server" Text="MS Office :" Font-Size="small"></asp:Label>
                                </td>

                                <td align="left" class="auto-style1">
                                    <asp:DropDownList ID="drp_msOffice" runat="server" Width="230px">
                                        <asp:ListItem Value="2003">2003</asp:ListItem>
                                        <asp:ListItem Value="2007">2007</asp:ListItem>
                                        <asp:ListItem Value="2010">2010</asp:ListItem>
                                        <asp:ListItem Value="2013">2013</asp:ListItem>
                                        <asp:ListItem Value="2014">2014</asp:ListItem>
                                        <asp:ListItem Value="2015">2015</asp:ListItem>
                                        <asp:ListItem Value="2016">2016</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_antiVirus" runat="server" Text="Antivirus :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:RadioButtonList ID="rdbtn_antiVirus" runat="server" RepeatDirection="Horizontal"
                                        RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                                        <asp:ListItem Text="Yes" Value="Y" />
                                        <asp:ListItem Text="No" Value="N" Selected="True" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_webcam" runat="server" Text="Webcam :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:RadioButtonList ID="rdbtn_webcam" runat="server" RepeatDirection="Horizontal"
                                        RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                                        <asp:ListItem Text="Yes" Value="Y" />
                                        <asp:ListItem Text="No" Value="N" Selected="True" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_lanStat" runat="server" Text="LAN Status :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:RadioButtonList ID="rdbtn_lanStat" runat="server" RepeatDirection="Horizontal"
                                        RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                                        <asp:ListItem Text="Yes" Value="Y" Selected="True" />
                                        <asp:ListItem Text="No" Value="N" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_domain" runat="server" Text="Domain :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_domain" runat="server" ToolTip=" Domain " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_domainUser" runat="server" Text="Domain Username :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_domainUser" runat="server" ToolTip=" Domain Username " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lbl_hostName" runat="server" Text="Host Name :" Font-Size="small"></asp:Label>
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:TextBox ID="txt_hostName" runat="server" ToolTip=" Host Name " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            



                            <tr>
                                <td></td>
                                <td class="auto-style1"></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="auto-style1" align="center">
                                    <asp:Button ID="btn_reg" runat="server" Text="Register" Font-Bold="True" ForeColor="Black" OnClick="btn_reg_Click" BackColor="LightSteelBlue" />
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
