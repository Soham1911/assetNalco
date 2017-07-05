<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Vendor_Remove.aspx.cs" Inherits="assetManagement.Vendor_Remove" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 344px;
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
                        <legend>Vendor Remove</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right">Vendor :
                                </td>
                                <td align="left" class="auto-style1">
                                    <asp:DropDownList ID="drp_ven" runat="server" Width="230px" DataValueField="vendorCode" DataTextField="vendorName">
                                    </asp:DropDownList>
                                </td>

                            </tr>
                           <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="left" class="auto-style1">
                                    <asp:Button ID="btn_rem" runat="server" Text="Remove" Font-Bold="True" ForeColor="Black" BackColor="LightSteelBlue" OnClick="btn_rem_Click"/>
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
