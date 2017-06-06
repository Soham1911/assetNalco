<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Asset_Pc.aspx.cs" Inherits="assetManagement.Asset_Pc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <div style="width: 30%;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend>Enter Your Credentials</legend>
                        <table class="auto-style1">
            <tr>
                <td class="auto-style0" colspan="3">
                    <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large" Text="PC/Laptop Registration"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelast_code" runat="server" Text="Asset Code"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxast_code" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1desc" runat="server" Text="Description"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1desc" runat="server" Width="357px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelmake" runat="server" Text="Make"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxmake" runat="server" Width="358px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelmodel" runat="server" Text="Model"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxmodel" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelcateggory" runat="server" Text="Category"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxcategory" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="LabelSno" runat="server" Text="Serial No."></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxsno" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>
                    
                 </td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelmonsize" runat="server" Text="Monitor Size"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxmonsize" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style4">
                    <asp:Label ID="Labelmon_res" runat="server" Text="Monitor Resolution"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxmon_res" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td class="auto-style6"></td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelproc" runat="server" Text="Processor"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxproc" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelram" runat="server" Text="RAM"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxram" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelhdd" runat="server" Text="Hard Disk Drive"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxhdd" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelgrap_cd" runat="server" Text="Graphic Card"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxgrap_cd" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelsmps" runat="server" Text="SMPS(V)"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxsmps" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelip" runat="server" Text="IP Address"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxip" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>
                   
                 </td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelpno" runat="server" Text="Part No"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxpno" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="LabelWebcam" runat="server" Text="Webcam"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="167px">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem id="no" Selected="True">No</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelpodt" runat="server" Text="PO Date"></asp:Label>
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="TextBoxpodt" runat="server" Width="359px" TextMode="Date"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelprice" runat="server" Text="Price"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxprice" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelvendor" runat="server" Text="Vendor"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxvendor" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelwarstdt" runat="server" Text="Warranty Start Date"></asp:Label>
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="TextBoxwarstdt" runat="server" Width="359px" TextMode="Date"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelwarenddt" runat="server" Text="Warranty End Date"></asp:Label>
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="TextBoxwarenddt" runat="server" Width="359px" TextMode="Date"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelamcstdt" runat="server" Text="AMC Start Date"></asp:Label>
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="TextBoxamcstdt" runat="server" Width="359px" TextMode="Date"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelamcenddt" runat="server" Text="AMC End Date"></asp:Label>
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="TextBoxamcenddt" runat="server" Width="359px" TextMode="Date"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelinstdt" runat="server" Text="Installation Date"></asp:Label>
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="TextBoxinsdt" runat="server" Width="359px" TextMode="Date"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelamcpty" runat="server" Text="AMC Party"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxamcpty" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelcust" runat="server" Text="Custodian"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxcust" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labeldept" runat="server" Text="Department"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownListdept" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelloc" runat="server" Text="Location"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxloc" runat="server" Width="359px" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelsubloc" runat="server" Text="Sub-Location"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxsubloc" runat="server" Width="359px" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="LabelOS" runat="server" Text="OS"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxos" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelavail" runat="server" Text="Asset Availability"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:RadioButtonList ID="RadioButtonListavail" runat="server" Width="167px">
                        <asp:ListItem Selected="True">Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelrem" runat="server" Text="Remarks"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxrem" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3">
                    <asp:Label ID="Labelunit_cd" runat="server" Text="Unit Code"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBoxunit_cd" runat="server" Width="359px"></asp:TextBox>
                </td>
                <td>
                    
                 </td>
            </tr>
            <tr>
                <td class="auto-style3">
                   &nbsp;
                </td>
                <td class="auto-style2">
                   <asp:Button ID="Buttonreg" runat="server" Text="Register" OnClick="Buttonreg_Click"/>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

                        <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>

                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>


        <div align="left">
        </div>

    </div>
</asp:Content>
