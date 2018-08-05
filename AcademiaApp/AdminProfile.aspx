<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="AcademiaApp.AdminProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="width:40%;height:auto;margin-left:10%;margin-right:10%;margin-top:2%;border:1px solid #d31111;border-radius:5px">
            <tr>
                <td colspan="2" class="tdHeader">Profile Details</td>
            </tr>
            
            <tr>
                <td class="tdLabel">First Name</td>
                <td>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="textBoxmedium"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator runat="server" CssClass="errorMessage" ErrorMessage="Required." Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </td>
            </tr>
                        <tr>
                <td class="tdLabel">Last Name</td>
                <td>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="textBoxmedium"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator runat="server" CssClass="errorMessage" ErrorMessage="Required." Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">Password</td>
                <td><asp:TextBox ID="txtPassword" runat="server" CssClass="textBoxmedium"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator runat="server" CssClass="errorMessage" ErrorMessage="Required." Display="Dynamic" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">Confirm Password</td>
                <td><asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="textBoxmedium"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator runat="server" CssClass="errorMessage" ErrorMessage="Required." Display="Dynamic" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" CssClass="errorMessage" ErrorMessage="Password mismatch." Display="Dynamic" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="buttonMedium" />
                </td>
            </tr>
            </table>
    </center>
</asp:Content>
