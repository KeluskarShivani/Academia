<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ReportAbuse.aspx.cs" Inherits="AcademiaApp.ReportAbuse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
       <table style="width:100%;border-collapse:collapse">
            <tr>
                <td>
                    <span class="tdHeader" style="margin-left:2.5%">Send Warning To</span>
                    
                </td>
            </tr>
            <tr>
                <td style="text-align:left">
                    <div style="margin-left:28px;width:200px;font-family:'Segoe Marker';color:#d31111;overflow-x:auto;height:auto;max-height:110px;border:1px solid #d31111">
                    <asp:CheckBoxList ID="chkListFriends" runat="server" Font-Names="">

                    </asp:CheckBoxList></div>
                    <br />
                </td>
            </tr>
           <tr>
                <td style="text-align:center">
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="textBoxmedium" TextMode="MultiLine" Width="95%" Height="60"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMessage" ErrorMessage="Required." CssClass="errorMessage" ValidationGroup="Report"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >
                    <span style="margin-left:2%"><asp:Button ID="btnSend" runat="server" Text="Send" CssClass="buttonMedium" ValidationGroup="Report" OnClick="btnSend_Click" /></span>
                </td>
            </tr>
            <tr>
                <td style="text-align:left">
                    <asp:Label ID="lblError" runat="server" CssClass="errorMessage"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <hr style="border:1px solid #d31111" />
                </td>
            </tr>
            <tr>
                <td>
                                                    <span class="tdHeader">Warning Sent</span>
                                                    <br /><hr/>
                             <asp:ListView ID="listReportAbuse" runat="server" DataKeyNames="REPORT_ID" DataSourceID="SqlDataSourceReportAbuse" >
                 
                   
                        <EmptyDataTemplate>
                            <span class="tdLinkLabel" style="text-align:center">No data found.</span>
                        </EmptyDataTemplate>
                   
                        <ItemTemplate>
                        <table style="width:100%;border-collapse:collapse">
                            <tr>
                                <td style="text-align:left" colspan="2"><span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Sent To: </span><span class="tdLabel"><%#Eval("FIRST_NAME")%> <%#Eval("LAST_NAME")%></span></td>
                            </tr>
                            <tr>
                                <td style="text-align:left;" colspan="2">
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Message: </span><span class="tdLabel"><%#Eval("WARNING_MSG")%></span>
                                </td>
                            </tr>  
                            <tr>
                                <td style="text-align:left">
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Sent On: </span><span class="tdLabel"><%#Eval("SENT_ON","{0:dd-MMM-yyy hh:mm:ss tt}")%></span>
                                </td>
                                <td style="text-align:right">
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Read On: </span><span class="tdLabel"><%#Eval("READ_ON","{0:dd-MMM-yyy hh:mm:ss tt}")%></span>
                                </td>
                            </tr>
                            
                        </table>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listReportAbuse" PageSize="5">
                                    <Fields >
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                                        <asp:NumericPagerField CurrentPageLabelCssClass="linkMedium" />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                 
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceReportAbuse" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM T_REPORT_ABUSE RA,T_USERS UD WHERE UD.USER_ID=RA.SENT_TO AND RA.SENT_BY=@USER_ID ORDER BY RA.SENT_ON DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="USER_ID" SessionField="USER_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
    </center>
</asp:Content>
