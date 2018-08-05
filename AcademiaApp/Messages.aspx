<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="AcademiaApp.Messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
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
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMessage" ErrorMessage="Required." CssClass="errorMessage" ValidationGroup="Meesage"></asp:RequiredFieldValidator>
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
                    <span style="margin-left:2%"><asp:Button ValidationGroup="Meesage" ID="btnSend" runat="server" Text="Send" CssClass="buttonMedium" OnClick="btnSend_Click" /></span>
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
                                                    <span class="tdHeader">Messages Received</span>
                                                    <br /><hr/>
                             <asp:ListView ID="listMessages" runat="server" DataKeyNames="COMMUNICATION_ID" DataSourceID="SqlDataSourceMessages" >
                 
                   
                        <EmptyDataTemplate>
                            <span class="tdLinkLabel" style="text-align:center">No data found.</span>
                        </EmptyDataTemplate>
                   
                        <ItemTemplate>
                        <table style="width:100%;border-collapse:collapse">
                            <tr>
                                <td style="text-align:left"><span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Sent By: </span><span class="tdLabel"><%#Eval("SENT_BY_NAME")%></span></td>
                            </tr>
                            <tr>
                                <td style="text-align:left;">
                                    <span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Message: </span><span class="tdLabel"><%#Eval("REMARK")%></span>
                                </td>
                            </tr>  
                            <tr>
                                <td style="text-align:right;font-weight:normal;font-family:'Segoe Marker';color:#d31111;font-size:medium">
                                    -<%#Eval("SENT_ON","{0:dd-MMM-yyy hh:mm:ss tt}")%>
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
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listMessages" PageSize="5">
                                    <Fields >
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"  />
                                        <asp:NumericPagerField CurrentPageLabelCssClass="linkMedium" />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                 
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceMessages" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT COMM.COMMUNICATION_ID,COMM.SENT_BY,COMM.SENT_TO,COMM.SENT_ON,(UD1.FIRST_NAME+' '+UD1.LAST_NAME) AS SENT_BY_NAME,(UD2.FIRST_NAME+' '+UD2.LAST_NAME) AS SENT_TO_NAME,COMM.REMARK,COMM.READ_ON FROM T_COMMUNICATION COMM,T_USERS UD1,T_USERS UD2 WHERE COMM.SENT_BY=UD1.USER_ID AND COMM.SENT_TO=UD2.USER_ID AND COMM.IS_DELETED=0 AND COMM.SENT_TO=@USER_ID ORDER BY COMM.SENT_ON DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="USER_ID" SessionField="USER_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        </center>
        </div>
</asp:Content>
