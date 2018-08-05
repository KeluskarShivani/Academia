<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddEducation.aspx.cs" Inherits="AcademiaApp.AddEducation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="width:40%;height:auto;margin-left:10%;margin-right:10%;margin-top:5%;border:1px solid #d31111;border-radius:5px">
            <tr>
                <td colspan="2" class="tdHeader">Add Education</td>
            </tr>
            <tr>
                <td class="tdLabel">Education</td>
                <td><asp:TextBox ID="txtEducation" runat="server" CssClass="textBoxmedium" AutoCompleteType="Disabled"></asp:TextBox></td>
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
