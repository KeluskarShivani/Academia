<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddAdmin.aspx.cs" Inherits="AcademiaApp.AddAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="width:40%;height:auto;margin-left:10%;margin-right:10%;margin-top:5%;border:1px solid #d31111;border-radius:5px">
            <tr>
                <td colspan="2" class="tdHeader">Add New Admin</td>
            </tr>
  <tr>
                <td class="tdLabel">First Name</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="textBoxmedium" AutoCompleteType="Disabled" placeholder="First Name" ></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage="Required." ValidationGroup="Register" CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">Last Name</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="textBoxmedium" AutoCompleteType="Disabled" placeholder="Last Name"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage="Required." ValidationGroup="Register" CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
                <tr>
                <td class="tdLabel">Gender</td>
                <td>
             <asp:DropDownList ID="ddrGender" runat="server" CssClass="ddrsmall">
                 <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                 <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                 <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
             </asp:DropDownList><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddrGender" InitialValue="Select" ErrorMessage="Required." ValidationGroup="Register" CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">Email</td>
                <td><asp:TextBox ID="txtEmail" runat="server" CssClass="textBoxmedium" AutoCompleteType="Disabled" placeholder="Email-ID"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Required." ValidationGroup="Register" CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtEmail" runat="server" Display="Dynamic" ErrorMessage="Invalid email format." CssClass="errorMessage" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">Password</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textBoxmedium" AutoCompleteType="Disabled" placeholder="Password"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Required." Display="Dynamic" ValidationGroup="Register" CssClass="errorMessage"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdLabel">Confirm Password</td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="textBoxmedium" AutoCompleteType="Disabled" placeholder="Confirm Password Again"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Required." Display="Dynamic" ValidationGroup="Register" CssClass="errorMessage"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password mismatch." CssClass="errorMessage" Display="Dynamic"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="buttonMedium"  Visible="false" OnClick="btnSave_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="buttonMedium" Visible="false" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="buttonMedium" OnClick="btnCancel_Click"  />
                </td>
            </tr>
            </table>
    </center>
</asp:Content>
