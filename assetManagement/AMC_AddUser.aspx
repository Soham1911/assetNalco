<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="AMC_AddUser.aspx.cs" Inherits="assetManagement.AMC_AddUser" %>
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
                        <legend>Register AMC User</legend>

                        <table>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> User ID :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_uid" runat="server" ToolTip="User ID" Width="230px" AutoPostBack="true" OnTextChanged="txt_uid_TextChanged"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Label ID="lbl_uid" runat="server" Text="*Already registered" Font-Size="Medium" Visible="false" Style="font-size: small" ForeColor="Red"></asp:Label>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_uid" ErrorMessage="*Enter User ID" ForeColor="Red" ></asp:RequiredFieldValidator>
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
                                    <font size="2em" style="font-weight: 700"> Password :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_pwd" runat="server" ToolTip="Password" Width="230px" ></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_pwd" ErrorMessage="*Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                             <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Designation :</font>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txt_designation" runat="server" ToolTip="Designation" Width="230px" ></asp:TextBox>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right">
                                    <font size="2em" style="font-weight: 700"> Company :</font>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="drp_amcParty" runat="server" ToolTip="Select AMC Party's Name" Width="230px">

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
