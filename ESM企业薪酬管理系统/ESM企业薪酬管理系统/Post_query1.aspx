<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Post_query1.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.Post_query1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>н�ʹ���ϵͳ</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
 
</head>
<body>
    <form id="form1" runat="server">
        <!-- ҳ�涥�� ��ʼ -->
        <table width="970" border="0" cellpadding="3" cellspacing="0" class="top_heading" align="center">
            <tr>
                <td valign="bottom">ZPark CRL - н�ʹ���ϵͳ</td>
                <td>
                    <div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div>
                </td>
            </tr>
        </table>
        <!-- ҳ�涥�� ���� -->

        <!-- ҳ��logo����¼ע������ ��ʼ -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td valign="bottom">
                    <div align="left"><img src="image/cfi_logo.png" width="350" height="30"  alt="1"/></div>
                </td>
                <td valign="bottom" class="account">
                    ��ӭ<asp:Label ID="lblUserName" runat="server" Text="XXX"></asp:Label>, ���Ѿ���<asp:Label ID="lblRole" runat="server" Text="XXX"></asp:Label>��ݵ�¼��
                    <asp:LinkButton ID="lnkLogout" runat="server" CssClass="navigation_links" OnClick="lnkLogout_Click">��ȫע��</asp:LinkButton>
                </td>
                <td valign="bottom">&nbsp;</td>
            </tr>
        </table>
        <!-- ҳ��logo����¼ע������ ���� -->

        <!-- ��� -->
        <table width="970" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <!-- ��� -->

        <!-- �˵����� ��ʼ -->
        <table width="970" height="32" background="image/navigation_bg.gif" id="navigation" align="center">
            <tr>
                <td>
                    <div id="menu_block" align="left">
                        <div align="left">
                            <asp:HyperLink ID="hlOrgStructure" runat="server" CssClass="navigation_toplevel" NavigateUrl="Post_query1.aspx">��֯�ṹ</asp:HyperLink>
                            <asp:HyperLink ID="hlEmployeeInfo" runat="server" CssClass="navigation_toplevel" NavigateUrl="Employee_query.aspx">Ա����Ϣ</asp:HyperLink>
                            <asp:HyperLink ID="hlSalaryStructure" runat="server" CssClass="navigation_toplevel" NavigateUrl="GeRenJieGouChaXun.aspx">н��ṹ����</asp:HyperLink>
                            <asp:HyperLink ID="hlSalaryCalc" runat="server" CssClass="navigation_toplevel" NavigateUrl="Self_View.aspx">н�����</asp:HyperLink>
                            <asp:HyperLink ID="hlReports" runat="server" CssClass="navigation_toplevel" NavigateUrl="Report_income_outline.aspx">����</asp:HyperLink>
                            <asp:HyperLink ID="hlUserManagement" runat="server" CssClass="navigation_toplevel" NavigateUrl="User_list.aspx">�û�����</asp:HyperLink>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- �˵����� ���� -->

        <!-- ҳ������ ��ʼ -->
        <div id="main_body">
           <div id="page_location">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server">
                    <PathSeparatorTemplate>&nbsp;&gt;&nbsp;</PathSeparatorTemplate>
                </asp:SiteMapPath>
            </div>
            <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
                <tr>
                    <td width="240" valign="top">
                        <div id="sub_navigation">
                            <h2>��֯�ṹ</h2>
                            <p>�ṩ��λ�����Ϣ�Ĳ�ѯ���޸Ĺ���</p>
                           <ul class="sub_navigation_links">
                                <li id="liPostQuery" runat="server">
                                    <asp:HyperLink ID="hlPostQuery" runat="server" NavigateUrl="Post_query1.aspx">��λ��Ϣ��ѯ</asp:HyperLink>
                                </li>
                                <li id="liPostMaintenance" runat="server">
                                    <asp:HyperLink ID="hlPostMaintenance" runat="server" NavigateUrl="Post_weihu.aspx">��λ�б�ά��</asp:HyperLink>
                                </li>
                            </ul>
                        </div>
                    </td>
                    <td width="1" bgcolor="#C2C2C2"></td>
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <fieldset class="pmsform">
                                    <h1 id="sub_title">��λ��Ϣ��ѯ &gt;&gt;</h1>
                                    
                                    <div>
                                        <label class="pmsform">��λ����&nbsp;&nbsp;
                                            <asp:TextBox ID="txtJobName" runat="server" Width="300px"></asp:TextBox>
                                        </label>
                                        
                                        <br />
                                        
                                        <label class="pmsform">���ڲ���&nbsp;&nbsp;
                                            <asp:TextBox ID="txtDepartment" runat="server" Width="300px"></asp:TextBox>
                                        </label>
                                        
                                        <br clear="all" />
                                        
                                        <div id="form_buttons">
                                            <asp:Button ID="btnSearch" runat="server" Text="��ѯ" CssClass="blue_btn" OnClick="BtnSearch_Click" />
                                            <asp:Button ID="btnReset" runat="server" Text="����" CssClass="blue_btn" OnClick="BtnReset_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            
                            <div id="post_list">
                                <asp:GridView ID="gvPosts" runat="server" Width="100%" AutoGenerateColumns="False"
                                    CellPadding="0" CellSpacing="0" GridLines="None" PageSize="10" AllowPaging="True">
                                      <PagerTemplate>
                                           <%-- ���գ������Ƴ���ҳ�� --%>
                                        </PagerTemplate>
                                    <Columns>
                                        <asp:TemplateField ItemStyle-CssClass="table_dashedline_td" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <img src="image/redarrow.gif"  alt="1"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:BoundField DataField="postName" HeaderText="��λ����" 
                                            ItemStyle-CssClass="table_dashedline_td"  />     
                                            
                                        <asp:BoundField DataField="deptName" HeaderText="���ڲ���" 
                                            ItemStyle-CssClass="table_dashedline_td"  />
                                            
                                        <asp:TemplateField HeaderText="��λ����" 
                                            ItemStyle-CssClass="table_dashedline_td" ItemStyle-Width="300" >
                                            <ItemTemplate>
                                                <a href="<%# "Post_duty.aspx?name=" + HttpUtility.UrlEncode(Eval("postName").ToString()) %>"><%# Eval("postDes") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    
                                    <HeaderStyle CssClass="table_header_td" />
                                    <RowStyle CssClass="table_dashedline_td" />
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                            </div>
                            
                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td class="page_navigation_1_2_3">
                                        <div align="right">
                                            <asp:LinkButton ID="lnkFirst" runat="server" OnClick="LnkFirst_Click">��ҳ</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkPrev" runat="server" OnClick="LnkPrev_Click">ǰһҳ</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkNext" runat="server" OnClick="LnkNext_Click">��һҳ</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkLast" runat="server" OnClick="LnkLast_Click">βҳ</asp:LinkButton>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- ҳ������ ���� -->

        <!-- ҳ���Ȩ���� ��ʼ -->
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#E0E0E0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="6" border="0" cellpadding="0" cellspacing="0" bgcolor="#BCBCBC" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td>
                    <div id="legal">ʹ�ñ���վ����ʾ���������ǵ�<asp:HyperLink ID="hlUserAgreement" runat="server" NavigateUrl="#">�û�Э��</asp:HyperLink>�����Ķ����ǵ�<asp:HyperLink ID="hlPrivacyPolicy" runat="server" NavigateUrl="#">��˽����</asp:HyperLink></div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td>
                    <p align="left">&copy; Copyright ZPark Corporation 1994-<%= DateTime.Now.Year %>. ��������Ȩ����</p>
                </td>
            </tr>
        </table>
        <!-- ҳ���Ȩ���� ���� -->
    </form>
</body>
</html>    