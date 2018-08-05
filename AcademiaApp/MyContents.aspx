<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="MyContents.aspx.cs" Inherits="AcademiaApp.MyContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <center>
        <table style="width:100%;border-collapse:collapse">
            <tr>
                <td>
                    <span class="tdHeader" style="margin-left:2.5%">Content Share</span>
                    
                </td>
            </tr>
            <tr>
                <td >
                    <span style="margin-left:2%"><asp:FileUpload runat="server" ID="fileUpload" /></span>
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:TextBox ID="txtRemark" runat="server" CssClass="textBoxmedium" TextMode="MultiLine" Width="95%" Height="60"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td >
                    <span style="margin-left:2%"><asp:Button ID="btnShare" runat="server" Text="Share" CssClass="buttonMedium" OnClick="btnShare_Click"/></span>
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
                <span class="tdHeader">Content Shared So Far</span>
                                                    <br /><hr/>
                             <asp:ListView ID="listContents" runat="server" DataKeyNames="CONTENT_ID" DataSourceID="SqlDataSourceContents" >
                   
                        <EmptyDataTemplate>
                            <span class="tdLinkLabel" style="text-align:center">No data found.</span>
                        </EmptyDataTemplate>
                   
                        <ItemTemplate>
                        <table style="width:100%;border-collapse:collapse">
                            <tr>
                                <td style="text-align:left"><span style="font-family:'Segoe Marker';color:#d31111;font-size:large">Shared By: </span><span class="tdLabel">You</span></td>
                                <td style="text-align:right" runat="server" Visible='<%# Eval("SHARED_BY").ToString().ToUpper() == Session["USER_ID"].ToString().ToUpper() ? true : false%>'><a href="MyContents.aspx?con=<%# Eval("CONTENT_ID")%>" class="linkMedium" onclick="return confirm('Are you sure want to delete?')">Delete</a></td>
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
                    <asp:SqlDataSource ID="SqlDataSourceContents" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT CON.CONTENT_ID,CON.SHARED_BY,(UD.FIRST_NAME+' '+UD.LAST_NAME) AS SHARED_BY_NAME,CON.FILE_NAME,CON.FILE_TYPE,CON.FILE_PATH,CON.REMARKS,CON.SENT_ON,CON.IS_DELETED FROM T_CONTENTS CON,T_USERS UD WHERE UD.USER_ID=CON.SHARED_BY AND CON.IS_DELETED=0 AND CON.SHARED_BY=@USER_ID ORDER BY CON.SENT_ON DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="USER_ID" SessionField="USER_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        </center>
</asp:Content>
