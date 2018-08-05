<%@ Page Title="" Language="C#" MasterPageFile="~/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="AcademiaApp.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h3>Dashboard</h3>
        <hr  style="border:1px solid #808080"/>
        <table style="width:80%">
            <tr>
                <td style="width:50%">
            <table style="width:100%">
            <tr>
                <td class="tdHeader" style="text-align:center">
                    Students
                    <hr />
                </td>
            </tr>
            <tr>
                <td style="height:300px;vertical-align:top">
                    <asp:ListView runat="server" ID="listStudents" DataSourceID="listDataSoucreStudents">
                        <AlternatingItemTemplate>
                            <li style="background-color: #FFF8DC;">Name:
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                <br />
                                Created On:
                                <asp:Label ID="CREATED_ONLabel" runat="server" Text='<%# Eval("CREATED_ON") %>' />
                                <br />
                            </li>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <li style="background-color: #008A8C;color: #FFFFFF;">Name:
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                <br />
                                Created On:
                                <asp:TextBox ID="CREATED_ONTextBox" runat="server" Text='<%# Bind("CREATED_ON") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </li>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            No data was returned.
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <li style="">Name:
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                <br />
                                Created On:
                                <asp:TextBox ID="CREATED_ONTextBox" runat="server" Text='<%# Bind("CREATED_ON") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </li>
                        </InsertItemTemplate>
                        <ItemSeparatorTemplate>
                            <br />
                        </ItemSeparatorTemplate>
                        <ItemTemplate>
                            <li style="background-color: #DCDCDC;color: #000000;">Name:
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                <br />
                                Created On:
                                <asp:Label ID="CREATED_ONLabel" runat="server" Text='<%# Eval("CREATED_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
                                <br />
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <li runat="server" id="itemPlaceholder" />
                            </ul>
                            <div style="font-family: Verdana, Arial, Helvetica, sans-serif; text-align: center; background-color: #CCCCCC; color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Name:
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                <br />
                                Created On:
                                <asp:Label ID="CREATED_ONLabel" runat="server" Text='<%# Eval("CREATED_ON") %>' />
                                <br />
                            </li>
                        </SelectedItemTemplate>

                    </asp:ListView>
                    <asp:SqlDataSource ID="listDataSoucreStudents" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT (FIRST_NAME+' '+LAST_NAME) AS Name, CREATED_ON  FROM T_USERS WHERE ROLE='Student' ORDER BY CREATED_ON DESC"></asp:SqlDataSource>
                </td>
            </tr>
                </table>
                </td>
                <td style="width:50%">
                               <table style="width:100%">
            <tr>
                <td class="tdHeader" style="text-align:center">
                    Teachers
                    <hr />
                </td>
            </tr>
       <tr>
                <td style="height:300px;vertical-align:top">
                    <asp:ListView runat="server" ID="listViewTeachers" DataSourceID="listDataSourceTeachers">
                        <AlternatingItemTemplate>
                            <li style="background-color: #FFF8DC;">Name:
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                <br />
                                Created On:
                                <asp:Label ID="CREATED_ONLabel" runat="server" Text='<%# Eval("CREATED_ON") %>' />
                                <br />
                            </li>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <li style="background-color: #008A8C;color: #FFFFFF;">Name:
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                <br />
                                Created On:
                                <asp:TextBox ID="CREATED_ONTextBox" runat="server" Text='<%# Bind("CREATED_ON") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </li>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            No data was returned.
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <li style="">Name:
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                <br />
                                Created On:
                                <asp:TextBox ID="CREATED_ONTextBox" runat="server" Text='<%# Bind("CREATED_ON") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </li>
                        </InsertItemTemplate>
                        <ItemSeparatorTemplate>
                            <br />
                        </ItemSeparatorTemplate>
                        <ItemTemplate>
                            <li style="background-color: #DCDCDC;color: #000000;">Name:
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                <br />
                                Created On:
                                <asp:Label ID="CREATED_ONLabel" runat="server" Text='<%# Eval("CREATED_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
                                <br />
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <li runat="server" id="itemPlaceholder" />
                            </ul>
                            <div style="font-family: Verdana, Arial, Helvetica, sans-serif; text-align: center; background-color: #CCCCCC; color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Name:
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                <br />
                                Created On:
                                <asp:Label ID="CREATED_ONLabel" runat="server" Text='<%# Eval("CREATED_ON") %>' />
                                <br />
                            </li>
                        </SelectedItemTemplate>

                    </asp:ListView>
                    <asp:SqlDataSource ID="listDataSourceTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT (FIRST_NAME+' '+LAST_NAME) AS Name, CREATED_ON  FROM T_USERS WHERE ROLE='Teacher' ORDER BY CREATED_ON DESC"></asp:SqlDataSource>
                </td>
            </tr>
                </table>
                </td>
            </tr>
 
        </table>
        <hr />
        <table style="width:80%">
            <tr>
                <td style="width:50%;vertical-align:top">
                               <table style="width:100%">
            <tr>
                <td class="tdHeader">
                    # Contents
                    <hr />
                </td>
            </tr>
            <tr >
           <td style="height:300px;vertical-align:top">
           <asp:ListView runat="server" ID="listViewContents" DataSourceID="listDataSourceContents">
               <AlternatingItemTemplate>
                   <li style="background-color: #FFF8DC;">Name:
                       <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                       <br />
                       Content:<a href='<%#Eval("FILE_PATH")%>' class="linkMedium" target="_blank">View</a>
                       <br />
                       Sent On:
                       <asp:Label ID="SENT_ONLabel" runat="server" Text='<%# Eval("SENT_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
                       <br />
                       Likes:
                       <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
                       <br />
                   </li>
               </AlternatingItemTemplate>
               <EmptyDataTemplate>
                   No data was returned.
               </EmptyDataTemplate>
               <ItemSeparatorTemplate>
