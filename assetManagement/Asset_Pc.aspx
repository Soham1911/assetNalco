<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Asset_Pc.aspx.cs" Inherits="assetManagement.Asset_Pc" %>

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
                        <legend>PC/Laptop Registration</legend>

                        <table>
                            <tr>
                                <td align="right">
                                    <font size="2em"> Unit Code :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_unitCode" runat="server" ToolTip="Unit Code" Width="230px"></asp:TextBox>
                                </td>


                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">       Asset Code :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_astCode" runat="server" ToolTip=" Asset Code " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">       Description :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_desc" runat="server" ToolTip=" Description " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Make :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_make" runat="server" ToolTip=" Make " Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em">      Model :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_model" runat="server" ToolTip=" Model " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Category :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_categ" runat="server" ToolTip=" Category " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Serial no. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_s_no" runat="server" ToolTip=" Serial no. " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Part no. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_part_no" runat="server" ToolTip=" Part No. " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Custodian :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_cust" runat="server" ToolTip=" Custodian " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Issue Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_issueDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_issueDate"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Department :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_dept" runat="server" ToolTip=" Department " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Location :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_location" runat="server" ToolTip=" Location " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Sub-Location :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_subLocation" runat="server" ToolTip=" Sub-Location " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Monitor Size :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_monSize" runat="server" ToolTip=" Monitor Size " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Monitor Resolution :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_monRes" runat="server" ToolTip=" Monitor Resolution " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Operating System :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_os" runat="server" ToolTip=" Operating System " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Processor :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_processor" runat="server" ToolTip=" Processor " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      RAM :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_ram" runat="server" ToolTip=" RAM " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Hard Disk Drive :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_hdd" runat="server" ToolTip=" Hard Disk Drive " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      SMPS :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_smps" runat="server" ToolTip=" SMPS " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Graphic Card :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_graphics" runat="server" ToolTip=" Graphic Card " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      IP Address :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_ip" runat="server" ToolTip=" IP Address " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Webcam :</font>
                                </td>
                                <td align="left">
                                    <asp:RadioButtonList ID="yn" runat="server" RepeatDirection="Horizontal"
                                        RepeatLayout="Table" TextAlign="Right" Font-Bold="True" ForeColor="#18562b">
                                        <asp:ListItem Text="Yes" Value="Yes" Selected="True" />
                                        <asp:ListItem Text="No" Value="No" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      PO no. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_po_no" runat="server" ToolTip=" PO number " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      PO Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_poDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_poDate"></asp:CalendarExtender>
                                </td>
                            </tr>


                            <tr>
                                <td align="right">
                                    <font size="2em">      PO Price :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_poPrice" runat="server" ToolTip=" PO Price " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Vendor Code :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_vendorCode" runat="server" ToolTip=" Vendor Code " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Installation Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_installDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender3" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_installDate"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      AMC Party :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_amcParty" runat="server" ToolTip=" AMC Party " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      AMC Start Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_amcStart" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender4" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_amcStart"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      AMC End Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_amcEnd" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender5" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_amcEnd"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Warranty Start Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_warStart" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender6" runat="server"
                                        Enabled="True" Format="dd/MM/yyyy" TargetControlID="txt_warStart"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Warranty End Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_warEnd" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender7" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_warEnd"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Gatepass Registration no. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_gatePReg_no" runat="server" ToolTip=" Gatepass Registration no. " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Gatepass no. :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_gateP_no" runat="server" ToolTip=" Gatepass no. " Width="230px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Gatepass Registration Date :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox Width="230px" ID="txt_gatePDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender8" runat="server"
                                        Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_gatePDate"></asp:CalendarExtender>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em">      Remarks :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_remarks" runat="server" ToolTip=" Remarks " Width="230px"></asp:TextBox>
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
                                    <asp:Button ID="btn_reg" runat="server" Text="Register" Font-Bold="True" ForeColor="#383E78" OnClick="btn_reg_Click" />
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
