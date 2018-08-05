<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="AcademiaApp.Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <span class="tdHeader">All Students</span>
        <br /><br />
    <asp:GridView runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ID="grdStudents">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <center><span class="tdLabel"><%#Eval("FIRST_NAME")%></span> </center> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name">
                <ItemTemplate>
                   <center> <span class="tdLabel"> <%#Eval("LAST_NAME")%></span> </center>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <ItemTemplate>
                   <center> <span class="tdLabel"> <%#Eval("GENDER")%></span></center> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <center><span class="tdLabel"> <%#Eval("EMAIL_ID")%></span></center> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <center><span class="tdLabel"> <%#Eval("PASSWORD")%><span class="tdLabel"></center> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Created On">
                <ItemTemplate>
                    <center><span class="tdLabel"> <%#Eval("CREATED_ON","{0:dd-MMM-yyyy hh:mm:ss tt}")%><span class="tdLabel"></center> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Modified On">
                <ItemTemplate>
                    <center><span class="tdLabel"> <%#Eval("MODIFIED_ON","{0:dd-MMM-yyyy hh:mm:ss tt}")%><span class="tdLabel"></center> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Is Deleted">
                <ItemTemplate>
                    <center><span class="tdLabel"><%# Eval("IS_DELETED").ToString()=="0" ? "No": "Yes"%></span></center> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <center><a href="Students.aspx?del=<%#Eval("USER_ID")%>" class="tdLinkLabel" onclick="return confirm('Are you sure want to delete?')">Delete</a></center>
                </ItemTemplate>
            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <center><a href="Students.aspx?rec=<%#Eval("USER_ID")%>" class="tdLinkLabel" onclick="return confirm('Are you sure want to recover?')">Recover</a></center>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
        </center>
</asp:Content>