<br />
               </ItemSeparatorTemplate>
               <ItemTemplate>
                   <li style="background-color: #DCDCDC;color: #000000;">Name:
                       <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                       <br />
                        Content:<a href='<%#Eval("FILE_PATH")%>' class="linkMedium" target="_blank">View</a>
                       <br />
                       Sent On:
                       <asp:Label ID="SENT_ONLabel" runat="server" Text='<%# Eval("SENT_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
                       <br />
                       Likes:
                       <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
                       <br />
                   </li>
               </ItemTemplate>
               <LayoutTemplate>
                   <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                       <li runat="server" id="itemPlaceholder" />
                   </ul>
                   <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                       <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                           <Fields>
                               <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                               <asp:NumericPagerField />
                               <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                           </Fields>
                       </asp:DataPager>
                   </div>
               </LayoutTemplate>
               <SelectedItemTemplate>
                   <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Name:
                       <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                       <br />
                       Content:
                       <asp:Label ID="FILE_PATHLabel" runat="server" Text='<%# Eval("FILE_PATH") %>' />
                       <br />
                       Sent On:
                       <asp:Label ID="SENT_ONLabel" runat="server" Text='<%# Eval("SENT_ON","0:dd-MMM-yyyy HH:mm:ss tt") %>' />
                       <br />
                       Likes:
                       <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
                       <br />
                   </li>
               </SelectedItemTemplate>
                        </asp:ListView>
               <asp:SqlDataSource ID="listDataSourceContents" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT (UD.FIRST_NAME+' '+UD.LAST_NAME) AS Name,CT.FILE_PATH,CT.SENT_ON,CT.LIKE_COUNT FROM T_USERS UD,T_CONTENTS CT WHERE CT.SHARED_BY=UD.USER_ID ORDER BY CT.SENT_ON DESC"></asp:SqlDataSource>
           </td>
            </tr>
                </table>
                </td>
                <td style="width:50%;vertical-align:top;">
                               <table style="width:100%">
            <tr>
                <td class="tdHeader">
                    # Communications
                    <hr />
                </td>
            </tr>
            <tr>
                <td style="height:300px;vertical-align:top">
<asp:ListView runat="server" ID="listViewCommunication" DataSourceID="listDataSourceCommunications">
    <AlternatingItemTemplate>
        <li style="background-color: #FFF8DC;">Sent By:
            <asp:Label ID="SentByLabel" runat="server" Text='<%# Eval("SentBy") %>' />
            <br />
            Sent To:
            <asp:Label ID="SentToLabel" runat="server" Text='<%# Eval("SentTo") %>' />
            <br />
            Sent On:
            <asp:Label ID="SENT_ONLabel" runat="server" Text='<%# Eval("SENT_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
            <br />
            Read On:
            <asp:Label ID="READ_ONLabel" runat="server" Text='<%# Eval("READ_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
            <br />
            Remark:
            <asp:Label ID="REMARKLabel" runat="server" Text='<%# Eval("REMARK") %>' />
            <br />
        </li>
    </AlternatingItemTemplate>
    <EmptyDataTemplate>
        No data was returned.
    </EmptyDataTemplate>
                   <ItemSeparatorTemplate>
