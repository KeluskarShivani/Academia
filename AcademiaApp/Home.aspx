<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AcademiaApp.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .profileImageStyle {
            border-radius:50%;
            border:2px solid #d31111 ;
        }
    </style>
    <center>
        <table style="width:100%;border-collapse:collapse">
            <tr>
                <td>
                    <span class="tdHeader" style="margin-left:2.5%">Add Post</span>
                    
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:TextBox ID="txtPost" runat="server" CssClass="textBoxmedium" TextMode="MultiLine" Width="95%" Height="60"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPost" CssClass="errorMessage" ErrorMessage="Required." ValidationGroup="post" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:left">
                    <span class="tdHeader" style="margin-left:2.0%"><asp:FileUpload ID="fileUploader" runat="server" ToolTip="Upload File" /></span>
                </td>
            </tr>
            <tr>
                <td >
                    <span style="margin-left:2%"><asp:Button ID="btnPost" runat="server" Text="Post" CssClass="buttonMedium" OnClick="btnPost_Click" ValidationGroup="post" /></span>
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
                                        <td style="text-align:right" runat="server" Visible='<%# Eval("USER_ID").ToString().ToUpper() == Session["USER_ID"].ToString().ToUpper() ? true : false%>'><a href="Home.aspx?dp=<%# Eval("POST_ID")%>" class="linkMedium" onclick="return confirm('Are you sure want to delete?')">Delete</a></td>
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
                                           <a href="Home.aspx?lk=<%# Eval("POST_ID") %>" style="text-decoration:none"><span style="font-family:'Segoe Marker';font-size:small;color:#d31111;"><u>Like</u>: <%# Eval("LIKE_COUNT") %></span></a> 
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
                    <asp:SqlDataSource ID="SqlDataSourcePosts" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT UD.USER_ID,BD.BASIC_DET_ID,PS.POST_ID,PS.POSTED_BY,PS.POST,PS.POST_CONTENT_FILE_PATH,PS.LIKE_COUNT,PS.POSTED_ON,PS.FILE_NAME,PS.FILE_TYPE,UD.FIRST_NAME,UD.LAST_NAME,BD.PROFILE_PHOTO_URL,UD.ROLE FROM T_POSTS PS,T_USERS UD,T_FRIEND_REQUESTS FR,T_BASIC_DETAILS BD WHERE UD.USER_ID=BD.USER_ID AND UD.USER_ID=PS.POSTED_BY AND PS.POSTED_BY=FR.REQ_FROM AND POSTED_BY IN (SELECT REQ_FROM FROM T_FRIEND_REQUESTS WHERE REQ_TO=@USER_ID)UNION SELECT  UD.USER_ID,BD.BASIC_DET_ID,PS.POST_ID,PS.POSTED_BY,PS.POST,PS.POST_CONTENT_FILE_PATH,PS.LIKE_COUNT,PS.POSTED_ON,PS.FILE_NAME,PS.FILE_TYPE,UD.FIRST_NAME,UD.LAST_NAME,BD.PROFILE_PHOTO_URL,UD.ROLE FROM T_POSTS PS,T_USERS UD,T_FRIEND_REQUESTS FR,T_BASIC_DETAILS BD WHERE UD.USER_ID=BD.USER_ID AND UD.USER_ID=PS.POSTED_BY AND PS.POSTED_BY=FR.REQ_TO AND POSTED_BY IN (SELECT REQ_TO FROM T_FRIEND_REQUESTS WHERE REQ_FROM=@USER_ID)UNION SELECT UD.USER_ID,BD.BASIC_DET_ID,PS.POST_ID,PS.POSTED_BY,PS.POST,PS.POST_CONTENT_FILE_PATH,PS.LIKE_COUNT,PS.POSTED_ON,PS.FILE_NAME,PS.FILE_TYPE,UD.FIRST_NAME,UD.LAST_NAME,BD.PROFILE_PHOTO_URL,UD.ROLE FROM T_POSTS PS,T_USERS UD,T_BASIC_DETAILS BD  WHERE UD.USER_ID=BD.USER_ID AND UD.USER_ID=PS.POSTED_BY AND UD.USER_ID=@USER_ID ORDER BY PS.POSTED_ON DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="USER_ID" SessionField="USER_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
