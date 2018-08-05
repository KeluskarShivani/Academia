<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Teacher.Master" AutoEventWireup="true" CodeBehind="TeacherProfile.aspx.cs" Inherits="AcademiaApp.TeacherProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="width:40%;height:auto;margin-left:10%;margin-right:10%;margin-top:5%;">
            <tr>
                <td colspan="2" class="tdHeader">Profile Details</td>
            </tr>
            <tr>
                <td class="tdLabel">Date Of Birth</td>
                <td>
 <table>
     <tr>
         <td><asp:DropDownList ID="ddrDate" runat="server" CssClass="ddrsmall">
                    <asp:ListItem Text="Day" Value="Day"></asp:ListItem>
                        <asp:ListItem Text="Day" Value="Day"></asp:ListItem>
                        <asp:ListItem Text="01" Value="01"></asp:ListItem>
                        <asp:ListItem Text="02" Value="02"></asp:ListItem>
                        <asp:ListItem Text="03" Value="03"></asp:ListItem>
                        <asp:ListItem Text="04" Value="04"></asp:ListItem>
                        <asp:ListItem Text="05" Value="05"></asp:ListItem>
                        <asp:ListItem Text="06" Value="06"></asp:ListItem>
                        <asp:ListItem Text="07" Value="07"></asp:ListItem>
                        <asp:ListItem Text="08" Value="08"></asp:ListItem>
                        <asp:ListItem Text="09" Value="09"></asp:ListItem>
             <asp:ListItem Text="10" Value="10"></asp:ListItem>
             <asp:ListItem Text="11" Value="11"></asp:ListItem>
             <asp:ListItem Text="12" Value="12"></asp:ListItem>
             <asp:ListItem Text="13" Value="13"></asp:ListItem>
             <asp:ListItem Text="14" Value="14"></asp:ListItem>
             <asp:ListItem Text="15" Value="15"></asp:ListItem>
             <asp:ListItem Text="16" Value="16"></asp:ListItem>
             <asp:ListItem Text="17" Value="17"></asp:ListItem>
             <asp:ListItem Text="18" Value="18"></asp:ListItem>
             <asp:ListItem Text="19" Value="19"></asp:ListItem>
             <asp:ListItem Text="20" Value="20"></asp:ListItem>
             <asp:ListItem Text="21" Value="21"></asp:ListItem>
             <asp:ListItem Text="22" Value="22"></asp:ListItem>
             <asp:ListItem Text="23" Value="23"></asp:ListItem>
             <asp:ListItem Text="24" Value="24"></asp:ListItem>
             <asp:ListItem Text="25" Value="25"></asp:ListItem>
             <asp:ListItem Text="26" Value="26"></asp:ListItem>
             <asp:ListItem Text="27" Value="27"></asp:ListItem>
             <asp:ListItem Text="28" Value="28"></asp:ListItem>
             <asp:ListItem Text="29" Value="29"></asp:ListItem>
             <asp:ListItem Text="30" Value="30"></asp:ListItem>
             <asp:ListItem Text="31" Value="31"></asp:ListItem>
                </asp:DropDownList></td>
         <td><asp:DropDownList ID="ddrMonth" runat="server" CssClass="ddrsmall">
                        <asp:ListItem Text="Month" Value="Month"></asp:ListItem>
             <asp:ListItem Text="Jan" Value="01"></asp:ListItem>
             <asp:ListItem Text="Feb" Value="02"></asp:ListItem>
             <asp:ListItem Text="Mar" Value="03"></asp:ListItem>
             <asp:ListItem Text="Apr" Value="04"></asp:ListItem>
             <asp:ListItem Text="May" Value="05"></asp:ListItem>
             <asp:ListItem Text="Jun" Value="06"></asp:ListItem>
             <asp:ListItem Text="Jul" Value="07"></asp:ListItem>
             <asp:ListItem Text="Aug" Value="08"></asp:ListItem>
             <asp:ListItem Text="Sep" Value="09"></asp:ListItem>
             <asp:ListItem Text="Oct" Value="10"></asp:ListItem>
             <asp:ListItem Text="Nov" Value="11"></asp:ListItem>
             <asp:ListItem Text="Dec" Value="12"></asp:ListItem>
                    </asp:DropDownList></td>
         <td><asp:TextBox ID="txtYear" runat="server" CssClass="textBoxsmall" AutoCompleteType="Disabled" placeholder="Year"></asp:TextBox></td>
     </tr>
     <tr>
         <td><asp:RequiredFieldValidator runat="server" ControlToValidate="ddrDate" InitialValue="Day" ErrorMessage="Required." CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator></td>
         <td><asp:RequiredFieldValidator runat="server" ControlToValidate="ddrMonth" InitialValue="Month" ErrorMessage="Required." CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator></td>
         <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtYear" ErrorMessage="Required." CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator></td>
     </tr>
 </table>  
                </td>
            </tr>
            <tr>
                <td class="tdLabel">Education</td>
                <td>
                    <asp:DropDownList ID="ddrEducation" runat="server" CssClass="ddrmedium">
         
                    </asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator runat="server" CssClass="errorMessage" ErrorMessage="Required." Display="Dynamic" ControlToValidate="ddrEducation" InitialValue="Select"></asp:RequiredFieldValidator>
                </td>
            </tr>
                        <tr>
                <td class="tdLabel">Location</td>
                <td>
                    <asp:DropDownList ID="ddrLocation" runat="server" CssClass="ddrmedium">
         
                    </asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator runat="server" CssClass="errorMessage" ErrorMessage="Required." Display="Dynamic" ControlToValidate="ddrLocation" InitialValue="Select"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr runat="server" id="trPassword" visible="false">
                <td class="tdLabel">Password</td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="textBoxmedium"></asp:TextBox>
                    
                    <br /><asp:RequiredFieldValidator runat="server" CssClass="errorMessage" ErrorMessage="Required." Display="Dynamic" ControlToValidate="txtPassword" ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr runat="server" visible="false" id="trProfilePhoto">
                <td class="tdLabel">Profile Photo</td>
                <td><asp:FileUpload ID="fileProfilePhoto" runat="server" CssClass="buttonMedium" />
                    <br />
                    <asp:RequiredFieldValidator runat="server" CssClass="errorMessage" ErrorMessage="Required." Display="Dynamic" ControlToValidate="fileProfilePhoto"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr runat="server" visible="false" id="trProfilePhotoUpload">
                <td class="tdLabel">Profile Photo</td>
                <td><asp:FileUpload ID="fileProfilePhotoUpload" runat="server" CssClass="buttonMedium" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="buttonMedium" OnClick="btnSave_Click" />
                       <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="buttonMedium" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="buttonMedium" CausesValidation="false" OnClick="btnCancel_Click"  />
                </td>
            </tr>
            </table>
    </center>
</asp:Content>
