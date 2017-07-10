<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="Allied_AddUser.aspx.cs" Inherits="assetManagement.Allied_AddUser" %>
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
                        <legend>Register Allied User</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Section :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_sec" runat="server" ToolTip="Select Section" Width="230px" DataValueField="sectionCode" DataTextField="sectionName">

                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> User ID :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_uname" runat="server" ToolTip="Username" Width="230px" AutoPostBack="true" OnTextChanged="txt_uname_TextChanged"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lbl_uname" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_uname" ErrorMessage="*Enter Username" ForeColor="Red" ></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Name :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_name" runat="server" ToolTip="Name" Width="230px" ></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_name" ErrorMessage="*Enter Name of User" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                          
                           
                             <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Location :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_loc" runat="server" ToolTip="Select Location" Width="230px" AutoPostBack="true" OnSelectedIndexChanged="drp_loc_SelectedIndexChanged" DataValueField="locationCode" DataTextField="locationName">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700">Sub Location :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_subLoc1" runat="server" ToolTip="Select Sub Location" Width="230px" DataValueField="subLoc1Code" DataTextField="subLoc1Name">
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Contact :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_contact" runat="server" ToolTip="Contact" Width="230px" ></asp:TextBox>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Description :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_desc" runat="server" ToolTip="Description" Width="230px" ></asp:TextBox>
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
                            </tr>
                            <tr>
                                <td></td>
                                <td align =" "center">
                                    <asp:Button ID="btn_reg" runat="server" Text="Register" Font-Bold="True" ForeColor="Black"  BackColor="LightSteelBlue" OnClick="btn_reg_Click"/>
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
