<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeRenJieGouChaXun.aspx.cs" Inherits="ESM��ҵн�����ϵͳ.GeRenJieGouChaXun" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>н�����ϵͳ</title>
    <link href="css/cfi_global.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function showOpen() {
            window.showModelessDialog("JiSuanRule.html", "", "status:off;dialogWidth:550px;dialogHeight:370px;");
        }
    </script>
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

        <!-- ҳ��logo����¼ע������ ��ʼ -->
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
        <table width="970" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#CDCDCD" align="center">
            <tr>
                <td></td>
            </tr>
        </table>
        <table width="970" height="1" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td></td>
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
                    <td valign="top">
                        <div id="sub_body">
                            <div id="this_page_title">
                                <div id="item_line">
                                    <h1 id="sub_title">
                                        <asp:Label ID="lblEmployeeName" runat="server" Text="XXX"></asp:Label>&nbsp;&nbsp;н����Ŀ�б�
                                    </h1>
                                </div>
                            </div>
                            
                            <div id="project_list">
                                <asp:GridView ID="gvSalaryItems" runat="server" AutoGenerateColumns="False" 
                                    Width="100%" BorderWidth="0" CellPadding="0" CellSpacing="0">
                                    <Columns>
                                        <asp:BoundField DataField="salaryItem" HeaderText="н����Ŀ" 
                                        ItemStyle-CssClass="table_header_td" />
                                    <asp:BoundField DataField="OperationType" HeaderText="�ۼ�/�۳�" 
                                        ItemStyle-CssClass="table_header_td" />
                                    <asp:BoundField DataField="IsTaxable" HeaderText="�Ƿ��˰" 
                                        ItemStyle-CssClass="table_header_td" />
                                    <asp:TemplateField HeaderText="��μ���" ItemStyle-CssClass="table_header_td">
                                       <ItemTemplate>
                                            <asp:Label ID="lblCalculation" runat="server" Text='<%# Eval("calculationFormula") %>' />
                                            <asp:HyperLink ID="hlViewFormula" runat="server" 
                                                Visible='<%# !string.IsNullOrEmpty(Eval("formulaPageUrl")?.ToString()) %>'
                                                NavigateUrl='<%# "JiSuanRule.aspx?item=" + Eval("salaryItem").ToString() %>'>
                                                �鿴��ʽ
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <AlternatingRowStyle CssClass="table_dashedline_td_bg_gray" />
                                    <RowStyle CssClass="table_dashedline_td" />
                                    <HeaderStyle CssClass="table_header_td" />
                                </asp:GridView>
                            </div>
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
                    <div id="legal">
                        ʹ�û�ע�᱾��վ����ʾ�������ǵ�<asp:HyperLink ID="hlAgreement" runat="server" NavigateUrl="#">�û�Э��</asp:HyperLink>��
                        ���Ķ����ǵ�<asp:HyperLink ID="hlPrivacy" runat="server" NavigateUrl="#">��˽����</asp:HyperLink>
                    </div>
                </td>
            </tr>
        </table>
        <table width="970" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td><p align="left">&copy; ��Ȩ���� ZPark Corporation 1994-2007����������Ȩ����</p></td>
            </tr>
        </table>
        <!-- ҳ���Ȩ���� ���� -->
    </form>
</body>
</html>
