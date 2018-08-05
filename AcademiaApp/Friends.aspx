<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="AcademiaApp.Friends" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .profileImageStyle {
            border-radius:50%;
            border:2px solid #d31111 ;
        }
    </style>
    <Center>
        <table style="width:100%;border-collapse:collapse">
            <tr>
                <td class="tdHeader">
                    Friends Suggestion
                </td>
            </tr>
            <tr>
                <td>
                    <hr style="border:1px solid #d31111" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top">
                    <asp:ListView ID="listFriends" runat="server" DataKeyNames="USER_ID,BASIC_DET_ID" DataSourceID="SqlDataSourceFriends" >
                 
                   
                        <EmptyDataTemplate>
                            <span class="tdLinkLabel" style="text-align:center">No data found.</span>
                        </EmptyDataTemplate>
                   
                        <ItemTemplate>
                        <table style="width:100%;border-collapse:collapse">
                            <tr>
                            <td rowspan="6" style="width:160px;text-align:center">
                            <asp:Image runat="server" ImageUrl='<%#Eval("PROFILE_PHOTO_URL") %>' Height="150" Width="150" CssClass="profileImageStyle" />
                            </td>
                            </tr>
                            <tr>
                            <td class="listViewLabel">Name</td>
                            <td>
                            <span class="listViewData"><%#Eval("FIRST_NAME")%> <%#Eval("LAST_NAME")%></span>
                            </td>
                            <td class="listViewLabel">As</td>
                                <td>
                            <span class="listViewData"><%#Eval("ROLE")%> </span>
                             </td>
                            </tr>  
                            <tr>
                            <td class="listViewLabel">Gender</td>
                            <td>
                            <span class="listViewData"><%#Eval("GENDER")%> </span>
                             </td>
                                <td class="listViewLabel">Birth Date</td>
                             <td>
                            <span class="listViewData"><%#Eval("DOB","{0:dd-MMM-yyyy}")%> </span>
                             </td>
                            </tr>   
                            <tr>
                                <td class="listViewLabel">Education</td>
                            <td>
                            <span class="listViewData"><%#Eval("EDUCATION")%> </span>
                             </td>
                                <td class="listViewLabel">Location</td>
                             <td>
                            <span class="listViewData"><%#Eval("LOCATION")%> </span>
                             </td>
                            </tr>   
                            <tr>
                            <td class="listViewLabel">Since From</td>
                            <td>
                            <span class="listViewData"><%#Eval("CREATED_ON","{0:dd-MMM-yyyy hh:mm:ss tt}")%> </span>
                             </td>
                             <td colspan="2">
                            <span ></span>
                             </td>
                            </tr>
                            <tr>
                            <td>
                            <a href="ViewProfile.aspx?vw=<%#Eval("USER_ID")%>" class="buttonMedium" style="text-decoration:none;border:1px solid #d31111;padding:3px;">View Profile</a>
                            </td>
                             <td>
                            <a href="Friends.aspx?sn=<%#Eval("USER_ID")%>" class="buttonMedium" style="text-decoration:none;border:1px solid #d31111;padding:3px;" onclick="return confirm('Are you sure want to send request?')">Add Friend</a>
                             </td>
                            </tr>   
                            <tr>
                            <td colspan="6"><hr style="border:1px solid #d31111" /></td>
                            </tr>
                        </table>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listFriends" PageSize="5">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                                        <asp:NumericPagerField CurrentPageLabelCssClass="linkMedium" />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                 
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceFriends" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM T_USERS UD,T_BASIC_DETAILS BD,T_EDUCATION_MASTER EM,T_LOCATION_MASTER LM WHERE LM.LOCATION_ID=BD.LOCATION_ID AND BD.EDUCATION_ID=EM.EDUCATION_ID AND UD.USER_ID=BD.USER_ID AND UD.IS_DELETED=0 AND UD.USER_ID!=@USER_ID AND UD.USER_ID NOT IN(SELECT REQ_TO FROM T_FRIEND_REQUESTS WHERE REQ_FROM=@USER_ID) AND UD.USER_ID NOT IN(SELECT REQ_FROM FROM T_FRIEND_REQUESTS WHERE REQ_TO=@USER_ID) ORDER BY UD.CREATED_ON">
                        <SelectParameters>
                            <asp:SessionParameter Name="USER_ID" SessionField="USER_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </Center>
</asp:Content>