<br />
               </ItemSeparatorTemplate>
    <ItemTemplate>
        <li style="background-color: #DCDCDC;color: #000000;">Sent By:
            <asp:Label ID="SentByLabel" runat="server" Text='<%# Eval("SentBy") %>' />
            <br />
            Sent To:
            <asp:Label ID="SentToLabel" runat="server" Text='<%# Eval("SentTo") %>' />
            <br />
            Sent On:
            <asp:Label ID="SENT_ONLabel" runat="server" Text='<%# Eval("SENT_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
            <br />
            Read On:
            <asp:Label ID="READ_ONLabel" runat="server" Text='<%# Eval("READ_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
            <br />
            Remark:
            <asp:Label ID="REMARKLabel" runat="server" Text='<%# Eval("REMARK") %>' />
            <br />
        </li>
    </ItemTemplate>
    <LayoutTemplate>
        <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
            <li runat="server" id="itemPlaceholder" />
        </ul>
        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">SentBy:
            <asp:Label ID="SentByLabel" runat="server" Text='<%# Eval("SentBy") %>' />
            <br />
            SentTo:
            <asp:Label ID="SentToLabel" runat="server" Text='<%# Eval("SentTo") %>' />
            <br />
            SENT_ON:
            <asp:Label ID="SENT_ONLabel" runat="server" Text='<%# Eval("SENT_ON") %>' />
            <br />
            READ_ON:
            <asp:Label ID="READ_ONLabel" runat="server" Text='<%# Eval("READ_ON") %>' />
            <br />
            REMARK:
            <asp:Label ID="REMARKLabel" runat="server" Text='<%# Eval("REMARK") %>' />
            <br />
        </li>
    </SelectedItemTemplate>
    </asp:ListView>
                    <asp:SqlDataSource ID="listDataSourceCommunications" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT (UD1.FIRST_NAME+' '+UD1.LAST_NAME) As SentBy,(UD2.FIRST_NAME+' '+UD2.LAST_NAME) As SentTo,COMM.SENT_ON,COMM.READ_ON,COMM.REMARK FROM T_COMMUNICATION COMM, T_USERS UD1,T_USERS UD2 WHERE UD1.USER_ID=COMM.SENT_BY AND UD2.USER_ID=COMM.SENT_TO ORDER BY COMM.SENT_ON DESC"></asp:SqlDataSource>
                    </td>
            </tr>
                </table>
                </td>
            </tr>
 
        </table>
        <hr />
        <table style="width:80%">
            <tr>
                <td style="width:50%;vertical-align:top">
                               <table style="width:100%">
            <tr>
                <td class="tdHeader">
                    
                    # Posts
                    <hr />
                </td>
            </tr>
            <tr>
                <td style="height:300px;vertical-align:top">
<asp:ListView runat="server" ID="listViewPosts" DataSourceID="listDataSourcePosts">
    <AlternatingItemTemplate>
        <li style="background-color: #FFF8DC;">Posted By:
            <asp:Label ID="PostedByLabel" runat="server" Text='<%# Eval("PostedBy") %>' />
            <br />
            Post:
            <asp:Label ID="POSTLabel" runat="server" Text='<%# Eval("POST") %>' />
            <br />
            Posted On:
            <asp:Label ID="POSTED_ONLabel" runat="server" Text='<%# Eval("POSTED_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
            <br />
            Likes:
            <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
            <br />
        </li>
    </AlternatingItemTemplate>
    <EmptyDataTemplate>
        No data was returned.
    </EmptyDataTemplate>
    <ItemSeparatorTemplate>
<br />
    </ItemSeparatorTemplate>
    <ItemTemplate>
        <li style="background-color: #DCDCDC;color: #000000;">Posted By:
            <asp:Label ID="PostedByLabel" runat="server" Text='<%# Eval("PostedBy") %>' />
            <br />
            Post:
            <asp:Label ID="POSTLabel" runat="server" Text='<%# Eval("POST") %>' />
            <br />
            Posted On:
            <asp:Label ID="POSTED_ONLabel" runat="server" Text='<%# Eval("POSTED_ON","{0:dd-MMMM-yyyy HH:mm:ss tt}") %>' />
            <br />
            Likes:
            <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
            <br />
        </li>
    </ItemTemplate>
    <LayoutTemplate>
        <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
            <li runat="server" id="itemPlaceholder" />
        </ul>
        <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">PostedBy:
            <asp:Label ID="PostedByLabel" runat="server" Text='<%# Eval("PostedBy") %>' />
            <br />
            POST:
            <asp:Label ID="POSTLabel" runat="server" Text='<%# Eval("POST") %>' />
            <br />
            POSTED_ON:
            <asp:Label ID="POSTED_ONLabel" runat="server" Text='<%# Eval("POSTED_ON") %>' />
            <br />
            LIKE_COUNT:
            <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
            <br />
        </li>
    </SelectedItemTemplate>

