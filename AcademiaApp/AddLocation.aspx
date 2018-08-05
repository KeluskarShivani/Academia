<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddLocation.aspx.cs" Inherits="AcademiaApp.AddLocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="width:40%;height:auto;margin-left:10%;margin-right:10%;margin-top:5%;border:1px solid #d31111;border-radius:5px">
            <tr>
                <td colspan="2" class="tdHeader">Add Location</td>
            </tr>
            <tr>
                <td class="tdLabel">Location</td>
                <td><asp:TextBox ID="txtLocation" runat="server" CssClass="textBoxmedium" AutoCompleteType="Disabled"></asp:TextBox></td>
                </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="buttonMedium" OnClick="btnSave_Click" Visible="false" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="buttonMedium" Visible="false" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="buttonMedium" OnClick="btnCancel_Click" />
                </td>
            </tr>
            </table>
    </center>
</asp:Content>
