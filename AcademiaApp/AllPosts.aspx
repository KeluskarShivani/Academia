<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AllPosts.aspx.cs" Inherits="AcademiaApp.AllPosts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <center>
        <table style="width:100%;border-collapse:collapse">
                        <tr>
                <td>
                    <asp:ListView ID="listPosts" runat="server" DataKeyNames="USER_ID,BASIC_DET_ID" DataSourceID="SqlDataSourcePosts" OnSelectedIndexChanged="listPosts_SelectedIndexChanged" >
                 
                   
                        <EmptyDataTemplate>
                            <span class="tdLinkLabel" style="text-align:center">No data found.</span>
                        </EmptyDataTemplate>
                   
                        <ItemTemplate>
                        <table style="width:100%;border-collapse:collapse">
                            <tr>
                            <td rowspan="3" style="width:60px;text-align:center;vertical-align:top">
                            <asp:Image runat="server" ImageUrl='<%#Eval("PROFILE_PHOTO_URL") %>' Height="50" Width="50" CssClass="profileImageStyle" />
                            </td>
                            </tr>
                            <tr>
                            <td>
                                <table style="width:100%">
                                    <tr>
                                        <td ><span class="listViewData"><%#Eval("FIRST_NAME")%> <%#Eval("LAST_NAME")%> says:</span></td>
                                        <td style="text-align:right" runat="server"><a href="AllPosts.aspx?dp=<%# Eval("POST_ID")%>" class="linkMedium" onclick="return confirm('Are you sure want to delete?')">Delete</a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        <span class="tdLabel"><%#Eval("POST")%> </span>
                                            </td>
                                    </tr>
                                    <tr runat="server" Visible='<%# Eval("FILE_TYPE").ToString() == "IMAGE" ? true : false%>'>
                                        <td>
                                            <a href="<%#Eval("POST_CONTENT_FILE_PATH")%>" target="_blank"><img src="<%#Eval("POST_CONTENT_FILE_PATH")%>" height="100" width="100" /></a>
                                        </td>
                                    </tr>
                                    <tr runat="server" Visible='<%# Eval("FILE_TYPE").ToString() == "PDF" ? true : false%>'>
                                        <td>
                                            <a href="<%#Eval("POST_CONTENT_FILE_PATH")%>" target="_blank"><iframe src="<%#Eval("POST_CONTENT_FILE_PATH")%>" width="500" height="400"></iframe></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:left">
                                           <a href="#" style="text-decoration:none"><span style="font-family:'Segoe Marker';font-size:small;color:#d31111;"><u>Like</u>: <%# Eval("LIKE_COUNT") %></span></a> 
                                        </td>
                                        <td style="text-align:right">
                                            <span style="font-family:'Segoe Marker';font-size:small;color:#d31111">Posted On:<%#Eval("POSTED_ON","{0:dd-MMM-yyyy hh:mm:ss tt}") %></span></td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="2">
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
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listPosts" PageSize="5">
                                    <Fields >
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                                        <asp:NumericPagerField CurrentPageLabelCssClass="linkMedium" />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                 
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourcePosts" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM T_POSTS PS,T_USERS UD,T_BASIC_DETAILS BD WHERE BD.USER_ID=UD.USER_ID AND UD.USER_ID=PS.POSTED_BY ORDER BY PS.POSTED_ON DESC">
                    
                    </asp:SqlDataSource>
                </td>
            </tr>

            </table>
            </center>
</asp:Content>
