<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="TeacherFeedback.aspx.cs" Inherits="AcademiaApp.TeacherFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
        <table style="width:100%;border-collapse:collapse">
            <tr>
                <td>
                    <span class="tdHeader" style="margin-left:2.5%">Send Message</span>
                    
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="textBoxmedium" TextMode="MultiLine" Width="95%" Height="60"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align:left">
                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large;margin-left:15px;">Select Friends</span>
                    <br />
                    <div style="margin-left:15px;width:200px;font-family:'Segoe Marker';color:#d31111;overflow-x:auto;height:auto;max-height:110px;border:1px solid #d31111">
                    <asp:CheckBoxList ID="chkListFriends" runat="server" Font-Names="">

                    </asp:CheckBoxList></div>
                    <br />
                </td>
            </tr>
            <tr>
                <td >
                    <span style="margin-left:2%"><asp:Button ID="btnSend" runat="server" Text="Send" CssClass="buttonMedium" OnClick="btnSend_Click" /></span>
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
                                                    <span class="tdHeader">Feedbck Sent Till Date</span>
                                                    <br /><hr/>
                             <asp:ListView ID="listFeedback" runat="server" DataKeyNames="FEEDBACK_ID" DataSourceID="SqlDataSourceFeedback" >
                 
                   
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
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Remark: </span><span class="tdLabel"><%#Eval("FEEDBACK")%></span>
                                </td>
                            </tr>  
                            <tr>
                                <td>
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Sent On: </span><span class="tdLabel"><%#Eval("SHARED_ON","{0:dd-MMM-yyy hh:mm:ss tt}")%></span>
                                </td>
                                <td >
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Read On: </span><span class="tdLabel"><%#Eval("READ_ON","{0:dd-MMM-yyy hh:mm:ss tt}")%></span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr style="border:1px solid #d31111" />
                                </td>
                            </tr>
                        </table>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listFeedback" PageSize="5">
                                    <Fields >
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                                        <asp:NumericPagerField CurrentPageLabelCssClass="linkMedium" />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                 
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceFeedback" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM T_FEEDBACKS FD,T_USERS UD WHERE UD.USER_ID=FD.SENT_TO AND FD.SENT_FROM=@USER_ID ORDER BY FD.SHARED_ON DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="USER_ID" SessionField="USER_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        </center>
</asp:Content>
