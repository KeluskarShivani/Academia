<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AccountMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AcademiaApp.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <br />
        <br />
        <marquee><span style="font-family:'Segoe Marker';font-size:large;color:#d31111">Education Social Network : Study related discussions, contents sharing, communications and many more..join today..its free!!!</span></marquee>
     <table style="width:100%;height:auto;" >
         <tr>
             <td rowspan="2" style="width:50%;vertical-align:top">
                 <table style="width:100%;height:650px;border:1px solid #d31111;border-radius:5px;background-color:white;opacity:0.9;vertical-align:top" >
                     <tr>
                         <td class="tdHeader">Our Roadmap</td>
                     </tr>
                     <tr>
                         <td style="vertical-align:top" class="tdLinkLabel">
                             <ul>
                                 <li class="tdLinkLabel">Register on Academia..Its Free!</li>
                                 <li class="tdLinkLabel">Complete your profile details.</li>
                                 <li class="tdLinkLabel">Find your mates as well as teachers from our suggestions.</li>
                                 <li class="tdLinkLabel">Send request / Accept their request and be connected.</li>
                                 <li class="tdLinkLabel">Share contents accross the connected ones.</li>
                                 <li class="tdLinkLabel">Recive updates from teachers once they brodcasts.</li>
                                 <li class="tdLinkLabel">Like the posts of your friends.</li>
                                 <li class="tdLinkLabel">Like the contets / Download it whenever requires.</li>
                                 <li class="tdLinkLabel">Join..Share..Communicate..</li>
                             </ul>
                         </td>
                     </tr>
                     </table>
             </td>
             <td>
                 <table style="width:100%;border:1px solid #d31111;border-radius:5px;background-color:white;opacity:0.9" >
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
                <td class="tdLabel">Password</td>
                <td>
                    <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" CssClass="textBoxmedium" AutoCompleteType="Disabled" placeholder="Password"></asp:TextBox><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLoginPassword" ErrorMessage="Required." ValidationGroup="Login" CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
                <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button runat="server" Text="Login" ID="btnLogin" CssClass="buttonMedium" ValidationGroup="Login" OnClick="btnLogin_Click"/>
                </td>
            </tr>
                     <tr>
                         <td colspan="2" style="text-align:center">
                             <asp:HyperLink ID="linkForgotPassword" runat="server" Text="Forgot Password?" CssClass="linkMedium" NavigateUrl="ForgotPassword.aspx"></asp:HyperLink>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="text-align:center">
                             <asp:Label ID="lblLoginError" runat="server" CssClass="errorMessage"></asp:Label>
                         </td>
                     </tr>
                 </table> 
             </td>
         </tr>
         <tr>
             <td >
                 <table style="width:100%;border:1px solid #d31111;border-radius:5px;background-color:white;opacity:0.9" >
            <tr>
                <td colspan="2" class="tdHeader">Register</td>
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
                 <td class="tdLabel">Register As</td>
                <td>
             <asp:DropDownList ID="ddrRegisterAs" runat="server" CssClass="ddrsmall">
                 <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                 <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                 <asp:ListItem Text="Teacher" Value="Teacher"></asp:ListItem>
             </asp:DropDownList><br />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddrRegisterAs" InitialValue="Select" ErrorMessage="Required." ValidationGroup="Register" CssClass="errorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button runat="server" Text="Register" ID="btnRegister" CssClass="buttonMedium" ValidationGroup="Register" OnClick="btnRegister_Click"/>
                    <asp:Button runat="server" Text="Reset" ID="btnReset" ValidationGroup="Reset" CausesValidation="false" CssClass="buttonMedium" OnClick="btnReset_Click" />
                </td>
            </tr>
        </table>
             </td>
         </tr>
            
        </table>
        <br />
        

    </center>
</asp:Content>
