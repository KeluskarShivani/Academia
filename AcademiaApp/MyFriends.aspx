<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="MyFriends.aspx.cs" Inherits="AcademiaApp.MyFriends" %>
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
                    Your Friends
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
                            <center><span class="listViewLabel" style="text-align:center">No data was returned.</span></center>
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
                             <td>
                            <span class="listViewLabel">
                            Status
                            </span>
                             </td>
                                <td>
                                    <span class="listViewData"><%#Eval("STATUS")%> </span>
                                </td>
                            </tr>
                            <tr>
                            <td>
                            <a href="ViewProfile.aspx?vw=<%#Eval("USER_ID")%>" class="buttonMedium" style="text-decoration:none;border:1px solid #d31111;padding:3px;">View Profile</a>
                            </td>
                             <td>
                             <a href="MyFriends.aspx?un=<%#Eval("FRND_REQ_ID")%>" class="buttonMedium" style="text-decoration:none;border:1px solid #d31111;padding:3px;" onclick="return confirm('Are you sure want to remove thsi friend from your list?')">Unfriend</a>
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
                    <asp:SqlDataSource ID="SqlDataSourceFriends" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM( SELECT FR.FRND_REQ_ID,FR.REQ_TO,FR.STATUS,FR.REQUESTED_ON,FR.ACTION_TAKEN_ON,FR.IS_DELETED,  UD.FIRST_NAME,UD.LAST_NAME,UD.GENDER,UD.ROLE,UD.CREATED_ON, BD.DOB,BD.PROFILE_PHOTO_URL,EM.EDUCATION,LM.LOCATION,UD.USER_ID,BD.BASIC_DET_ID FROM T_FRIEND_REQUESTS FR,T_USERS UD,T_BASIC_DETAILS BD,T_EDUCATION_MASTER EM,T_LOCATION_MASTER LM WHERE FR.REQ_FROM=@USER_ID AND FR.REQ_TO=UD.USER_ID AND BD.USER_ID=UD.USER_ID AND BD.EDUCATION_ID=EM.EDUCATION_ID AND BD.LOCATION_ID=LM.LOCATION_ID UNION SELECT FR.FRND_REQ_ID,FR.REQ_FROM,FR.STATUS,FR.REQUESTED_ON,FR.ACTION_TAKEN_ON,FR.IS_DELETED,  UD.FIRST_NAME,UD.LAST_NAME,UD.GENDER,UD.ROLE,UD.CREATED_ON, BD.DOB,BD.PROFILE_PHOTO_URL,EM.EDUCATION,LM.LOCATION,UD.USER_ID,BD.BASIC_DET_ID FROM T_FRIEND_REQUESTS FR,T_USERS UD,T_BASIC_DETAILS BD,T_EDUCATION_MASTER EM,T_LOCATION_MASTER LM WHERE FR.REQ_TO=@USER_ID AND FR.REQ_FROM=UD.USER_ID AND BD.USER_ID=UD.USER_ID AND BD.EDUCATION_ID=EM.EDUCATION_ID AND BD.LOCATION_ID=LM.LOCATION_ID )FRIEND_REQUEST WHERE STATUS!='Pending'">
                        <SelectParameters>
                            <asp:SessionParameter Name="USER_ID" SessionField="USER_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </Center>
</asp:Content>
