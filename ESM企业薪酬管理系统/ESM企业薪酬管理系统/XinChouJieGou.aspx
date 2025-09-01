<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XinChouJieGou.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.XinChouJieGou" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>н�����ϵͳ</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
        <!-- ҳ�涥�� ��ʼ -->
        <table width="970" border="0" cellpadding="3" cellspacing="0" class="top_heading" align="center">
            <tr>
                <td valign="bottom">ZPark CRL - н�����ϵͳ</td>
                <td><div align="right"><img src="image/ibm_logo.jpg" alt="IBM Logo" width="101" height="30" /></div></td>
            </tr>
        </table>
        <!-- ҳ�涥�� ���� -->

        <!-- ҳ��logo ����½��Ϣ ��ʼ -->
        <table width="970" height="50" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td valign="bottom"><div align="left"><img src="image/cfi_logo.png" width="350" height="30" /></div></td>
                <td valign="bottom" class="account">
                  ��ӭ<asp:Label ID="lblUserName" runat="server" Text="XXX"></asp:Label>, ���Ѿ���<asp:Label ID="lblRole" runat="server" Text="XXX"></asp:Label>��ݵ�¼��
                    <asp:LinkButton ID="lnkLogout" runat="server" CssClass="navigation_links" OnClick="lnkLogout_Click">��ȫע��</asp:LinkButton>
                </td>
                <td valign="bottom">&nbsp;</td>
            </tr>
        </table>
        <!-- ҳ��logo ����½��Ϣ ���� -->

        <!-- ���˵����� ��ʼ -->
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
        <!-- ���˵����� ���� -->

        <!-- ҳ������ ��ʼ -->
        <div id="main_body">
            <div id="page_location">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server">
                    <PathSeparatorTemplate>&nbsp;&gt;&nbsp;</PathSeparatorTemplate>
                </asp:SiteMapPath>
            </div>
            
            <table width="970" border="0" cellpadding="0" cellspacing="0" id="main_table">
                <tr>
                    <!-- ����Ӳ˵� -->
                    <td width="240" valign="top">
                        <div id="sub_navigation">
                            <h2>н��ṹ����</h2>
                            <p>�ṩн��ṹά������</p>
                            <ul class="sub_navigation_links">
                                <li><asp:HyperLink ID="hlPersonalSalary" runat="server" NavigateUrl="GeRenJieGouChaXun.aspx">����н��ṹ���</asp:HyperLink></li>
                                 <li id="liTemplate" runat="server"><asp:HyperLink ID="hlTemplate" runat="server" NavigateUrl="XinChouTemplateList.aspx">����н��ģ��</asp:HyperLink></li>
                                 <li id="liSalaryMaintain" runat="server"><asp:HyperLink ID="hlSalaryMaintain" runat="server" NavigateUrl="XinChouJieGou.aspx">Ա��н��ṹά��</asp:HyperLink></li>
                            </ul>
                        </div>
                    </td>
                    
                    <td width="1" bgcolor="#C2C2C2"></td>
                    
                    <!-- �������� -->
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <fieldset class="pmsform">
                                    <h1 id="sub_title">Ա����Ϣ��ѯ>></h1>
                                    
                                    <div>
                                        <label class="pmsform">Ա���� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmployeeId" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtName" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtDepartment" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <label class="pmsform">�ʼ��ʺ�&nbsp;&nbsp;
                                            <asp:TextBox ID="txtEmail" runat="server" size="50"></asp:TextBox>
                                        </label>
                                        
                                        <br clear="all" />
                                        <div id="form_buttons">
                                            <asp:Button ID="btnSearch" runat="server" Text="�ύ" CssClass="blue_btn" OnClick="btnSearch_Click" />
                                            <asp:Button ID="btnReset" runat="server" Text="����" CssClass="blue_btn" OnClick="btnReset_Click" />
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            
                            <div id="E_List">
                                <h1 id="sub_title">Ա����Ϣ�б�</h1>
                            </div>
                            
                            <!-- Ա���б��� -->
                            <div id="user_list">
                                <asp:GridView ID="gvEmployees" runat="server" Width="100%" AutoGenerateColumns="False"
                                    CellPadding="0" CellSpacing="0" PageSize="10" AllowPaging="True" DataKeyNames="empId">
                                       <PagerTemplate>
                                                    <%-- ���գ������Ƴ���ҳ�� --%>
                                        </PagerTemplate>
                                    <Columns>
                                        <asp:BoundField DataField="empId" HeaderText="Ա����" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" />
                                        <asp:BoundField DataField="empName" HeaderText="����" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="deptName" HeaderText="����" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="postName" HeaderText="��λ" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="level" HeaderText="����" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="Mail" HeaderText="�ʼ�" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:BoundField DataField="Tel1" HeaderText="�绰" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"/>
                                        <asp:TemplateField HeaderText="н��ṹ" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                            <ItemTemplate>
                                                <a href="<%# "XinChouJieGou_sub1.aspx?empId=" + Eval("empId").ToString() %>"><img src="image/icon_configure.png" border="0" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="table_header_td" />
                                    <RowStyle CssClass="table_dashedline_td" />
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                </asp:GridView>
                            </div>
                            
                            <!-- ��ҳ�ؼ� -->
                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td class="page_navigation_1_2_3">
                                        <div align="right">
                                            <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click">ʼҳ</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkPrev" runat="server" OnClick="lnkPrev_Click">ǰһҳ</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">��һҳ</asp:LinkButton>
                                            &nbsp;|&nbsp;
                                            <asp:LinkButton ID="lnkLast" runat="server" OnClick="lnkLast_Click">βҳ</asp:LinkButton>
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

        <!-- ҳ���Ȩ��Ϣ -->
        <table width="970" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#525252" align="center">
            <tr>
                <td>
                    <div id="legal">
                        &copy; Copyright ZPark Corporation 1994-<%= DateTime.Now.Year %>. ��Ȩ���С�
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
