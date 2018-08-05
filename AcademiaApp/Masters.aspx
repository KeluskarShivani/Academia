<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Masters.aspx.cs" Inherits="AcademiaApp.Masters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
    <asp:RadioButton ID="rdLocation" runat="server" Text="Location" GroupName="Master" AutoPostBack="true" CssClass="tdLinkLabel" />
    <asp:RadioButton ID="rdEducation" runat="server" Text="Education" GroupName="Master" AutoPostBack="true" CssClass="tdLinkLabel" />
    <asp:RadioButton ID="rdAdmin" runat="server" Text="Add Admin" GroupName="Master" AutoPostBack="true" CssClass="tdLinkLabel" />
    <hr style="border:1px solid #d31111" />
    <div id="divLocation" runat="server" visible="false">
        <table style="width:500px;">
            <tr>
                <td style="text-align:center">
                    <asp:Button ID="btnAddnewLocation" runat="server" Text="Add Location" CssClass="buttonMedium" OnClick="btnAddnewLocation_Click" />
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:GridView ID="gridLocation" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="WhiteSmoke" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                        <Columns>
                            <asp:TemplateField HeaderText="Location">
                                <ItemTemplate>
                                    <center><span class="tdLabel"><%#Eval("LOCATION") %></span></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created On">
                                <ItemTemplate>
                                    <center><span class="tdLabel"><%#Eval("CREATED_ON","{0:dd-MMM-yyyy hh:mm:ss tt}") %></span></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <center><a href="AddLocation.aspx?eid=<%#Eval("LOCATION_ID") %>" class="tdLinkLabel">Edit</a></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <div id="divEducation" runat="server" visible="false">
        <table style="width:500px;">
            <tr>
                <td style="text-align:center">
                    <asp:Button ID="btnAddNewEducation" runat="server" Text="Add Education" CssClass="buttonMedium" OnClick="btnAddNewEducation_Click" />
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:GridView ID="gridEducation" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="WhiteSmoke" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                        <Columns>
                            <asp:TemplateField HeaderText="Education">
                                <ItemTemplate>
                                    <center><span class="tdLabel"><%#Eval("EDUCATION") %></span></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created On">
                                <ItemTemplate>
                                    <center><span class="tdLabel"><%#Eval("CREATED_ON","{0:dd-MMM-yyyy hh:mm:ss tt}") %></span></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <center><a href="AddEducation.aspx?eid=<%#Eval("EDUCATION_ID") %>" class="tdLinkLabel">Edit</a></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <div id="divAdmin" runat="server" visible="false">
        <table style="width:600px;">
            <tr>
                <td style="text-align:center">
                    <asp:Button ID="btnAddAdmin" runat="server" Text="Add Admin" CssClass="buttonMedium" OnClick="btnAddAdmin_Click"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:GridView ID="gridAdminData" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="WhiteSmoke" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                        <Columns>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <center><span class="tdLabel"><%#Eval("FIRST_NAME") %> <%#Eval("LAST_NAME") %></span></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <center><span class="tdLabel"><%#Eval("Email_ID") %></span></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created On">
                                <ItemTemplate>
                                    <center><span class="tdLabel"><%#Eval("CREATED_ON","{0:dd-MMM-yyyy hh:mm:ss tt}") %></span></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <center><a href="AddAdmin.aspx?eid=<%#Eval("USER_ID") %>" class="tdLinkLabel">Edit</a></center>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            </table>
        </div>
</center>
</asp:Content>
