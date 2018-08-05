<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AccountMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="AcademiaApp.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <table style="width:30%;margin-left:10%;margin-right:10%;margin-top:6%;border:1px solid #d31111;border-radius:5px;background-color:white;opacity:0.9" >
                     <tr>
                <td colspan="2" class="tdHeader">Login</td>
            </tr>
            <tr>
                <td class="tdLabel">Email</td>
                <td><asp:TextBox ID="txtLoginEmail" runat="server" CssClass="textBoxmedium" AutoCompleteType="Disabled" placeholder="Email-ID"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required." ControlToValidate="txtLoginEmail" ValidationGroup="Login" CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtLoginEmail" Display="Dynamic" CssClass="errorMessage" ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
                        <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button runat="server" Text="Get Password" ID="btnGetPassword" CssClass="buttonMedium" ValidationGroup="Login" OnClick="btnGetPassword_Click" />
                    <br />
                    <asp:Label runat="server" ID="lblError" CssClass="errorMessage"></asp:Label>
                </td>
            </tr>
                     <tr>
                         <td colspan="2" style="text-align:center">
                             <asp:HyperLink ID="linkForgotPassword" runat="server" Text="Already Registered?" CssClass="linkMedium" NavigateUrl="Index.aspx"></asp:HyperLink>
                         </td>
                     </tr>
        </table>
</center>
</asp:Content>
