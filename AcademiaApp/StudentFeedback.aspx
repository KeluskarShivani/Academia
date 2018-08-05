<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="StudentFeedback.aspx.cs" Inherits="AcademiaApp.StudentFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="width:100%;border-collapse:collapse">
            <tr>
                <td>
                                                    <span class="tdHeader">Feedback Received</span>
                                                    <br /><hr/>
                             <asp:ListView ID="listFeedback" runat="server" DataKeyNames="FEEDBACK_ID" DataSourceID="SqlDataSourceFeedback" >
                 
                   
                        <EmptyDataTemplate>
                            <span class="tdLinkLabel" style="text-align:center">No data found.</span>
                        </EmptyDataTemplate>
                   
                        <ItemTemplate>
                        <table style="width:100%;border-collapse:collapse">
                            <tr>
                                <td style="text-align:left" colspan="2">
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Sent By: </span><span class="tdLabel"><%#Eval("FIRST_NAME")%> <%#Eval("LAST_NAME")%></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left;" colspan="2">
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Remark: </span><span class="tdLabel"><%#Eval("FEEDBACK")%></span>
                                </td>
                            </tr>  
                            <tr>
                                <td>
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Shared On: </span><span class="tdLabel"><%#Eval("SHARED_ON","{0:dd-MMM-yyy hh:mm:ss tt}")%></span>
                                </td>
                                <td>
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
                    <asp:SqlDataSource ID="SqlDataSourceFeedback" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM T_FEEDBACKS FD,T_USERS UD WHERE UD.USER_ID=FD.SENT_FROM AND FD.SENT_TO=@USER_ID ORDER BY FD.SHARED_ON DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="USER_ID" SessionField="USER_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
    </center>
</asp:Content>
