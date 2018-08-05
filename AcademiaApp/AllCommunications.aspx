<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AllCommunications.aspx.cs" Inherits="AcademiaApp.AllCommunications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <center>
        <table style="width:100%;border-collapse:collapse">
                        <tr>
                <td>
                    <asp:ListView ID="listCommunications" runat="server" DataKeyNames="COMMUNICATION_ID" DataSourceID="SqlDataSourceCommunications" >
                 
                   
                        <EmptyDataTemplate>
                            <span class="tdLinkLabel" style="text-align:center">No data found.</span>
                        </EmptyDataTemplate>
                   
                        <ItemTemplate>
                        <table style="width:100%;border-collapse:collapse">
                            <tr>
                            <td>
                                <table style="width:100%">
                                    <tr>
                                        <td style="text-align:left"><span class="listViewData"><b>Sent By:</b> <%#Eval("SentBy")%></span></td>
                                        <td style="text-align:right"> <span class="listViewData"><b>Sent To:</b> <%#Eval("SentTo")%></span></td>
                                        <td style="text-align:right" runat="server"><a href="AllCommunications.aspx?comm=<%# Eval("COMMUNICATION_ID")%>" class="linkMedium" onclick="return confirm('Are you sure want to delete?')">Delete</a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                        <span class="tdLabel"></b>Message: </b><%#Eval("REMARK")%> </span>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:left">
                                            <span style="font-family:'Segoe Marker';font-size:small;color:#d31111">Sent On:<%#Eval("SENT_ON","{0:dd-MMM-yyyy hh:mm:ss tt}") %></span></td>
                                        </td>
                                        <td style="text-align:right" colspan="2">
                                            <span style="font-family:'Segoe Marker';font-size:small;color:#d31111">Read On:<%#Eval("READ_ON","{0:dd-MMM-yyyy hh:mm:ss tt}") %></span></td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="3">
                                            <hr style="border:1px solid #d31111" />
                                        </td>
                                    </tr>
                                </table>
                            
                            </td>
                            </tr>  
                        </table>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listCommunications" PageSize="5">
                                    <Fields >
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                                        <asp:NumericPagerField CurrentPageLabelCssClass="linkMedium" />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                 
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceCommunications" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT COMM.COMMUNICATION_ID,(UD1.FIRST_NAME+' '+UD1.LAST_NAME) As SentBy,(UD2.FIRST_NAME+' '+UD2.LAST_NAME) As SentTo,COMM.SENT_ON,COMM.READ_ON,COMM.REMARK FROM T_COMMUNICATION COMM, T_USERS UD1,T_USERS UD2 WHERE UD1.USER_ID=COMM.SENT_BY AND UD2.USER_ID=COMM.SENT_TO ORDER BY COMM.SENT_ON DESC">
                    
                    </asp:SqlDataSource>
                </td>
            </tr>

            </table>
            </center>
</asp:Content>
