<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="pm_rel.aspx.cs" Inherits="assetManagement.pm_rel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        <table align="center">
            <tr>
                <td>
                    <asp:Label ID="lbl_amcparty" runat="server" Text="AMC Party" align="right"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_amcparty" runat="server" Text="HITACHI" Enabled="false" align="left"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_startDate" runat="server" Text="Start Date" align="right"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_start" runat="server" Text="2017-01-01" Enabled="false" align="left"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_endDate" runat="server" Text="End Date" align="right"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_endDate" runat="server" Text="2019-12-31" Enabled="false" align="left"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_quarter" runat="server" Text="Select Quarter" align="right"></asp:Label>

                </td>
                <td>
                    <asp:DropDownList ID="drp_quart" align="left" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td />
                <td />

            </tr>
            <tr>
                <td />
                <td>
                    <asp:Button ID="btn_lock" runat="server" Text="Lock" align="right" OnClick="btn_lock_Click" />
                    <asp:Button ID="btn_release" runat="server" Text="Release" align="right" OnClick="btn_release_Click" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lbl_no_recs" runat="server" align="center" ForeColor="Red" Height="43px" Width="164px" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Larger" />
    </div>
    <div align="center">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lbl_1" runat="server" Text="Assets Pending:" Visible="false" align="right"/>
                </td>
                <td>
                    <asp:Label ID="l1" runat="server" Visible="false" align="right"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_2" runat="server" Text="Assets Completed:" Visible="false" align="right"/>
                </td>
                <td>
                    <asp:Label ID="l2" runat="server" Visible="false" align="right"/>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
