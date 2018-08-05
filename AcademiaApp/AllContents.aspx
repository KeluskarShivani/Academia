<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AllContents.aspx.cs" Inherits="AcademiaApp.AllContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="width:100%;border-collapse:collapse">
            <tr>
                <td>
                <span class="tdHeader">All Contents</span>
                                                    <br /><hr/>
                             <asp:ListView ID="listContents" runat="server" DataKeyNames="CONTENT_ID" DataSourceID="SqlDataSourceContents" >
                   
                        <EmptyDataTemplate>
                            <span class="tdLinkLabel" style="text-align:center">No data found.</span>
                        </EmptyDataTemplate>
                   
                        <ItemTemplate>
                        <table style="width:100%;border-collapse:collapse">
                            <tr>
                                <td style="text-align:left"><span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Shared By: </span><span class="tdLabel"><%#Eval("FIRST_NAME")%> <%#Eval("LAST_NAME")%></span></td>
                                <td style="text-align:right" runat="server" ><a href="AllContents.aspx?con=<%# Eval("CONTENT_ID")%>" class="linkMedium" onclick="return confirm('Are you sure want to delete?')">Delete</a></td>
                            </tr>
                            <tr runat="server" Visible='<%# Eval("FILE_TYPE").ToString() == "IMAGE" ? true : false%>'>
                                <td colspan="2">
                                    <a href="<%#Eval("FILE_PATH")%>" target="_blank"><img src="<%#Eval("FILE_PATH")%>" height="100" width="100" /></a>
                                </td>
                            </tr>
                            <tr runat="server" Visible='<%# Eval("FILE_TYPE").ToString() == "PDF" ? true : false%>'>
                                        <td colspan="2">
                                            <a href="<%#Eval("FILE_PATH")%>" target="_blank"><iframe src="<%#Eval("FILE_PATH")%>" width="500" height="400"></iframe></a>
                                        </td>
                                    </tr>
                            <tr runat="server" Visible='<%# Eval("FILE_TYPE").ToString() == "EXCEL" ? true : false%>'>
                                <td colspan="2">
                                    <a href="<%#Eval("FILE_PATH")%>" target="_blank">Download</a>
                                </td>
                            </tr>
                            <tr runat="server" Visible='<%# Eval("FILE_TYPE").ToString() == "DOCUMENT" ? true : false%>'>
                                <td colspan="2">
                                    <a href="<%#Eval("FILE_PATH")%>" target="_blank">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left;" colspan="2">
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Note: </span><span class="tdLabel"><%#Eval("REMARKs")%></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;font-weight:normal;font-family:'Segoe Marker';color:#d31111;font-size:medium" colspan="2">
                                    <%#Eval("SENT_ON","{0:dd-MMM-yyy hh:mm:ss tt}")%>
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
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listContents" PageSize="5">
                                    <Fields >
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                                        <asp:NumericPagerField CurrentPageLabelCssClass="linkMedium" />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                 
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceContents" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM T_CONTENTS CN,T_USERS UD WHERE UD.USER_ID=CN.SHARED_BY ORDER BY CN.SENT_ON DESC">
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
            </center>
</asp:Content>
