<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WarningMessage.aspx.cs" Inherits="AcademiaApp.WarningMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            <title>Warning</title>
        <link href="CSS/Academia.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     <center>
        <br />
        <br />
        <br />
        <span style="color:red;font-family:'Segoe Marker';font-size:larger"> Warning From Admin!!!</span>
        <br />
        <br />
        <asp:Label runat="server" ID="lblWarningMessage" CssClass="tdLabel"></asp:Label>
        <br />
        <asp:Button ID="btnContinue" runat="server" CssClass="buttonMedium" Text="Continue" OnClick="btnContinue_Click" />
    </center>
    </form>
</body>
</html>
