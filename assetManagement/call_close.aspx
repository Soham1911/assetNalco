<%@ Page Title="" Language="C#" MasterPageFile="~/Systems.Master" AutoEventWireup="true" CodeBehind="call_close.aspx.cs" Inherits="assetManagement.call_close" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div align="center">
        <div class="page" align="center">

            <div class="main">
                <asp:ScriptManager runat="server" ></asp:ScriptManager>


                <br />
                <br />
                <div align="left">


                    <div style="width: 100%">



                        <br />
                        <div style="overflow-y: scroll">


                            <asp:GridView ID="grid_display" runat="server" OnRowDataBound="GridView1_RowDataBound"
                                AutoGenerateColumns="False" Width="100%"
                                Font-Size="1.11em" PageSize="7"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" HorizontalAlign="Left" style="margin-bottom: 0px">
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                                    HorizontalAlign="Left" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>

                                     <asp:BoundField DataField="call_id" HeaderText="Call ID"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Call ID" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left" ></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_no" HeaderText="Personal No."
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Personal No." HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ImageUrl='<%# Eval("url") %>' ID="id" Width="30" Height="30" onmouseout="this.style.width='30px';this.style.height='30px';" onmouseover="this.style.width='200px';this.style.height='200px';" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="name" HeaderText="Name"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Name" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="deptName" HeaderText="Department Name"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Department Name" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="location" HeaderText="Location"
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Location" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="contact_no" HeaderText="Mobile No."
                                        ItemStyle-HorizontalAlign="Left" SortExpression="Mobile No." HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="userDescription" HeaderText="Call Detail"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Call Detail" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="openingDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="Date of Opening"
                                        ItemStyle-HorizontalAlign="Center" SortExpression="Date of Opening" HeaderStyle-HorizontalAlign="Left">
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </asp:BoundField>

                                   <asp:TemplateField HeaderText="Attended By">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_attendedby" runat="server" Visible="True" />
                                            <asp:DropDownList ID="attendedBy" runat="server" AppendDataBoundItems="True" AutoPostBack="false" DataTextField="name" DataValueField="user_id" Height="16px">
                                                 <asp:ListItem Value="0">-- Select Name--</asp:ListItem>
                                            </asp:DropDownList>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="Enter Name" ControlToValidate="attendedby" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date of Closing">
                                    <ItemTemplate>
                                        <asp:TextBox Width="100px" ID="txt_cdate" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                            Enabled="True" Format="yyyy/MM/dd" TargetControlID="txt_cdate"></asp:CalendarExtender>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Date" ControlToValidate="txt_cdate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="Change Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_status" runat="server" Visible="True"/>
                                        <asp:DropDownList ID="callStat" runat="server">
                                            <asp:ListItem Value="o" Text="o" />
                                            <asp:ListItem Value="d">d</asp:ListItem>
                                            <asp:ListItem Value="c">c</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  
                                 <asp:TemplateField HeaderText="Remarks">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_remark" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                


                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </div>
                    </div>

                </div>



                       <asp:Label ID="lbl_no_recs" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Medium"
                            Visible="false"
                            Text="No Record available"></asp:Label>



                <br />
                <br />

            </div>
            <br />
            <asp:Button ID="btn_callop" runat="server" Text="Save Changes" Font-Bold="True" ForeColor="#383E78" OnClick="btn_save_Click" />
            <br />
            <br />
            <br />
            <asp:Label ID="lbl_error" runat="server" Text="Success" ForeColor="Green" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>
        </div>

    </div>




</asp:Content>