</asp:ListView>
                    <asp:SqlDataSource ID="listDataSourcePosts" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT (UD.FIRST_NAME+' '+UD.LAST_NAME)AS PostedBy,PS.POST,PS.POSTED_ON,PS.LIKE_COUNT FROM T_POSTS PS,T_USERS UD WHERE PS.POSTED_BY=UD.USER_ID ORDER BY PS.POSTED_ON DESC"></asp:SqlDataSource>
                    </td>
            </tr>
                </table>
                </td>
                <td style="width:50%;vertical-align:top">
                               <table style="width:100%">
            <tr>
                <td class="tdHeader">
                    # Likes
                    <hr />
                </td>
            </tr>
            <tr>
                <td>
 <asp:ListView runat="server" ID="listViewLikes" DataSourceID="listDataSourceLikes">
     <AlternatingItemTemplate>
         <li style="background-color: #FFF8DC;">Liked By:
             <asp:Label ID="LikedByLabel" runat="server" Text='<%# Eval("LikedBy") %>' />
             <br />
             Liked On:
             <asp:Label ID="LIKED_ONLabel" runat="server" Text='<%# Eval("LIKED_ON") %>' />
             <br />
             Post:
             <asp:Label ID="POSTLabel" runat="server" Text='<%# Eval("POST") %>' />
             <br />
             Likes:
             <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
             <br />
         </li>
     </AlternatingItemTemplate>
     <EmptyDataTemplate>
         No data was returned.
     </EmptyDataTemplate>
     <ItemSeparatorTemplate>
         <br />
     </ItemSeparatorTemplate>
     <ItemTemplate>
         <li style="background-color: #DCDCDC;color: #000000;">Liked By:
             <asp:Label ID="LikedByLabel" runat="server" Text='<%# Eval("LikedBy") %>' />
             <br />
             Liked On:
             <asp:Label ID="LIKED_ONLabel" runat="server" Text='<%# Eval("LIKED_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
             <br />
             Post:
             <asp:Label ID="POSTLabel" runat="server" Text='<%# Eval("POST") %>' />
             <br />
             Likes:
             <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
             <br />
         </li>
     </ItemTemplate>
     <LayoutTemplate>
         <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
             <li runat="server" id="itemPlaceholder" />
         </ul>
         <div style="font-family: Verdana, Arial, Helvetica, sans-serif; text-align: center; background-color: #CCCCCC; color: #000000;">
             <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                 <Fields>
                     <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                     <asp:NumericPagerField />
                     <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                 </Fields>
             </asp:DataPager>
         </div>
     </LayoutTemplate>
     <SelectedItemTemplate>
         <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Liked By:
             <asp:Label ID="LikedByLabel" runat="server" Text='<%# Eval("LikedBy") %>' />
             <br />
             Liked On:
             <asp:Label ID="LIKED_ONLabel" runat="server" Text='<%# Eval("LIKED_ON","{0:dd-MMM-yyyy HH:mm:ss tt}") %>' />
             <br />
             Post:
             <asp:Label ID="POSTLabel" runat="server" Text='<%# Eval("POST") %>' />
             <br />
             LIKE_COUNT:
             <asp:Label ID="LIKE_COUNTLabel" runat="server" Text='<%# Eval("LIKE_COUNT") %>' />
             <br />
         </li>
     </SelectedItemTemplate>

 </asp:ListView>
                    <asp:SqlDataSource ID="listDataSourceLikes" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT (UD.FIRST_NAME+' '+UD.LAST_NAME) As LikedBy,LK.LIKED_ON,PS.POST,PS.LIKE_COUNT FROM T_LIKES LK,T_USERS UD,T_POSTS PS WHERE UD.USER_ID=LK.LIKED_BY AND LK.POST_ID=PS.POST_ID ORDER BY LK.LIKED_ON DESC"></asp:SqlDataSource>
                    </td>
            </tr>
                </table>
                </td>
            </tr>
 
        </table>
    </center>
</asp:Content>
