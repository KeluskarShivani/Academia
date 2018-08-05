<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="DeleteAccountConfirm.aspx.cs" Inherits="AcademiaApp.DeleteAccountConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <br />
        <br />
        <br />
<h3>Are you sure you want to delete your profile?</h3>
        <br />
        <asp:Button ID="btnDelete" runat="server" Text="Delete Profile" CssClass="buttonMedium" OnClick="btnDelete_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="buttonMedium" OnClick="btnCancel_Click" />

    </center>
</asp:Content>
